Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C618399A63
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 08:02:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwb0340ZKz2yyt
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 16:02:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IBXfs6Rv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IBXfs6Rv; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwZzz5n2zz2ym4
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Jun 2021 16:02:23 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id i67so4923366qkc.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Jun 2021 23:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aVGBSqEMWvho2HHHhcn8tJYFWMPyQsDHrSqOC/pMDus=;
 b=IBXfs6RvwlME9tLQ5hjQLVzuBZS2IzCpbKO/Cfg/gf54yiK7m47CiRdEiRFZDUfF6A
 92ZwKKSGkNKvkBoeCWiT6svOo0AgSXvAXABfFUv/RKq4c8RqHKChpAn3UO5yRcFF0YJj
 hDB/6kKVqUOAmfSzrHtqRTxSSfM++NCalWdg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aVGBSqEMWvho2HHHhcn8tJYFWMPyQsDHrSqOC/pMDus=;
 b=MOkIWWIqxeNkwcTzIdQ4vWXBXPHvG9hXaW9yBspW6f7PKEvGP5jLEbh20NGkZwdUU4
 jSLDnurX+s51/ni+GOqsgnbdXR5PWCAwI/EYWz+EYDibLkYGc/Rk0TfFdmQrLO1in7kH
 UmVOBmzPJ1g4xsXlU6EvMJxvT7Wnz6nKG0F6y17an3XceaYF9HaYyrdwRdxIRcXrx8gj
 M3OTLWiBDAEqcYYld1lFHqqhI81PuSQN2Zo5GmT8oHVOrPaFjUlIARKw/s3gDgPeeY3H
 BvBmgsxyPAxzB+zu4iop3Dp+gVyyIciQ8D8y2Sy7+c0GVPEcVgTyPlHtHydbC+rl0sVi
 J9vw==
X-Gm-Message-State: AOAM531x7ZoCNbaDRAMHHwbo+auCdWPFibBKAgUo4wFxuVJ0FCDyunM2
 CoTHlPf3KoZNmVFxRXmOJuA+WIxVH8edirjoQ20=
X-Google-Smtp-Source: ABdhPJw/OThWUwK486H/0pNkThCivzv84ZpWEH1P9Vep0jbnQKir8Pp/quWobR1asuUH1GRm/ZyXjQu1xXQ4lnMxOFE=
X-Received: by 2002:a05:620a:704:: with SMTP id
 4mr30648908qkc.66.1622700139228; 
 Wed, 02 Jun 2021 23:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210316085932.2601-1-troy_lee@aspeedtech.com>
 <CACPK8XeYtaLLWDMR8xZhERrQ_WCUJ2RM_JZmZNQ6oZSvgSDM_w@mail.gmail.com>
 <CAGm54UHgQSMh8WLzRf7Swhv9mmzNBuEK6eKf9eX0ASp95hjARw@mail.gmail.com>
In-Reply-To: <CAGm54UHgQSMh8WLzRf7Swhv9mmzNBuEK6eKf9eX0ASp95hjARw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Jun 2021 06:02:07 +0000
Message-ID: <CACPK8XdgLP7XSH0Zkej87ynnKTbEUW+RUBiSMgDH1H-LD5VXhg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v1] ARM: dts: Fix 64MiB OpenBMC flash
 layout and aspeed-ast2600-evb.dts
To: Lei Yu <yulei.sh@bytedance.com>, Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 leetroy@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 16 Apr 2021 at 07:35, Lei Yu <yulei.sh@bytedance.com> wrote:
>
> On Fri, Apr 16, 2021 at 11:03 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Tue, 16 Mar 2021 at 08:59, Troy Lee <troy_lee@aspeedtech.com> wrote:
> > >
> > > Aspeed AST2600 u-boot requires 600KiB+ flash space. Sharing the same
> > > openbmc-flash-layout-64.dtsi requires to resize the flash partition.
> > >
> > > The updated flash layout as follows:
> > > - u-boot: 896 KiB
> > > - u-boot-env: 128 KiB
> > > - kernel: 9MiB
> > > - rofs: 32 MiB
> > > - rwfs: 22 MiB
> >
> > Changing the 64MB layout will break the systems that are already using
> > this layout. I'll get the Bytedance people to chime in, as theirs is
> > the only system using this layout so far.
> >
> > John, Lei?
>
> Because the kernel's offset is updated, several other changes are required:
> 1. The related offsets, which is already sent to
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
> 2. The u-boot patch to update the `bootm` address and make sure it
> only applies to the 64MiB layout.
>
> Without the above two changes, I would suggest holding the merge.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Just confirming that we are okay to go ahead with this change, as per
the discussion on the openbmc list[1].

[1] https://lore.kernel.org/openbmc/CACPK8XdVNXSfzDBPryjQh_4S0yU4Tp6VOOtju+L_DcfgHumPJw@mail.gmail.com/

Cheers,

Joel
