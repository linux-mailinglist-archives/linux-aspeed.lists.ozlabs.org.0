Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521D86BF65
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Feb 2024 04:22:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fRNXX3Iz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlc2v63fRz3dRc
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Feb 2024 14:21:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fRNXX3Iz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlc2p5DxYz3bmy
	for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Feb 2024 14:21:53 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-70-176.adl-apt-pir-bras31.tpg.internode.on.net [14.2.70.176])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 854162003C;
	Thu, 29 Feb 2024 11:21:48 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1709176912;
	bh=RLcNqeFFO91l5U2c2IKNxo911MnrtAjB3bSLnMByv8c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fRNXX3IzTcEDeyZE4x/DP7vMGGIc5cp7BOkn7QL+57i48ck+9kkXj2c+UWUD9JxVX
	 2EqFfWfksv4DLEqx48mVIcMgcys42fwv2FaWdBCdNGi9nyArnwCtBtvzDf7jUk5DR3
	 /anASWfpRpAMG2muKIHLK/ZBzNlMpeM+0B9HZOepx0wgXeMYRdEj3m909jz4J63VTS
	 aWztF4wAso9Qg9NuRqiVWWMiVr4GAYD35xnEa9cWmTkWE+vP5zCHwCiMvvsDAnUEjx
	 hNZziqdSqQmtRsAZSeWSJSyWL5OIjPElh1aFlTOotSSxurW0x8g8Ryg1PYBbwVKuzz
	 QNybC8fjN4CcA==
Message-ID: <16ddd99007176da3f84462de217cb76c8fa4e1bd.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to
 DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linus.walleij@linaro.org, brgl@bgdev.pl, krzysztof.kozlowski+dt@linaro.org
Date: Thu, 29 Feb 2024 13:51:45 +1030
In-Reply-To: <c2060450-4b76-4740-afe4-d14717245f01@linaro.org>
References: <20240228003043.1167394-1-andrew@codeconstruct.com.au>
	 <c2060450-4b76-4740-afe4-d14717245f01@linaro.org>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-02-28 at 08:47 +0100, Krzysztof Kozlowski wrote:
> On 28/02/2024 01:30, Andrew Jeffery wrote:
> > Squash warnings such as:
> >=20
> > ```
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb@1e=
600000/gpio@1e780000: failed to match any schema with compatible: ['aspeed,=
ast2400-gpio']
> > ```
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > v6: Address more constraint feedback from Krzysztof:
> >     https://lore.kernel.org/all/f69ef2ad-8ace-40c8-b923-4dde20eda2ec@li=
naro.org/
>=20
> You still have way too many examples. One is enough, two is still okay.
> We really do not want more of examples with minor differences.

Noted, I'll keep them to a minimum in the future.

>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for the feedback.

Andrew

