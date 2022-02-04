Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 628204A93BB
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Feb 2022 06:53:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jql8Q1Cjlz3bXn
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Feb 2022 16:53:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YBivNNSP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=YBivNNSP; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jql8K0DNjz30FH
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Feb 2022 16:53:34 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id g11so4579622qvu.3
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Feb 2022 21:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eYsZplQCWhMg5A+bT/pC03ERRgBVVGDzmghNtqEQDr0=;
 b=YBivNNSPLPS90P9KanrM2iXgWGM9hWxwxA3cqwPEs0O+rRpVly9+LQwEvvJEX+WosN
 Cw8s0KI5wt9MO3OpPlCUiGTFse+3KKZ/AzysoAgshKxrQySVr9haOsvZXRi5+VroDUz8
 BTE63MbJ+nz1+UP0MXiQKKvLtuGnwItdTM2yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eYsZplQCWhMg5A+bT/pC03ERRgBVVGDzmghNtqEQDr0=;
 b=0gniqnvp5V0vE0MhgvRACocevM0ePciUQehhZr9rUaF8h2h8gf62wsLcinw63/wpNq
 lcGR/Al1MtI+dDiXy/aGEWx9cFW6+dWI7lk+m3nzQXs5YNp9qpEukWu06nbFKDqGiIHD
 Yq6ex7ehaYUY0JEa2it2tOb4WBnYLC6AGZJrkCciZayiMZgacbZAJ9ltpAa/skpQHqfU
 SIpwFjDrxr/JRqb3dZXIN924TwpYe0GNuu0VS/AqNGvLPIzN5V7liLZkCSxaDfHx0EA7
 TZbhzRAjVhhDE9MN6xb9KzI2lCOB9aoGiVbhq3N5iiTHZyEtNaDTsZMLepmYNsl3i0P2
 mw8A==
X-Gm-Message-State: AOAM532iJ3PmIbhUXO8swt6ehVWk0pj4fsAfajThQVJe+13ZxQlowkbd
 cDWX2YZPuKgRb8fluXNGP8QRCHy0guyos6onIFQ=
X-Google-Smtp-Source: ABdhPJxzV9x3lo5VCczp8QlRvauAgQ3xtN6M8nj+/uAMvK/1xvpmzR2BHbFocweO2eKRTPo+WwYrOvSqosvPmjV5APE=
X-Received: by 2002:ad4:5f89:: with SMTP id jp9mr815712qvb.130.1643954011111; 
 Thu, 03 Feb 2022 21:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20220203115344.267159-1-joel@jms.id.au>
 <20220203115344.267159-2-joel@jms.id.au>
 <f44d2e01-b6cb-5f22-f651-f4dd7ced166f@arm.com>
In-Reply-To: <f44d2e01-b6cb-5f22-f651-f4dd7ced166f@arm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Feb 2022 05:53:18 +0000
Message-ID: <CACPK8Xed3AESz2JjqJa2v=6ipXDBBMd=CxmiwruJS5cBEE+Qfg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] firmware: Add boot information to sysfs
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 3 Feb 2022 at 14:23, Robin Murphy <robin.murphy@arm.com> wrote:
> > diff --git a/Documentation/ABI/testing/sysfs-firmware-bootinfo b/Documentation/ABI/testing/sysfs-firmware-bootinfo
> > new file mode 100644
> > index 000000000000..cd6c42316345
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-firmware-bootinfo
> > @@ -0,0 +1,43 @@
> > +What:                /sys/firmware/bootinfo/*
> > +Date:                Jan 2022
> > +Description:
> > +             A system can expose information about how it was started in
> > +             this directory.
> > +
> > +             This information is agnostic as to the firmware implementation.
> > +
> > +             A system may expose a subset of these properties as applicable.
> > +
> > +
> > +What:                /sys/firmware/bootinfo/secure_boot
> > +Date:                Jan 2022
> > +Description:
> > +             Indicates the system was started with secure boot enabled in
> > +             the firmware.
> > +
> > +
> > +What:                /sys/firmware/bootinfo/abr_image
> > +Date:                Jan 2022
> > +Description:
> > +             Indicates the system was started from the alternate image
> > +             loaded from an Alternate Boot Region. Often this is a result of
> > +             the primary firmware image failing to start the system.
> > +
> > +
> > +What:                /sys/firmware/bootinfo/low_security_key
> > +Date:                Jan 2022
> > +Description:
> > +             Indicates the system's secure boot was verified with a low
> > +             security or development key.
> > +
> > +What:                /sys/firmware/bootinfo/otp_protected
> > +Date:                Jan 2022
> > +Description:
> > +             Indicates the system's boot configuration region is write
> > +             protected and cannot be modified.
> > +
> > +What:                /sys/firmware/bootinfo/uart_boot
> > +Date:                Jan 2022
> > +Description:
> > +             Indicates the system firmware was loaded from a UART instead of
> > +             an internal boot device.
>
> I'd be concerned about how well details like "uart_boot" and "abr_image"
> scale beyond one SoC family from one vendor. The combinatorial explosion
> of possible boot configurations across Linux-capable SoCs and firmware
> in general is larger than I'd care to imagine, even before considering
> that the nuances don't necessarily stop there - e.g. whether a given
> storage interface is hard-wired or user-accessible is not a fixed
> property on many SoCs, and even a socketed SD card might be "trusted" if
> a board is deployed in a product with a sealed enclosure.

This is a fair point. The first iteration of this idea was specific to
the aspeed soc.

For the system I'm building, secure_boot and otp_locked tell our
manufacturing test process that the machine has been correctly
provisioned. I'd like to get something agreed upon so we can start
using those sysfs files in the testing without having to go back and
change things.

abr_image is an indication that something went wrong at boot time. I
thought this was a standard eMMC concept, but taking a closer look
it's specific to the aspeed soc.

Would it help if we gave them generic names?

 - abr_image -> alternate_boot

I welcome other suggestions.

I'll drop the uart_boot property for now.

Cheers,

Joel
