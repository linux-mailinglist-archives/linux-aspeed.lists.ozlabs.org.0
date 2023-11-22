Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9957B7F51DE
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Nov 2023 21:47:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JTZKN5o8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbCwx1KTMz3dBy
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Nov 2023 07:47:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JTZKN5o8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbCwq1Vf3z3bWQ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Nov 2023 07:47:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3AC961F79
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Nov 2023 20:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3570DC433CD
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Nov 2023 20:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700686039;
	bh=iOGqsjNrxAouz3AJJHZo7n5yudWeQ8nrq1vq3zxtsBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JTZKN5o8vBbSuTJ3zDm40Y+bDC/o4pO62dv6Qdw7wjjfuIvXz850E2mN4N0glDyAQ
	 I24R1FewFREzbe6rsAaoxOszJT3HRAS9FwQcOgcd7p5330hxLb25O+yIbsQjwCTtsn
	 +UFBAeZhqin2ubNn0OiBQfTXJ3vuEL5ciC2berJUgxbcBx4Aia14ioQrjV7DiaUVSR
	 st50n8JxEhvGIa27YvK0jqgESrKFfDzRghsbGqbgZ3ITGcJLSxCRtKlTKGWtCMUBqj
	 XpnKWid20FYJZBoiCILBrxO3xwRpU60BIQ28102Xv1iodp9t4T9w+AQKOUaZTyPQCD
	 Ac2OW6LMM00DQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c51682fddeso13455821fa.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Nov 2023 12:47:19 -0800 (PST)
X-Gm-Message-State: AOJu0YyoGs3DiAUSsaDdNO2PsB/trAaa+euA34/bKLeET3+CIefq2C35
	ExWSC7z7DIWGOsY+jSko8dj9Z7H9UeXmfz4Fhw==
X-Google-Smtp-Source: AGHT+IGTjq0mZD9i+eUzTXzP28Wi1Bo+2Bm1FI9n8vEQBS5kPkO5fcu9os4HymBwAvrwCsgVBASyxd59bRZr+JZsdyc=
X-Received: by 2002:a05:6512:3e20:b0:509:4792:25eb with SMTP id
 i32-20020a0565123e2000b00509479225ebmr249053lfv.17.1700686037339; Wed, 22 Nov
 2023 12:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20231107105025.1480561-1-billy_tsai@aspeedtech.com>
 <20231107105025.1480561-3-billy_tsai@aspeedtech.com> <20231108182135.GA2698015-robh@kernel.org>
 <SG2PR06MB33655734700697E8F6FD0D1B8BB2A@SG2PR06MB3365.apcprd06.prod.outlook.com>
In-Reply-To: <SG2PR06MB33655734700697E8F6FD0D1B8BB2A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Nov 2023 13:47:04 -0700
X-Gmail-Original-Message-ID: <CAL_JsqL=2-dD5yFWWDDHu1svcCF-EMZqcYz92Pr7L5ntppNQVA@mail.gmail.com>
Message-ID: <CAL_JsqL=2-dD5yFWWDDHu1svcCF-EMZqcYz92Pr7L5ntppNQVA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 2/3] dt-bindings: hwmon: Support Aspeed g6 PWM
 TACH Control
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "naresh.solanki@9elements.com" <naresh.solanki@9elements.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Nov 13, 2023 at 8:11=E2=80=AFPM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:
>
> > > Document the compatible for aspeed,ast2600-pwm-tach device, which can
> > > support up to 16 PWM outputs and 16 fan tach input.
> > >
> > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > > ---
> > >  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 69 +++++++++++++++++=
++
> > >  1 file changed, 69 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6=
-pwm-tach.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-ta=
ch.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> > > new file mode 100644
> > > index 000000000000..c615fb10705c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> > > @@ -0,0 +1,69 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright (C) 2023 Aspeed, Inc.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/hwmon/aspeed,g6-pwm-tach.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ASPEED G6 PWM and Fan Tach controller
> > > +
> > > +maintainers:
> > > +  - Billy Tsai <billy_tsai@aspeedtech.com>
> > > +
> > > +description: |
> > > +  The ASPEED PWM controller can support up to 16 PWM outputs.
> > > +  The ASPEED Fan Tacho controller can support up to 16 fan tach inpu=
t.
> > > +  They are independent hardware blocks, which are different from the
> > > +  previous version of the ASPEED chip.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - aspeed,ast2600-pwm-tach
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  "#pwm-cells":
> > > +    const: 3
> > > +
> > > +patternProperties:
> > > +  "^fan-[0-9]+$":
> > > +    $ref: fan-common.yaml#
> > > +    unevaluatedProperties: false
> > > +    required:
> > > +      - tach-ch
> > > +
> > > +required:
> > > +  - reg
> > > +  - clocks
> > > +  - resets
> > > +  - "#pwm-cells"
> > > +  - compatible
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/aspeed-clock.h>
> > > +    pwm_tach: pwm-tach-controller@1e610000 {
> > > +      compatible =3D "aspeed,ast2600-pwm-tach";
> > > +      reg =3D <0x1e610000 0x100>;
> > > +      clocks =3D <&syscon ASPEED_CLK_AHB>;
> > > +      resets =3D <&syscon ASPEED_RESET_PWM>;
> > > +      #pwm-cells =3D <3>;
> > > +
> > > +      fan-0 {
>
> > I assume there's a PWM connection here? How do you know which PWM? You
> > said the tach channel is independent, so it is not that.
>
> > It should not be 0 from 'fan-0' because that's just a meaningless index=
.
>
> > You either need 'pwms' here or you can use 'reg' and the reg value is
> > the PWM channel.
>
> Hi Rob, this binding is used to export the PWM provider and the Fan monit=
or (i.e., Tach).
> If the user wants to add the PWM connection for the fan, it can be done a=
s follows:
>
> fan0: pwm-fan0 {
>         compatible =3D "pwm-fan";
>         pwms =3D <&pwm_tach 0 40000 0>;
>         cooling-min-state =3D <0>;
>         cooling-max-state =3D <3>;
>         #cooling-cells =3D <2>;
>         cooling-levels =3D <0 15 128 255>;
> };
>
> This will reuse the existing PWM fan driver (e.g., pwm-fan.c).

I'm confused now. So what are the child nodes you have? You are
defining the fan in 2 places? The "pwm-fan" driver supports a tach via
an interrupt, so how would this work in your case?

Rob
