Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 818BC39B04E
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 04:18:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx5zX3Ystz3021
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 12:18:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx5zT37tDz2yWJ
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Jun 2021 12:18:44 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 15424eXE032117;
 Fri, 4 Jun 2021 10:04:40 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 10:18:10 +0800
Date: Fri, 4 Jun 2021 10:18:08 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 4/5] gpio: gpio-aspeed-sgpio: Add set_config function
Message-ID: <20210604021807.GB25112@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-5-steven_lee@aspeedtech.com>
 <CAHp75VcPdUeK49w9qg9RuJY7ASMyFMEEi=cX1gnp=wM_QHDZ+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAHp75VcPdUeK49w9qg9RuJY7ASMyFMEEi=cX1gnp=wM_QHDZ+w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15424eXE032117
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

The 06/03/2021 19:07, Andy Shevchenko wrote:
> On Thu, Jun 3, 2021 at 1:20 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > AST SoC supports *retain pin state* function when wdt reset.
> > The patch adds set_config function for handling sgpio reset tolerance
> > register.
> 
> ...
> 
> > +static int aspeed_sgpio_set_config(struct gpio_chip *chip, unsigned int offset,
> > +                                  unsigned long config)
> > +{
> > +       unsigned long param = pinconf_to_config_param(config);
> > +       u32 arg = pinconf_to_config_argument(config);
> > +
> > +       if (param == PIN_CONFIG_PERSIST_STATE)
> > +               return aspeed_sgpio_reset_tolerance(chip, offset, arg);
> 
> > +       else
> 
> Redundant.
> 
> > +               return -EOPNOTSUPP;
> 
> IIRC we are using ENOTSUPP internally in the kernel. YEs, checkpatch
> warning may be ignored.
> 
> > +}
> 

I will modify the code as you suggested above, thanks.

> -- 
> With Best Regards,
> Andy Shevchenko
