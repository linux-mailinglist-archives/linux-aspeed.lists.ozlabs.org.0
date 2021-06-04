Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E283339B043
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 04:15:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx5vF72j5z3021
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 12:15:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx5v852P5z2yWl
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Jun 2021 12:14:59 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 15420tHr031948;
 Fri, 4 Jun 2021 10:00:55 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 10:14:26 +0800
Date: Fri, 4 Jun 2021 10:14:23 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 3/5] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
Message-ID: <20210604021422.GA25112@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-4-steven_lee@aspeedtech.com>
 <CAHp75Vef0HDXAHzSNL-LtA0Sra6Zpivt513_+aFR_um0JeFkog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAHp75Vef0HDXAHzSNL-LtA0Sra6Zpivt513_+aFR_um0JeFkog@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15420tHr031948
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
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, "Hongweiz@ami.com" <Hongweiz@ami.com>,
 "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The 06/03/2021 19:05, Andy Shevchenko wrote:
> On Thu, Jun 3, 2021 at 1:19 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins.
> > In the current driver, the maximum number of gpio pins of SoC is hardcoded
> > as 80 and the gpio pin count mask for GPIO Configuration register is
> > hardcode as GENMASK(9,6). In addition, some functions uses the hardcoded
> 
> use
> 
> > value to calculate the gpio offset.
> > The patch adds ast2600 compatibles and platform data that includes the
> > max number of gpio pins supported by ast2600 and gpio pin count mask for
> > GPIO Configuration register.
> > The patch also modifies some functions to pass aspeed_sgpio struct for
> > calculating gpio offset wihtout using the hardcoded value.
> 
> without
> 
> ...
> 
> > +#include <linux/of_device.h>
> 
> Why?
> 
> ...
> 

I will remove it as of_device_get_match_data() will be replaced
to device_get_match_data()

> > +#define GPIO_OFFSET(x)        ((x) & 0x1f)
> 
> GENMASK()
> 
> ...
> 

Do you mean the macro should be modified as follows?
#define GPIO_OFFSET(x)        ((x) & GENMASK(4, 0))

> > +       pdata = of_device_get_match_data(&pdev->dev);
> 
> device_get_match_data()
> 
> I guess you may replace all those of_*() to the corresponding
> device_*() or fwnode_*() calls.
> 

Thanks for the reviews, I will add a new patch for replacing all
of_*() to device_*().

> -- 
> With Best Regards,
> Andy Shevchenko
