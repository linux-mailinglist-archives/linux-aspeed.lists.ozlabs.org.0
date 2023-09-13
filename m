Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7D17A4132
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 08:30:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bkeM2rjL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpw0P4xX6z3cD0
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 16:30:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bkeM2rjL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm28T2qqxz3gZw
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 23:57:44 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-64c1d487e72so42872206d6.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694613459; x=1695218259; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RUg8ihGXCA7FnzWf+xkh3lfaXlVmxxG+LwKzFG2RNzk=;
        b=bkeM2rjLNNZb7g3cT4/Rh1zI5Amu35HrI1sPVq9wIyJuorzxr6rs5PMduHNqrrIm2T
         RHNSMgQRkCvK3WlJFs34KSxNTXIL3C71vGGkqKiWrSeg5ZPvaxk3+8Bn8kq0/AeH8d+w
         p2lDChiuQNfayGkY9tIZmBdAtR/SMAMqUd7/C/r2tb2ZRTA7Js+/Aaau7EZeyrfiGoDs
         HtTlpFsJuYF2lWDWfREFrjuAowCHp+R8MR01z7+zMIIDdMN6dzOMhe9CFWGpNhex3Eht
         /RFbVlF3MZ68foaSrgBJoHJr2YGWij2D8DO5BKL9Qg+kOnhstC1p/nPDdnNOj2mG+pAH
         L3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694613459; x=1695218259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUg8ihGXCA7FnzWf+xkh3lfaXlVmxxG+LwKzFG2RNzk=;
        b=tqbKZM9heqy5m9dbcg7eCcb44DX0ZE3Wnhv3pcoDF3Ft1el7RoBUD4v+UXiXO9GwZR
         EdJ2fl5sPi84KEK75QNO5vjBSxH3qhRaIoDaquJk2JJ+d4WB5AhB32KWl8EKFihJVIOt
         agh3R+k7T5DBqdRHknXgyHauZleaLAxQ5Ykrh1lfVwyoPe6jzHUSNCkR1iprwdh4+IIq
         cmayKlRvO3S8kc+xsrV2u+zz26lg9D2wot1MRldcSRkYOwjvZOE9T/j6jyq4Y/AAjCAE
         Lh44HjN0/4PNVZbiD4WKq5TOQdHn2jih4ZrBWsdgxJRicKKwUjx1g2ZQVaT7QuI8FSJv
         KGPA==
X-Gm-Message-State: AOJu0YzVF2MUTqq4Ryp788XXs4e220pE+mpJ2jX95QStSD1UDmTtcC8a
	UZ2AbNLHEOh5LxIXYRfUpaW65YFc7ZsMtOdkYUs=
X-Google-Smtp-Source: AGHT+IHOGA/zHAuDlsImyT+ZwXiZWBXTTF9v7ENRPWmA1Ae5pEsRAkbQG1kh7o4H7XoNQ1oAX+nPQHc7BuWixqN1INQ=
X-Received: by 2002:a0c:ca06:0:b0:655:dd86:7234 with SMTP id
 c6-20020a0cca06000000b00655dd867234mr2415331qvk.40.1694613459568; Wed, 13 Sep
 2023 06:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-3-yangchen.openbmc@gmail.com> <1bfdc230-e358-6aa4-7d60-03b5477a6be9@linaro.org>
