Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9794D755E3C
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 10:16:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fdTi9RX0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4FKt3j4Yz2y1j
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 18:16:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fdTi9RX0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=billyking19920205@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2Msk28cTz2xqH
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 17:04:25 +1000 (AEST)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-392116ae103so1224954b6e.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 00:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689318261; x=1691910261;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ct5iW0ccrR/9N0121PpCL8sBSVjvyEMaWpZ9Z6RaSww=;
        b=fdTi9RX0UHW5JsMNDBJ4gWLoiZOaGmD0a5ZKaDOYkKE4cXLNmpigumU0BctS0wrtY/
         hw95EvAL3yozD3hvix2FFWyOSGzrYdrBGgVlehMgMy/pIng8dTpijVDu/PmeXiiLpFM+
         AHDPBi/CQZu+xws9jXMK/wOzcXFKL7NquwUofvv5opwD7TAKa6EnFbmfz1pFCxRaqCIG
         zuLDzK6wpbJ+pPMKN0xSnG89kzysxERy4bYiQJQ11e7r5PacQGI/hlTmFQtz/7uUV/nC
         wb/sj77pW7peJSPCV7QaJWO6ArAkWTD6iE4a+Csu8L9KQZsGTHStIqyhbirQd1bGYC1i
         TzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689318261; x=1691910261;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ct5iW0ccrR/9N0121PpCL8sBSVjvyEMaWpZ9Z6RaSww=;
        b=Dzqg+PaAiJ6eo7huHSm0tbczlc61SC+WDCuRCeO4KCUQMhIjKuxPhz7iIrARzuWiAI
         4+R9AS7Paa3BZ60Ls7MFh9936vd56Es+OJYPmUN0v/IyuY3Cjweyup7G3v5qzqeQ7zxR
         IWLg3ZbjWeH0a0VVXWqrOahZJmIyqymVu0QH78ov1p8S9yS+4b21Fv0Zrhkm2dAs+kop
         g+abWWcLqbWgad5pxpk8/IXk+SBvBkIia4U5q5h1dC1275i4PFC/jK+OjvtDgiRAone5
         F7SCHa1L/RbpJ4s8++bk3H+YfMGTiTPyKVPDu0jUAjVOH4EuXdUSgyzdlHE4k1kzdUVF
         Nb0g==
X-Gm-Message-State: ABy/qLaLqxTz0lwWm3nFyMcwfZ9zadvAZ5M0DivxPGbgMdNeVEyN3UNj
	bAKzwqZ0QLy0DFZ1zZNyw0CneqK7N+zYzl9BBso=
X-Google-Smtp-Source: APBJJlElje0JyWi/pEFOyo8CFYLDpmFMq00Bnwa1vvnod9f3hcR37f+wOZOaUI6uulwVibwVME8QMd3bea+x4Q4/hzg=
X-Received: by 2002:a05:6808:20a4:b0:3a3:83c9:bdf7 with SMTP id
 s36-20020a05680820a400b003a383c9bdf7mr4836867oiw.5.1689318261363; Fri, 14 Jul
 2023 00:04:21 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>
Date: Fri, 14 Jul 2023 15:04:10 +0800
Message-ID: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control documentation
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com" <jdelvare@suse.com>, 
	"robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@aj.id.au" <andrew@aj.id.au>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "corbet@lwn.net" <corbet@lwn.net>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, 
	Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: multipart/alternative; boundary="000000000000e1997a06006d0eb6"
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:11:36 +1000
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

--000000000000e1997a06006d0eb6
Content-Type: text/plain; charset="UTF-8"

        On 6/7/23 23:21, Billy Tsai wrote:

        > > >          > The code says:

        > > >

        > > >          > In Aspeed AST2600 SoC features 16 TACH
controllers, with each

        > > >

        > > >          > controller capable of supporting up to 1 input.

        > > >

        > > >          > which is a bit different. I guess there are no
examples anymore,

        > > >

        > > >          > but I'd really like to see how this looks like in
the devicetree file,

        > > >

        > > >          > and how the driver is supposed to
distinguish/select the 16 inputs.

        > > >

        > > > Hi Roeck,

        > > >

        > > > The node in the devicetree file will looks like following:

        > > >

        > > > tach0: tach0@1e610008 {

        > > >

        > > >          compatible = "aspeed,ast2600-tach";

        > > >

        > > >          reg = <0x1e610008 0x8>;

        > > >

        > > >          #address-cells = <1>;

        > > >

        > > >          #size-cells = <0>;

        > > >

        > > >          pinctrl-names = "default";

        > > >

        > > >          pinctrl-0 = <&pinctrl_tach0_default>;

        > > >

        > > >          clocks = <&syscon ASPEED_CLK_AHB>;

        > > >

        > > >          resets = <&syscon ASPEED_RESET_PWM>;

        > > >

        > > >          status = "disabled";

        > > >

        > > > };

        > > >



        > > Neither reg nor pinctrl is mentioned in the bindings. Maybe
