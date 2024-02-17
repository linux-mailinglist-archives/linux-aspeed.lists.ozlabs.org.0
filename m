Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A92B858F5F
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Feb 2024 13:43:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cZm6w3+q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TcT3q5j0Vz3cDt
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Feb 2024 23:43:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cZm6w3+q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TcT3j3S45z3bt2
	for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Feb 2024 23:42:57 +1100 (AEDT)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B3641C06E0
	for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Feb 2024 12:42:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64E86FF802;
	Sat, 17 Feb 2024 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708173745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQgQFC20iCOwYcRfjCRWjcJxj6kdRvb0sW/GpMA0iJA=;
	b=cZm6w3+q/UHjIT1yNRcAtWgateZy+3L53YEsxa8c0kbbAEj7aWy5AFrxj6rry5XSn9IF1M
	sT+b48pGm6Dbwqf7PWGXGB9DYyA8rgLo4Z6HcP3sO/cREYR0dfOL7IKM6jvRQHdZUQDLX8
	dGvaU1z+9dq+Tdm0/WBz2I9WWXpSW8yE2NA8JLFV4oY0StaAUa8ZKw8Bi7lf1VpSEA6Gat
	JJ3VGzSFbxSM5jVo5yPLcXMayJ++a4QX1PSgmntwv9QmTKJxOdD5lXyEufGFe0tT3Or9aH
	VLy8fnI6yzSpUVkK3fUTy08Ni3w0cq4IbSrs3qkZJ27zPKvMZn2wxvPryuteOA==
Date: Sat, 17 Feb 2024 13:42:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
Message-ID: <2024021712422352187ad4@mail.local>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
 <00d6a0d5-6787-4777-8fb2-dcad4304a724@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00d6a0d5-6787-4777-8fb2-dcad4304a724@linaro.org>
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
Cc: linux-aspeed@lists.ozlabs.org, Nicolas Pitre <npitre@baylibre.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Conor Culhane <conor.culhane@silvaco.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 16/02/2024 12:26:12+0100, Krzysztof Kozlowski wrote:
> On 17/01/2024 08:56, Krzysztof Kozlowski wrote:
> > Drop the requirement of "-master" suffix in node names because:
> > 1. "Master" word is discouraged and MIPI Alliance renamed it to
> >    "Controller".
> > 2. Some devices can operate in Controller (Master) or Target mode, thus
> >    the name is not accurate in such cases.
> > 3. Other buses, like I2C controllers, use simple "i2c".
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> 
> Rob, can you pick this one up? It seems Alexandre did not take it.
> 

I'll take it but I don't think it is super urgent.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
