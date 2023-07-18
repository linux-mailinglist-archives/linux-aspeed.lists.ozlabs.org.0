Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 907567572A8
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jul 2023 06:01:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fCpfi36d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4lcx3GtBz30Kf
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jul 2023 14:01:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fCpfi36d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=billyking19920205@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4lcn0jwTz300N
	for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Jul 2023 14:01:28 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a412653335so3221625b6e.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 21:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689652885; x=1692244885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFDsYeU09QyX9nMGiHdFlrICPlkCawySijwdpTw5NLM=;
        b=fCpfi36ddfNUO4DxSsb38t1Gm9qcZ2cyxe1ho9CTdR0NF3RYOvfxRFg8sjudYuMA35
         YbfxUYupQDgG7zx/tJKMpfhNlAXcnXKnKu1xoxJeOd362zxKXkWrBRU1KfqYzmif3OuM
         yaNzfCWTnY5jtYBCPD8/LkyjZIgn1wuVPT6F5YHmK4DWR/VkTpeXKdunCmjQIxdZVknY
         g9x+RMMYiTVo243FOHcCk/5Jy98HLDIzKYer4s9KRVaLv3052hDn3acFvxHfSrMDlK0t
         f7vauHUJk9r0tJqPad+Iv4P+drE/i5dirMTQfBoPV+8/VkfMy62mQxYR2YHYrR0Y+2M0
         F5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689652885; x=1692244885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFDsYeU09QyX9nMGiHdFlrICPlkCawySijwdpTw5NLM=;
        b=J/DpSWdKVdYNNXjVitonOHdv31Mexyk/ogmO75j3jqOZI1TBJ6We8BS6Atvpyg/P2e
         HNODhbrIggb5XlcnyDmeiaaMn6AAYQKaaQFR3kQkrHnAe7owbitIbMnW3LGOSOoQ8K/M
         3oNcuFJ+/NRjxietYRvmGlanIP6i2lmv4gj9DQwzNLZ/HXtSITXd5jiT/gOOd8cRmJIL
         tN94j1TwmeWty+qY5zOYgWvm+iNPXlCF3Kvo/6bkNS13r+RHeg0w/pJBUbhhH2YExB21
         x2ZStWoGk9sqFoaP0RBGE3Dx/l4MdD5h0uQDMGvUP60nktY8OLscGW7BU1akBqAmFd5p
         gctA==
X-Gm-Message-State: ABy/qLYHUEtMCLhXkoMIhQymSp5hflQ6phS/suIAflWiHc9QEnP90Nq+
	m4pySpvEUdxPIAgYFrRZJK67WmroDUDvcsLOvO8=
X-Google-Smtp-Source: APBJJlFei5nTsv62G4RI+NBkc29pl0jchtNvubF4SKpPkRcKNsh9fO5zwyBsd/MW55rbHWgSub5On7KihHxl/Remrv4=
X-Received: by 2002:a05:6808:199c:b0:3a3:ac49:77dc with SMTP id
 bj28-20020a056808199c00b003a3ac4977dcmr15295760oib.1.1689652884633; Mon, 17
 Jul 2023 21:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
 <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org> <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
 <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com>
 <7b198d57-ddec-3074-314a-3e5e5b8f48f9@roeck-us.net> <CAGUgbhDbFedVe-pc+muD_NtDpjHpGqMDdrS3A73C-QbxeHn4oQ@mail.gmail.com>
 <cf91edc9-1093-495b-48eb-6b05198c2541@linaro.org> <7a69bda1-5f4c-5b1f-8eb6-6fd58917a9b1@roeck-us.net>
 <CAGUgbhCTDPGt_vpbfaEreX+iuLJ3WUBqt4kppxyaFZQus9Zf0Q@mail.gmail.com> <b22b2ccc-6760-0db6-067b-109c3864d2e8@linaro.org>
