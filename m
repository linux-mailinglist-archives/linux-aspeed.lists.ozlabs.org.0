Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDAF3A2244
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Jun 2021 04:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0nrs0Nl8z306M
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Jun 2021 12:25:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0nrn5vc6z2ymP
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Jun 2021 12:25:43 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 15A2ASoQ033844;
 Thu, 10 Jun 2021 10:10:28 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 10:24:20 +0800
Date: Thu, 10 Jun 2021 10:24:19 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 00/10] ASPEED sgpio driver enhancement.
Message-ID: <20210610022416.GA27188@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <CACRpkdZOStr+K9U9QTkAcsk4NxuSqBRVv_-9_VkGJbT69iSxmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACRpkdZOStr+K9U9QTkAcsk4NxuSqBRVv_-9_VkGJbT69iSxmQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15A2ASoQ033844
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
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The 06/09/2021 18:54, Linus Walleij wrote:
> On Tue, Jun 8, 2021 at 12:26 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
> 
> > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> > supports up to 80 pins.
> > In the current driver design, the max number of sgpio pins is hardcoded
> > in macro MAX_NR_HW_SGPIO and the value is 80.
> >
> > For supporting sgpio master interfaces of AST2600 SoC, the patch series
> > contains the following enhancement:
> > - Convert txt dt-bindings to yaml.
> > - Update aspeed-g6 dtsi to support the enhanced sgpio.
> > - Define max number of gpio pins in ast2600 platform data. Old chip
> >   uses the original hardcoded value.
> > - Support muiltiple SGPIO master interfaces.
> > - Support up to 128 pins.
> > - Support wdt reset tolerance.
> > - Fix irq_chip issues which causes multiple sgpio devices use the same
> >   irq_chip data.
> > - Replace all of_*() APIs with device_*().
> >
> > Changes from v4:
> 
> v5 looks good to me!
> 
> I just need Rob's or another DT persons nod on the bindings (or timeout)
> before I merge it. Poke me if nothing happens.
> 
> >   ARM: dts: aspeed-g6: Add SGPIO node.
> >   ARM: dts: aspeed-g5: Remove ngpios from sgpio node.
> 
> These two need to be merged through the SoC tree, the rest I will handle.
> 
Hi Linus, Andrew,

Per the comment in the following mail
https://lkml.org/lkml/2021/6/9/317

I was wondering if I should prepare v6 for the currnet solution or
I should drop this patch series then prepare another patch for the
new solution(piar GPIO input/output) which breaks userspace but is
better than the current solution.

Thanks,
Steven

> Yours,
> Linus Walleij
