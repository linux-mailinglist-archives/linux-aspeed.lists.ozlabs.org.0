Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09249822CCE
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Jan 2024 13:17:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Ok9yJgrr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=0o4Fwpm1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4pcw5406z2ysD
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Jan 2024 23:17:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Ok9yJgrr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=0o4Fwpm1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4pcn40yMz3btj
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Jan 2024 23:17:13 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id DED985C01B4;
	Wed,  3 Jan 2024 07:17:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 03 Jan 2024 07:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1704284231; x=1704370631; bh=tO+/ZwtPBh
	TkBucL3MQP+jVMBKPcHDEPNI5yeaQsy0g=; b=Ok9yJgrrQNbTqq1quT9+5hA9+9
	ydSTtfAOHyLVi+qmv0dvTmu+QSc5/94mxZ+UYSbZdYgRaPC5r3Jq7JqzXnX33CER
	OtZI/9s73E4+reNJJBcYui8BoEHTPdg0+05JeJ+aHESkRsMWC+/q0ETzYXdWVBDy
	/DFzr2K0R6ZRk7wdEEnPxLOa+K8Q20AgxW9j9QPt6PZCRDA9z3ZNnrWOwD+NwMYP
	8hu2zhp8FnOIcOsCCMOx07i3t5YVPr+OoR1TkvNAbN7JgglBjY4F1iJz3IMrhh+7
	rNHpfVotDWGP3qnrMrS5LsA5Bw1FQlwpi5FQbHJcF0k5akyIlG1XOt9fTR0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704284231; x=1704370631; bh=tO+/ZwtPBhTkBucL3MQP+jVMBKPc
	HDEPNI5yeaQsy0g=; b=0o4Fwpm1z94GqyybFh7C7kMVDnibVGf34jRMCs7y9Dum
	yg/uaRM5JfDCeFkqYy8kO7OzUT8s9zDNCs/ArtPhotFL2oo3lI8lLgwnimhgM/y9
	b0jokNtFJDGpBLyoT+laIs4PAOa1pj1RGOIYiaINu59wyZuydPjxRiBLZ91ljQ70
	0LJVduSR7EM7k+/YWSrcKd7RO757sZ3/LlGDrn6jWF1h7Py85X0MGQ8190mgmtEe
	0ZLkh1iUR5aP4ZpJMpsd7UDcbmmDADpoXAOlZ3TAEf3zMZRx/SUSlwPEAa8VJN3y
	7JGpRyeXIhr1VaM9NTA2TzaIIHvGjoXaZKWGJwQXxQ==
X-ME-Sender: <xms:R1CVZW25N90Vuj1NwQ1w7qYIYK9CitGwxTL_ZFSjyXsrqgYdbL-RGQ>
    <xme:R1CVZZH9w_9vGC8uIK-jGS3SeZ7zrE8H-RKTD3oi1a4pY6pnooIm9NsyezhmqrrnV
    TyOnLYPusRK8hngayE>
X-ME-Received: <xmr:R1CVZe6UT3ObH9HkHENiPVRFWfVc-4YYkkcleqOn2bvCjYkbrLw2_XKe0o6Lalv4aELxkXQ3SgjSzOD8sfBZ6ES2LQmNbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeghedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejgfdtleelvdeftdeggefffeeu
    feevgeejkeelgeeujeevveeufeeigfeivdejjeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:R1CVZX2p-4zlfpUjMW-3DGP8_Zhc3ShVJ-JLjM9MeM_jnZ-jNseA5w>
    <xmx:R1CVZZE87QIkubNdFBGcxvuD76HyP1qotBCCLXaRHjuF9IghO8f_bA>
    <xmx:R1CVZQ-s_3fl7A0xVz1h1dMrDE99g4vYxbueZNlJPs9k4ZzSTWLrNw>
    <xmx:R1CVZfaU5dnwr5OUeDnEQvd0oJ3hPmmku6rXhfAd-hPyMyFMlIK9cA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jan 2024 07:17:11 -0500 (EST)
