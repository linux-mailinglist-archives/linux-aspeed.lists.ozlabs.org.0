Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2950B3A2
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Apr 2022 11:11:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl7v13q7Pz3bb0
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Apr 2022 19:11:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir;
 Fri, 22 Apr 2022 19:11:18 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl7tt1PXTz2yp5
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 19:11:17 +1000 (AEST)
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M6lYs-1noydZ07na-008Kwu for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr
 2022 11:06:03 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 r4-20020a05600c35c400b0039295dc1fc3so5002332wmq.3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 02:06:02 -0700 (PDT)
X-Gm-Message-State: AOAM530OOMYH6NpitVa83Afvy+A+csz7kicsXFuE8/vQRE0oYzG6xin7
 tSYsCP7/gDdU0jLrj0UimmI/6JzVr0xrIdUjGAo=
X-Google-Smtp-Source: ABdhPJyBJy68LeWxoCtkZpxUNMy01/6v++E4fqe+8tuCDM/CbPdYU7ohbVixofosAP/W+Pe5EImxDo7fKgPauiW5gWg=
X-Received: by 2002:a7b:ce15:0:b0:38e:b7b0:79be with SMTP id
 m21-20020a7bce15000000b0038eb7b079bemr3153470wmc.71.1650618361979; Fri, 22
 Apr 2022 02:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220204072234.304543-1-joel@jms.id.au>
 <20220204072234.304543-2-joel@jms.id.au>
 <YmJPRPhfA4Cki85S@kroah.com>
In-Reply-To: <YmJPRPhfA4Cki85S@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Apr 2022 11:05:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0G_xNQ6b2e71VXPVi+-j5L--SU37gFErwGYuh1QPrr1A@mail.gmail.com>
Message-ID: <CAK8P3a0G_xNQ6b2e71VXPVi+-j5L--SU37gFErwGYuh1QPrr1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] firmware: Add boot information to sysfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MWw/rnW8ybvWGWE0G97/k6m7SV551h1ghQPUhR6UbKZg4VOlN11
 ENpdGZum9ALQV4YPZ1BJnCscmJKmBqVofHjLGz9JvALhaVr8/JOHKHRAg/P0dD+4UpI/82X
 x38l0SRghR0za1sNyY79t6oTuy1OgCaocewQrRDORsOuPNDNUw1Izno+JQz6QLLTZs/70Tx
 cDqAl45pjwEOs4m80EDlg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k+pNTSHTTmE=:PMB7ealG6Tg47FZqH92WzD
 pcNrsCrdefHJCgJElH46nRgRxDbmXd3bm2uK0nf5rK0eSryl6Dsajg8WL9lGeL+HDYYhcI0X0
 XfRgqE5EnV1fSmVeltt+5+hGh7m1wObVkS/lwvAoDQl+FimF/P8tJHGzY7lp5bK+997jKPV4E
 3ocQINR+PXV4+rr/hLtAk7mE4hE95HeD2DygViJeQw3L9V1z9ryyITmfSdg9lkXCNigrxEMVB
 /p8wZSKb/hlsG1uIJZ9wpMcpRQqDAjkIcLEbc2dZ2IyPlMptVOUUByFG7QZz4X+gCL81l8q7S
 KoP4hDDCNT3Km3pIBcn9SZfwfb58UzTN2XNiuGeGqlBXXqmg2ZfBixdlREowt3E/G+tNHqk6z
 5ya4yG1tCO/1IelX07xCT2YHw7ukQ7eAbPQL0HExHSA+25R5HB2glKFGZPlqwNNhqh0a74sZ4
 UIz9BgCWQG/3Ipjv3Oakd28nQCDMvWBuVkmRPo/p87slnccVyFFx/il7+DeivgfID9ciK6T/5
 DDMt/yuLATpLtWBY03OL7jAxf1zfVDkYunEy75z0RqxSHvafELSssXkSUn1KDikMpUTfNL0bT
 +JH9UqUsXpKLLqT1mvU58qNsqbKwpKbY87v/DrpV5Sz4M/o2Ix2iH1c7j83ZJxQ6IMaUYhoj5
 bheklP6nCvJW633n2YHOsjTPipNWOxWFRpnQc6v2CgOSQiOzhDm5npChRzID8+UTa+oYfzdt8
 Ea0QNSP1vuxN4bUqe1AN0Mvc0+o7lG32nfACpiPvmHrGiu16wdMltO4Fv/p+oLCUyVvgkrk7N
 Q4nMhTsdbM6/6io+3TEz6xBX1kqpUtxTsYxK/xmH9dUElrk0cc=
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 8:46 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Feb 04, 2022 at 05:52:32PM +1030, Joel Stanley wrote:
> > +What:                /sys/firmware/bootinfo/*
> > +Date:                Jan 2022
>
> It isn't January anymore :)

The patch was sent on Feb 4, I would expect that to be close enough. Does this
need to be the month of the kernel release it is merged into instead?

> > +Description:
> > +             A system can expose information about how it was started in
> > +             this directory.
>
> I do not understand what you mean by "how it was started".
>
> > +             This information is agnostic as to the firmware implementation.
>
> How?  This should be very firmware specific.

The original patch was specific to a particular SoC vendor. Since the
information provided here is fairly generic in the end, I asked for
the interface
to be generalized to the point that it can be reused across multiple
vendors and architectures.

      Arnd
