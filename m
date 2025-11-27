Return-Path: <linux-aspeed+bounces-3007-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01089C8C6E8
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Nov 2025 01:38:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGyFd65Gvz2yr4;
	Thu, 27 Nov 2025 11:37:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764203877;
	cv=none; b=SmAuLsD9azzUoZynxCXrAqsmfPT+4ALcspOD9+w/8RLj+AmB46EIdW0wMZPprEXAendGnaE7RsxWmfIBg3iVtWNRRDAejzCNucsp0GNRfWC+hxH4LE6Pl6nrWZGM7DISYSVnufMASSk+vuHTEo2hN/fi+6nNaJ7wmS+Fqo6zoQR/RCRHCGJI4vF2iJBUQjxJ/491DCRb/II1uJwUgUaSgcY7SjTMIHt5IsnpiR5AajJPLpn1nTiEkWReg+GA89w70OhMQRn9NPvb7TwoedOJT9Ox484HWMof2Wkt3/cT20uYWumdy3J+NdZkIkgaHX9G3Msn4SH3cm2Yuisw12sGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764203877; c=relaxed/relaxed;
	bh=CQ20Iy0RcHBHgkwxq2o8sUHkUfWWwKay7LCggNECWyg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SDG/gEvTyLTlQ5GEex0qfddx1634DnmrbsEHuVeGhv/b9x4X68VGHTZcAsBV3Abb9Oy0op/d0w9QNU0Yjfztj/XCjLkoxBpgrMc1d7p9rJ3U4kQLwq4CWOR0h/iGrCqQJfPwNRivR41xKiSodZp8mhGlNqxhuTnie2UIilTBbAZHRM7YF5Dg9lz4SKbeGwLX7GjhtF6KI0QUThJayqzphAq384EUEePlJu7MeKQejaZsckfa2pNPM20+5VmMVL0fMCduV18Lpb8irXIvGKWNA+96A7il3RFoGEBjwmeRMDbpNO58pT/zD5kLc1Fzq9/M/QUK5HJVlOEQx9a940QIow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=duCJEbmU; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=duCJEbmU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGyFd2xDtz2xP8
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Nov 2025 11:37:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764203876;
	bh=CQ20Iy0RcHBHgkwxq2o8sUHkUfWWwKay7LCggNECWyg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=duCJEbmUPl0A54Y1u8LnbdpsMQtdW7BLOiZvOGnOu3g7CgGd8C886uT4RPZmWiPxi
	 WK6oX07ebhuv7vmGwct/dxh0g3+0YC+LXiy8r8x5Diam/pncqqi0n1L7tNXl8YKfGA
	 t0eh5i9ljzCeaL/tIFxhveCHUsxwA1cIUiLZ3yrFbv6LND/8mjpLFOJoQLLDAQiAkn
	 1AkxzUMuQIyPJYxouzCHDNOdBzoG5WyVa++3k0ZrEiBHMsXfwKgQyCCb0PeojNSZvA
	 bM/HX8sESNqI82kLc1G0kqEuB0RhvPxavXinraD9tE9xRhDeRtGd2wBO+bjpJCUtpu
	 vQii4AJok0U6A==
Received: from [127.0.1.1] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CB7A26561D;
	Thu, 27 Nov 2025 08:37:55 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Kimi Chen <kimi.zy.chen@fii-foxconn.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com
In-Reply-To: <20251125-dts-add-gpio-to-io-expander-v4-1-e6d31f80470c@fii-foxconn.com>
References: <20251125-dts-add-gpio-to-io-expander-v4-1-e6d31f80470c@fii-foxconn.com>
Subject: Re: [PATCH v4] ARM: dts: aspeed: clemente: add gpio line name to
 io expander
Message-Id: <176420387574.173041.5260439773042865128.b4-ty@codeconstruct.com.au>
Date: Thu, 27 Nov 2025 11:07:55 +1030
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 25 Nov 2025 13:42:50 +0800, Kimi Chen wrote:
> The chassis power cycle process requires a forced shutdown before
> cutting off the standby power. The SCM CPLD implements a hard shutdown
> host function that is controlled through the IO expander in the
> Clemente platform.
> 
> This change adds a new GPIO line named "shdn_force_l_cpld" to the
> PCA9555 IO expander's gpio-line-names at index 10. When asserted,
> this GPIO signals the CPLD to pull the HPM's SHDN_FORCE_L pin low,
> which triggers a forced host shutdown.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


