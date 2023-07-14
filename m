Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BBF755E42
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 10:17:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VNRWJ0vy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4FL50Fdxz2yVX
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 18:17:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VNRWJ0vy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=billyking19920205@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2S9v687mz3brV
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 20:18:42 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a426e70575so1082234b6e.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689329919; x=1691921919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5S/Su+LnonQlJtv6h9aSSkyuGTPnasq4Gs6B9RnTFM=;
        b=VNRWJ0vyETvMhGB3+48qAa5PT2NK/MARU30eKt5SIUMCo36TbT07+MGuFWUOU75kwn
         9N4ENPVsAiqeCos8lwVFUgNCbBqN4VghsOWOcMLGJU0C6eWmxpLLOFb5temWQPOvvnyf
         d+MBkEw/eV+X5Hy0BBNvVVLtTwavKPVuHAvJDEx2gksI45eodF27o+ZSmmXcF1WMEreI
         TqLFQ1l3LJdeF9wJgPds1M24aiNnAGP2CwN2KYO9TcIczutklkOTHFS5LlZbXNHPaOuy
         sifBZhHGvU1fviBCC4xY91oOZqMghBO6flASgNI9qJgpNGDp56Y6SyNqJCNkVHYpp8Tr
         GQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689329919; x=1691921919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5S/Su+LnonQlJtv6h9aSSkyuGTPnasq4Gs6B9RnTFM=;
        b=LcTjMKgt6H/gq4I27r58LfVLk+XW8zztdPMUAyRguxxCEj4Nj2es7pv2G0+OVbrsEv
         nF2bCVBN0J/rAm4DpVdG8nUaWbJ59dzQkdzgTqjUCeeiH7/M4KALEYEMkbibb304gazz
         0XWILPrrfI8Om85tuU9h6LKpFpba7t4G8HhwyOPGrCeTN7TpB1acRT5TxJJIainZQWLJ
         aFr6oXEm1MWsKanTkXAEB67drzfhiWD/r89+PGqXGkZWNPWXKdSMpexp8lorO/3COE+L
         /qGJkHHNYNLlLzzqio1ZZ3dy2ElZZG3VvNxxkj/Ew4liJkivA1DV7EdEGfglrcRT4nIy
         YNew==
X-Gm-Message-State: ABy/qLYPlmh7E9hgHH/6h8bkNhL3rl8tSZIHnTOlZ8wEehQxfCW0w/vq
	VaVxNptti1f59g3J68lw0/NrpcCahlWk6baz1PA=
X-Google-Smtp-Source: APBJJlFnmD26TrqVTOxm7Zyo2EOzSV61byUJyWgGAvIuT7uv/IVd5NbGKL7x4j5UPbh+Zfun/v4Fdt3+B1C0/pI0qWQ=
X-Received: by 2002:a05:6808:13cf:b0:3a3:820e:2f05 with SMTP id
 d15-20020a05680813cf00b003a3820e2f05mr4930470oiw.1.1689329919411; Fri, 14 Jul
 2023 03:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
 <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org> <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
In-Reply-To: <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
From: =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>
Date: Fri, 14 Jul 2023 18:18:28 +0800
Message-ID: <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com>
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control documentation
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2023=E5=B9=B47=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:59=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 7/14/23 00:13, Krzysztof Kozlowski wrote:
> > On 14/07/2023 09:04, =E8=94=A1=E6=89=BF=E9=81=94 wrote:
> >
> >>          > This is because our register layout for PWM and Tach is not
> >> continuous.
> >>
> >>          > PWM0 used 0x0 0x4, Tach0 used 0x8 0xc
> >>
> >>          > PWM1 used 0x10 0x14, Tach1 used 0x18 0x1c
> >>
> >>          > ...
> >>
> >>          > Each PWM/Tach instance has its own controller register and =
is not
> >> dependent on others.
> >
> > Your email reply quoting style is very difficult to read.
> >
> >>
> >>
> >>
> >> Hi Guenter,
> >>
> >>
> >>
> >> Did you receive a response to my previous email?
> >>
> >> I would like to inquire if you have any further concerns regarding the=
 PWM
> >> and Tach with 16 instances.
> >
> > But isn't like this in all PWMs in all SoCs?
> >
>
> Correct, pretty much every fan controller is implemented that way.
> I don't understand the logic.
>

Hi Krzysztof and Guenter,

Apologies for any confusion earlier.
So, you think that the implementation with 16 instances of TACH/PWM
device nodes in dts instead of one is ok to you, right?

Thanks

Best regards,
Billy Tsai