In-Reply-To: <1bfdc230-e358-6aa4-7d60-03b5477a6be9@linaro.org>
From: Yang Chen <yangchen.openbmc@gmail.com>
Date: Wed, 13 Sep 2023 21:57:28 +0800
Message-ID: <CALFa7M_GvCgmEZxvo_ZSYoCPOe+9-tQt3KHn=_cu3n7psP+PTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva CMC board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004a0bda06053df1be"
X-Mailman-Approved-At: Mon, 18 Sep 2023 16:30:23 +1000
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eddie.Chen@quantatw.com, patrick@stwcx.xyz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--0000000000004a0bda06053df1be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> +
> +&i2c15 {
> +     status =3D "okay";
> +
> +     eeprom@50 {
> +             compatible =3D "atmel,24c128";
> +             reg =3D <0x50>;
> +     };
> +};
> +
> +&adc0 {
> +     ref_voltage =3D <2500>;

There is no such property in the bindings.

> +     status =3D "okay";
> +     pinctrl-0 =3D <&pinctrl_adc0_default &pinctrl_adc1_default
> +             &pinctrl_adc2_default &pinctrl_adc3_default
> +             &pinctrl_adc4_default &pinctrl_adc5_default
> +             &pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +     ref_voltage =3D <2500>;

NAK, there is no such property.

Thanks for your advice, I will change this property to
"aspeed,int-vref-microvolt" which is defined in the binding in the v2 patch=
.

Thanks,
Yang Chen


Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2023=E5=B9=
=B49=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=89
=E4=B8=8B=E5=8D=886:04=E5=AF=AB=E9=81=93=EF=BC=9A

> On 12/09/2023 16:05, yangchen.openbmc@gmail.com wrote:
> > From: Yang Chen <yangchen.openbmc@gmail.com>
> >
> > Add linux device tree entry related to the Minerva Chassis Management
> > Controller (CMC) specific devices connected to the Aspeed SoC (AST2600)=
.
> >
> > Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile             |   1 +
> >  .../aspeed-bmc-facebook-minerva-cmc.dts       | 265 ++++++++++++++++++
> >  2 files changed, 266 insertions(+)
> >  create mode 100644
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
> >
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/
>
>
> > +
> > +&i2c15 {
> > +     status =3D "okay";
> > +
> > +     eeprom@50 {
> > +             compatible =3D "atmel,24c128";
> > +             reg =3D <0x50>;
> > +     };
> > +};
> > +
> > +&adc0 {
> > +     ref_voltage =3D <2500>;
>
> There is no such property in the bindings.
>
> > +     status =3D "okay";
> > +     pinctrl-0 =3D <&pinctrl_adc0_default &pinctrl_adc1_default
> > +             &pinctrl_adc2_default &pinctrl_adc3_default
> > +             &pinctrl_adc4_default &pinctrl_adc5_default
> > +             &pinctrl_adc6_default &pinctrl_adc7_default>;
> > +};
> > +
> > +&adc1 {
> > +     ref_voltage =3D <2500>;
>
> NAK, there is no such property.
>
>
>
> Best regards,
> Krzysztof
>
>

--0000000000004a0bda06053df1be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Krzysztof,<div><div style=3D"background-color:#fff"> </=
div><br> <div class=3D"gmail_default" style=3D"margin-left:0.6rem;padding-t=
op:0.4rem;padding-bottom:0.4rem;padding-left:0.8em;padding-right:1.2rem;bac=
kground-color:#e9f3ff;color:#222;display:inline-block;border-radius:5px"><s=
pan class=3D"">&gt; +<br>
&gt; +&amp;i2c15 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0eeprom@50 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
atmel,24c128&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x50&gt;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;adc0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ref_voltage =3D &lt;2500&gt;;<br>
<br></span>
There is no such property in the bindings.<span class=3D"im"><br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_adc0_default &amp;=
pinctrl_adc1_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc2_def=
ault &amp;pinctrl_adc3_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc4_def=
ault &amp;pinctrl_adc5_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc6_def=
ault &amp;pinctrl_adc7_default&gt;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;adc1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ref_voltage =3D &lt;2500&gt;;<br>
<br></span>
NAK, there is no such property.</div> <div style=3D"background-color:#fff">=
</div> <br></div><div>Thanks for your advice, I will change this property t=
o &quot;aspeed,int-vref-microvolt&quot; which is defined in the binding in =
the v2 patch.</div><div><br></div><div>Thanks,</div><div>Yang Chen<br><div>=
<br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlows=
ki@linaro.org">krzysztof.kozlowski@linaro.org</a>&gt; =E6=96=BC 2023=E5=B9=
=B49=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:04=E5=AF=AB=
=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 12/09/2023 16:05, <a href=3D"mailto:yangchen.openbmc@gmail.com" targe=
t=3D"_blank">yangchen.openbmc@gmail.com</a> wrote:<br>
&gt; From: Yang Chen &lt;<a href=3D"mailto:yangchen.openbmc@gmail.com" targ=
et=3D"_blank">yangchen.openbmc@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Add linux device tree entry related to the Minerva Chassis Management<=
br>
&gt; Controller (CMC) specific devices connected to the Aspeed SoC (AST2600=
).<br>
&gt; <br>
&gt; Signed-off-by: Yang Chen &lt;<a href=3D"mailto:yangchen.openbmc@gmail.=
com" target=3D"_blank">yangchen.openbmc@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/aspeed/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../aspeed-bmc-facebook-minerva-cmc.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 265 ++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 266 insertions(+)<br>
&gt;=C2=A0 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-=
minerva-cmc.dts<br>
&gt; <br>
&gt; diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/<br>
<br>
<br>
&gt; +<br>
&gt; +&amp;i2c15 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0eeprom@50 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
atmel,24c128&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x50&gt;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;adc0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ref_voltage =3D &lt;2500&gt;;<br>
<br>
There is no such property in the bindings.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_adc0_default &amp;=
pinctrl_adc1_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc2_def=
ault &amp;pinctrl_adc3_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc4_def=
ault &amp;pinctrl_adc5_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc6_def=
ault &amp;pinctrl_adc7_default&gt;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;adc1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ref_voltage =3D &lt;2500&gt;;<br>
<br>
NAK, there is no such property.<br>
<br>
<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div>

--0000000000004a0bda06053df1be--
