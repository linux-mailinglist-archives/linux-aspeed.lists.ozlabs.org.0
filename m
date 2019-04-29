Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12895E884
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 19:13:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tB7W4PP3zDqRX
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 03:13:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="UWe7teRV"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tB7P3msgzDq5W
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 03:13:03 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id r85so208378itc.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=25fiyi7j1Bbc8JQlGA4N04qFKyRP6T12Pl+h/G3rDyI=;
 b=UWe7teRVNHnVVVX7AxpBK7ppMB7htmVYCLs2maddnhAQN3s3CmuabCZeOMH8mGI/+6
 /JAfjgHvCS2HhFocaMlJd0BXxYtS9navSccjbvY6qbHBMMr4XEP05Vux6hRDc7FRqF9t
 kiOiH9k0iz1UZcROEN79XDk6Y4qZ4lS4HzZB2oSvWSi83Rn8F2YFkjGPBu66JMg3b00L
 7fc+GysM/pjBsAmOQm4Bn8C/JvFBndEdO1r5YjJ9N0VM9tkAqjSOPKtK1qzYDc9iIoYW
 FuK/BnRIigm4/uC2qkKopwb616CzVTL2ueBStfTT9+WDc3wTMj6WBvJkt9HrY9wm4l1G
 xNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=25fiyi7j1Bbc8JQlGA4N04qFKyRP6T12Pl+h/G3rDyI=;
 b=afHq3cbtAouUyjt1T0VYEu0Me2FGaP+LGrCJi/71ebBBbt8975CagPLXjpRJUwBP8t
 sZStM7rbCBoffXpcQoG/0163ky/ZrzMkkpuSA2rJrigOyyULy/QBvic9e6U+a4OZiLIL
 +CPq1HPVDX8KzZAVUvzHWcypa2Rq5GaVWAYcdpeNJLKWqyrKGdA7aY/Dv3Ou1AYvwbSo
 pvY3BboCT/IqAY5vo5YVfVMQZNbxZzARoAatSIjFWmhv4029zGg9KsN4m29gG1fjhnfT
 4gcd/wvAwzv9hWiQG/5xTrGCZtw0k0z7xfXgAxLTtG4kElQYhv30SL0PS9nvU3I79DMC
 abcA==
X-Gm-Message-State: APjAAAXRkudnAyFdzPu96BVl3mjb741+9rryyYXSu87Q29Pl0T8j0J/O
 dEQ/K6H/h+38P0TdY5NyQ5V7E7x8qsIutMtGMV31qQ==
X-Google-Smtp-Source: APXvYqweY4l9yaoGv4MZCSEVnHgtdmzETHUyk5nS1Ww7LwbZsUOtMDtCJk63xjgrLfehIEYLnqh+/O9ZQ0ZLjkXKcqk=
X-Received: by 2002:a24:58c:: with SMTP id 134mr87853itl.103.1556557980790;
 Mon, 29 Apr 2019 10:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190423142629.120717-1-venture@google.com>
 <CAO=notzjzpt0WHfJEWXMGgkoJU8UiLnqZnrGrPs-dRH5GNdJyQ@mail.gmail.com>
 <CAO=notz9QVoqKLrhJ3kx9FHja5+Mh68f36O36+1ewLG+SanmOA@mail.gmail.com>
 <20190425172549.GA12376@kroah.com> <20190429165137.mwj4ehhwerunbef4@localhost>
In-Reply-To: <20190429165137.mwj4ehhwerunbef4@localhost>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 29 Apr 2019 10:12:48 -0700
Message-ID: <CAOesGMg49z4Gip-bLK-h7+LSLa4Fu68r11gT2EV8E8xMCPGDxg@mail.gmail.com>
Subject: Re: [PATCH v2] soc: add aspeed folder and misc drivers
To: Greg KH <gregkh@linuxfoundation.org>
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
 Patrick Venture <venture@google.com>,
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
>
> Patrick: Follow up with incremental patch in case there's any difference.
> Meanwhile, please keep in mind that you're adding a lot of work for people when
> you respin patches without following up on the previous version. Thanks!

Not only that, but subthreads were cc:d to arm@kernel.org and some
were not, so I missed the overnight conversation on the topic.

If this email thread is any indication of how the code will be
flowing, there's definitely need for more structure. Joel, I'm hoping
you'll coordinate.

I'm with Arnd on whether the code should be in drivers/soc or not --
most of it likely should not.


-Olof
