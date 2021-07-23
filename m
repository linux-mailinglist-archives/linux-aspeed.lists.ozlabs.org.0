Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7443D364F
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 10:15:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWMZS0gV2z307j
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 18:15:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=te641jru;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=te641jru; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWMZK5Fxhz2yP4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 18:15:20 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id e14so2325472plh.8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+hUTfroK4XrVka2cxPI9GUKB6AoybCvrzYIU9GjgxPs=;
 b=te641jruSoZSB1c76xGUmXXFfqdJM8AIngp3I+YtE/+nXVybDdBjcC0UuHeE7rGPHc
 buUim3pdB49NYuI7Ud9wkxEpQ4sJ1VFglPek+7VI5VC5wPgMEf7ewdBaNl3pveZCCfx2
 xAzqKhAZAAKM6JJmcQaY7OBd/C4HpDUey2WTHZJA5ntQyRzSEJXt+Wo2VtbeFK24huxN
 5SlnwcjUZpZ8TCQh81pq077tFQWn23MtQikAEjgto9sV7if6D5guyeiyoVJZJOD+zIGf
 DzVqEDCMExtGN4rCI6xqYTwInLMBTRTUtDSOs9sJSOfrXnMq0WDfOEClOuHyZBy0oEwe
 c6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+hUTfroK4XrVka2cxPI9GUKB6AoybCvrzYIU9GjgxPs=;
 b=Ura9PcsFuHGGxyd+d42lMp4Jd90DwVdxQ4em30YvMZHWdB8jHN4P7ztSWBbslAR9g/
 bv83ihJJrbSzjs0HKQ+nOmxsE794tKhmmzg4U18If86REz4EBtZrMWkpL404dpXSqtey
 JOrZO7zbP/MtXaGxvEn3rfRVIwg0m6sU39nOUlyF5VSqzpxhW0DRF4fwyWrUlUi0/LCK
 PaguSbiDhHguqXSQDQCn/ajHequaD9dqq8HdowmnVX/FVdmhW0WL/vcEJJP4uuzUEzL4
 w03qEcbMELMiz89D1F1QirX3kpG9WzVtilGl1vxWov0A8yvb39jIhVbJX3TVUME7nSes
 SwLg==
X-Gm-Message-State: AOAM530YGbbmB6UFwPDpKYHv1svfRWpCq0Z7hxXHPPmlKeo+oENX6cH6
 629Cu4CSCadQiUAOZHoTZu1NOYxqrVu3Im1+wds=
X-Google-Smtp-Source: ABdhPJxDG9CKIqR7Qvw2GUSA7f1tfSddRps0RTfUqgU2+MxfCjy9JWqJYP20DSgVIOYHn8ChT/JgBM89c0PFa2Wq3T0=
X-Received: by 2002:a17:90b:1194:: with SMTP id
 gk20mr12749395pjb.181.1627028117558; 
 Fri, 23 Jul 2021 01:15:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:1d81:0:0:0:0 with HTTP; Fri, 23 Jul 2021 01:15:16
 -0700 (PDT)
In-Reply-To: <20210723075858.376378-1-andrew@aj.id.au>
References: <20210723075858.376378-1-andrew@aj.id.au>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 23 Jul 2021 11:15:16 +0300
Message-ID: <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] leds: Fix pca955x GPIO pin mappings
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000fc999605c7c60087"
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "clg@kaod.org" <clg@kaod.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--000000000000fc999605c7c60087
Content-Type: text/plain; charset="UTF-8"

On Friday, July 23, 2021, Andrew Jeffery <andrew@aj.id.au> wrote:

> Hello,
>
> This series does a bunch of crimes, so it's an RFC. I'm cross-posting to
> the
> pinctrl/GPIO and LEDs lists because the PCA955x devices impact all of
> them. What
> needs fixing is the leds-pca955x driver's failure to map the GPIO
> numberspace to
> the pin numberspace of the PCA955x devices. The series solves that by
> implementing pinctrl and pinmux in the leds-pca955x driver.
>
> Things I'm unsure about:
>
> 1. Patch 1: The pinctrl_gpio_as_pin() API feels a bit dirty, not sure what
>    others thoughts are on that (Linus?).
>
> 2. Patch 2: I've added a new callback to hook the entirety of the pinctrl
> map
>    parsing rather than supplying a subnode-specific callback. This was
> necessary
>    to handle the PCA955x devicetree binding in a backwards compatible way.
>
> 3. Patch 4: The PCA955x devices don't actually have any pinmux hardware,
> but the
>    properties of the pinctrl/pinmux subsystems in the kernel map nicely
> onto the
>    problem we have. But it's quite a bit of code...
>
> 4. Patch 6: I also lost a bunch of time to overlooking the get_group_pins()
>    callback for pinctrl, and it seems odd to me that it isn't required.
>
> Please review!



