Return-Path: <linux-aspeed+bounces-3261-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7E2D01DDA
	for <lists+linux-aspeed@lfdr.de>; Thu, 08 Jan 2026 10:37:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn0DV5mBFz2yGD;
	Thu, 08 Jan 2026 20:37:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767865034;
	cv=none; b=hIsb0hyb0v+yR+60CHII964LVFmi/Goeg4W2eCEvqfej/wTeeY1NvnYiStSzebTU16IbAHbvs1Q+yzCrKVboUrvWZ+2LvAOOQeYAEhWm/HkpsLBCi8rFmGRuoPAT2+xzBX6J4/poI8ru7uG+sMcwjmD0V8Il+V1pdr8vwXDGcnao1OVJOHVz+Ut782Bb4zYe6yNk1yg3YJwXx0Jlx+nXviDwEmmCm6Ambcjk2J0klAFaXCEu2/sjRI7hU3V5mSzhrXWdCxt7Q2+0R8kvp09XwR+NQ5fnDcdVsVFeT0zp61O4uE354I5/76lN8xVPb9EXKxFFmbIgGt1R+pUhtA4ajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767865034; c=relaxed/relaxed;
	bh=DtIN+U3vfCr3zEjBHzX6oM4do/3hxJWl7iyhruf7srI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iSye2+/LCo8+7zdiBaJiHf6WE6jUhVo+h/iJEkXTQpQ79OcWSuiDKIhPjmsfuM6DVXb3USvWYHnqe6qhVK2uE2g2YJX0e+CX1ihYkqidSmrgtPQ5DItNxWgjjRZSHNvwxM2JErz08utlHxof2pWWksmNqGObUklwJOo47RoNBLp4mnEW+wek8XQVqw+XR3CqXi97cqdgKh4EQXCOMH9OUJfpv1M9UKzKkfgQ7eqtUzdm4UKlEi3m5kgJOcn4VOpbaog+0tPAyJSI43fIGAsCtjq9ygHVyZMjUzQhA56f5zjDhPlqxWaouennsPWWws+WFDW00TLa1KRLnaCGBSdO4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=X8Zh6SMd; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=X8Zh6SMd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn0DV20KQz2yG7
	for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jan 2026 20:37:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767865033;
	bh=DtIN+U3vfCr3zEjBHzX6oM4do/3hxJWl7iyhruf7srI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=X8Zh6SMdTyodMLssOQ3O7TKAoEPFh6iqNodDHJeC2Uy6VOj2vnzyTbYc9gZosTuip
	 OGY+JVUtwbRcGh+Fpa0SDRaAupzoaPeBSsbajmLa8W+AJlTMKL/Gn0bCU6ow1nRsQB
	 roNAh/OymbyKbGjX7c9120pangqNthVSnX/dCKrnx52AUGOLcCn7smRQiFtiLLhMCq
	 DMu88Bica3Jv2Uuq4HlMvzVMCO5UtDM5l5icXPrDXGwE8rUHli6ljh7q3Sry2gHVtl
	 riDRUDzfk5jKfHMs+ifuCtvzFqUtaZJOgIu65PYfsw8Vv+L5Ejr7DXVEUVoeMRY9gD
	 UiS7LkzSSEyGA==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AD5C179F8C;
	Thu,  8 Jan 2026 17:37:12 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260106213153.2766411-1-robh@kernel.org>
References: <20260106213153.2766411-1-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: aspeed: ibm: Use non-deprecated AT25
 properties
Message-Id: <176786503263.1448890.555842411272962996.b4-ty@codeconstruct.com.au>
Date: Thu, 08 Jan 2026 20:07:12 +1030
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

On Tue, 06 Jan 2026 15:31:51 -0600, Rob Herring (Arm) wrote:
> The at25,* properties have been deprecated since 2012. These platforms
> weren't upstream until 2020 and 2023, so it should be safe to switch
> over to the "new" properties and just drop the deprecated ones.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


