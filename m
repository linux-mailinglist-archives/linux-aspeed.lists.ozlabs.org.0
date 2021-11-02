Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F61344260A
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 04:29:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjwPG1nHrz2y7H
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 14:29:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=cPps30E1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cPps30E1; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjwP84gQXz2xC1
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 14:29:14 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id h16so13358013qtk.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Nov 2021 20:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbZDx6RLiMrCpFDLIQL6rmuGnSugSGQ3Nvv9b+v8Ry4=;
 b=cPps30E1mKIRTCIRPCKk1MzXMjmCw+8/NnxEtqligTCGSQAdqEdZk5va84NsYgNItL
 RyVJ/ITqL9aA8wskWFq1pKuGXXXmuCF1qfHJ5jkSgimf+arTork/++r+6K75lFjds+WN
 DI32nXAnGIekBEv6cQ2OKUF7NwjJTuFvvwZ9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbZDx6RLiMrCpFDLIQL6rmuGnSugSGQ3Nvv9b+v8Ry4=;
 b=HKqebs4lD4JWnvj2pWSxGCxfElxr4Ja1qVuvunzEYgKdTOr/9Ai7XZh2eZj8jxgyYd
 5IOZXzsdZDvEndYb02d5myuFx1rPfB5y6a38qKlkU42e2uWODNdnUuHnr9ntWXwF3Crq
 JhFh72Wh15J2VeyVpdQfZgOmWHm+D3yKJbNFHhO6Er/SkeSVh3Ynxnx76LpGYTOLg3/7
 GIjwdXX0hkO14abvSH594QjwJjcEcN98BeE5lbw1gWaezpcwrDXvsb8GBFcI3RznRLGv
 LJVGuABMriqexGERIRbcKCFpwiduYiM0TV0nVMDuyJDMgrjBIFLfr6dyD2NK5QMTULNY
 KPSw==
X-Gm-Message-State: AOAM532yt+ti5wbyYSDbZ69bIZa8bYRPzLil+MeYSqEQlYDMFWdsOazE
 Ro0W2+hOEePGTYS6ao2EwbUaoDTt1KHcHQe1m2w=
X-Google-Smtp-Source: ABdhPJz/yhS9s3prGdIS4/h5cMOgyU9mocT/KpsW4wd3ZxMd0KgkaRpGR1li6TnoBvwaNd+ckUHx8iZKpGqxkLyskjg=
X-Received: by 2002:ac8:5cd5:: with SMTP id s21mr10724169qta.392.1635823749370; 
 Mon, 01 Nov 2021 20:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-5-jae.hyun.yoo@intel.com>
 <HK0PR06MB3779F8E273396ED805EE5D81918B9@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB3779F8E273396ED805EE5D81918B9@HK0PR06MB3779.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Nov 2021 03:28:57 +0000
Message-ID: <CACPK8XesLdb+Cbi3ZYrOahRHbXQi3L=cQXax=RV2=PrjiPQBew@mail.gmail.com>
Subject: Re: [PATCH -next 4/4] ipmi: kcs_bmc_aspeed: add clock control logic
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
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
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 "jae.hyun.yoo@intel.com" <jae.hyun.yoo@intel.com>,
 Cedric Le Goater <clg@kaod.org>, Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2 Nov 2021 at 03:16, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> Hi Jae,
>
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On
> >
> > From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >
> > If LPC KCS driver is registered ahead of lpc-ctrl module, LPC KCS block will be
> > enabled without heart beating of LCLK until lpc-ctrl enables the LCLK. This
> > issue causes improper handling on host interrupts when the host sends
> > interrupts in that time frame.
> > Then kernel eventually forcibly disables the interrupt with dumping stack and
> > printing a 'nobody cared this irq' message out.
> >
> > To prevent this issue, all LPC sub drivers should enable LCLK individually so this
> > patch adds clock control logic into the LPC KCS driver.
>
> Have all LPC sub drivers could result in entire LPC block down if any of them disables the clock (e.g. driver unload).
> The LPC devices such as SIO can be used before kernel booting, even without any BMC firmware.
> Thereby, we recommend to make LCLK critical or guarded by protected clock instead of having all LPC sub drivers hold the LCLK control.
>
> The previous discussion for your reference:
> https://lkml.org/lkml/2020/9/28/153

Please read the entire thread. The conclusion:

https://lore.kernel.org/all/CACPK8XdBmkhZ8mcSFmDAFV8k7Qj7ajBL8TVKfK8c+5aneUMHZw@mail.gmail.com/

That is, for the devices that have a driver loaded can enable the
clock. When they are unloaded, they will reduce the reference count
until the last driver is unloaded. eg:

https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L945

There was another fork to the thread, where we suggested that a
protected clocks binding could be added:

https://lore.kernel.org/all/160269577311.884498.8429245140509326318@swboyd.mtv.corp.google.com/

If you wish to use this mechanism for eg. SIO clocks, then I encourage
Aspeed to submit a patch to do that.

Cheers,

Joel