Sounds like a hack. I was briefly looking into patches 1-4 and suddenly
realized that the fix can be similar as in PCA9685 (PWM), I.e. we always
have chips for the entire pin space and one may map them accordingly,
requested in one realm (LED) in the other (GPIO) automatically is BUSY. Or
I missed the point?


>
> Andrew
>
> Andrew Jeffery (6):
>   pinctrl: Add pinctrl_gpio_as_pin()
>   pinctrl: Add hook for device-specific map parsing
>   leds: pca955x: Relocate chipdef-related descriptors
>   leds: pca955x: Use pinctrl to map GPIOs to pins
>   ARM: dts: rainier: Add presence-detect and fault indictor GPIO
>     expander
>   pinctrl: Check get_group_pins callback on init
>
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  76 +++
>  drivers/leds/leds-pca955x.c                  | 554 +++++++++++++++----
>  drivers/pinctrl/core.c                       |  28 +-
>  include/linux/pinctrl/pinctrl.h              |   4 +
>  4 files changed, 566 insertions(+), 96 deletions(-)
>
> --
> 2.30.2
>
>

-- 
With Best Regards,
Andy Shevchenko

--000000000000fc999605c7c60087
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, July 23, 2021, Andrew Jeffery &lt;<a href=3D"mailto:andr=
ew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Hello,<br>
<br>
This series does a bunch of crimes, so it&#39;s an RFC. I&#39;m cross-posti=
ng to the<br>
pinctrl/GPIO and LEDs lists because the PCA955x devices impact all of them.=
 What<br>
needs fixing is the leds-pca955x driver&#39;s failure to map the GPIO numbe=
rspace to<br>
the pin numberspace of the PCA955x devices. The series solves that by<br>
implementing pinctrl and pinmux in the leds-pca955x driver.<br>
<br>
Things I&#39;m unsure about:<br>
<br>
1. Patch 1: The pinctrl_gpio_as_pin() API feels a bit dirty, not sure what<=
br>
=C2=A0 =C2=A0others thoughts are on that (Linus?).<br>
<br>
2. Patch 2: I&#39;ve added a new callback to hook the entirety of the pinct=
rl map<br>
=C2=A0 =C2=A0parsing rather than supplying a subnode-specific callback. Thi=
s was necessary<br>
=C2=A0 =C2=A0to handle the PCA955x devicetree binding in a backwards compat=
ible way.<br>
<br>
3. Patch 4: The PCA955x devices don&#39;t actually have any pinmux hardware=
, but the<br>
=C2=A0 =C2=A0properties of the pinctrl/pinmux subsystems in the kernel map =
nicely onto the<br>
=C2=A0 =C2=A0problem we have. But it&#39;s quite a bit of code...<br>
<br>
4. Patch 6: I also lost a bunch of time to overlooking the get_group_pins()=
<br>
=C2=A0 =C2=A0callback for pinctrl, and it seems odd to me that it isn&#39;t=
 required.<br>
<br>
Please review!</blockquote><div><br></div><div><br></div><div>Sounds like a=
 hack. I was briefly looking into patches 1-4 and suddenly realized that th=
e fix can be similar as in PCA9685 (PWM), I.e. we always have chips for the=
 entire pin space and one may map them accordingly, requested in one realm =
(LED) in the other (GPIO) automatically is BUSY. Or I missed the point?</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Andrew<br>
<br>
Andrew Jeffery (6):<br>
=C2=A0 pinctrl: Add pinctrl_gpio_as_pin()<br>
=C2=A0 pinctrl: Add hook for device-specific map parsing<br>
=C2=A0 leds: pca955x: Relocate chipdef-related descriptors<br>
=C2=A0 leds: pca955x: Use pinctrl to map GPIOs to pins<br>
=C2=A0 ARM: dts: rainier: Add presence-detect and fault indictor GPIO<br>
=C2=A0 =C2=A0 expander<br>
=C2=A0 pinctrl: Check get_group_pins callback on init<br>
<br>
=C2=A0arch/arm/boot/dts/aspeed-bmc-<wbr>ibm-rainier.dts |=C2=A0 76 +++<br>
=C2=A0drivers/leds/leds-pca955x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 554 +++++++++++++++----<br>
=C2=A0drivers/pinctrl/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 28 +-<br>
=C2=A0include/linux/pinctrl/pinctrl.<wbr>h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A04 files changed, 566 insertions(+), 96 deletions(-)<br>
<br>
-- <br>
2.30.2<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--000000000000fc999605c7c60087--
