Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CA29995CF
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2024 01:45:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPmb95bf9z3bw9
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2024 10:45:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728603924;
	cv=none; b=g59v7ReU91Q9IlhBXKJlUS45VuLOz3LnWXHl6pPBkX0DWJEfcq6cnHIDezXemPKnNt5+CODOp+Es5bH5F1adrFmbmcZkA1l825s0UlYluQOK3JB/2hTi22oOF2YeyCywm/38Ar2PDOttArzZSXrzP1o2XnEt09yuWWRAgs/4vuJYQFvKeLkAYqHRmA52YMiNF6BlpOJPqbVcDZCaVcNKeMuPnAgc4an19meS2YbUS9mLRuwv35uMYDrPcDupLCXzsqbbBW34jYbpHvQQPLEZu4OcK6H+dUZ3oh/Yh3RZTjmslO7fFsPSr4feK7nwkFI7iVzzItLE9JKkQEAgLRxjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728603924; c=relaxed/relaxed;
	bh=ToZcgnbZ8v7eof9auRtT/Slo3MhgKvn3XM1vCWslblw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iSn6mreImMvEegHlySQAAsBvfc4M00pE+YAv5ceA3BvAk0FRLIfEN+j/qFb5Ey+EQWFnvMm+CbxSpMKbZ9YrRQ/J7ssEzxzPKethIjxxiJIuv8YXlCP/8abJR+wdR2/cDe0K8bLGxahFCyd9fnACxWwzYWnV46fFbs11vaTmg3RGDUxAZccZoWYzltyrq932jES/m+l1zaFQdjdyGn22LdT/89RJYKZ95RUu2PHD6A/c5rdE/7adyQtvhjxbsp9JO0RVvfstHyS4Du9M/nEklhoYlzvGLomMz7E3d0IQvzT4vkNsHcwqEIG7wIMUU8R4mHkkqhPqykoR5fHkDNt37A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RA5Riigd; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RA5Riigd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPmb70Smyz3bmH
	for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2024 10:45:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1728603921;
	bh=ToZcgnbZ8v7eof9auRtT/Slo3MhgKvn3XM1vCWslblw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RA5RiigdYBT2fodE39/oNGDHLsvyZWKvCLJz1582UnsnOFdxjAqDBlD2vIC3TI+Y9
	 /2NaRgOm750UW87yok5DYxQvdFZf33b8HFY7iN3b6eTwHsswafzhsNxgvweCqycTsn
	 HUm1PR7+yzpdZGBkwmT64/zRP/MG//rzdIlJDb5/HbQAIUG8JRUtGzjU9AHdTGSeHG
	 JPSUrxm5Nudq3mWnYMlBaiMKwbeofFbQnvXMmv45SbfdcNtR8wX73LUjxPxCyFcY7x
	 6qoj11WE3H9fCGwKMZxtrwDR5G0RWcSUKDv03vqm2N2exy7TezBoYt1nxCd1QBJZWk
	 hvWIK40rsJEWQ==
Received: from [192.168.68.112] (ppp118-210-188-189.adl-adc-lon-bras34.tpg.internode.on.net [118.210.188.189])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5D0BC64998;
	Fri, 11 Oct 2024 07:45:19 +0800 (AWST)
Message-ID: <4d596ac9a2215be8510369c948e0b9680ee2fce3.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Naresh Solanki <naresh.solanki@9elements.com>
Date: Fri, 11 Oct 2024 10:15:17 +1030
In-Reply-To: <172857036038.1533242.5775916298170949713.robh@kernel.org>
References: <20241010112337.3840703-1-naresh.solanki@9elements.com>
	 <172857036038.1533242.5775916298170949713.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Naresh,

On Thu, 2024-10-10 at 09:30 -0500, Rob Herring (Arm) wrote:
> On Thu, 10 Oct 2024 16:53:31 +0530, Naresh Solanki wrote:
> > Document the new compatibles used on IBM SBP1.
> >=20
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Changes in V4:
> > - Retain Acked-by from v2.
> > - Fix alphabetic order
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
>=20
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
> New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-sbp1.dtb'=
 for 20241010112337.3840703-1-naresh.solanki@9elements.com:
>=20

...

> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mux@77: interrupts: Fal=
se schema does not allow [[44, 4]]
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu2@=
58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cp=
u2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu1@=
58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cp=
u1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu3@=
58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cp=
u3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulato=
rs' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulato=
rs' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulato=
rs' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulato=
rs' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu0@=
58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cp=
u0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#

These still must be addressed as mentioned on v3 (with more specific
comments regarding the infineon,ir38263 on v4). Please look through the
binding documents for the affected nodes and make sure the nodes in
your DTS conform to their definitions. You can check your work with
`make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-sbp1.dtb` prior to sending.

It may help to base your series on top of [1] to reduce the volume of
output from CHECK_DTBS=3Dy.

Andrew

[1]: https://github.com/amboar/linux/tree/for/bmc/aspeed/dt

