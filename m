Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E278984504F
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 05:33:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BjwurPLZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQQyb5whCz3cSN
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 15:33:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BjwurPLZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQQyW1CJHz3bnB
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Feb 2024 15:33:39 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-76-194.adl-apt-pir-bras31.tpg.internode.on.net [14.2.76.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DF516200EF;
	Thu,  1 Feb 2024 12:33:37 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1706762018;
	bh=lBcqegpsp9dEZEdmLm8wG2kv9Gwq3fYLCeomI3yn6lU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BjwurPLZ0/3XT9axSg4fADQzwaSK0SWeSYfWCzJdbpm6O4GH9yKHNiUMyziICeOcX
	 chUczHM9a6c06OFZf8Co82qEf5kMSIvPe2qf919eC2dzPwzSZzhr2GYqX9q18iNhDA
	 DcQORA+RMZtKlQcORJyiHBKjy9G64k0G9YW9n822t9sWQBnrY/KuWxFFhk+wGUztbN
	 5Mwmi0ZPzjehaoUK1c5r3dk+3aj1dP/b+YDbgHI8dDeDSNrZD6MsrA6a6YpbgjyP7Q
	 K9isyB9Trt20+NYEj8ZOMT5GieV7FTQVLpyz0os05N+RxD9CPxtcxSoD0dNPU+tw1K
	 4n5ZJ2tNH/rrw==
Message-ID: <b07068223fbc64c453fde6913edce842647dd2c8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 09/21] ARM: dts: aspeed: yosemite4: Enable interrupt
 setting for pca9555
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Date: Thu, 01 Feb 2024 15:03:37 +1030
In-Reply-To: <20240131084134.328307-10-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240131084134.328307-10-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-01-31 at 16:41 +0800, Delphine CC Chiu wrote:
> Enable interrupt setting for pca9555
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
> Changelog:
>   - v4
>     - Revise device node name
>   - v1
>     - enable interrupt setting for pca9555
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 56 +++++++++++++++++--
>  1 file changed, 52 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index cbf385e72e57..4b23e467690f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -832,30 +832,78 @@ power-sensor@12 {
> =20
>  	gpio@20 {
>  		compatible =3D "nxp,pca9555";
> -		reg =3D <0x20>;
> +		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
> +		reg =3D <0x20>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <98 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-line-names =3D
> +		"P48V-OCP-GPIO1","P48V-OCP-GPIO2",
> +		"P48V-OCP-GPIO3","FAN-BOARD-0-REVISION-0-R",
> +		"FAN-BOARD-0-REVISION-1-R","FAN-BOARD-1-REVISION-0-R",
> +		"FAN-BOARD-1-REVISION-1-R","RST-MUX-R-N",
> +		"RST-LED-CONTROL-FAN-BOARD-0-N","RST-LED-CONTROL-FAN-BOARD-1-N",
> +		"RST-IOEXP-FAN-BOARD-0-N","RST-IOEXP-FAN-BOARD-1-N",
> +		"PWRGD-LOAD-SWITCH-FAN-BOARD-0-R","PWRGD-LOAD-SWITCH-FAN-BOARD-1-R",
> +		"","";

Perhaps the addition of the line names should go in a separate patch?
They seem unrelated to the interrupt configuration. The query applies
to the hunks below as well.

>  	};
> =20
>  	gpio@21 {
>  		compatible =3D "nxp,pca9555";
> -		reg =3D <0x21>;
> +		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
> +		reg =3D <0x21>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <98 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-line-names =3D
> +		"HSC-OCP-SLOT-ODD-GPIO1","HSC-OCP-SLOT-ODD-GPIO2",
> +		"HSC-OCP-SLOT-ODD-GPIO3","HSC-OCP-SLOT-EVEN-GPIO1",
> +		"HSC-OCP-SLOT-EVEN-GPIO2","HSC-OCP-SLOT-EVEN-GPIO3",
> +		"ADC-TYPE-0-R","ADC-TYPE-1-R",
> +		"MEDUSA-BOARD-REV-0","MEDUSA-BOARD-REV-1",
> +		"MEDUSA-BOARD-REV-2","MEDUSA-BOARD-TYPE",
> +		"DELTA-MODULE-TYPE","P12V-HSC-TYPE",
> +		"","";
>  	};
> =20
>  	gpio@22 {
>  		compatible =3D "nxp,pca9555";
> -		reg =3D <0x22>;
> +		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
> +		reg =3D <0x22>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <98 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-line-names =3D
> +		"CARD-TYPE-SLOT1","CARD-TYPE-SLOT2",
> +		"CARD-TYPE-SLOT3","CARD-TYPE-SLOT4",
> +		"CARD-TYPE-SLOT5","CARD-TYPE-SLOT6",
> +		"CARD-TYPE-SLOT7","CARD-TYPE-SLOT8",
> +		"OC-P48V-HSC-0-N","FLT-P48V-HSC-0-N",
> +		"OC-P48V-HSC-1-N","FLT-P48V-HSC-1-N",
> +		"EN-P48V-AUX-0","EN-P48V-AUX-1",
> +		"PWRGD-P12V-AUX-0","PWRGD-P12V-AUX-1";
>  	};
> =20
>  	gpio@23 {
>  		compatible =3D "nxp,pca9555";
> -		reg =3D <0x23>;
> +		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
> +		reg =3D <0x23>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <98 IRQ_TYPE_LEVEL_LOW>;

Just confirming the interrupt lines from the expanders are all wired up
to the one GPIO input pin on the BMC?

Andrew
