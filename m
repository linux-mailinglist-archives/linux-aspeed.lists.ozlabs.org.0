Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23B8A4668
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 02:54:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JJCwfSnh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHpbC2bD8z3dV7
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 10:54:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JJCwfSnh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 230 seconds by postgrey-1.37 at boromir; Mon, 15 Apr 2024 10:54:09 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHpb53znVz3cVG;
	Mon, 15 Apr 2024 10:54:09 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1BE9C201BD;
	Mon, 15 Apr 2024 08:54:08 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1713142448;
	bh=obtxTmSKvgPXEQa4POBsx1nO7wzpz7LF4Uo923gf2K0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JJCwfSnhnSVvmpuEJ5zdraw7TH40sS5X/WIOoIvGzmJFUiyg3KVO2b3SvZ4uvFOZT
	 +RSdzZ2a8d4871p4WM1OKqkclyFcgxE8ogk84R16VIWfjne6j8eiVRihxJf8v6E7tr
	 UxLVYSb8tKfYoxExPNctJ73CzPUzjAhyNF1ahJmFnBnE22R4fb2lVXcZZYHcAJ3O7q
	 idE8139o9L50T9UwgUiQUniQfhi6BJhZeaqNT/cI7J7UgSSSuOtUezOxl8R374brv2
	 EzBDb1iuTIo/re+oIf2C+uyFx9JzF9nxFBKMiLb8w1PWLNhKikc9Iyc9718C+3sR3c
	 aA1OlOFD2vnBg==
Message-ID: <5c6f58cc13492988d307504d55cc5d31a512ab8c.camel@codeconstruct.com.au>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: Update Odyssey SBEFIFO compatible
 strings
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Date: Mon, 15 Apr 2024 10:24:07 +0930
In-Reply-To: <20240412144358.204129-4-eajames@linux.ibm.com>
References: <20240412144358.204129-1-eajames@linux.ibm.com>
	 <20240412144358.204129-4-eajames@linux.ibm.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, alistair@popple.id.au, jk@ozlabs.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-04-12 at 09:43 -0500, Eddie James wrote:
> Set the new compatible string for Odyssey SBEFIFOs so that they
> don't collect async FFDC.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 64 +++++++++----------
>  .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi | 64 +++++++++----------
>  2 files changed, 64 insertions(+), 64 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
> index 214b2e6a4c6d..3a2bfdf035cb 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
> @@ -2545,7 +2545,7 @@ scom500: scom@1000 {
>  						};
> =20
>  						sbefifo500: sbefifo@2400 {
> -							compatible =3D "ibm,p9-sbefifo";
> +							compatible =3D "ibm,ody-sbefifo";
>  							reg =3D <0x2400 0x400>;
>  							#address-cells =3D <1>;
>  							#size-cells =3D <0>;


Bit of a drive-by comment as I'm not really holding any stakes here,
but did the hardware actually change?

Would it be better to request the behaviour by a property rather than
changing the compatible?

Andrew
