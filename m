Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B82E87F
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 19:12:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tB6l64d3zDq5W
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 03:12:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RHPyhmdJ"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tB6Z3d30zDqDQ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 03:12:22 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id o5so5357384pls.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 10:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qUQwHR2VNeOE5MlCJ+FwXuCGuTGwhtdasJmtn1jXdiM=;
 b=RHPyhmdJuh4p9le7C8dnOEN+s/+kDEu7SpmvlvI4SYn8Wx81kzFxa/oxWR1hteJ5Dl
 OgDZ7UUSq4AcAcTrbT1g1ecqpA1ph7ueHeLKH8e3KvuIoYfHr3hwHNfZrfDwwOiwl8p9
 R29BMEjov8i+HamY04UYLVJfLDYgjroc3TxdDWUtHURJcAd2ymXMChRj6GrN8M8ENvFX
 WinMBAnsx/OzkDhZM2VhFw8LudtbHa41OLHMB8U/tzUszERAQRRYosfRyA95PXqiFi8Z
 FmebDEB/falILN7pKubBCOe0VN7vC4txcuSGuhj+IbXoQVvSL/9CwA9pq3BMLWvDTMV8
 MdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qUQwHR2VNeOE5MlCJ+FwXuCGuTGwhtdasJmtn1jXdiM=;
 b=V3GgO8LuITbLKzZoe3oDNutcJjrPhrzPZfdqxarDg4hqug6BX2SMrclgzAdm5Mn/Qi
 K7cfmeECYUA4MzJhSHPZeQ5dbcVAqNxXjfyK1tEiiCxu1aFdYMaGcW9IcD7BsC88Sz5u
 Owmlakc5cLdYF1DyXCPt9DrTx4uTtqyAiPM0iWumk8oLiNmdD9xW5pQWhVUKjxP0bPfD
 dOEymalzuE7Zs9BNP10FHtryfA8qEewNCfW/0qD1fnIBcoegU0gifdER5BPemNgPc903
 aRCkIBsEXBziB9m1znXrrsiAcKc682zc5VqFLROX/fYa6uJk/xhrQbBeJJXuH+5ZkhqA
 h/Nw==
X-Gm-Message-State: APjAAAU6AbT7ZcOkbYRy6EHdZ0EDJX0ZzByX6/j/BDg/f1hDbbni8Sfy
 6L75/+Mx+brh2o3J/V9wmKMd5fCo7fquwAlbZ63ynw==
X-Google-Smtp-Source: APXvYqxq59dYK855wXF2UaGJJlas8QKc5gdt2Tmc79lygnKF06mh76NgaeqWYhNzCj+xE1WIeZANTXTtJj3hhk6vfL0=
X-Received: by 2002:a17:902:7d8f:: with SMTP id
 a15mr62322314plm.3.1556557937999; 
 Mon, 29 Apr 2019 10:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190423142629.120717-1-venture@google.com>
 <CAO=notzjzpt0WHfJEWXMGgkoJU8UiLnqZnrGrPs-dRH5GNdJyQ@mail.gmail.com>
 <CAO=notz9QVoqKLrhJ3kx9FHja5+Mh68f36O36+1ewLG+SanmOA@mail.gmail.com>
 <20190425172549.GA12376@kroah.com> <20190429165137.mwj4ehhwerunbef4@localhost>
In-Reply-To: <20190429165137.mwj4ehhwerunbef4@localhost>
From: Patrick Venture <venture@google.com>
Date: Mon, 29 Apr 2019 10:12:06 -0700
Message-ID: <CAO=notwewAeeLz=LsOcSj=DakLGW0KjeDHALP5Nv2ckgkRqnFA@mail.gmail.com>
Subject: Re: [PATCH v2] soc: add aspeed folder and misc drivers
To: Olof Johansson <olof@lixom.net>
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
Cc: linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, soc@kernel.org,
 arm-soc <arm@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 10:08 AM Olof Johansson <olof@lixom.net> wrote:
>
> On Thu, Apr 25, 2019 at 07:25:49PM +0200, Greg KH wrote:
> > On Tue, Apr 23, 2019 at 08:28:14AM -0700, Patrick Venture wrote:
> > > On Tue, Apr 23, 2019 at 8:22 AM Patrick Venture <venture@google.com> wrote:
> > > >
> > > > On Tue, Apr 23, 2019 at 7:26 AM Patrick Venture <venture@google.com> wrote:
> > > > >
> > > > > Create a SoC folder for the ASPEED parts and place the misc drivers
> > > > > currently present into this folder.  These drivers are not generic part
> > > > > drivers, but rather only apply to the ASPEED SoCs.
> > > > >
> > > > > Signed-off-by: Patrick Venture <venture@google.com>
> > > >
> > > > Accidentally lost the Acked-by when re-sending this patchset as I
> > > > didn't see it on v1 before re-sending v2 to the larger audience.
> > >
> > > Since there was a change between v1 and v2, Arnd, I'd appreciate you
> > > Ack this version of the patchset since it changes when the soc/aspeed
> > > Makefile is followed.
> >
> > I have no objection for moving stuff out of drivers/misc/ so the SOC
> > maintainers are free to take this.
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> I'm totally confused. This is the second "PATCH v2" of this patch that I came
> across, I already applied the first.

I think the issue here was that I added to the CC list another email
and so you may see the v2  without that mailing list, and a v2 with it
--

Does this require a v3?  I honestly didn't think so, but this was the
first time I had to add more people without needing other changes.

>
> Patrick: Follow up with incremental patch in case there's any difference.
> Meanwhile, please keep in mind that you're adding a lot of work for people when
> you respin patches without following up on the previous version. Thanks!

w.r.t this patch series.  I found an issue with v1, and released a v2
with the detail of what changed.  I thought that was the correct
approach.  I apologize for creating extra work, that's something
nobody needs.

>
>
> -Olof
