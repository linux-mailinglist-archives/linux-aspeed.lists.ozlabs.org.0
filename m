Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8435189D6F3
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 12:27:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=B4iPBcOV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDMbZ1q9Lz3dSn
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 20:27:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=B4iPBcOV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDMbQ46yTz3dHK
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 20:27:30 +1000 (AEST)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id A4249C393C
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 10:27:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12DC6240008;
	Tue,  9 Apr 2024 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712658421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IgLT556EQ1sZdDx/D7AZFOXHnmen1aI83W1NiohbSlY=;
	b=B4iPBcOVkx3mfxd+rg95RkbF9UEK4k+DdgW7xqj7tT7F/2vpHwnjQmDQ01ZtZ2oPa6qb4o
	09hXRQXlI1bqDHQc7MN0KzWmcS8dC3mmiBR3PcE1J4p1rg96l1Z2iHM1zoIv581lXIUG8K
	NfCKCTjkTH2u2kWQgbzhk5E9pvoWfSAHVii0/ZMTyKKOcRkJR7qjWrv6ImsjDKaWJStKgs
	ZSueTSYdbsYsNielAvIp9rUoLonaww1JS5vne6O47pRkr+IIEkMbjlzieJrNosCxKvivb1
	YyKnTxhiVH2u+bOnBIuKc3KzzumhN9k6vojpT6uYw0Vz5TWnPch2JjL1wVrwzg==
Date: Tue, 9 Apr 2024 12:26:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH 0/9] rtc: convert multiple bindings into dtschema
Message-ID: <20240409102658d86fb2bd@mail.local>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 08/04/2024 17:53:00+0200, Javier Carrasco wrote:
> This series converts the following bindings into dtschema, moving them
> to trivial-rtc whenever possible:
> 
> - orion-rtc: trival-rtc, referenced in arm arch.
> - google,goldfish-rtc: trivial-rtc, referenced in mips arch.
> - lpc32xx-rtc: trival-rtc, referenced in arm arch.
> - maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
> - rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
> - pxa-rtc: add missing properties and convert. Referenced in arm arch.
> - st,spear600-rtc: trivial-rtc, referenced in arm arch.
> - stmp3xxx-rtc: convert, referenced in arm arch.
> - via,vt8500-rtc: trivial-rtc, referenced in arm arch.

Probably all the moves to trivial-rtc can be squashed.

> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (9):
>       dt-bindings: rtc: orion-rtc: move to trivial-rtc
>       dt-bindings: rtc: google,goldfish-rtc: move to trivial-rtc
>       dt-bindings: rtc: lpc32xx-rtc: move to trivial-rtc
>       dt-bindings: rtc: maxim,ds1742: move to trivial-rtc
>       dt-bindings: rtc: rtc-aspeed: move to trivial-rtc
>       dt-bindings: rtc: pxa-rtc: convert to dtschema
>       dt-bindings: rtc: spear-rtc: move to trivial-rtc
>       dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema
>       dt-bindings: rtc: via,vt8500-rtc: move to trivial-rtc
> 
>  .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 45 ++++++++++++++++++++++
>  .../bindings/rtc/google,goldfish-rtc.txt           | 17 --------
>  .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
>  .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 +++++++++++++++++++
>  .../devicetree/bindings/rtc/maxim,ds1742.txt       | 12 ------
>  .../devicetree/bindings/rtc/orion-rtc.txt          | 18 ---------
>  Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 -------
>  .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 -----------
>  .../devicetree/bindings/rtc/spear-rtc.txt          | 15 --------
>  .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ----------
>  .../devicetree/bindings/rtc/trivial-rtc.yaml       | 18 +++++++++
>  .../devicetree/bindings/rtc/via,vt8500-rtc.txt     | 15 --------
>  12 files changed, 103 insertions(+), 149 deletions(-)
> ---
> base-commit: fec50db7033ea478773b159e0e2efb135270e3b7
> change-id: 20240406-rtc_dtschema-302824d1ec20
> 
> Best regards,
> -- 
> Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
