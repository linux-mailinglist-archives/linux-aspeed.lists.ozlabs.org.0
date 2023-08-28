Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8AB78D27D
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 05:20:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=EVNyxX2D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rb8gd55pNz3bwj
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 13:20:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=EVNyxX2D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ2qy6YrTz2yDd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Aug 2023 17:53:49 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-564b8e60ce9so1266690a12.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Aug 2023 00:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693209225; x=1693814025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yc5/64aDDHimpalFyKo/sDYTTFjFL1PiUBqmUUqNYNY=;
        b=EVNyxX2D6EZ5nzDDCwGTnaKtkt4faXDCrRZB+EWpBULWw6ZofaARnr23A2UfkDFslR
         VTHjtWH1hVnX6DCHF8Z9iAxLt1b1Tmgg0KwRSx0eTxhQlrrGKB+GRJb+qt+Mp637iu+1
         djvqqUloB8V3bujW+Mdax+wO37dYgmDLV9XdQZtqymlzzMqCS4QgC6eYtcdeHu2gOPIW
         42igJq3p/nyBsOyk6dUQ8NMZex3pu71WtSsJKnvwJsXe1yNt3w5luvk/LkE9tHSskA6Q
         8aYzN4CS3gI9Wvqe8y2VYcVR/yC2qROUREGW0D7O+jxuWsNG/Ttr6n+Pykn3HQTP6FJv
         Egvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693209225; x=1693814025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yc5/64aDDHimpalFyKo/sDYTTFjFL1PiUBqmUUqNYNY=;
        b=ish4REK+YzRuTcZ5G+jq5dFb8QFLjeO0tp3/PLSLfQfBhpxOpfyo5SG7+gG1c/8baQ
         CXhpB0WZRt1BswChpHSTdmlMOHtO+yM90UH0XVahw9YTVncFA1z543SZWVjLq966PM+2
         4/H22D0dXsCkNAaQEpw7yaztxiu7pznjlBoEGfbzU3l8xpHf08G3CysTM/Xg6IyMvZSX
         WAbCizgPM9LkWR2BidYZSp619J6HN7GSQ9Q0B/Nwes86z/LMGhQvIU2iOvlapkzD7MxX
         wNYpT5EyTvUVx9VGhZcB3fwhL+iVmG+Pi2hOt2IzkFxw7r8uRijhxnILU8KPmVdoi/X0
         Rhdg==
X-Gm-Message-State: AOJu0YzWNnM9SSXO22sn/2qwWwRqJ+PhcxGYTNenoeQkmgsUv9EVYhRp
	eUBTg+j/51cM5AARGbKPhw0ctBAzjLz1FqOVL0VdYg==
X-Google-Smtp-Source: AGHT+IE4ZTuCbpfSd2u26y/GnloivJyZc/YSoHKEwSl0YpsN37Q/7zIWDf5qfNHHW8SlBatqk5kJBNfX4i4HRUvRd2I=
X-Received: by 2002:a17:90a:3ec1:b0:26d:4642:1bd7 with SMTP id
 k59-20020a17090a3ec100b0026d46421bd7mr18663702pjc.34.1693209224797; Mon, 28
 Aug 2023 00:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230817120029.221484-1-billy_tsai@aspeedtech.com>
 <20230817120029.221484-2-billy_tsai@aspeedtech.com> <20230823131334.GA2059582-robh@kernel.org>
 <SG2PR06MB33659FFB0CBFFA55295E6A098B1DA@SG2PR06MB3365.apcprd06.prod.outlook.com>
In-Reply-To: <SG2PR06MB33659FFB0CBFFA55295E6A098B1DA@SG2PR06MB3365.apcprd06.prod.outlook.com>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Mon, 28 Aug 2023 13:23:33 +0530
Message-ID: <CABqG17g-s4h810JO-MO_TRRJhPkP=RMLDm7Jq6Sx4Gm1hRKqLg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: Support Aspeed g6 PWM TACH Control
To: Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 30 Aug 2023 13:19:08 +1000
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Rob Herring <robh@kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, Luke Chen <luke_chen@aspeedtech.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,


On Mon, 28 Aug 2023 at 09:33, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> On Thu, Aug 17, 2023 at 08:00:28PM +0800, Billy Tsai wrote:
>
> >> Document the compatible for aspeed,ast2600-pwm-tach device, which can
>
> >> support upto 16 PWM outputs and 16 fan tach input.
>
> >>
>
> >> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>
> >> ---
>
> >>  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 57 +++++++++++++++++++
>
> >>  1 file changed, 57 insertions(+)
>
> >>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
>
> >>
>
> >> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
>
> >> new file mode 100644
>
> >> index 000000000000..1666304d0b0f
>
> >> --- /dev/null
>
> >> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
>
> >> @@ -0,0 +1,57 @@
>
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>
> >> +# Copyright (C) 2021 Aspeed, Inc.
>
> >> +%YAML 1.2
>
> >> +---
>
> >> +$id: http://devicetree.org/schemas/hwmon/aspeed,g6-pwm-tach.yaml#
>
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>
> >> +
>
> >> +title: ASPEED G6 PWM and Fan Tach controller device driver
>
> >> +
>
> >> +maintainers:
>
> >> +  - Billy Tsai <billy_tsai@aspeedtech.com>
>
> >> +
>
> >> +description: |
>
> >> +  The ASPEED PWM controller can support upto 16 PWM outputs.
>
> >> +  The ASPEED Fan Tacho controller can support upto 16 fan tach input.
>
> >> +
>
> >> +properties:
>
> >> +  compatible:
>
> >> +    enum:
>
> >> +      - aspeed,ast2600-pwm-tach
>
> >> +
>
> >> +  reg:
>
> >> +    maxItems: 1
>
> >> +
>
> >> +  clocks:
>
> >> +    maxItems: 1
>
> >> +
>
> >> +  resets:
>
> >> +    maxItems: 1
>
> >> +
>
> >> +  "#pwm-cells":
>
> >> +    const: 3
>
> >> +
>
> >> +  aspeed,fan-tach-ch:
>
> >> +    description: Specify the Fan tach input channels.
>
> >> +    $ref: "/schemas/types.yaml#/definitions/uint8-array"
>
>
>
> >This property is already defined in aspeed-pwm-tacho.txt as a single u8
>
> >that goes in a fan node. You can't redefine its type and location here.
>
>
>
> Hi Rob,
>
>
>
> I didn't redefine the type of property. The type of the aspeed,fan-tach-ch is unit8-array
>
> in aspeed-pwm-tacho.txt.
>
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt#L48
>
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt#L71
>
>
>
> >To repeat what I've said in previous versions, work with others to
>
> >define a common fan and fan controller binding. Otherwise, anything new
>
> >with fan related properties is simply going to be rejected.
>
>
>
> Okay I will try to work with Naresh for defining a common fan binding.
>
>
>
> Thanks for your suggestion.
>
>
>
> Hi Naresh,
>
>
>
> As Rob mentioned, it would be advisable for my dt-bindings to reference the common fan bindings instead of introducing specific properties.
>
> I noticed that you have already submitted a related patch to the community, which seems to be pending for around 10 months.
>
> https://lore.kernel.org/lkml/20221116213615.1256297-2-Naresh.Solanki@9elements.com/
>
> Do you have plans to send the next version of the patch? Alternatively, can I proceed to cherry-pick this version of the patch and continue with
>
> the upstreaming process in my patch serial?
Sure, go ahead.

Regards,
Naresh
>
>
>
> Thanks
>
> Best Regards,
>
> Billy Tsai