In-Reply-To: <b22b2ccc-6760-0db6-067b-109c3864d2e8@linaro.org>
From: =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>
Date: Tue, 18 Jul 2023 12:01:13 +0800
Message-ID: <CAGUgbhDmXnyxYCL9h9C0P4ByDSTstWnGqW=uFoDVVHeK3BerHA@mail.gmail.com>
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control documentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>
> On 17/07/2023 11:01, =E8=94=A1=E6=89=BF=E9=81=94 wrote:
> > Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2023=E5=B9=B47=E6=9C=8817=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=881:00=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >>
> >> On 7/16/23 09:08, Krzysztof Kozlowski wrote:
> >>
> >> [ ... ]
> >>
> >>>>
> >>>> This patch serial doesn't use to binding the fan control h/w. It is
> >>>> used to binding the two independent h/w blocks.
> >>>> One is used to provide pwm output and another is used to monitor the
> >>>> speed of the input.
> >>>> My patch is used to point out that the pwm and the tach is the
> >>>> different function and don't need to
> >>>> bind together. You can not only combine them as the fan usage but al=
so
> >>>> treat them as the individual module for
> >>>> use. For example: the pwm can use to be the beeper (pwm-beeper.c), t=
he
> >>>> tach can be used to monitor the heart beat signal.
> >>>
> >>> Isn't this exactly the same as in every other SoC? PWMs can be used i=
n
> >>> different ways?
> >>>
> >>
> >> ... and in every fan controller. Not that it really makes sense becaus=
e
> >> normally the pwm controller part of such chips is tied to the fan inpu=
t,
> >> to enable automatic fan control, but it is technically possible.
> >> In many cases this is also the case in SoCs, for example, in ast2500.
> >> Apparently this was redesigned in ast2600 where they two blocks are
> >> only lightly coupled (there are two pwm status bits in the fan status
> >> register, but I have no idea what those mean). If the blocks are tight=
ly
> >> coupled, separate drivers don't really make sense.
> >>
> >> There are multiple ways to separate the pwm controller part from the
> >> fan inputs if that is really necessary. One would be to provide a
> >> sequence of address mappings, the other would be to pass the memory
> >> region from an mfd driver. It is not necessary to have N instances
> >> of the fan controller, even if the address space is not continuous.
> >>
> >
> > Hi Guenter,
> >
> > May I ask about the meaning of the sequence of address mappings? It app=
ears
> > to consist of multiple tuples within the 'reg' property, indicating
> > the usage of PWM/Tach
> > registers within a single instance. After that I can use the dts like f=
ollowing:
> >
> > pwm: pwm@1e610000 {
> > ...
> > reg =3D <0x1e610000 0x8
> > 0x1e610010 0x8
> > 0x1e610020 0x8
> > 0x1e610030 0x8
> > 0x1e610040 0x8
> > 0x1e610050 0x8
> > 0x1e610060 0x8
> > 0x1e610070 0x8
> > 0x1e610080 0x8
> > 0x1e610090 0x8
> > 0x1e6100A0 0x8
> > 0x1e6100B0 0x8
> > 0x1e6100C0 0x8
> > 0x1e6100D0 0x8
> > 0x1e6100E0 0x8
> > 0x1e6100F0 0x8>;
>
>
> Uh, no... I mean, why? We keep pointing out that this should not be done
> differently than any other SoC. Open any other SoC PWM controller and
> tell me why this is different? Why this cannot be one address space?

Hi Krzysztof,

This is because the register layout for PWM and Tach is not continuous.
Each PWM/Tach instance has its own set of controller registers, and they
are independent of each other.

For example:
PWM0 uses registers 0x0 and 0x4, while Tach0 uses registers 0x8 and 0xc.
PWM1 uses registers 0x10 and 0x14, while Tach1 uses registers 0x18 and 0x1c=
.
...

To separate the PWM controller part from the fan inputs, Guenter has
provided two methods.
The first method involves passing the memory region from an MFD
driver, which was the
initial method I intended to use. However, it seems that this method
does not make sense to you.

Therefore, I would like to explore the second method suggested by
Guenter, which involves providing
a sequence of address mappings.

Thanks

Best Regards,
Billy Tsai
