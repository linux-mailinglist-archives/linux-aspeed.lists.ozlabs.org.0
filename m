Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6736A3D9EE0
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Jul 2021 09:41:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb2Ws5gbzz3brX
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Jul 2021 17:40:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=t7g76zVF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=t7g76zVF; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb2Wk3s7Mz30Bm
 for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Jul 2021 17:40:49 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id ca5so9016748pjb.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Jul 2021 00:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w0a44nIazAWCFeMTVCEPSrDUq0YniFKHNtq0Lfg2ohY=;
 b=t7g76zVFOW82+YW0LTokF9MjLOA1uv5TRTNkErJ+A5zrihX8F4YV0jMNwhp72ra3Qo
 j6/uIRxl7Syp0Jus87MCUNNvG028aI9vlfEKJYteeFsAGsDwU0e0BnkqUbX/PWk4Invp
 SBh/7NCKQOn88oLj2/TOukmnNx1mdX2408K+KuJD5EyGTvAUJUtuJRYZwMCOx1I9ECPQ
 qSkCol4vxbg0TqOU77Urzpd7DNcXd7b7FF5r18vz6vpVLRgaORohwdPZ0oekbGzgbiXd
 NH0k1oiS1Yzvn10cdydt+xWDWIDA4rFwv4jZ/Od/NzzUSDFuVfLHpyQriy0PGSGGaQ/D
 nPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w0a44nIazAWCFeMTVCEPSrDUq0YniFKHNtq0Lfg2ohY=;
 b=teJ2+uVKH6vnMyXcuHiTGd2sn7OEJykIiEfRThIEg2SUIQPpl5zgknbvcftzkGLHud
 v3o3MpP59bQO7WxRD/1dgA8pxiQ1SDQ7E5o5xB+4+XY/PO9TfAHoaalHCostbJZKgl69
 0J16kYf8H/jDiOVMb3hgExmrouY/2zyYorEiFHWGGF32YBgAUPWyg7QWdNz0MPcCoNFg
 r984C1H9CWqDAeUdLa0oLMiuJJ88AGd9qK5G7GXVt4bl2J7BfYXH5C5IBCImWiSKmFCX
 jBQY7Z+5Fd/EP4cShFNZLkBBxVtgakqic1PrIUvGFKJpDtiDUqpRP53nOvD58bRuW3kG
 uWvg==
X-Gm-Message-State: AOAM533pwnq7c9X1tBNGEPdtn6TrBjJtcDLIy1t2+/tGj7IZIU7ifiGH
 6obaelqZzVh/6iDgMQfM+Q1n5J7SsYpY8cruRb4=
X-Google-Smtp-Source: ABdhPJw5qTNwYA5vkwxrUjxBj2aoPq1ZzdhxfkGVQkBAcF/mi0Y9RzrkVX6d4p9LIzWpx2R9LR85dj2HijqNc4C4faY=
X-Received: by 2002:a17:90a:7146:: with SMTP id
 g6mr3944401pjs.228.1627544446084; 
 Thu, 29 Jul 2021 00:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au>
 <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
 <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com>
 <CAHp75Vc2W+WmwNj1AvH6EiT_80c+5gADV9QzK+asHxpd1Ucppw@mail.gmail.com>
 <6cc64039-f82a-4c1e-ad2c-16fad7aa3178@www.fastmail.com>
In-Reply-To: <6cc64039-f82a-4c1e-ad2c-16fad7aa3178@www.fastmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 29 Jul 2021 10:40:09 +0300
Message-ID: <CAHp75Vdx9QA7dmSWK8GHxBBxP0uYjrz=Gm=75yqaWbBX6k3v=w@mail.gmail.com>
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

On Thu, Jul 29, 2021 at 3:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 28 Jul 2021, at 18:43, Andy Shevchenko wrote:
> > On Wed, Jul 28, 2021 at 8:43 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > On Fri, 23 Jul 2021, at 17:45, Andy Shevchenko wrote:
> > >
> > > > I was briefly looking into patches 1-4 and suddenly
> > > > realized that the fix can be similar as in PCA9685 (PWM), I.e. we
> > > > always have chips for the entire pin space and one may map them
> > > > accordingly, requested in one realm (LED) in the other (GPIO)
> > > > automatically is BUSY. Or I missed the point?
> > >
> > > No, you haven't missed the point. I will look at the PCA9685 driver.
> > >
> > > That said, my goal was to implement the behaviour intended by the
> > > existing binding (i.e. fix a bug).
> >
> > Okay, so it implies that this used to work at some point.
>
> I don't think this is true. It only "works" if the lines specified as
> GPIO in the devicetree are contiguous from line 0. That way the pin and
> GPIO number spaces align. I suspect that's all that's been tested up
> until this point.
>
> We now have a board with a PCA9552 where the first 8 pins are LED and
> the last 8 pins are GPIO, and if you specify this in the devicetree
> according to the binding you hit the failure to map between the two
> number spaces.
>
> > What has
> > changed from that point? Why can't we simply fix the culprit commit?
>
> As such nothing has changed, I think it's always been broken, just we
> haven't had hardware configurations that demonstrated the failure.
>
> >
> > > However, userspace would never have
> > > got the results it expected with the existing driver implementation, so
> > > I guess you could argue that no such (useful) userspace exists. Given
> > > that, we could adopt the strategy of always defining a gpiochip
> > > covering the whole pin space, and parts of the devicetree binding just
> > > become redundant.
> >
> > I'm lost now. GPIO has its own userspace ABI, how does it work right
> > now in application to this chip?
>
> As above, it "works" if the GPIOs specified in the devicetree are
> contiguous from line 0. It's broken if they're not.

So, "it never works" means there is no bug. Now, what we need is to
keep the same enumeration scheme, but if you wish to be used half/half
(or any other ratio), the driver should do like the above mentioned
PWM, i.e. register entire space and depending on the requestor either
proceed with a line or mark it as BUSY.

Ideally, looking into what the chip can do, this should be indeed
converted to some like pin control + PWM + LED + GPIO drivers. Then
the function in pin mux configuration can show what exactly is enabled
on the certain line(s).


-- 
With Best Regards,
Andy Shevchenko
