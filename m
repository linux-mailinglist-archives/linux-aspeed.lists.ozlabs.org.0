Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE37755E43
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 10:17:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nhkOwTk9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4FL90fWqz2yGJ
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 18:17:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nhkOwTk9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=billyking19920205@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2TVc0wBlz3bXw
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 21:18:15 +1000 (AEST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1b06a46e1a9so1376349fac.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689333490; x=1691925490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuYl6dCIknZy3pEG+UL4YUVY6+/QZzqXbjFQUObZGXw=;
        b=nhkOwTk9YifMtYKteO1Kq3wigRUgTDommOdBBtJwwiPhGQ3RozJUWEYN1GhcJR1Vka
         2P5gsVBABB4WN6oGs+c4PcxrrDSaDTNjKwRXJBi3v9vEHSSUJ+mIE+5Uu8cersg4bx4O
         bKs1BIT1K9A0L3fqtKZ1MK9157ou+bPD4uDCXKvQu4DYTDpJ9yblJBgSW9NYRWhD3ZFa
         uJHfx7e2WyRo8t68s6fsADklSR0PmZYD/L99BD8pJT3BVG3+cZt88UEil416HTsHo3b5
         D1S/MEEA3b3r02c7ObXKxWKnYeNuvyf94jsg2DfZMlB+4q3pwLBpIPxmzxSO/XyNVhVS
         z1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689333490; x=1691925490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuYl6dCIknZy3pEG+UL4YUVY6+/QZzqXbjFQUObZGXw=;
        b=HP8eyh02RrenEclTH78g/yPhewODN5a9VBpyv12MracifWKg/0H4MCsN2j66I+E3GL
         +RYSIn5pdN77MlXVEHNzuWtn3fiBAb6GDt1Wyq7Chh+LewdgfsZQ8CQVjS1MbQNqTk1V
         trCbJUSpXPm4h9k4sRz45SiDxbUMmjrqedZYTzLhPLtSLBB/UoTZuh6CXt/d3JHBOdgF
         9/T16n82HwnGu+GOzyL9ecDRit4voAiLZRsngaoSuNpTLlwiKp8fOlMkXl3+8AI41tUf
         L0gm8N8BQrAcsJ8QJ5QKex/BHSDppkZCX25En/jXHsOdCRGo6bK/eKn0KmqvwJPqnpSE
         bkuQ==
X-Gm-Message-State: ABy/qLb2Q1Luq/DKPfzGBeBTs25wdrt/9q6IC5uiXtFAXGE9eUXaSWMq
	QNKA8PgJip2nH5ViNLTeMe9JGl7a9K48YJM8sdo=
X-Google-Smtp-Source: APBJJlHdNUAjTNtAhNO+eAbBQ+pFyE7d8pfHIMRz9h3zGtKhJRU7tiu+03iq2yjQP0WlPQmUS6r8tnd5CkXQLnBIxnM=
X-Received: by 2002:a05:6870:610b:b0:1b0:408a:1d05 with SMTP id
 s11-20020a056870610b00b001b0408a1d05mr5066660oae.38.1689333490449; Fri, 14
 Jul 2023 04:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
 <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org> <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
 <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com> <7b198d57-ddec-3074-314a-3e5e5b8f48f9@roeck-us.net>
In-Reply-To: <7b198d57-ddec-3074-314a-3e5e5b8f48f9@roeck-us.net>
From: =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>
Date: Fri, 14 Jul 2023 19:17:59 +0800
Message-ID: <CAGUgbhDbFedVe-pc+muD_NtDpjHpGqMDdrS3A73C-QbxeHn4oQ@mail.gmail.com>
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
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:26=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 7/14/23 03:18, =E8=94=A1=E6=89=BF=E9=81=94 wrote:
> > Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2023=E5=B9=B47=E6=9C=8814=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:59=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >>
> >> On 7/14/23 00:13, Krzysztof Kozlowski wrote:
> >>> On 14/07/2023 09:04, =E8=94=A1=E6=89=BF=E9=81=94 wrote:
> >>>
> >>>>           > This is because our register layout for PWM and Tach is =
not
> >>>> continuous.
> >>>>
> >>>>           > PWM0 used 0x0 0x4, Tach0 used 0x8 0xc
> >>>>
> >>>>           > PWM1 used 0x10 0x14, Tach1 used 0x18 0x1c
> >>>>
> >>>>           > ...
> >>>>
> >>>>           > Each PWM/Tach instance has its own controller register a=
nd is not
> >>>> dependent on others.
> >>>
> >>> Your email reply quoting style is very difficult to read.
> >>>
> >>>>
> >>>>
> >>>>
> >>>> Hi Guenter,
> >>>>
> >>>>
> >>>>
> >>>> Did you receive a response to my previous email?
> >>>>
> >>>> I would like to inquire if you have any further concerns regarding t=
he PWM
> >>>> and Tach with 16 instances.
> >>>
> >>> But isn't like this in all PWMs in all SoCs?
> >>>
> >>
> >> Correct, pretty much every fan controller is implemented that way.
> >> I don't understand the logic.
> >>
> >
> > Hi Krzysztof and Guenter,
> >
> > Apologies for any confusion earlier.
> > So, you think that the implementation with 16 instances of TACH/PWM
> > device nodes in dts instead of one is ok to you, right?
> >
>
> Did I say that ? No, it is not ok with me. It is confusing and doesn't ma=
ke
> sense to me. This is one fan controller with 16 channels, not 16 separate
> controllers.
>

This patch serial doesn't use to binding the fan control h/w. It is
used to binding the two independent h/w blocks.
One is used to provide pwm output and another is used to monitor the
speed of the input.
My patch is used to point out that the pwm and the tach is the
different function and don't need to
bind together. You can not only combine them as the fan usage but also
treat them as the individual module for
use. For example: the pwm can use to be the beeper (pwm-beeper.c), the
tach can be used to monitor the heart beat signal.

Thanks
