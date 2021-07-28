Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACA73D8A67
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Jul 2021 11:13:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZSdX4Cygz30F0
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Jul 2021 19:13:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iC6z8Qct;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iC6z8Qct; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZSdS5BS9z303D
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Jul 2021 19:13:47 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 j18-20020a17090aeb12b029017737e6c349so2239214pjz.0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Jul 2021 02:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6m4UZEx/kYzeDD67ywCPsN6+L14vcm0XjCn8vgnR0gs=;
 b=iC6z8Qctytr3DWMW26XBlXyJXmcX9mHqtGYg7L6xD94wbl7ajzQi5zIilGaoIAsNBu
 ZN7L0JWLQB0NsyAQiW+JqWlOT1mTbK4f+uOaBNUne3qrnSByPi9LK4eaUGHE6oXAo+tw
 7gXczYP9K2NW9xgp4RU0Wn0tG7xRBm8dvpW/t/+zJk+V0r1Lb6GZzxN+922cNAK3aV+j
 lKtMq4xZPZfiDze9gJjeELttGZiHW7K0jpIUX7aPHQVSLXgmQga/VBWMx7C7W9UDTxml
 zt0rZuogVBn8QhRnDgl2my8YDzXxJUe2Cy1wtm27Z5pRU6koXTuaHQgUeJXb1z/uUgVX
 Qrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6m4UZEx/kYzeDD67ywCPsN6+L14vcm0XjCn8vgnR0gs=;
 b=rqBK8bBlIHu4MT1jE5RYSbmVJqDHso4T8DjJRUZIBTK7lxKvvGi3efISnoG28ZwlQx
 d9czj3F49Y9E4S9Hz+vtYEdWR4k4mDP/gN/EEMgyykFkq0BEBoVm6ZOb++2IQWU3p2zO
 uQPlXorcfENey86c+OoAwHY6SFtbN7hXNBW+9dSFvjxD48e4ugxVcYOd5gz2gVXSyACm
 nIyMN2Jf8Gjb0jk2uGK5RMnq/7Z1Z12PMtsFY6iFDFXOwaUrcL8M5kgdU0kpJ269zU9d
 0NFi8qUJ1FhYo+uzjN2yU05jIl+2rFESdUJlJnnKFNTBFMbovnkXfhSLRjBaxD9bSCdf
 GnHA==
X-Gm-Message-State: AOAM531OO7qsZyX7rTO/gB0f/RJEp28VHI2kMiEad+NLOmPjPIAFoiMt
 BJDwBqqM+yMLR+HzyR2/6cBJdNJT1dG551BwYhY=
X-Google-Smtp-Source: ABdhPJyyR2mCT0pEZEhhVsDOslGMUTe+AfTMeNLSOODQi5iwax+TD6tMAXsYw27Coe070sKnGki21opJt2OQkPeCxzA=
X-Received: by 2002:a17:902:ac90:b029:12c:e7a:c183 with SMTP id
 h16-20020a170902ac90b029012c0e7ac183mr14859743plr.21.1627463622505; Wed, 28
 Jul 2021 02:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au>
 <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
 <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com>
In-Reply-To: <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Jul 2021 12:13:06 +0300
Message-ID: <CAHp75Vc2W+WmwNj1AvH6EiT_80c+5gADV9QzK+asHxpd1Ucppw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] leds: Fix pca955x GPIO pin mappings
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Pavel Machek <pavel@ucw.cz>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 28, 2021 at 8:43 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 23 Jul 2021, at 17:45, Andy Shevchenko wrote:
> > On Friday, July 23, 2021, Andrew Jeffery <andrew@aj.id.au> wrote:

> > > This series does a bunch of crimes, so it's an RFC. I'm cross-posting to the
> > > pinctrl/GPIO and LEDs lists because the PCA955x devices impact all of them. What
> > > needs fixing is the leds-pca955x driver's failure to map the GPIO numberspace to
> > > the pin numberspace of the PCA955x devices. The series solves that by
> > > implementing pinctrl and pinmux in the leds-pca955x driver.
> > >
> > > Things I'm unsure about:
> > >
> > > 1. Patch 1: The pinctrl_gpio_as_pin() API feels a bit dirty, not sure what
> > >    others thoughts are on that (Linus?).
> > >
> > > 2. Patch 2: I've added a new callback to hook the entirety of the pinctrl map
> > >    parsing rather than supplying a subnode-specific callback. This was necessary
> > >    to handle the PCA955x devicetree binding in a backwards compatible way.
> > >
> > > 3. Patch 4: The PCA955x devices don't actually have any pinmux hardware, but the
> > >    properties of the pinctrl/pinmux subsystems in the kernel map nicely onto the
> > >    problem we have. But it's quite a bit of code...
> > >
> > > 4. Patch 6: I also lost a bunch of time to overlooking the get_group_pins()
> > >    callback for pinctrl, and it seems odd to me that it isn't required.
> > >
> > > Please review!
> >
> >
> > Sounds like a hack.
>
> Yes, possibly. Feedback like this is why I sent the series as an RFC.
>
> > I was briefly looking into patches 1-4 and suddenly
> > realized that the fix can be similar as in PCA9685 (PWM), I.e. we
> > always have chips for the entire pin space and one may map them
> > accordingly, requested in one realm (LED) in the other (GPIO)
> > automatically is BUSY. Or I missed the point?
>
> No, you haven't missed the point. I will look at the PCA9685 driver.
>
> That said, my goal was to implement the behaviour intended by the
> existing binding (i.e. fix a bug).

Okay, so it implies that this used to work at some point. What has
changed from that point? Why can't we simply fix the culprit commit?

> However, userspace would never have
> got the results it expected with the existing driver implementation, so
> I guess you could argue that no such (useful) userspace exists. Given
> that, we could adopt the strategy of always defining a gpiochip
> covering the whole pin space, and parts of the devicetree binding just
> become redundant.

I'm lost now. GPIO has its own userspace ABI, how does it work right
now in application to this chip?

-- 
With Best Regards,
Andy Shevchenko
