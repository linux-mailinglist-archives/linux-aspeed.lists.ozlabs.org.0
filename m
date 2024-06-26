Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DDC9181E9
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:12:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AusMygBu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MYL62BXz3dDn
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:12:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AusMygBu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MYF12Bdz3cVB
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:11:59 +1000 (AEST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2598ae41389so3516651fac.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407513; x=1720012313; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9lt8YMuSfdHCHBC7u4Y78n5f7iONuGIKzSj+d7oElGg=;
        b=AusMygBuB/S8qE76W6aE1dvChc5VFDbWNIMgJdsPYo3br6N8//PmH6a9qouqKMKDQs
         pCOmy9KupbUz0rVz6Oj0ePyJdXgfTI3d6dqZND6yl6Nx95/AINx+rvpGOeNGKKWtjM4E
         vWXxa6ofq30e8n1HYj2ljk44oee4/C9JznT0QXvwOUWckCoPNQY3mAOH6uxh3C7C1V9D
         t4Cd51tPoeTQyp3Od81bqgWcIoLCVe1UhZ5C2bc+pZ7UfroYg7/tQDwzJ/xPYoGLC1tj
         YReARdmfl7WM0XbtM34lKeO2e3/gt2UWcAndYDtHd15RHe58NJNez26BgBuVAbtsBSk+
         vMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407513; x=1720012313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lt8YMuSfdHCHBC7u4Y78n5f7iONuGIKzSj+d7oElGg=;
        b=Zw0sauPAfIo10l7imYNY9JuHYwk8GBwnxiaMni+KfNKTgD1B4YbkexraiiF6JhiMId
         Rf47zl9mVWC4IcXO2Yx5S1parH0PCMxPm/qaVuqRomvKW9U2n5uvEXJgWKTdsGzv1GRN
         EDxYLHVVVApPyzgBTNcwYXEYZvD54Hl5BC+2WgFjuBHXWOJP74hW4SGUH41s/7iRBmI3
         FbxvBE/G8ZPrlZaRqqVhtH5iC5ZhA6H7LRZSCcaSbJas69yK4YAek/F4+64lj/vXFj/L
         rg+pLRr5p30rBvrylqCphJPleo7Pyh9Xoex76XI3gAgu2FR2x6b/wql7CX3WETFoDS/H
         di5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOo4Kda5XWW0jwwIzn1qty9UG5CqrV0caJE/qYNHLMN48cae9Gy4ySJv9pOMMTxzV/zM9w7WC8hmzMEus/iBVPMgMzdl/gkwHRSJNp2g==
X-Gm-Message-State: AOJu0Yy5t99d1yyRjzZCHKd+c3LHu3tYnV2EY18GSvWg42XPG7Fb6f+b
	Pd/jx71X94qHziYR9CZBY/EdhjviItqiHuYU1t0yBdoHxOddxFbDsf4+VbfkDc7SAjiKkmaV3KF
	MdVmUVve0YVYYZT0aDs1yvyfFflM=
X-Google-Smtp-Source: AGHT+IFsKH+fPrMfqj+P5kJZphG3OvYqk0VUzH9BmkVL9dw1rp0gyUrC9gkRntUMUQWpkXfPtKuU1r+BIh35S8L5AXo=
X-Received: by 2002:a05:6870:55c9:b0:24c:a8e6:34e7 with SMTP id
 586e51a60fabf-25d06cd6cb8mr12070102fac.26.1719407513327; Wed, 26 Jun 2024
 06:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
 <20240625121835.751013-3-yangchen.openbmc@gmail.com> <4391083991a16c435c5d8849eb5ee2be2f03793c.camel@codeconstruct.com.au>
In-Reply-To: <4391083991a16c435c5d8849eb5ee2be2f03793c.camel@codeconstruct.com.au>
From: Yang Chen <yangchen.openbmc@gmail.com>
Date: Wed, 26 Jun 2024 21:11:41 +0800
Message-ID: <CALFa7M-6T9gd0rUTdd845JgAnV9zZexO4Kmzj495i9m7AMWLuQ@mail.gmail.com>
Subject: Re: [PATCH 02/17] ARM: dts: aspeed: minerva: Add spi-gpio
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: multipart/alternative; boundary="0000000000000e5ff6061bcac26f"
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--0000000000000e5ff6061bcac26f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Jun 26, 2024 at 9:30=E2=80=AFAM Andrew Jeffery <andrew@codeconstruc=
t.com.au>
wrote:

> On Tue, 2024-06-25 at 20:18 +0800, Yang Chen wrote:
> > From: Yang Chen <yang.chen@quantatw.com>
> >
> > Add spi-gpio for TPM device.
> >
> > Signed-off-by: Yang Chen <yang.chen@quantatw.com>
> > ---
> >  .../aspeed/aspeed-bmc-facebook-minerva.dts    | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> > index e20e31917d6c..7d96a3638448 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> > @@ -22,6 +22,8 @@ aliases {
> >               i2c19 =3D &imux19;
> >               i2c20 =3D &imux20;
> >               i2c21 =3D &imux21;
> > +
> > +             spi1 =3D &spi_gpio;
> >       };
> >
> >       chosen {
> > @@ -49,6 +51,25 @@ led-fan-fault {
> >                       default-state =3D "off";
> >               };
> >       };
> > +
> > +     spi_gpio: spi-gpio {
> > +             status =3D "okay";
> > +             compatible =3D "spi-gpio";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             gpio-sck =3D <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> > +             gpio-mosi =3D <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>=
;
> > +             gpio-miso =3D <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>=
;
> > +             num-chipselects =3D <1>;
> > +             cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> > +
> > +             tpmdev@0 {
> > +                     compatible =3D "infineon,slb9670", "tcg,tpm_tis-s=
pi";
> > +                     spi-max-frequency =3D <33000000>;
> > +                     reg =3D <0>;
> > +             };
> > +     };
>
> I poked at your series with the following script:
>
> ```
> $ cat dtb-check
> #!/usr/bin/bash
>
> set -euo pipefail
>
> DTB=3D"$1"
>
> rm -f arch/arm/boot/dts/"$DTB"
> make CHECK_DTBS=3Dy "$DTB" 2>&1 |
>     sed "/should not be valid under {'type': 'object'}/d" > curr.log
> diff -u ref.log curr.log
> ```
>
> I ran this after creating a reference output prior to your series using
> the same `make CHECK_DTBS=3Dy` command.
>
> This patch gave the following output (which I expect Rob's bot will
> follow up with at some point as well):
>
> ```
> --- ref.log     2024-06-26 10:48:23.767078834 +0930
> +++ curr.log    2024-06-26 10:55:56.857034132 +0930
> @@ -1,4 +1,6 @@
>    DTC_CHK arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb
> +/home/andrew/src/
> kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-b=
mc-facebook-minerva.dtb:
> /: spi-gpio: {'status': ['okay'], 'compatible': ['spi-gpio'],
> '#address-cells': [[1]], '#size-cells': [[0]], 'gpio-sck': [[62, 203, 0]]=
,
> 'gpio-mosi': [[62, 204, 0]], 'gpio-miso': [[62, 205, 0]],
> 'num-chipselects': [[1]], 'cs-gpios': [[62, 200, 1]], 'tpmdev@0':
> {'compatible': ['infineon,slb9670', 'tcg,tpm_tis-spi'],
> 'spi-max-frequency': [[33000000]], 'reg': [[0]]}} is not of type 'array'
> +       from schema $id:
> http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>  /home/andrew/src/
> kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-b=
mc-facebook-minerva.dtb:
> timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id:
> http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
>  /home/andrew/src/
> kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-b=
mc-facebook-minerva.dtb:
> sdram@1e6e0000: compatible: ['aspeed,ast2600-sdram-edac', 'syscon'] is
> too long
> @@ -38,3 +40,17 @@
>         from schema $id:
> http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb:
> /ahb/apb/fsi@1e79b100: failed to match any schema with compatible:
> ['aspeed,ast2600-fsi-master', 'fsi-master']
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb:
> /ahb/apb/dma-controller@1e79e000: failed to match any schema with
> compatible: ['aspeed,ast2600-udma']
> +/home/andrew/src/
> kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-b=
mc-facebook-minerva.dtb:
> spi-gpio: $nodename:0: 'spi-gpio' does not match
> '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
> +       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
>
> +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/d=
ts/aspeed/aspeed-bmc-facebook-minerva.dtb
> <http://devicetree.org/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel=
.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-faceb=
ook-minerva.dtb>:
> spi-gpio: gpio-sck: False schema does not allow [[62, 203, 0]]
> +       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
>
> +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/d=
ts/aspeed/aspeed-bmc-facebook-minerva.dtb
> <http://devicetree.org/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel=
.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-faceb=
ook-minerva.dtb>:
> spi-gpio: gpio-miso: False schema does not allow [[62, 205, 0]]
> +       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
>
> +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/d=
ts/aspeed/aspeed-bmc-facebook-minerva.dtb
> <http://devicetree.org/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel=
.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-faceb=
ook-minerva.dtb>:
> spi-gpio: gpio-mosi: False schema does not allow [[62, 204, 0]]
> +       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
>
> +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/d=
ts/aspeed/aspeed-bmc-facebook-minerva.dtb
> <http://devicetree.org/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel=
.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-faceb=
ook-minerva.dtb>:
> spi-gpio: 'sck-gpios' is a required property
> +       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
>
> +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/d=
ts/aspeed/aspeed-bmc-facebook-minerva.dtb
> <http://devicetree.org/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel=
.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-faceb=
ook-minerva.dtb>:
> spi-gpio: Unevaluated properties are not allowed ('#address-cells',
> '#size-cells', 'gpio-miso', 'gpio-mosi', 'gpio-sck', 'tpmdev@0' were
> unexpected)
> +       from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
>
> +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/d=
ts/aspeed/aspeed-bmc-facebook-minerva.dtb
> <http://devicetree.org/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel=
.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-faceb=
ook-minerva.dtb>:
> tpmdev@0: $nodename:0: 'tpmdev@0' does not match '^tpm(@[0-9a-f]+)?$'
> +       from schema $id:
> http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
> ```
>
> Can you please address these and go over the rest of the patches to
> shore them up against the current bindings?
>
> Thanks,
>
> Andrew
>


Thanks for your suggestion, I sent a v1 version and the link is below:
https://lore.kernel.org/all/20240626130332.929534-1-yangchen.openbmc@gmail.=
com/

Please help to review again, thank you!

Thanks,
Yang Chen

--0000000000000e5ff6061bcac26f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Andrew,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 26, 2024 at 9:30=E2=80=AFAM And=
rew Jeffery &lt;<a href=3D"mailto:andrew@codeconstruct.com.au">andrew@codec=
onstruct.com.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Tue, 2024-06-25 at 20:18 +0800, Yang Chen wrote:<br>
&gt; From: Yang Chen &lt;<a href=3D"mailto:yang.chen@quantatw.com" target=
=3D"_blank">yang.chen@quantatw.com</a>&gt;<br>
&gt; <br>
&gt; Add spi-gpio for TPM device.<br>
&gt; <br>
&gt; Signed-off-by: Yang Chen &lt;<a href=3D"mailto:yang.chen@quantatw.com"=
 target=3D"_blank">yang.chen@quantatw.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../aspeed/aspeed-bmc-facebook-minerva.dts=C2=A0 =C2=A0 | 21 +++=
++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 21 insertions(+)<br>
&gt; <br>
&gt; diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts =
b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts<br>
&gt; index e20e31917d6c..7d96a3638448 100644<br>
&gt; --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts<br>
&gt; +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts<br>
&gt; @@ -22,6 +22,8 @@ aliases {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c19 =3D &amp;i=
mux19;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c20 =3D &amp;i=
mux20;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c21 =3D &amp;i=
mux21;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi1 =3D &amp;spi_gpi=
o;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {<br>
&gt; @@ -49,6 +51,25 @@ led-fan-fault {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0default-state =3D &quot;off&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi_gpio: spi-gpio {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
spi-gpio&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &l=
t;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;0=
&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-sck =3D &lt;&amp=
;gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-mosi =3D &lt;&am=
p;gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-miso =3D &lt;&am=
p;gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num-chipselects =3D &=
lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-gpios =3D &lt;&amp=
;gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpmdev@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;infineon,slb9670&quot;, &quot;tcg,tpm_tis-spi&q=
uot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0spi-max-frequency =3D &lt;33000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
<br>
I poked at your series with the following script:<br>
<br>
```<br>
$ cat dtb-check<br>
#!/usr/bin/bash<br>
<br>
set -euo pipefail<br>
<br>
DTB=3D&quot;$1&quot;<br>
<br>
rm -f arch/arm/boot/dts/&quot;$DTB&quot;<br>
make CHECK_DTBS=3Dy &quot;$DTB&quot; 2&gt;&amp;1 |<br>
=C2=A0 =C2=A0 sed &quot;/should not be valid under {&#39;type&#39;: &#39;ob=
ject&#39;}/d&quot; &gt; curr.log<br>
diff -u ref.log curr.log<br>
```<br>
<br>
I ran this after creating a reference output prior to your series using<br>
the same `make CHECK_DTBS=3Dy` command.<br>
<br>
This patch gave the following output (which I expect Rob&#39;s bot will<br>
follow up with at some point as well):<br>
<br>
```<br>
--- ref.log=C2=A0 =C2=A0 =C2=A02024-06-26 10:48:23.767078834 +0930<br>
+++ curr.log=C2=A0 =C2=A0 2024-06-26 10:55:56.857034132 +0930<br>
@@ -1,4 +1,6 @@<br>
=C2=A0 =C2=A0DTC_CHK arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.d=
tb<br>
+/home/andrew/src/<a href=3D"http://kernel.org/linux/origin/build.aspeed_g5=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb" rel=3D"noreferre=
r" target=3D"_blank">kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/=
dts/aspeed/aspeed-bmc-facebook-minerva.dtb</a>: /: spi-gpio: {&#39;status&#=
39;: [&#39;okay&#39;], &#39;compatible&#39;: [&#39;spi-gpio&#39;], &#39;#ad=
dress-cells&#39;: [[1]], &#39;#size-cells&#39;: [[0]], &#39;gpio-sck&#39;: =
[[62, 203, 0]], &#39;gpio-mosi&#39;: [[62, 204, 0]], &#39;gpio-miso&#39;: [=
[62, 205, 0]], &#39;num-chipselects&#39;: [[1]], &#39;cs-gpios&#39;: [[62, =
200, 1]], &#39;tpmdev@0&#39;: {&#39;compatible&#39;: [&#39;infineon,slb9670=
&#39;, &#39;tcg,tpm_tis-spi&#39;], &#39;spi-max-frequency&#39;: [[33000000]=
], &#39;reg&#39;: [[0]]}} is not of type &#39;array&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0from schema $id: <a href=3D"http://devicetree.o=
rg/schemas/gpio/gpio-consumer.yaml#" rel=3D"noreferrer" target=3D"_blank">h=
ttp://devicetree.org/schemas/gpio/gpio-consumer.yaml#</a><br>
=C2=A0/home/andrew/src/<a href=3D"http://kernel.org/linux/origin/build.aspe=
ed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb" rel=3D"nore=
ferrer" target=3D"_blank">kernel.org/linux/origin/build.aspeed_g5/arch/arm/=
boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb</a>: timer: &#39;clocks&#39=
; does not match any of the regexes: &#39;pinctrl-[0-9]+&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 from schema $id: <a href=3D"http://devicetree.o=
rg/schemas/timer/arm,arch_timer.yaml#" rel=3D"noreferrer" target=3D"_blank"=
>http://devicetree.org/schemas/timer/arm,arch_timer.yaml#</a><br>
=C2=A0/home/andrew/src/<a href=3D"http://kernel.org/linux/origin/build.aspe=
ed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb" rel=3D"nore=
ferrer" target=3D"_blank">kernel.org/linux/origin/build.aspeed_g5/arch/arm/=
boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb</a>: sdram@1e6e0000: compat=
ible: [&#39;aspeed,ast2600-sdram-edac&#39;, &#39;syscon&#39;] is too long<b=
r>
@@ -38,3 +40,17 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 from schema $id: <a href=3D"http://devicetree.o=
rg/schemas/fsi/aspeed,ast2600-fsi-master.yaml#" rel=3D"noreferrer" target=
=3D"_blank">http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yam=
l#</a><br>
=C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/fs=
i@1e79b100: failed to match any schema with compatible: [&#39;aspeed,ast260=
0-fsi-master&#39;, &#39;fsi-master&#39;]<br>
=C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/dm=
a-controller@1e79e000: failed to match any schema with compatible: [&#39;as=
peed,ast2600-udma&#39;]<br>
+/home/andrew/src/<a href=3D"http://kernel.org/linux/origin/build.aspeed_g5=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb" rel=3D"noreferre=
r" target=3D"_blank">kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/=
dts/aspeed/aspeed-bmc-facebook-minerva.dtb</a>: spi-gpio: $nodename:0: &#39=
;spi-gpio&#39; does not match &#39;^spi(@.*|-([0-9]|[1-9][0-9]+))?$&#39;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0from schema $id: <a href=3D"http://devicetree.o=
rg/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel.org/linux/origin/buil=
d.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb" rel=
=3D"noreferrer" target=3D"_blank">http://devicetree.org/schemas/spi/spi-gpi=
o.yaml#<br>
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb</a>: spi-gpio: gpio-sck: False sche=
ma does not allow [[62, 203, 0]]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0from schema $id: <a href=3D"http://devicetree.o=
rg/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel.org/linux/origin/buil=
d.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb" rel=
=3D"noreferrer" target=3D"_blank">http://devicetree.org/schemas/spi/spi-gpi=
o.yaml#<br>
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb</a>: spi-gpio: gpio-miso: False sch=
ema does not allow [[62, 205, 0]]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0from schema $id: <a href=3D"http://devicetree.o=
rg/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel.org/linux/origin/buil=
d.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb" rel=
=3D"noreferrer" target=3D"_blank">http://devicetree.org/schemas/spi/spi-gpi=
o.yaml#<br>
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb</a>: spi-gpio: gpio-mosi: False sch=
ema does not allow [[62, 204, 0]]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0from schema $id: <a href=3D"http://devicetree.o=
rg/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel.org/linux/origin/buil=
d.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb" rel=
=3D"noreferrer" target=3D"_blank">http://devicetree.org/schemas/spi/spi-gpi=
o.yaml#<br>
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb</a>: spi-gpio: &#39;sck-gpios&#39; =
is a required property<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0from schema $id: <a href=3D"http://devicetree.o=
rg/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel.org/linux/origin/buil=
d.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb" rel=
=3D"noreferrer" target=3D"_blank">http://devicetree.org/schemas/spi/spi-gpi=
o.yaml#<br>
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb</a>: spi-gpio: Unevaluated properti=
es are not allowed (&#39;#address-cells&#39;, &#39;#size-cells&#39;, &#39;g=
pio-miso&#39;, &#39;gpio-mosi&#39;, &#39;gpio-sck&#39;, &#39;tpmdev@0&#39; =
were unexpected)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0from schema $id: <a href=3D"http://devicetree.o=
rg/schemas/spi/spi-gpio.yaml#+/home/andrew/src/kernel.org/linux/origin/buil=
d.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb" rel=
=3D"noreferrer" target=3D"_blank">http://devicetree.org/schemas/spi/spi-gpi=
o.yaml#<br>
+/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts=
/aspeed/aspeed-bmc-facebook-minerva.dtb</a>: tpmdev@0: $nodename:0: &#39;tp=
mdev@0&#39; does not match &#39;^tpm(@[0-9a-f]+)?$&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0from schema $id: <a href=3D"http://devicetree.o=
rg/schemas/tpm/tcg,tpm_tis-spi.yaml#" rel=3D"noreferrer" target=3D"_blank">=
http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#</a><br>
```<br>
<br>
Can you please address these and go over the rest of the patches to<br>
shore them up against the current bindings?<br>
<br>
Thanks,<br>
<br>
Andrew<br></blockquote><div><br></div><div><br class=3D"gmail-Apple-interch=
ange-newline">Thanks for your suggestion, I sent a v1 version and the link =
is below:</div><div><a href=3D"https://lore.kernel.org/all/20240626130332.9=
29534-1-yangchen.openbmc@gmail.com/" target=3D"_blank">https://lore.kernel.=
org/all/20240626130332.929534-1-yangchen.openbmc@gmail.com/</a><br></div><d=
iv><br></div><div>Please help to review again, thank you!</div><div><br></d=
iv><div>Thanks,</div><div>Yang Chen=C2=A0</div><div>=C2=A0</div></div></div=
>

--0000000000000e5ff6061bcac26f--
