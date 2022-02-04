Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA74A9432
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Feb 2022 07:55:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqmX93tLgz3bWj
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Feb 2022 17:55:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ZUhCgpFY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ZUhCgpFY; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqmX25kzxz2xtb
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Feb 2022 17:55:44 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id k4so4645957qvt.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Feb 2022 22:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WrQwIpuL5QQfrgQ1xY53TifwqFAdlu7lxhrd4A0K1Og=;
 b=ZUhCgpFYZFBMz0t/T/beYFLKyn+oTMgDvYNPCbrlZ+O0b0zjcOqM77KZwgcsko/rfY
 Opae/By9+juSbUqZyAJn3N+M/IW4QNYoDVqQn5S8v1Wg9cw35yR5424cTMW/AzJfReQW
 d4r4Sn5ZhN1aL1JuGq5Xyb2RcWHA5vjxUlYPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WrQwIpuL5QQfrgQ1xY53TifwqFAdlu7lxhrd4A0K1Og=;
 b=NxbrOUQKVO8hgfQMv5kDAEDyYQl2ZoLRw6QVAAKOU3PKVM0YqmkCyPDyUKnz3GhHMV
 dCeoDik/79jvDUPhb5yFZHsks9xyMzLkDZ8S7X8v4e9C442awXiRw/5SuT5nPS/5VeeH
 jVeQpIafn/VLsKCWFa/I0worF3uHiVLsrZoT9m5b3EbqAtSphwbkuCvB8isJpdRJiJ/l
 +iXazkt2MEUiMAyQDTXh0psEbFYPIYXUbzsTHwN0TVENphjCJse2EHDxmMJ85c2R/uI7
 hpP0cKXyCD9Zi1W55lazKFHN7GiH49keQnjqrPoc1Wzat90ps7bln0UMX2hB2/CkRL7k
 hQcA==
X-Gm-Message-State: AOAM531lBHffeR1+QyZlHpWTjSyG1agz9juUA1j2hSxpCMBM0F6Z0NHl
 +12npKv+jwuFESj4NY0NCLfrIRbRWGu8v4aTvW8=
X-Google-Smtp-Source: ABdhPJxIjXiua+2yaEudTWQZyVYtPJtC/dM9ic+ZK8TwsIe6R0AL7UGzZh5w9Deg7uDYYn4w0AGn6vDx1cg4HSF2Ovg=
X-Received: by 2002:ad4:5f89:: with SMTP id jp9mr908243qvb.130.1643957739826; 
 Thu, 03 Feb 2022 22:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20220203115344.267159-1-joel@jms.id.au>
 <20220203115344.267159-2-joel@jms.id.au>
 <YfvONCxvTTuWqI+J@kroah.com>
In-Reply-To: <YfvONCxvTTuWqI+J@kroah.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Feb 2022 06:55:26 +0000
Message-ID: <CACPK8Xf-gEkMUxB=numzbzQyM7f+YioUcocDP9=6T4VaF822sg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] firmware: Add boot information to sysfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 3 Feb 2022 at 12:44, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 03, 2022 at 10:23:42PM +1030, Joel Stanley wrote:

> > diff --git a/include/linux/firmware_bootinfo.h b/include/linux/firmware_bootinfo.h
> > new file mode 100644
> > index 000000000000..3fe630b061b9
> > --- /dev/null
> > +++ b/include/linux/firmware_bootinfo.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
>
> I have to ask, do you really mean "or later"?

Yeah. That's what we're told we should use.

> > +/* Copyright 2022 IBM Corp. */
> > +
> > +#include <linux/sysfs.h>
> > +#include <linux/init.h>
> > +
> > +#define BOOTINFO_SET(b, n, v) b.n.en = true; b.n.val = v
>
> Please use a while {} loop around these two statements.
>
> Didn't checkpatch warn you about that?

No, it didn't. I'll add it.

>
> > +struct bootinfo_entry {
> > +     bool en;
>
> What does "en" mean?  "enabled"?  If so, please spell it out.
>
> > +     bool val;
>
> How can a "value" have a boolean?  Is this "valid"?  Again, please spell
> it out, we have no lack of letters to use here to keep people from being
> confused.

I meant value. I think it's reasonable for a value to be true or
false. I'll make the names clearer with docs as you suggest.

>
> Can you please use kernel-doc comments to describe this structure?
>
>
> > +};
> > +
> > +struct bootinfo {
> > +     struct bootinfo_entry abr_image;
> > +     struct bootinfo_entry low_security_key;
> > +     struct bootinfo_entry otp_protected;
> > +     struct bootinfo_entry secure_boot;
> > +     struct bootinfo_entry uart_boot;
> > +};
>
> Same here, please use kernel-doc
>
> > +
> > +int __init firmware_bootinfo_init(struct bootinfo *bootinfo_init);
>
> __init is not needed on a function definition like this.

ack.
