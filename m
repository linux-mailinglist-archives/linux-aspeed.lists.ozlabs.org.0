Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 955114A8345
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 12:40:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqGtT2cCrz3bZb
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 22:40:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=P94tOZ+K;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=P94tOZ+K; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqGtN6F82z30FH
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Feb 2022 22:39:54 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id e16so1890252qtq.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Feb 2022 03:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t/FmJ+H6iPvmZzSgzAi6Vzfm5Bl75LQIahcxCaEsuyE=;
 b=P94tOZ+K0B+HU5I2I9P6ymAbTI2GNSrt0XldvVwf0lmQabuky1T+i+dbQqs2NmUdbU
 k8pvA1od8fOQ43PMUWKGFelgDliKuS/NSX3z3JqeVHs/f9Dw3dyS/hEydKaHkJlL1p7o
 kY9d2lpNwPl9sAjNtLZNQnt6oyKrd3UlZ+aos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t/FmJ+H6iPvmZzSgzAi6Vzfm5Bl75LQIahcxCaEsuyE=;
 b=26VrW6QM90I7cNtOKG3fbdO/sFHUEttZSa4dZ/nyfybnxQMpPkWLWxWVHgxl5pLaby
 x63ztbN4K2AwPnzEhjX18Hh6TCkQmiZ32zGUZ8TeP53RuRdGdzh8EIazGF0pYLMens6P
 fNsdLfggipB2s273jmq0U2Iiu2ZhxxtOQhzZHgsao8HV1okF3j5sBjmJN9ESFiE1NNBT
 BfWRsoEgFKG75BMgl6HXw0eNqDr9KlnHJVw3D4NqrunZh7afgbinhQZ1IcwzW+ZouQDp
 mahLRtkuYhIoHvQ+tvDgdNzpfypoYMsovolomdixzkZG1mzhQvKNvtSTxytWURbiPOBk
 i0OQ==
X-Gm-Message-State: AOAM531WzdRO5eZ2wedivQZX0fZGPs5VX/lcf1ClK+L6ZhVE161liCbX
 9LFQt+QNLvNBk7y29PPt7KJFugfuOzFeGrPdtuM=
X-Google-Smtp-Source: ABdhPJxRb/JyUozYSYKLFLDaIbQz9iHfeo6RHF4VQC9PTd8qJYKFSk2SQWVOIjoFfpGT/Rr3BktnRlrOxYI4t86ps7w=
X-Received: by 2002:ac8:5a93:: with SMTP id c19mr26756233qtc.58.1643888389787; 
 Thu, 03 Feb 2022 03:39:49 -0800 (PST)
MIME-Version: 1.0
References: <20220201050501.182961-1-joel@jms.id.au>
 <20220201050501.182961-3-joel@jms.id.au>
 <YfjyNo5wBPs16vkz@kroah.com>
In-Reply-To: <YfjyNo5wBPs16vkz@kroah.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Feb 2022 11:39:38 +0000
Message-ID: <CACPK8XcYFZUtw_-8A5hzT0dYqtnifuFOf7qoER0YVsbCsReH8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: aspeed: Add secure boot controller support
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

On Tue, 1 Feb 2022 at 08:41, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Feb 01, 2022 at 03:35:01PM +1030, Joel Stanley wrote:

> > --- a/drivers/soc/aspeed/aspeed-socinfo.c
> > +++ b/drivers/soc/aspeed/aspeed-socinfo.c
> > @@ -8,6 +8,9 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >  #include <linux/sys_soc.h>
> > +#include <linux/firmware_bootinfo.h>
> > +
> > +static u32 security_status;
> >
> >  static struct {
> >       const char *name;
> > @@ -74,6 +77,83 @@ static const char *siliconid_to_rev(u32 siliconid)
> >       return "??";
> >  }
> >
> > +#define SEC_STATUS           0x14
> > +#define ABR_IMAGE_SOURCE     BIT(13)
> > +#define OTP_PROTECTED                BIT(8)
> > +#define LOW_SEC_KEY          BIT(7)
> > +#define SECURE_BOOT          BIT(6)
> > +#define UART_BOOT            BIT(5)
>
> Where do these bits come from?

They are taken from the datasheet.

> > +     pr_info("AST2600 secure boot %s\n",
> > +             (security_status & SECURE_BOOT) ? "enabled" : "disabled");
>
> When all is good, no need to print anything out.

We had some back and forth on this in an earlier iteration of this change:

 https://lore.kernel.org/all/57584776-06e7-0faf-aeb2-eab0c7c5ae1f@molgen.mpg.de/

It boils down to what is "good"? The system is fine if it is not
provisioned with secure boot keys, if that's the intent of the system
builder.

A similar thing is done for efi secure boot, where it prints out
whether it's enabled, disabled or unable to determine.

I'll send out a v2 that takes on the suggestions you made in the cover letter.

Cheers,

Joel
