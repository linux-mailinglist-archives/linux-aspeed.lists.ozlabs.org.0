Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B126D39EC01
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 04:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzZ050mHTz302f
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 12:27:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzZ020LRTz2xtt
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 12:27:44 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1582BpMG065091;
 Tue, 8 Jun 2021 10:11:51 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 10:25:40 +0800
Date: Tue, 8 Jun 2021 10:25:32 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v4 3/7] ARM: dts: aspeed-g6: Add SGPIO node.
Message-ID: <20210608022531.GA2948@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
 <20210607071514.11727-4-steven_lee@aspeedtech.com>
 <5277db96-4eb8-4794-a1fa-6a5bc40bffb7@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5277db96-4eb8-4794-a1fa-6a5bc40bffb7@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1582BpMG065091
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

The 06/08/2021 07:28, Andrew Jeffery wrote:
> On Mon, 7 Jun 2021, at 16:45, Steven Lee wrote:
> > AST2600 supports 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  arch/arm/boot/dts/aspeed-g6.dtsi | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> > index f96607b7b4e2..c09b24824b6d 100644
> > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > @@ -377,6 +377,36 @@
> >  				#interrupt-cells = <2>;
> >  			};
> >  
> > +			sgpiom0: sgpiom@1e780500 {
> > +				#gpio-cells = <2>;
> > +				gpio-controller;
> > +				compatible = "aspeed,ast2600-sgpiom-128";
> > +				reg = <0x1e780500 0x100>;
> > +				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> > +				ngpios = <128>;
> 
> Doesn't this affect the way the data is presented on the bus?
> 

I add ngpios in aspeed-g6.dtsi as it can be overridden by dts files and
driver won't return error if users only add status = "okay" in
dts files without adding ngpios property.

I will remove the property from aspeed-g6.dtsi if we don't need a
default value for ngpios.

> My understanding is this should be defined by each platform, not in the dtsi. Having said that, it appears it is specified in aspeed-g5.dtsi (as the value 8?).
> 

I will remove the property from aspeed-g5 in a separate patch.

Thanks,
Steven

> > +				clocks = <&syscon ASPEED_CLK_APB2>;
> > +				interrupt-controller;
> > +				bus-frequency = <12000000>;
> > +				pinctrl-names = "default";
> > +				pinctrl-0 = <&pinctrl_sgpm1_default>;
> > +				status = "disabled";
> > +			};
> > +
> > +			sgpiom1: sgpiom@1e780600 {
> > +				#gpio-cells = <2>;
> > +				gpio-controller;
> > +				compatible = "aspeed,ast2600-sgpiom-80";
> > +				reg = <0x1e780600 0x100>;
> > +				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> > +				ngpios = <80>;
> 
> As above.
> 
> Andrew
