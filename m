Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C81D39251E
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 04:57:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrCDK3QG1z2yhd
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 12:57:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrCDH06YVz2xv9
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 12:57:48 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 14R2WLnS077535
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 10:32:21 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14R2Ui7a077457;
 Thu, 27 May 2021 10:30:44 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 10:43:47 +0800
Date: Thu, 27 May 2021 10:43:41 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 0/4] ASPEED sgpio driver enhancement.
Message-ID: <20210527024341.GB9971@aspeedtech.com>
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
 <4d995f6e-b582-4f45-b87c-2cd795de8d14@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4d995f6e-b582-4f45-b87c-2cd795de8d14@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14R2Ui7a077457
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
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The 05/27/2021 09:41, Andrew Jeffery wrote:
> Hi Steven,
> 
> On Thu, 27 May 2021, at 10:24, Steven Lee wrote:
> > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> > supports up to 80 pins.
> > In the current driver design, the max number of sgpio pins is hardcoded
> > in macro MAX_NR_HW_SGPIO and the value is 80.
> > 
> > For supporting sgpio master interfaces of AST2600 SoC, the patch series
> > contains the following enhancement:
> > - Convert txt dt-bindings to yaml.
> > - Update aspeed dtsi to support the enhanced sgpio.
> > - Get the max number of sgpio that SoC supported from dts.
> > - Support muiltiple SGPIO master interfaces.
> > - Support up to 128 pins.
> > 
> > Changes from v1:
> > * Fix yaml format issues.
> > * Fix issues reported by kernel test robot.
> > 
> > Please help to review.
> 
> I think it's worth leaving a little more time between sending series.
> 
> I've just sent a bunch of reviews on v1.
> 

I am worried about the patch series may be drop by reviewers due to
the report of kernel test robot.

Regardless, thanks for the comment in v1 patch series.

Steven

> Cheers,
> 
> Andrew
