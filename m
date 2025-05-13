Return-Path: <linux-aspeed+bounces-1213-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD8BAB54FB
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 May 2025 14:38:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxbcS0tJjz2yNG;
	Tue, 13 May 2025 22:38:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747139912;
	cv=none; b=HPNcst1bC8MXI1gL7Tr68OR3NXEASv1Jc4nIdw9wYc4ypKe0rc/OJufzlTUHD5PNO954KP+h0qUrrM7LiltSRn1HRomyOhHKSbrffHH3GWZOH+fM04j720zVrSSJNA6Hc197IUkXZsW1BauzJkfo3riuJknTz613z66pubxrkK1tNHd7md5HwFltl2Fm9MtuYEbrKJqTmVEb0Aq1C1zdDLnG+cs6E/SznznJFnTFwbYygN5YwrE01IMs6MFucL7Uq3qN9182KPTQSGPPehxBEomwy1+vewSox8VDAoW+yl4ZZYSPZUUDZXHjmx6lrwVKmic6c39HSo7kQmYoSIXlXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747139912; c=relaxed/relaxed;
	bh=IhcSVT0ilThLTEqD751qEwwwjKQxPdQ/g5IW8iOJnYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEYIk5ub1F3NsBAonCMZc7ky5n5E6HnmqwvE2wDc2gCHjmdd/X60yqHoazRViF7r+i2fkQfxkyNP1O/YjpHyJ/DeY88VUZyAArxyXKW2fHeDbfUdpxnJC5BJLLAiF5bw86cyuWLBZho6OSG/4MRm4xuEdPW8hGYiLexXwbpnh77WFpuR3NMVWksAuGJEehtgrC2j8JMve0/f+v6Pw+R/4PPKj1AowC8udKg3Agg3nrotWZ8xDyFfd07qo5f1wDI47gwxprQdZNIAaBRZiK9Hr5ffTWcxQIlXHCL53wXPnpyNmwl/B/OAh1ev8q8TQhpWbvwmeqJVbUoaHl+qd7R09g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NOQRx7XT; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NOQRx7XT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxbcR1Vx0z2xtt
	for <linux-aspeed@lists.ozlabs.org>; Tue, 13 May 2025 22:38:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IhcSVT0ilThLTEqD751qEwwwjKQxPdQ/g5IW8iOJnYo=; b=NOQRx7XTuoWUjZfRP5o5Wstmex
	gr38zDZCcGap0v5IKV9arZyd1u8H0b/FM7OA43lGWEWAYIpM/SHW/D33/CJJ5Py6TbFMw3w5b/al2
	a9yDwQIp8lgGHYABQ1Cv599sS1w0/trmB0ctEXHkrh+Qp4h9v9OqeAQlotRpN/POvPQI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEotg-00CS3N-90; Tue, 13 May 2025 14:38:12 +0200
Date: Tue, 13 May 2025 14:38:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: leo.jt.wang@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com, leo.jt.wang@fii-foxconn.com
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
Message-ID: <bebe4a75-0d7d-424e-a217-dfea710b3262@lunn.ch>
References: <20250513031010.267994-1-LeoWang>
 <6822b851.050a0220.27a24d.d071@mx.google.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6822b851.050a0220.27a24d.d071@mx.google.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> +&mac0 {
> +	status = "disabled";
> +	/* phy-mode = "rgmii-rxid"; */

Did i already say this is probably wrong?

	Andrew

