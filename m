Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A56995CED
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 03:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNZxd12XCz30Ns
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 12:27:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728437234;
	cv=none; b=ejstNv3A0+ZBS2D7mjXKXmYS8Qjo41uVplpyfxvqdhc+ZKhMb6DeCj/jgLBVpyTI1g2/cWUEI7aDATJoIuONhm6XBiaI8x7lP5yeYtIDvONWEbD5wz1YspjMKzlpStbF/cD+4wy0G+EkU+8Edn2I4DzARMUu2sxygLbgCImBuyI0BaVnfOpiXYNyVmTmWqX5aLQDYBhksToA0LLborReX52/nGyP3RUF1yT1ZOMdDL0qmXfW4u4Ci/ZGYTaKROIXIaioZyX8DU5k049JW+2iOCVbJP+Rop7uQK0T/5zFPg3O9Wl6k8wPCF7uVIDvLVOTXnqwcfpS2P4B9WAdsieqog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728437234; c=relaxed/relaxed;
	bh=wkuRk6jxUw0jV4GEtxreQLO/W5UhOPn3u8EdvBkuGrQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dcy6hwEBLQ7x05lUfE8JJ0y8QrRkOrQbV7ZC85HFRgSXKRwAMverL89iEd7SQTfQuzMySpcf6duOZMZNXkLpbUHr0HE1msAQ7JN0AnCTxA2WZly++7Lls2wYn1q1edKNfSMid6plO15Rp2khb8s7LFtgPtdJkWiG8PVwTlGw483sufS/4n8/73v7hp9KBEx6eIsnLGMlQWlSZm8nEYFc2cvIsivdyGtyuiJ6LOUfi7hMeYOVJUHzjtXkPp81Z28J0+CH0Xyj45UuAP0TU3rGYtyUcZaV6uBnMHmXs1NUhs+fSMHBc5+atMC7p3gKTdM//zycMJ42IGxoa+g+ZxwV5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aaaTxY6c; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aaaTxY6c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNZxX62gmz2xjH
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2024 12:27:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1728437230;
	bh=wkuRk6jxUw0jV4GEtxreQLO/W5UhOPn3u8EdvBkuGrQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aaaTxY6cKqWtOy7+Q1CiGUbKTXyFhXrrThL0niVbY11enCVcWRroxKOmb8dzqHlMI
	 SAyAMbN2GqkvEft5kpBjbwQdA+VN8xCvBxeL+TFFCJzJLehP/o1dMbqqnZlU4+Li8T
	 BAo4xL6Jb9TlGDhAjSIWyMVko3TvcVRZ3bGrnmAvPe1uqzRrxvL2FpqXkv6AWg/rdw
	 GM38KdbiLnJuex5b/gtsmDcHTDAtJHRVVUjr6XFSvqoZQDFInECI18K69BXuXjZy9F
	 KARASxpcESwb7KXBqBaodm9wxNsWfYLOVNHqcIK3KKUuU5Gcad1zMQDq0WywsZ3Fhc
	 B4ZFGSqtKrukA==
Received: from [192.168.68.112] (ppp118-210-190-105.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.105])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1293F6497F;
	Wed,  9 Oct 2024 09:27:08 +0800 (AWST)
Message-ID: <e4dd331944168257bfd2f4239d24317424da7b9c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: sbp1: IBM sbp1 BMC board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Naresh Solanki <naresh.solanki@9elements.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Wed, 09 Oct 2024 11:57:07 +1030
In-Reply-To: <20241008111924.1865857-2-naresh.solanki@9elements.com>
References: <20241008111924.1865857-1-naresh.solanki@9elements.com>
	 <20241008111924.1865857-2-naresh.solanki@9elements.com>
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
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Naresh,

On Tue, 2024-10-08 at 16:49 +0530, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>=20
> Add a device tree for IBM sbp1 BMC board which is based on AST2600 SOC.
>=20
> sbp1 baseboard has:
> - support for up to four Sapphire Rapids sockets having 16 DIMMS each.
>   - 240 core/480 threads at maximum
> - 32x CPU PCIe slots
> - 2x M.2 PCH PCIe slots
> - Dual 200Gbit/s NIC
> - SPI TPM
>=20
> Added the following:
> - Indication LEDs
> - I2C mux & GPIO controller, pin assignments,
> - Thermister,
> - Voltage regulator
> - EEPROM/VPD
>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>=20
> ---
> Changes in V4:
> - Move reset related entried under mdio to phy.
> - Removed reserved gpio range.
> Changes in V3:
> Drop unused regulator entries which are not used by drivers.
> Decouple p12v_a
> Update pincfg for U62120
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |    1 +
>  .../boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts   | 6128 +++++++++++++++++
>  2 files changed, 6129 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index c4f064e4b073..577cc6754c45 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>  	aspeed-bmc-ibm-rainier-1s4u.dtb \
>  	aspeed-bmc-ibm-rainier-4u.dtb \
>  	aspeed-bmc-ibm-system1.dtb \
> +	aspeed-bmc-ibm-sbp1.dtb \

