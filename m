Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 493EC403A7A
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Sep 2021 15:20:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4N6J13fZz2yJn
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Sep 2021 23:20:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Tu+Htqp3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Tu+Htqp3; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4N6C2VFMz2xYQ
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Sep 2021 23:20:02 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id f2so3497714ljn.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Sep 2021 06:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZJdZCk3goovG5C8eSe2Bq8C9UIur86/nQp9LkqQjXYU=;
 b=Tu+Htqp3o8/8HQy5vcZvrCYOjxNjUghZ/LWL6AUWBmjZl6noo2SBB42RcizHk16FlE
 7Mha8zLBzxaJW0oRETKJI1j2taDDWW7zD1CF3hWt5eWOBYgXzHOtIaq50e+EQ0aXw05Z
 VZhDlPPYROV7Vwd+G+CHaDkXjhnLy6lDEtIuQNnjpjzfgwYH5LF9RiWET0ZkjmqVFi1r
 5LG6cs1rXiPHEI9q9Y+q+VBvqbAD/qaHms8Y/MYxtw0SaNu7BX5nHEkHfIL9vmkXuiHc
 yvIDk7Nin2FbmXhPBKF/jWY++yWC6rIGRaXfdPSSRvqiXHVRWWOJn312OJC1rSNpwBke
 TtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZJdZCk3goovG5C8eSe2Bq8C9UIur86/nQp9LkqQjXYU=;
 b=aUQL2IL/5OnB109yfBpo0ppNPrT6tDRaa2x/AfE4uqwzJ8HEJkw0KfhizwSdKdl81p
 8TvHyZ4zclZcm43cN0PmW5+oJfYPw++x3AXL0KL4czlI/452icRUYNGmHKfBL8qQUpqj
 It1ctnu9DGurw7jB56kLNtnlV8+BA1xtV3A02rKIOpAYro+KwvbNq8T/Rc+u7rK0VxR5
 u5mR2v/xHb7Ow9Ehrq+zJAjZhSRZetQywjnBCeKXAF14NedR0ud6ze4hw3TjeP9D0v3K
 GBWAO+pbanQ+9oBM7hFGl9lwyBQ5JhP6TU4YtzbDwt4Wzefoa6PLBbUPw2H5qHIgC+Fd
 1XvQ==
X-Gm-Message-State: AOAM530+NO+j6pJCSYJnZTHUvdlgUtl1Nfrz8scyb2sbCWMt7Py/qh/F
 XHEGrWAqIpvjD/LtkAXhn0jb+MwjdFPY9UZTlIxarg==
X-Google-Smtp-Source: ABdhPJyP3Fvzjo+yCiZXscEPInswiZdq+xZxXKaG/5+w1weGK3YAZ6q3duHELKynKYHXjEzYScZCO3b2nIQgwuT/dsc=
X-Received: by 2002:a2e:1556:: with SMTP id 22mr2695278ljv.253.1631107194225; 
 Wed, 08 Sep 2021 06:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
 <20210908094248.GZ23326@home.paul.comp>
 <HK0PR06MB3779180F75DB8BD872F8A78391D49@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <20210908105245.GB23326@home.paul.comp>
In-Reply-To: <20210908105245.GB23326@home.paul.comp>
From: Oskar Senft <osk@google.com>
Date: Wed, 8 Sep 2021 09:19:38 -0400
Message-ID: <CABoTLcT2kSNtTRL1sETR1oNsT5R1hyX6WpfkeG9=rOcwhH05LQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm: aspeed: Add UART routing support
To: Paul Fertser <fercerpav@gmail.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Konstantin Klubnichkin <kitsok@yandex-team.ru>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hey Paul

> Or do you mean the BMC software shouldn't be enabling SUART1 by making
> sure its clock is disabled in SCU0C? Is there anything else needed?
> I've tried reading the ast2500 datasheet many times but this detail
> seem to be missing. Is there some appnote on the topic probably?

I ran into this issue a while ago.

