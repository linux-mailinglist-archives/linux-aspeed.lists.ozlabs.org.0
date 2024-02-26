Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 791B18683E3
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 23:42:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IqyDBwGf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkFxB164Fz3d23
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 09:42:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IqyDBwGf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkFx44GXjz3brc
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 09:42:16 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-168-240.adl-adc-lon-bras34.tpg.internode.on.net [118.210.168.240])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C4A1320127;
	Tue, 27 Feb 2024 06:42:14 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1708987335;
	bh=/qvMBMrVFDTYVqfc8l6H/h1iuLNhCL0RUCd1VIFMYVM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IqyDBwGfwh2HZob3GYo5SUtNf44rqoQBZVTxs3qvSfCXE6SELc4Y7oUddjXEyIRhG
	 uid4MOhriFaEXq+ig+lDlMtlbRVk0+mH/Hy1aW/xOgigMlQZS1tbcUqxMaPDMjtqoq
	 mCH7e3Pk++aa18POkxcjzVS8cFKWrEt7O3eV8h5mxe775BVVuRCDgHmIACJSqmuYa+
	 uMJ/OYGY8fGwHCMSF9BfRKxPiNDJMpSrNmalISJZGAyzKiUbwv0Id41IEXE9hidPdR
	 NWKL+CSAmH4jbaxJQWrzDWqOtui4RBoJOJgA0z9xJ2JAhBl28gb5j9Btu+eF0ok2vO
	 o7qEemSchbX/g==
Message-ID: <cd7806bf4ae8818697b1eba47b380c82a919ecc5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to
 DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linus.walleij@linaro.org, brgl@bgdev.pl, krzysztof.kozlowski+dt@linaro.org
Date: Tue, 27 Feb 2024 09:12:10 +1030
In-Reply-To: <458becdb-fb1e-4808-87b6-3037ec945647@linaro.org>
References: <20240226051645.414935-1-andrew@codeconstruct.com.au>
	 <458becdb-fb1e-4808-87b6-3037ec945647@linaro.org>
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

On Mon, 2024-02-26 at 08:08 +0100, Krzysztof Kozlowski wrote:
> On 26/02/2024 06:16, Andrew Jeffery wrote:
> > Squash warnings such as:
> >=20
> > ```
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb@1e=
600000/gpio@1e780000: failed to match any schema with compatible: ['aspeed,=
ast2400-gpio']
> > ```
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20
> ...
>=20
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: The clock to use for debounce timings
> > +
> > +  gpio-controller: true
> > +  gpio-line-names: true
>=20
> min/maxItems

Ack.

>=20
> > +  gpio-ranges: true
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +
> > +  ngpios: true
>=20
> Where are the constraints I asked? minimum, maximum.

Sorry. Thanks for clarifying. I'll address that in v4.

Andrew