that is not needed nowadays,

        > > but I find it confusing.



        > > Either case, it is highly unusual that there would be 16
instances of this device

        > > instead of one. Why is this done ? It doesn't really make sense
to me.



        > Having 16 instances of PWM and Tach is more compatible with our
hardware design.

        > This is because our register layout for PWM and Tach is not
continuous.

        > PWM0 used 0x0 0x4, Tach0 used 0x8 0xc

        > PWM1 used 0x10 0x14, Tach1 used 0x18 0x1c

        > ...

        > Each PWM/Tach instance has its own controller register and is not
dependent on others.



Hi Guenter,



Did you receive a response to my previous email?

I would like to inquire if you have any further concerns regarding the PWM
and Tach with 16 instances.



Thanks



Best Regards,

Billy Tsai

--000000000000e1997a06006d0eb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;=
font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>On 6/7/23 23:21=
, Billy Tsai wrote:</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size=
:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0<=
/span>&gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; The code says:=
</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:C=
alibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span></p><p class=3D"Mso=
Normal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;c=
olor:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"g=
mail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-sp=
ace">=C2=A0</span>&gt; In Aspeed AST2600 SoC features 16 TACH controllers, =
with each</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font=
-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &=
gt; &gt;<span class=3D"gmail-Apple-converted-space">=C2=A0</span></p><p cla=
ss=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,san=
s-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span c=
lass=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-con=
verted-space">=C2=A0</span>&gt; controller capable of supporting up to 1 in=
put.</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-fami=
ly:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt;=
 &gt;<span class=3D"gmail-Apple-converted-space">=C2=A0</span></p><p class=
=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-=
serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span cla=
ss=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-conver=
ted-space">=C2=A0</span>&gt; which is a bit different. I guess there are no=
 examples anymore,</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:=
10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</sp=
an>&gt; &gt; &gt;<span class=3D"gmail-Apple-converted-space">=C2=A0</span><=
/p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Ca=
libri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-=
Apple-converted-space">=C2=A0</span>&gt; but I&#39;d really like to see how=
 this looks like in the devicetree file,</p><p class=3D"MsoNormal" style=3D=
"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)"=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-conve=
rted-space">=C2=A0</span>&gt; &gt; &gt;<span class=3D"gmail-Apple-converted=
-space">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin:0cm;font-si=
ze:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0<=
/span>&gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; and how the dr=
iver is supposed to distinguish/select the 16 inputs.</p><p class=3D"MsoNor=
mal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;colo=
r:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmai=
l-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;<span class=3D"gmail-Ap=
ple-converted-space">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margi=
n:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted=
-space">=C2=A0</span>&gt; &gt; &gt; Hi Roeck,</p><p class=3D"MsoNormal" sty=
le=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,=
0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-=
converted-space">=C2=A0</span>&gt; &gt; &gt;<span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin:0cm;fo=
nt-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=
=C2=A0</span>&gt; &gt; &gt; The node in the devicetree file will looks like=
 following:</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;fo=