As ChiaWei explained, the issue is that there are TWO implementations
of a host-facing UART in the Aspeed:

1) SuperIO (aka "SIO"), which includes two UARTS (and some other stuff).
The SIO is fully controlled by the host. The BMC has no ability to
configure the SIO. Of course, it can disable it by stopping its clocks
or by blocking access from the host to it. But it cannot observe or
modify the settings that the host made. The SIO is functionally very
similar to the SIOs that were around 20+ years ago.

With that, it's the host's (i.e. BIOS's) responsibility to detect the
presence of the SIO and to configure its UART with port (e.g. 0x3f8)
and interrupt (e.g. 0x4). The SIO in the BMC will just take this
configuration "no questions asked" and make the UART accessible on LPC
for the host to communicate with. The BIOS also registers the UART in
the SMBIOS and ACPI tables where the OS learns about its existence to
load the correct driver.

The SuperIO's UART actually generates/receives serial UART signals on
a 3-wire interface (TX, RX, GND) at the configured speed. This signal
can then be routed (there are a bunch of muxes in the Aspeed) either
to another UART (which the BMC can control) or to a physical serial
port (i.e. a D-Sub 9 or a header on the mainboard). The default
configuration is for UART1 and UART2 (both of which are controlled by
the SIO) to be routed to physical serial ports.

The big problem with SIO in AST2400 / AST2500 is CVE-2019-6260. As I
understand it, in order to expose the SIO to the host, a number of
interfaces need to be enabled that ultimately allow the host to
perform other operations that are undesirable wrt. BMC security.
Please correct me if I'm wrong.


2) VUART ("Virtual UART")
The VUART is "virtual", since it does not actually generate serial
UART signals. Instead the VUART really is two "half UARTs" connected
with each other. One half is connected to LPC to be used by the host,
the other is accessible from the BMC. They both expose the UART
programming interface which allows both the host and the BMC  to use
standard serial port drivers. There's no configurable routing for the
VUART. Whatever the "port speed" that's configured by host or BMC, the
VUART always runs at "maximum speed", i.e. bytes written to the UART
on one end are accessible "immediately" on the other end (of course
there's a maximum "baud rate" there, but that's not due to an actual
serial UART signal.

The big difference with VUART is that the "host settings" (i.e. port
and interrupt) are fully controlled by the BMC. This requires a change
in the host's BIOS, as it should no longer attempt to detect and
configure the SIO and instead just expect a UART to be present at a
predetermined address. For the BIOS that I worked with, this required
to build and include a different module that performs the necessary
initialization on the host side (e.g. configure the LPC bridge to
forward requests to the specified port and accept an incoming
interrupt) and to store the serial port in the SMBIOS and ACPI tables
for the OS to "detect" it from.

Now, if SIO is enabled on the BMC side and the host side AND if also
VUART is enabled and configured on the BMC side, this may result in
TWO devices listening on the port and possibly attempting to issue
interrupts. I'm not sure what mechanism the Aspeed uses to prevent
both the SIO's UART and the VUART to respond at the same time on the
same address.


Also note that there's host-side setting for LPC interrupts ("LPC
IRQSER"), which can either be "quiet" or "continuous" mode, with a HW
default on the host of "quiet" mode; see Intel C620 datasheet, p.
1544, when setting the Enable (EN, bit 7) bit in the Serial IRQ
Control register (SCNT, offset 0x64), the Mode (MD, bit 6) bit should
be set to enable "continuous mode". However, the Aspeed's default is
"continuous" (not sure if it supports "quiet" mode). This results in
the Aspeed not being able to send interrupts to the host.


> In this case do we have some way to make it an obvious error to enable
> both SUART1 and VUART in DTS? If they're conflicting surely there
> should be a way to express that?
No, I don't think we should try to employ any "smarts" here, as
ultimately the behavior is caused by a combination of enabled BMC
features (SIO) and host (BIOS) behavior.


I hope that clears it up a little? I'm happy to explain more if needed.

Thanks
Oskar.