Please keep this list sorted alphabetically.

>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-inspur-fp5280g2.dtb \
>  	aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts b/arch/arm/=
boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
> new file mode 100644
> index 000000000000..6036a9ca3840
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
>=20
> +
> +&i2c1 {
> +	status =3D "okay";
> +
> +	bmc_mux_nic: mux@77 {
> +		compatible =3D "maxim,max7357";
> +		reg =3D <0x77>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reset-gpios =3D <&gpio0 ASPEED_GPIO(R, 3) (GPIO_ACTIVE_LOW | GPIO_OPEN=
_DRAIN)>;
> +		vdd-supply =3D <&p3v3_aux>;
> +
> +		i2c@0 {
> +			reg =3D <0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			smb_pex_nic: pinctrl@20 {
>=20
...
> +			};
> +		};
> +
> +		i2c@1 {
> +			reg =3D <1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c@2 {
> +			reg =3D <2>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			ir38263-pvcore-nic2@40 {
> +				compatible =3D "infineon,ir38263";
> +				reg =3D <0x40>;
> +
> +				regulators {
> +					pvcore_nic2: vout {
> +						regulator-name =3D "pvcore_nic2";
> +						regulator-enable-ramp-delay =3D <2000>;
> +						vin-supply =3D <&p12v>;
> +					};
> +				};
> +			};

This doesn't match my understanding of the infineon,ir38263 and
regulator bindings. Certainly `make CHECK_DTBS=3Dy ...` complains about
it.

This is untested, but from my understanding, it should rather be
something like:

   pvcore_nic2: regulator@40 {
       compatible =3D "infineon,ir38263";
       reg =3D <0x40>;
  =20
       regulator-name =3D "pvcore_nic2";
       regulator-enable-ramp-delay =3D <2000>;
       vin-supply =3D <&p12v>;
   };

Note that this is _not_ the same as the maxim,max5978 binding, which
_does_ specify the regulators subnode.

Please fix all infineon,ir38263 nodes in the dts.

...

> +
> +		i2c-protocol;
> +	};
> +};
> +
> +&i2c5 {
> +	status =3D "okay";
> +
> +	i2cmux2: mux@77 {
> +		compatible =3D "maxim,max7357";
> +		reg =3D <0x77>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		reset-gpios =3D <&gpio0 ASPEED_GPIO(Z, 2) (GPIO_ACTIVE_LOW | GPIO_OPEN=
_DRAIN)>;
> +		vdd-supply =3D <&p3v3_aux>;
> +
> +		i2c@1 {
> +			reg =3D <1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			r38263-p1v05-pch-aux@40 {
> +				compatible =3D "infineon,ir38263";
> +				reg =3D <0x40>;
> +
> +				interrupt-parent =3D <&smb_pex_vr_ctrl>;
> +				interrupts =3D <9 IRQ_TYPE_LEVEL_LOW>;

Aside from the regulators subnode issue, the infineon,ir38263 binding
doensn't specify interrupt properties. Does it need to be updated?

Otherwise, we have the following warning:

   r38263-p1v05-pch-aux@40: Unevaluated properties are not allowed ('interr=
upt-parent', 'interrupts', 'regulators' were unexpected)

> +
> +				regulators {
> +					p1v05_pch_aux: vout {
> +						regulator-name =3D "p1v05_pch_aux";
> +						regulator-enable-ramp-delay =3D <2000>;
> +						vin-supply =3D <&p12v>;
> +					};
> +				};
> +			};
> +		};
> +
> +		i2c@2 {
> +			reg =3D <2>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			ir38060-p1v8-pch-aux@40 {
> +				compatible =3D "infineon,ir38060";
> +				reg =3D <0x40>;
> +
> +				interrupt-parent =3D <&smb_pex_vr_ctrl>;
> +				interrupts =3D <32 IRQ_TYPE_LEVEL_LOW>;

As above.

Andrew
