Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F2531638D
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 11:19:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbG2S3Qz8zDshY
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 21:19:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FMzLIjun; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbG2J0HM3zDshY
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 21:19:00 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id c5so1128074qth.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 02:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=baxcKrCgkoScFUDNAwKsa84jVZFHv1nVp34webfNPW4=;
 b=FMzLIjunyqiHNiUcPvkqjDQKBNtMZFSJVGEPJfUVMDqvrc/fzg9Nb4FG7kVjduLgXB
 EP3sCzCQRAKuTEHztB6GWafxqQAYW53oatc5Vs+ENMIsF/z63khBAKiPab/05HGlBsm4
 qNGb3KtRaLxNLMtTdC/WtCNJaK9NMwUP5bBLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=baxcKrCgkoScFUDNAwKsa84jVZFHv1nVp34webfNPW4=;
 b=DX81jsk9UD+aFPf1kcazJ6CnILWYYnRjd1gNp9JHx8ACXco6jroh/C2WhMtDSDANUl
 qupj+Qti+X4jJI2y5hoeeK/cmKvhbccbAovgY+af86LHhkOZMVNmvNQ3HdNJlRaPWpBX
 DuGkmdOofa1gFSl0oWxMOy7gvHG11m7X72AAMf3mXbIUmofVV1dgKiIJTvGG0WjlZ3h5
 tMvah6kab3jeLKNCFw4BCJm0wNduBO+CFd3tfgw21dtXa8AewMiQhLjDA9LbUKaPc6yi
 b59t2K18m9QAHdcfDXoquYAaYOKMRwhjP9z+Hvek6nReoiU/I9V4tR4JYpW5mjeOE+na
 ezjQ==
X-Gm-Message-State: AOAM531r3RiiIFFM84M/DW52P2MzjEGPPX6p7sw/StweWYdZQxqy1/FT
 Ej75b+BIoXo87FoMEqqUWJwyJ4wWUVVRqlMYl+4=
X-Google-Smtp-Source: ABdhPJx8EwJMSfm1WnKBn8E5s6t3mQThpXYQTyVN5sLS/BAw6cQj9PKEjrp9ONWSXAMxw7s+zOrssnSpZXkZO5vOhFM=
X-Received: by 2002:ac8:5156:: with SMTP id h22mr2122208qtn.176.1612952333710; 
 Wed, 10 Feb 2021 02:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
 <HK0PR06MB33807C054FCE9E355346E204F2D00@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <CAK8P3a2WPvWokkqJB-yhfQH1ofofGNvibqPjUXPme+F2LCHjxw@mail.gmail.com>
 <HK0PR06MB3380A1F79CDE49FACC1A3E71F2A60@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <CAK8P3a1g8szrHnhOxjwFkwYt+P5ukawZRr7jbwtJLVyFVHS21g@mail.gmail.com>
In-Reply-To: <CAK8P3a1g8szrHnhOxjwFkwYt+P5ukawZRr7jbwtJLVyFVHS21g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Feb 2021 10:18:40 +0000
Message-ID: <CACPK8XdzLOQKe_v2BK=iTFonrw2V2NgYYqwiWky-PPzxs11iAg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] misc: Add clock control logic into Aspeed LPC
 SNOOP driver
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Robert Lippert <rlippert@google.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrewrj@au1.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Patrick Venture <venture@google.com>, Joel Stanley <joel@linux.ibm.com>,
 "xuxiaohan@bytedance.com" <xuxiaohan@bytedance.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 10 Feb 2021 at 01:43, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Sat, Jan 16, 2021 at 2:03 AM Ryan Chen <ryan_chen@aspeedtech.com> wrote:
> > >
> > > Sorry it did not make it into the merge window. The patch is still in patchwork.
> > > I could just pick it up directly for v5.12, or wait for a combined pull request
> > > with other work.
> >
> > Hello Arnd,
> > Thanks your update.
> >
> > >Joel, please let me know what you prefer.
> > >
> > Hello Joel,
> > Could you help check on this patch?
> > https://patchwork.ozlabs.org/project/linux-aspeed/patch/20200928070108.14040-2-ryan_chen@aspeedtech.com/

Sure, I'll respond to that thread separately.

> Hi Joel,
>
> I see there has been no new pull request for mach-aspeed in
> v5.12. If you have any material at all, please send it as soon
> as you can so I can pick it up this time.

There are some patches that I have queued up. As you can see I have
been a bit behind this cycle.

I'll get a pull request to you today. Thanks for the reminder.

Cheers,

Joel

>
> As a reminder, the patch here has still not been merged, as I
> never heard back from you.
>
>        Arnd
