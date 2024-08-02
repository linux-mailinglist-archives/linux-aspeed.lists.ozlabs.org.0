Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E9945817
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 08:37:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MxtqBcEA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZx2M0CPZz3cJl
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 16:36:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MxtqBcEA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZx2F5b4Bz30fM
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 16:36:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722580611;
	bh=Of1XQj/7J9HzKpXSbYLjUaisLnBd/UQhz1by2QoX/5c=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=MxtqBcEATo0dGOTgctGcB6bOQvpEkAMPyBrwIu6xtPH9/21QZTVJbdkqAEWgE9EuT
	 d5cyH/eAhSTka6Y49yPXuH+uWDNhIYrYm1i2RmSVLHsYXWHY+8TLpZ4XN36EF0NfX/
	 zZtyjTPSZ5Zc/MuxmfM2ob7YSYBszFARDBfFboUbA+YfpNd8IoFABDaUYldr4btgAM
	 9zLeK+1LuLBoOmyFrFt7WRbqW2Jnv2G1av0XmYe0Fi6tLyTqBP8gCj1sQvREnJAJBm
	 h/k4AciM7MwmQz+7RLOB0tpL312Zpdzpn01JezLMe+qsV8M8ktUS4hev83ch4ZIsTO
	 KgplzLHHIvG7A==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1638D65665;
	Fri,  2 Aug 2024 14:36:49 +0800 (AWST)
Message-ID: <7bf4cb57f2b0b41c79f2efea3e0b0211988c0896.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 02/11] ARM: dts: aspeed: Harma: add VR device
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 02 Aug 2024 16:06:47 +0930
In-Reply-To: <20240801160136.1281291-3-peteryin.openbmc@gmail.com>
References: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
	 <20240801160136.1281291-3-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-08-02 at 00:01 +0800, Peter Yin wrote:
> Add isl69260, xdpe152c4 device
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> index d99fba321379..8fb30029e46c 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> @@ -398,6 +398,30 @@ imux28: i2c@0 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>  			reg =3D <0>;
> +			power-monitor@61 {
> +				compatible =3D "isil,isl69260";
> +				reg =3D <0x61>;
> +			};
> +			power-monitor@62 {
> +				compatible =3D "isil,isl69260";
> +				reg =3D <0x62>;
> +			};
> +			power-monitor@63 {
> +				compatible =3D "isil,isl69260";
> +				reg =3D <0x63>;
> +			};

As of v6.11-rc1 this gives me:

```
$ ./scripts/checkpatch.pl --strict -g HEAD
...
WARNING: DT compatible string "isil,isl69260" appears un-documented -- chec=
k ./Documentation/devicetree/bindings/
#24: FILE: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts:402:
+                               compatible =3D "isil,isl69260";

WARNING: DT compatible string "isil,isl69260" appears un-documented -- chec=
k ./Documentation/devicetree/bindings/
#28: FILE: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts:406:
+                               compatible =3D "isil,isl69260";

WARNING: DT compatible string "isil,isl69260" appears un-documented -- chec=
k ./Documentation/devicetree/bindings/
#32: FILE: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts:410:
+                               compatible =3D "isil,isl69260";

total: 0 errors, 3 warnings, 0 checks, 30 lines checked
```

and

```
$ make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-harma.dtb 2>&1 | grep isil
...
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a0=
00/i2c@700/i2c-mux@70/i2c@0/power-monitor@61: failed to match any schema wi=
th compatible: ['isil,isl69260']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a0=
00/i2c@700/i2c-mux@70/i2c@0/power-monitor@62: failed to match any schema wi=
th compatible: ['isil,isl69260']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a0=
00/i2c@700/i2c-mux@70/i2c@0/power-monitor@63: failed to match any schema wi=
th compatible: ['isil,isl69260']
```

While there's already an Aspeed-based Quanta platform that also
specifies this device, let's not add to the problems of the Aspeed
devicetrees.

Please make sure to run `make dtbs_check ...` and checkpatch on your
changes. Regarding `make dtbs_check` and related tests, this blog post
is helpful:

https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sourc=
es-with-the-devicetree-schema/

Andrew
