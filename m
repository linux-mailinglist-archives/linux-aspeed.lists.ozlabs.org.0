Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80B3713E9
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 May 2021 12:59:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYg2l4cvRz2yx4
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 May 2021 20:59:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYg2h3nC0z2yQv
 for <linux-aspeed@lists.ozlabs.org>; Mon,  3 May 2021 20:59:07 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 143Akm0o036864;
 Mon, 3 May 2021 18:46:48 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 3 May
 2021 18:58:27 +0800
Date: Mon, 3 May 2021 18:58:19 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: ast2600evb: Add timing-phase
 property for eMMC controller
Message-ID: <20210503105819.GC12520@aspeedtech.com>
References: <20210503014336.20256-1-steven_lee@aspeedtech.com>
 <20210503014336.20256-3-steven_lee@aspeedtech.com>
 <f237a53e-ad61-469a-a19f-8a1e52c6cfba@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <f237a53e-ad61-469a-a19f-8a1e52c6cfba@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 143Akm0o036864
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
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The 05/03/2021 13:07, Andrew Jeffery wrote:
> Hi Steven,
> 
> On Mon, 3 May 2021, at 11:13, Steven Lee wrote:
> > Set eMMC input clock phase to 3, which is more stable on AST2600 EVBs.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts 
> > b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > index 2772796e215e..7a93317e27dc 100644
> > --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > @@ -102,6 +102,7 @@
> >  
> >  &emmc_controller {
> >  	status = "okay";
> > +	timing-phase = <0x300FF>;
> 
> Please use the existing binding for phase corrections. The existing 
> binding is already supported by the driver (added in v5.12).
> 

Hi Andrew,

Thanks for the review.
I will add the following settings from aspeed-bmc-ibm-rainier.dts
instead of adding timing-phase in device tree.

        clk-phase-mmc-hs200 = <N> <N>;

> Andrew
