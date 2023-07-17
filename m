Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F0755EEC
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 11:01:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YbJ2jFbu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4GKv2qyFz2yGd
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 19:01:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YbJ2jFbu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=billyking19920205@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4GKl1Cjtz2y1k
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 19:01:46 +1000 (AEST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1b06ea7e7beso3337105fac.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689584499; x=1692176499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxldzEnqhxU11I1qenml6kr6jYXmqVdQ8A5TZLTLFXc=;
        b=YbJ2jFbuBvsxsq+FFnLBHzWtJWttbm0hbVvB1eIgpYvmPoezlwAfRDw3+SJ8ZGbUSF
         D32HEvc89R9TKCdMxLVLozQ9yFbCR5Dk09Ehy6X0RA2S9uvIWamDXLiZ2urXjvTwx+cv
         FcBr44cXJ/oAerRc1E0gcq7EMLZcUOKxz8hDBLM9CCdN6Lai6G8fIzqQO/5S8/z92YHP
         4M7ckb0YPjOcMVai8RnzdoJ8cqgqdj8nbfaUaPFf9zak0mx/H0Do5C9BonfGe5h+6pYI
         jAhno5X0mJ9eViSgtmH6Mr6hHOYwDrEA+I0d7n+23O70odDsHeXw7X1ZSZS+JFeDlcRk
         176g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689584499; x=1692176499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxldzEnqhxU11I1qenml6kr6jYXmqVdQ8A5TZLTLFXc=;
        b=B4t6AartbMONb/xRi3Q8V4WwwtapH/+RH15JP8/dekpR/2L0OsXub66zy8/bAzMStQ
         5M+I3P9TTKXdt7j16MGgN2eBe1GCwmEeuQGVyNlTU1LzGRcz1oskDc6KgtG1PBrk6+vM
         SqaHVAdeRbVcbuWK418yqssQlXETgsLdVKNHICMPmcec57HckypZiGnp2UqNDIGsY4PM
         eifXkcQrkfwtHFz+GzqSgl+FV8SLi1jD2Ga6lfAco71YYUG7RoZk1vz8j7pZWAgbLzw6
         4ruFVDyufp/TBeiGVbyltTKUgmm+ffo6KAdVxUQ8Oos8JnMq4tAo4KPV9jhYOfFn+qv8
         L8LA==
X-Gm-Message-State: ABy/qLahrcHp4w2fxL5wgYA4Mj8Sha52nkBypW+eTGmwAWLhJSgejtVc
	uB8APqmvg8Gf5K+9Rip65qYjDdSOgMY0GwGBbn4=
X-Google-Smtp-Source: APBJJlHgS3n1gQn4Oax9fTF+hYKgAcdQqB9afBeR6x0UgGsHhp289g1cgQIuZwJ37pl3ns1pDcKlMFedVXvZ0dTUDmg=
X-Received: by 2002:a05:6870:589b:b0:1b0:40b0:114c with SMTP id
 be27-20020a056870589b00b001b040b0114cmr12150916oab.43.1689584499214; Mon, 17
 Jul 2023 02:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
 <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org> <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
 <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com>
 <7b198d57-ddec-3074-314a-3e5e5b8f48f9@roeck-us.net> <CAGUgbhDbFedVe-pc+muD_NtDpjHpGqMDdrS3A73C-QbxeHn4oQ@mail.gmail.com>
 <cf91edc9-1093-495b-48eb-6b05198c2541@linaro.org> <7a69bda1-5f4c-5b1f-8eb6-6fd58917a9b1@roeck-us.net>
In-Reply-To: <7a69bda1-5f4c-5b1f-8eb6-6fd58917a9b1@roeck-us.net>
From: =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>
Date: Mon, 17 Jul 2023 17:01:28 +0800
Message-ID: <CAGUgbhCTDPGt_vpbfaEreX+iuLJ3WUBqt4kppxyaFZQus9Zf0Q@mail.gmail.com>
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control documentation
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2023=E5=B9=B47=E6=9C=8817=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=881:00=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 7/16/23 09:08, Krzysztof Kozlowski wrote:
>
> [ ... ]
>
> >>
> >> This patch serial doesn't use to binding the fan control h/w. It is
> >> used to binding the two independent h/w blocks.
> >> One is used to provide pwm output and another is used to monitor the
> >> speed of the input.
> >> My patch is used to point out that the pwm and the tach is the
> >> different function and don't need to
> >> bind together. You can not only combine them as the fan usage but also
> >> treat them as the individual module for
> >> use. For example: the pwm can use to be the beeper (pwm-beeper.c), the
> >> tach can be used to monitor the heart beat signal.
> >
> > Isn't this exactly the same as in every other SoC? PWMs can be used in
> > different ways?
> >
>
> ... and in every fan controller. Not that it really makes sense because
> normally the pwm controller part of such chips is tied to the fan input,
> to enable automatic fan control, but it is technically possible.
> In many cases this is also the case in SoCs, for example, in ast2500.
> Apparently this was redesigned in ast2600 where they two blocks are
> only lightly coupled (there are two pwm status bits in the fan status
> register, but I have no idea what those mean). If the blocks are tightly
> coupled, separate drivers don't really make sense.
>
> There are multiple ways to separate the pwm controller part from the
> fan inputs if that is really necessary. One would be to provide a
> sequence of address mappings, the other would be to pass the memory
> region from an mfd driver. It is not necessary to have N instances
> of the fan controller, even if the address space is not continuous.
>

Hi Guenter,

May I ask about the meaning of the sequence of address mappings? It appears
to consist of multiple tuples within the 'reg' property, indicating
the usage of PWM/Tach
registers within a single instance. After that I can use the dts like follo=
wing:

pwm: pwm@1e610000 {
...
reg =3D <0x1e610000 0x8
0x1e610010 0x8
0x1e610020 0x8
0x1e610030 0x8
0x1e610040 0x8
0x1e610050 0x8
0x1e610060 0x8
0x1e610070 0x8
0x1e610080 0x8
0x1e610090 0x8
0x1e6100A0 0x8
0x1e6100B0 0x8
0x1e6100C0 0x8
0x1e6100D0 0x8
0x1e6100E0 0x8
0x1e6100F0 0x8>;
...
};

tach: tach@
...
reg =3D <0x1e610008 0x8
0x1e610018 0x8
0x1e610028 0x8
0x1e610038 0x8
0x1e610048 0x8
0x1e610058 0x8
0x1e610068 0x8
0x1e610078 0x8
0x1e610088 0x8
0x1e610098 0x8
0x1e6100A8 0x8
0x1e6100B8 0x8
0x1e6100C8 0x8
0x1e6100D8 0x8
0x1e6100E8 0x8
0x1e6100F8 0x8>;
...
};

