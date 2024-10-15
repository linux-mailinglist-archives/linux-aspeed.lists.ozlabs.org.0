Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E938299DAB7
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Oct 2024 02:38:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSFZN1djYz3c00
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Oct 2024 11:38:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728952698;
	cv=none; b=KjYVL7ji70KAvoAjsCQXERiAWOJN7gIemwHcR24C5Xr1Vlrit6jmAAPExooZwjVepkdnNbYo4SF7XRP0xCA1bbAZRXe7bPW8yi8ZNEmIeMVkg5qL2uwvDqRuI0oEEcePMvUZL3y4uFPmouJMZaOqfnTl10C2JYj+b6kzr3PSS4tQlnnb4dOLSFp+r1wxLyOsxcZxDemGlgEPT+EeJ5skSuBICWQ/+1LPsmVfK+WmBzGYAE+uXnnCmMy/2hArRbCpTBT64RsYQAF1d0GedT0Y73u057Gaw43NdLJ62rlFW5Xa6QjEW/gJ3iYktCR69HjxRhu7sDl4kLp0xPmAGKyQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728952698; c=relaxed/relaxed;
	bh=6/06bc8oCZtyUeywqMc8qTFgfwd5N7FHrM9Z7htd1G0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eHRim8e9njlO5MezGwHOLng8hMDuO4ibToypBCm1PHe+Qv88eOJZ0/dc8QrpvHvCwhWBXhrvNyqRiPS3wz28tunlT3/11It8t3BrJW01LKqj14vRxSO3TZCQ524Lwq34YlM5semTrx6Qtv6LBzbKs2qSPeqOG52qqcRStXnr9u/tz0gav7G20yzkdWJSlH3e0iTAAZV+iClTKimRVIyqZaJ8DIawaM1Nh8PAABP1nkeX5LjcM688j/MWeJHz3SNeoZQv+7c4uXBw7vgMNsUpszAQFKIVA5sOnyilwXjXLYCKd4TYR7LXNZN/9pN3aRHk3l+Al2EyV/sriHlx+v1iQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Yr3vlzPP; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Yr3vlzPP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSFZH2mmVz3bZr
	for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Oct 2024 11:38:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1728952691;
	bh=6/06bc8oCZtyUeywqMc8qTFgfwd5N7FHrM9Z7htd1G0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Yr3vlzPPFYdNfF21gVd7sc9jkCqRu3O12LkVhdfZMDUdr2lIULQqlZ/m3DaEXQeB5
	 A2O9PXWnoZKl5FqwlqPYoHLE+dCBur3+TS5TqFhnhxYOj0dI/o9sJ/ADPgJUBPvZRn
	 w9Od7APzUPV3yJD6HOT7K/3gTCZIE/9uVV71aG1rmtuhaAWwcAi7xxrIAeDGm7Ddec
	 ehVmgt7l/WvAqE3YHyapNPS55d6Q8Lmyi8XHcq3ukIi3kka67W1FZRM4eJ6v5nF18I
	 +s0t9MmKu+DSMsnc0lN0O0zZSYEJlaq/m6p0yGa+AomRGk2VvJToHHa5pkE7Q8aS1M
	 4WVbxmKP0cCiA==
Received: from [192.168.68.112] (203-173-0-39.dyn.iinet.net.au [203.173.0.39])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F16C4649A0;
	Tue, 15 Oct 2024 08:38:08 +0800 (AWST)
Message-ID: <5ca25b137b955dc5e0d9607df104097e3de7b782.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 15 Oct 2024 11:08:08 +1030
In-Reply-To: <CABqG17gmjvBmpp2a7tgVwR+q3tsrbejVmezWaXH__txytr30hQ@mail.gmail.com>
References: <20241010112337.3840703-1-naresh.solanki@9elements.com>
	 <172857036038.1533242.5775916298170949713.robh@kernel.org>
	 <4d596ac9a2215be8510369c948e0b9680ee2fce3.camel@codeconstruct.com.au>
	 <CABqG17gmjvBmpp2a7tgVwR+q3tsrbejVmezWaXH__txytr30hQ@mail.gmail.com>
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

On Fri, 2024-10-11 at 13:38 +0530, Naresh Solanki wrote:
> Hi Andrew,
>=20
>=20
> On Fri, 11 Oct 2024 at 05:15, Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > Hi Naresh,
> >=20
> > On Thu, 2024-10-10 at 09:30 -0500, Rob Herring (Arm) wrote:
> > > On Thu, 10 Oct 2024 16:53:31 +0530, Naresh Solanki wrote:
> > > > Document the new compatibles used on IBM SBP1.
> > > >=20
> > > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > > Changes in V4:
> > > > - Retain Acked-by from v2.
> > > > - Fix alphabetic order
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >=20
> > >=20
> > >=20
> > > My bot found new DTB warnings on the .dts files added or changed in t=
his
> > > series.
> > >=20
> > > Some warnings may be from an existing SoC .dtsi. Or perhaps the warni=
ngs
> > > are fixed by another series. Ultimately, it is up to the platform
> > > maintainer whether these warnings are acceptable or not. No need to r=
eply
> > > unless the platform maintainer has comments.
> > >=20
> > > If you already ran DT checks and didn't see these error(s), then
> > > make sure dt-schema is up to date:
> > >=20
> > >  pip3 install dtschema --upgrade
> > >=20
> > >=20
> > > New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-sbp1.=
dtb' for 20241010112337.3840703-1-naresh.solanki@9elements.com:
> > >=20
> >=20
> > ...
> >=20
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mux@77: interrupts:=
 False schema does not allow [[44, 4]]
> > >  from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.y=
aml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-c=
pu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccf=
a-cpu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-c=
pu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccf=
a-cpu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-c=
pu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccf=
a-cpu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regu=
lators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regu=
lators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regu=
lators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regu=
lators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-c=
pu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccf=
a-cpu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> >=20
> > These still must be addressed as mentioned on v3 (with more specific
> > comments regarding the infineon,ir38263 on v4). Please look through the
> > binding documents for the affected nodes and make sure the nodes in
> > your DTS conform to their definitions. You can check your work with
> > `make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-sbp1.dtb` prior to sending.
>=20
> These are the warnings coming for trivial devices. Even for regulator@5f
>=20
> grep -rsn mp2973 Documentation/
> Documentation/devicetree/bindings/trivial-devices.yaml:286:
> # Monolithic Power Systems Inc. multi-phase controller mp2973
> Documentation/devicetree/bindings/trivial-devices.yaml:287: -
> mps,mp2973
>=20

Right, but if they're generating warnings, then you haven't specified
the nodes in accordance with the bindings. From here one of two things
is the case:

   1. The bindings' specifications are incomplete, and you need to
      introduce patches updating them to match how you need to use the
      hardware
   2. Your devicetree is incorrect, and the unexpected properties need
      to be removed from the listed nodes.

The only third option is "don't use the hardware how you need to" (i.e.
remove the unexpected properties despite needing them, because you
don't want to update the bindings).

Ultimately the tools are telling you something is wrong, and I need the
warnings I've identified addressed before I can apply your patch,
otherwise the hardware is not going to do what you might expect.
> I've rebased it on top of for-next branch in [2]
>=20
> I rebased on top of [1] & the volume of output did reduce for CHECK_DTBS.

Great :)

Andrew
