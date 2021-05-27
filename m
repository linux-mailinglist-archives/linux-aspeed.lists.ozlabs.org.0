Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66523925C8
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 06:02:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrDft54JMz2ykF
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 14:02:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrDfn2K2hz2yX0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 14:02:21 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14R3moGk084120;
 Thu, 27 May 2021 11:48:50 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 12:01:53 +0800
Date: Thu, 27 May 2021 12:01:47 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v1 2/4] ARM: dts: aspeed-g6: Add SGPIO node.
Message-ID: <20210527040146.GE9971@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com>
 <20210526094609.14068-3-steven_lee@aspeedtech.com>
 <69b31043-957c-40af-9ab9-6bcc63ccdc85@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <69b31043-957c-40af-9ab9-6bcc63ccdc85@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14R3moGk084120
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

The 05/27/2021 09:27, Andrew Jeffery wrote:
> Hi Steven,
> 
> On Wed, 26 May 2021, at 19:16, Steven Lee wrote:
> > AST2600 supports 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins.
> 
> Is there any chance the serial GPIO controllers can be explicitly 
> listed in the Memory Space Allocation Table of the datasheet? Currently 
> they're covered by the entry for "GPIO Controller (Parallel GPIO)" 
> which is listed as ranging from 0x1e780000-0x1e7807ff.
> 

I've forwarded your suggestion to designers.
Per the discussion with designers, they may change the
GPIO controller description of Memory Space Allocation Table to
"GPIO Controller (including Parallel and Serial GPIO)".

> Admittedly the details are listed in chapter 41 for the GPIO 
> Controller, but it would be handy to not have to dig.
> 
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  arch/arm/boot/dts/aspeed-g6.dtsi | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> > index f96607b7b4e2..556ce9535c22 100644
> > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > @@ -377,6 +377,38 @@
> >  				#interrupt-cells = <2>;
> >  			};
> >  
> > +			sgpiom0: sgpiom@1e780500 {
> > +				#gpio-cells = <2>;
> > +				gpio-controller;
> > +				compatible = "aspeed,ast2600-sgpiom";
> > +				reg = <0x1e780500 0x100>;
> > +				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> > +				max-ngpios = <128>;
> 
> I need to think more about this one.
> 
> Andrew