correct?

Thanks

> Guenter
>
> > Anyway, it is tricky to keep the discussion since you avoid posting
> > entire DTS. I already said:
> >
> > "I will start NAKing such patches without DTS user. It's like reviewing
> > fake code for some unknown solution and trying to get from you piece of
> > answers one by one, because you do not want to share entire part."
> >

Hi Krzysztof,

Do you mean the DTS example of the usage in the binding, like the
following right?
PWM:
pwm0: pwm0@1e610000 {
compatible =3D "aspeed,ast2600-pwm";
reg =3D <0x1e610000 0x8>;
#pwm-cells =3D <3>;
#address-cells =3D <1>;
#size-cells =3D <0>;
pinctrl-names =3D "default";
pinctrl-0 =3D <&pinctrl_pwm0_default>;
clocks =3D <&syscon ASPEED_CLK_AHB>;
resets =3D <&syscon ASPEED_RESET_PWM>;
};

TACH:
examples:
- |
tach0: tach0@1e610008 {
        compatible =3D "aspeed,ast2600-tach";
        reg =3D <0x1e610008 0x8>;
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_tach0_default>;
        clocks =3D <&syscon ASPEED_CLK_AHB>;
        resets =3D <&syscon ASPEED_RESET_PWM>;
};

Thanks

> >
> >
> > Best regards,
> > Krzysztof
> >
>