Date: Wed, 3 Jan 2024 06:17:10 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Peter Yin <peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v1 5/5] ARM: dts: aspeed: Harma: Add spi-gpio
Message-ID: <ZZVQRgTe57G4Tc_w@heinlein.vulture-banana.ts.net>
References: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
 <20240102044409.3810873-6-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4MieZFNir6FV4A2x"
Content-Disposition: inline
In-Reply-To: <20240102044409.3810873-6-peteryin.openbmc@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--4MieZFNir6FV4A2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2024 at 12:44:09PM +0800, Peter Yin wrote:
> Add spi-gpio for tpm device.
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> index 36aad01dda20..25ae044cd176 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> @@ -28,6 +28,8 @@ aliases {
>  		i2c29 =3D &imux29;
>  		i2c30 =3D &imux30;
>  		i2c31 =3D &imux31;
> +
> +		spi1 =3D &spi_gpio;
>  	};
> =20
>  	chosen {
> @@ -67,6 +69,25 @@ led-2 {
>  			gpios =3D <&gpio0 124 GPIO_ACTIVE_HIGH>;
>  		};
>  	};
> +
> +	spi_gpio: spi-gpio {
> +		status =3D "okay";
> +		compatible =3D "spi-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		gpio-sck =3D <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> +		gpio-mosi =3D <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
> +		gpio-miso =3D <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
> +		num-chipselects =3D <1>;
> +		cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +
> +		tpmdev@0 {
> +			compatible =3D "tcg,tpm_tis-spi";

Due to other pending changes, there is a request that all tpm_tis-spi
also contain a compatible with a chip vendor.  Please add
"infineon,slb9670".

See https://lore.kernel.org/lkml/ZZTS0p1hdAchIbKp@heinlein.vulture-banana.t=
s.net/
for more context.

> +			spi-max-frequency =3D <33000000>;
> +			reg =3D <0>;
> +		};
> +	};
>  };
> =20
>  // HOST BIOS Debug
> --=20
> 2.25.1
>=20

--=20
Patrick Williams

--4MieZFNir6FV4A2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWVUEYACgkQqwNHzC0A
wRlu0Q/+JCxoappGQgYN8XwykKfMvTqOKTOoH56HMD4//s7BZSAqhc663TqU+iSk
GdF5fU6nXjga9rM/eh5t4HPBmptag+RnUIAYolxL3G5UoRaJs0Mk6k2qQzCUheZv
+aIo5H1NDzurnUt4WXhpc07nVwQRlsu/q6+xPLrLfd2sVnHLRbGjfo9T+Q1w+9P7
bKsSfO8dqtfxIvHc4GRqQTJTprzpyJd9X3WC6PmeS5PEWuLzG5JDK4LzEjGHpEno
ldZKmO7TNInpLA4TbeLzS3O1dHSPIGcqwAAzrkgZ1pJUZaTmpdoHKFgpIeYq5p+b
INHCEaBukf20jwjC04FQaF3dif+zMlMUiRkDdZIQmc4RatAVWv5pkfj4hRqbnDk3
/1VOY6C3NKtu+1v7MOQsfuxwNrbrb20TQu5LWco9z1ENsbW5ngr6iHU/yx164UDs
xy1HPRm7Y9wJUz3VmvQmvdUHNIQ6gAMGMnrk+4F69pUR5drmUtgDAxc1TTsUBklV
MCj47BP+o1PNwT/UaScuQorCS8ffxk7tGOT4zfKLqQghEpLO/aKzaSk+V8k8hoRC
pXbBmjXtyuYEp50RG5Uim4/PdoWX6Dm1Vfz6pE7t0XzcntXgwzPNgWYBiGwamhEL
ajhb2hf4aXXIyutOcF+F2g/VSpRh1cJ8AFomfqW+CSLRWn9zXAY=
=ZFb5
-----END PGP SIGNATURE-----

--4MieZFNir6FV4A2x--
