Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7E393C3C
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 06:11:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrrpJ4s4Mz2yss
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 14:11:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrrpB48vyz2xvP
 for <linux-aspeed@lists.ozlabs.org>; Fri, 28 May 2021 14:10:55 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14S3uTIr014580;
 Fri, 28 May 2021 11:56:29 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 12:09:36 +0800
Date: Fri, 28 May 2021 12:09:34 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
Message-ID: <20210528040934.GA28403@aspeedtech.com>
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
 <20210527005455.25758-2-steven_lee@aspeedtech.com>
 <CACRpkdZFcFuT9rdrc8BfEBmhy0--9uLMSJWfr=A+nU117_BT8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACRpkdZFcFuT9rdrc8BfEBmhy0--9uLMSJWfr=A+nU117_BT8A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14S3uTIr014580
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

The 05/28/2021 07:51, Linus Walleij wrote:
> On Thu, May 27, 2021 at 2:55 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> 
> > SGPIO bindings should be converted as yaml format.
> > In addition to the file conversion, a new property max-ngpios is
> > added in the yaml file as well.
> > The new property is required by the enhanced sgpio driver for
> > making the configuration of the max number of gpio pins more flexible.
> >
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> (...)
> > +  max-ngpios:
> > +    description:
> > +      represents the number of actual hardware-supported GPIOs (ie,
> > +      slots within the clocked serial GPIO data). Since each HW GPIO is both an
> > +      input and an output, we provide max_ngpios * 2 lines on our gpiochip
> > +      device. We also use it to define the split between the inputs and
> > +      outputs; the inputs start at line 0, the outputs start at max_ngpios.
> > +    minimum: 0
> > +    maximum: 128
> 
> Why can this not be derived from the compatible value?
> 
> Normally there should be one compatible per hardware variant
> of the block. And this should be aligned with that, should it not?
> 
> If this is not the case, maybe more detailed compatible strings
> are needed, maybe double compatibles with compatible per
> family and SoC?
> 

Thanks for your suggestion.
I add max-ngpios in dt-bindings as there is ngpios defined in
dt-bindings, users can get the both max-ngpios and ngpios information
from dtsi without digging sgpio driver.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-g5.dtsi#n354

If adding more detailed compatibles is better, I will add them to sgpio driver
in V3 patch and remove max-ngpios from dt-bindings.

Since AST2600 has 2 sgpio controller one with 128 pins and another one with 80 pins.
For supporting max-ngpios in compatibles, 2 platform data for each
ast2600 sgpio controller as follows are necessary.

```
static const struct aspeed_sgpio_pdata ast2600_sgpiom1_pdata = {
        .max_ngpios = 128;
};
static const struct aspeed_sgpio_pdata ast2600_sgpiom2_pdata = {
        .max_ngpios = 80;
};

{ .compatible = "aspeed,ast2500-sgpio" , .data = &ast2400_sgpio_pdata, },
{ .compatible = "aspeed,ast2600-sgpiom1", .data = &ast2600_sgpiom1_pdata, },
{ .compatible = "aspeed,ast2600-sgpiom2", .data = &ast2600_sgpiom2_pdata, },
```

Thanks,
Steven

> Yours,
> Linus Walleij