nt-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt=
; &gt; &gt;<span class=3D"gmail-Apple-converted-space">=C2=A0</span></p><p =
class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,=
sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<spa=
n class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt; tach0: =
tach0@1e610008 {</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10=
pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</sp=
an>&gt; &gt; &gt;<span class=3D"gmail-Apple-converted-space">=C2=A0</span><=
/p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Ca=
libri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-=
Apple-converted-space">=C2=A0</span>compatible =3D &quot;aspeed,ast2600-tac=
h&quot;;</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-=
family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &=
gt; &gt;<span class=3D"gmail-Apple-converted-space">=C2=A0</span></p><p cla=
ss=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,san=
s-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span c=
lass=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-con=
verted-space">=C2=A0</span>reg =3D &lt;0x1e610008 0x8&gt;;</p><p class=3D"M=
soNormal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif=
;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D=
"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;<span class=3D"gma=
il-Apple-converted-space">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"=
margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-conver=
ted-space">=C2=A0</span>&gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>=
#address-cells =3D &lt;1&gt;;</p><p class=3D"MsoNormal" style=3D"margin:0cm=
;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space=
">=C2=A0</span>&gt; &gt; &gt;<span class=3D"gmail-Apple-converted-space">=
=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;=
font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0</span>=C2=A0=C2=A0=C2=A0&g=
t; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span cla=
ss=3D"gmail-Apple-converted-space">=C2=A0</span>#size-cells =3D &lt;0&gt;;<=
/p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Ca=
libri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span></p><p class=3D"Mso=
Normal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;c=
olor:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"g=
mail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-sp=
ace">=C2=A0</span>pinctrl-names =3D &quot;default&quot;;</p><p class=3D"Mso=
Normal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;c=
olor:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"g=
mail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;<span class=3D"gmail=
-Apple-converted-space">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"ma=
rgin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-conver=
ted-space">=C2=A0</span>&gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>=
pinctrl-0 =3D &lt;&amp;pinctrl_tach0_default&gt;;</p><p class=3D"MsoNormal"=
 style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rg=
b(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Ap=
ple-converted-space">=C2=A0</span>&gt; &gt; &gt;<span class=3D"gmail-Apple-=
converted-space">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin:0c=
m;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space=
">=C2=A0</span>&gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>clocks =
=3D &lt;&amp;syscon ASPEED_CLK_AHB&gt;;</p><p class=3D"MsoNormal" style=3D"=
margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-conver=
ted-space">=C2=A0</span>&gt; &gt; &gt;<span class=3D"gmail-Apple-converted-=
space">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin:0cm;font-siz=
e:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0<=
/span>&gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span>resets =3D &lt;&amp=
;syscon ASPEED_RESET_PWM&gt;;</p><p class=3D"MsoNormal" style=3D"margin:0cm=
;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space=
">=C2=A0</span>&gt; &gt; &gt;<span class=3D"gmail-Apple-converted-space">=
=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;=
font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>=
&gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span c=
lass=3D"gmail-Apple-converted-space">=C2=A0</span>status =3D &quot;disabled=
&quot;;</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-f=
amily:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &=
gt; &gt;<span class=3D"gmail-Apple-converted-space">=C2=A0</span></p><p cla=
ss=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,san=
s-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span c=
lass=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt; };</p><p c=
lass=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,s=
ans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span=
 class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; &gt; &gt;<span cla=
ss=3D"gmail-Apple-converted-space">=C2=A0</span></p><p class=3D"MsoNormal" =
style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb=
(0,0,0)">=C2=A0</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10p=
t;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>=
&gt; &gt; Neither reg nor pinctrl is mentioned in the bindings. Maybe that =
is not needed nowadays,</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-=
size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=
=A0</span>&gt; &gt; but I find it confusing.</p><p class=3D"MsoNormal" styl=
e=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0=
,0)">=C2=A0</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;fo=
nt-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt=
; &gt; Either case, it is highly unusual that there would be 16 instances o=
f this device</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;=
font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>=
&gt; &gt; instead of one. Why is this done ? It doesn&#39;t really make sen=
se to me.</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font=
-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0</p><p class=3D"MsoNorma=
l" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:=
rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-=
Apple-converted-space">=C2=A0</span>&gt; Having 16 instances of PWM and Tac=
h is more compatible with our hardware design.<span class=3D"gmail-Apple-co=
nverted-space">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin:0cm;=
font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space=
">=C2=A0</span>&gt; This is because our register layout for PWM and Tach is=
 not continuous.</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10=
pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</sp=
an>&gt; PWM0 used 0x0 0x4, Tach0 used 0x8 0xc</p><p class=3D"MsoNormal" sty=
le=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,=
0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<span class=3D"gmail-Apple-=
converted-space">=C2=A0</span>&gt; PWM1 used 0x10 0x14, Tach1 used 0x18 0x1=
c</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:=
Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0<span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; ...</p>=
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Calib=
ri,sans-serif;color:rgb(0,0,0)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span>&gt; Each PWM/Tach =
instance has its own controller register and is not dependent on others.</p=
><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Cali=
bri,sans-serif;color:rgb(0,0,0)">=C2=A0</p><p class=3D"MsoNormal" style=3D"=
margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">=
Hi Guenter,</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;fo=
nt-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0</p><p class=3D"MsoNor=
mal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;colo=
r:rgb(0,0,0)">Did you receive a response to my previous email?</p><p class=
=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-=
serif;color:rgb(0,0,0)"><span lang=3D"EN-US">I would like to inquire if you=
 have any further concerns regarding the PWM and Tach with 16 instances.</s=
pan></p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;font-fami=
ly:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0</p><p class=3D"MsoNormal" st=
yle=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0=
,0,0)">Thanks</p><p class=3D"MsoNormal" style=3D"margin:0cm;font-size:10pt;=
font-family:Calibri,sans-serif;color:rgb(0,0,0)">=C2=A0</p><p class=3D"MsoN=
ormal" style=3D"margin:0cm;font-size:10pt;font-family:Calibri,sans-serif;co=
lor:rgb(0,0,0)">Best Regards,</p><p class=3D"MsoNormal" style=3D"margin:0cm=
;font-size:10pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)">Billy Tsai=
</p></div>

--000000000000e1997a06006d0eb6--
