Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4399DEDA
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Oct 2024 08:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSPz80PMwz3cH2
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Oct 2024 17:56:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728975409;
	cv=none; b=bGd9CFdM2Z+Ny6rsslF/JV5i3MBO2BOU9YYIBp4gbH6gqWqPZuR37I1w7x3duM4Hif5Vz+BnhsSlZ4IL9/s0ghiXZnKGHzk3cbAssmon5kD8ok5S26pBapgPJpHTKLIsf20660wVdreEH9jIQaSa7NHeHKZr/hSyRTq+7Kq0KYyzvzQFCqiFHRM05aK8leRDFBmMtnMYdgT79nzbs3plRjfAj/d+W8bcym6sicrEv6hqYYIpCIqsxA1vj+IwcfcY0RVFUl3YqRVyCjJJMaZTUbC03UvJmZ2wlauOtiG/hARH1eGLc+AsN6XxHdbXZNVnCYqqUL/nZYkR4zAV+lgN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728975409; c=relaxed/relaxed;
	bh=UCWhCFC1nCnipKcYnROrt7/QHUQp4Uyi0FOnqd7XWdA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCEUTjs5SpfQNxAVizWvJ+POjtIdWiz6+Y6/S+cy/T56NlGZnMhcvPiX5ugtq5ttCELwh/Aov6X/4PGpjQnVda1oiVrafih+zZTT4AU8h005wP2q5Bt2OVeSS6cTJFYu6nGtN4ku79nl6E7Yw6u7eEwkjLfqfghfGRM11wEZLV2s2ntkThuQxvPV1s9/hGsbtbsow+uAPRI+KU0dkoYcoKjQYLrv5TOaAaHjg5kofKyE+/KkZbfprTYeb7rsexXkGgoIe/+8isdYknacCnv34EzUhHC4IGO/iuul5D9WEJmgEqTwaEHp1Ua1zUQhfb8sOhnzXeoC5314CkIqnFMPDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=nfpKAIbq; dkim-atps=neutral; spf=pass (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=011d9ea62=conor.dooley@microchip.com; receiver=lists.ozlabs.org) smtp.mailfrom=microchip.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=nfpKAIbq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=011d9ea62=conor.dooley@microchip.com; receiver=lists.ozlabs.org)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSPz34s9fz3bcV
	for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Oct 2024 17:56:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1728975407; x=1760511407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Sj4pR4hDeqqU2JhHI+sXnxUm8jUqiCpTHuhpkV97O4=;
  b=nfpKAIbq86DS79Sl1opDaA1a6QKwwFPcYQpQZ4QEhkbHaP5/ih5L3j0N
   fKD8dOJEY7ST6W/BQrHk2yhbHOp7l6ZR1PZX7+vOBKOVML5PvQKjnzE/H
   vCoM2FvzCu50vlfvV3TL8mwXsgOISZUMAS8EeTZVkXVv6BJ0swijguy7z
   /yQN/gTkwl4Vij65mi1EvbdEkdBphOV65BqSdq7nFNIWaZ04P6T7HYQrd
   o5+5m9VhVzEwlGXhQz1wkE57KWyyzzPTyevT2hcAueMi6fwyGO3q3B9og
   8i/9p5Cii7TK3sduVEIaNuum6qDR5xZ23UYk+ii0L2XJSVtfrzTcXlo8G
   Q==;
X-CSE-ConnectionGUID: XyjmHW/JQKad8t5tqwiT3A==
X-CSE-MsgGUID: wlxq7VeBR3KD9OaaVPDVjA==
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="asc'?scan'208";a="33020112"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Oct 2024 23:56:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 14 Oct 2024 23:56:40 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 14 Oct 2024 23:56:39 -0700
Date: Tue, 15 Oct 2024 07:56:20 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Naresh Solanki <naresh.solanki@9elements.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Message-ID: <20241015-portion-parish-4ca08647bb4c@wendy>
References: <20241010112337.3840703-1-naresh.solanki@9elements.com>
 <172857036038.1533242.5775916298170949713.robh@kernel.org>
 <4d596ac9a2215be8510369c948e0b9680ee2fce3.camel@codeconstruct.com.au>
 <CABqG17gmjvBmpp2a7tgVwR+q3tsrbejVmezWaXH__txytr30hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zgnNujWOZf5FzJWM"
Content-Disposition: inline
In-Reply-To: <CABqG17gmjvBmpp2a7tgVwR+q3tsrbejVmezWaXH__txytr30hQ@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--zgnNujWOZf5FzJWM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 01:38:52PM +0530, Naresh Solanki wrote:
> Hi Andrew,
>=20
>=20
> On Fri, 11 Oct 2024 at 05:15, Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >
> > Hi Naresh,
> >
> > On Thu, 2024-10-10 at 09:30 -0500, Rob Herring (Arm) wrote:
> > > On Thu, 10 Oct 2024 16:53:31 +0530, Naresh Solanki wrote:
> > > > Document the new compatibles used on IBM SBP1.
> > > >
> > > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > > Changes in V4:
> > > > - Retain Acked-by from v2.
> > > > - Fix alphabetic order
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > >
> > >
> > > My bot found new DTB warnings on the .dts files added or changed in t=
his
> > > series.
> > >
> > > Some warnings may be from an existing SoC .dtsi. Or perhaps the warni=
ngs
> > > are fixed by another series. Ultimately, it is up to the platform
> > > maintainer whether these warnings are acceptable or not. No need to r=
eply
> > > unless the platform maintainer has comments.
> > >
> > > If you already ran DT checks and didn't see these error(s), then
> > > make sure dt-schema is up to date:
> > >
> > >   pip3 install dtschema --upgrade
> > >
> > >
> > > New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-sbp1.=
dtb' for 20241010112337.3840703-1-naresh.solanki@9elements.com:
> > >
> >
> > ...
> >
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mux@77: interrupts:=
 False schema does not allow [[44, 4]]
> > >       from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca9=
54x.yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-c=
pu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccf=
a-cpu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-c=
pu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccf=
a-cpu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-c=
pu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccf=
a-cpu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regu=
lators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regu=
lators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regu=
lators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regu=
lators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-c=
pu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccf=
a-cpu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >       from schema $id: http://devicetree.org/schemas/trivial-devices.=
yaml#
> >
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
> Documentation/devicetree/bindings/trivial-devices.yaml:287:          -
> mps,mp2973

It coming from trivial-devices.yaml means that the device does not
actually qualify as a trivial device, but rather needs to be described
in a binding of its own.

--zgnNujWOZf5FzJWM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZw4SEwAKCRB4tDGHoIJi
0nIjAPwIEU8NPVESdU3NKkpEF0S/EBcc+8Exu+WbEkvqoq2nIAD+KK53TduJay6t
7wAqGuWhZfn8YbO16ghift7SX79yeg8=
=Gv8+
-----END PGP SIGNATURE-----

--zgnNujWOZf5FzJWM--
