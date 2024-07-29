Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F104A93EA85
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2024 03:17:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mFPDK6Yr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXL7Z6r51z3cND
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2024 11:17:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mFPDK6Yr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXL7V6Jysz3c3g
	for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2024 11:17:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722215846;
	bh=aUrFfDFmD5KIKv3jz80Iad9Jg4vDE1/Msd0Yw2YSF08=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mFPDK6Yr3iMsM0daTCQB8XQTk9qCQvyZR6AUj9dJY87DABrlHpKW3jkEjgbsVwGTZ
	 oX1O7B9MytNzlcbpajL6HML9l3B4+30QdpUj91c0kme73XiOyAbEypQ9XAk1YLVA05
	 7jZ5z90JJVrjnYpq8zE2eMQxgFGtrHDlJMBlGQLcZRO+jk/ZtoLQWOuVFYfu9yud2X
	 dMifVSMrTnSvP6YtmuQmLMxLKuFnGHfjcCgwI7g48wTi5qihGwr9lU9xyQLYy4CIAf
	 T8FpqEjCCHuRASJKzcyqKAbxi9NARvYe1RKpIIYf8m5ZPXqw7a7/VGdkH7D8/uDYL/
	 Gb3IoAuCTVBUw==
Received: from [192.168.68.112] (unknown [118.211.93.69])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E99A466B02;
	Mon, 29 Jul 2024 09:17:23 +0800 (AWST)
Message-ID: <6d73dcf20c726ad59e2aa16e507af17b3af59c42.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 29 Jul 2024 10:47:22 +0930
In-Reply-To: <172199921421.1507234.14901757413141840919.robh@kernel.org>
References: <20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com>
	 <172199921421.1507234.14901757413141840919.robh@kernel.org>
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Conor Dooley <conor.dooley@microchip.com>, Cosmo Chou <cosmo.chou@quantatw.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Potin,

On Fri, 2024-07-26 at 08:09 -0500, Rob Herring (Arm) wrote:
> On Fri, 26 Jul 2024 18:26:48 +0800, Potin Lai wrote:
> > Add Linux device tree entry related to Meta(Facebook) Catalina specific
> > devices connected to BMC(AST2600) SoC.
>=20
...
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-cata=
lina.dtb' for 20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com:
>=20
>=20
...
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1=
e78a000/i2c@100/i2c-mux@70/i2c@2/pwm@21: failed to match any schema with co=
mpatible: ['maxim,max31790']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1=
e78a000/i2c@100/i2c-mux@70/i2c@2/pwm@27: failed to match any schema with co=
mpatible: ['maxim,max31790']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1=
e78a000/i2c@100/i2c-mux@70/i2c@3/vrm@60: failed to match any schema with co=
mpatible: ['isil,raa228004']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1=
e78a000/i2c@100/i2c-mux@70/i2c@3/vrm@61: failed to match any schema with co=
mpatible: ['isil,raa228004']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1=
e78a000/i2c@100/i2c-mux@70/i2c@3/vrm@62: failed to match any schema with co=
mpatible: ['isil,raa228004']
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1=
e78a000/i2c@400/ipmb@10: failed to match any schema with compatible: ['ipmb=
-dev']
...

The snipped errors are mostly from the DTSI, but these errors above are
specific to your DTS. Can you please address them?

Andrew
