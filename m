Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BB383013F
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jan 2024 09:27:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XpGHtRkR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFJrg4xJ3z30fh
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jan 2024 19:26:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XpGHtRkR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 374 seconds by postgrey-1.37 at boromir; Wed, 17 Jan 2024 19:26:51 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFJrW2zQqz2yVR
	for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Jan 2024 19:26:51 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 910CC200EF;
	Wed, 17 Jan 2024 16:20:28 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1705479632;
	bh=hZ9j8UuXRkmu15JoqsIHh0GDdaekortIGwbW9yvv6ts=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=XpGHtRkRfLDwrUodELF03yxjD4NPXkDcZ1NSbJNn14dWioGavFVlSgGMoTZRpbIKX
	 kn8W8nkaVlGw3rx6xgEhoJKZfg91VDffqlP6tkIHFz+VjjrITvYT2rF04aPia0WKHO
	 +bhEzP2JnZlUfQ5lYteM7FLCfzxSxI2df8kTCAuT5EDg5s9kPdEiFdORu5hfg1IjR6
	 FYwhYUris9LHOzxXE3wvbtf3BSZVesoK6QJ9v+mHKCWf8mm8/wWmDAdFrdMPyTsOpi
	 WHPSdC26WXLCKAUqIU/od3F9KOky/x7y9RSbw4mRXs1SWY5Ls1z8T+n+BLslEF7xYO
	 JQFX2jy7i8cFg==
Message-ID: <491efee1860ef1fbe94f990faea9c40cd99294c4.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>,  =?UTF-8?Q?Przemys=C5=82aw?= Gaj
 <pgaj@cadence.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Conor
 Culhane <conor.culhane@silvaco.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>, NXP Linux
 Team <linux-imx@nxp.com>, Dinh Nguyen <dinguyen@kernel.org>,  Boris
 Brezillon <bbrezillon@kernel.org>, Nicolas Pitre <npitre@baylibre.com>,
 linux-i3c@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Wed, 17 Jan 2024 16:20:28 +0800
In-Reply-To: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

> Drop the requirement of "-master" suffix in node names because:
> 1. "Master" word is discouraged and MIPI Alliance renamed it to
> =C2=A0=C2=A0 "Controller".
> 2. Some devices can operate in Controller (Master) or Target mode,
>    thus the name is not accurate in such cases.
> 3. Other buses, like I2C controllers, use simple "i2c".

Sounds good, thanks!

For the ast2600-i3c changes:

Acked-by: Jeremy Kerr <jk@codeconstruct.com.au>

Cheers,


Jeremy
