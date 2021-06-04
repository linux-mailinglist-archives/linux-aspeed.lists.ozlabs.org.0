Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F287139B0EE
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 05:31:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx7bP0hsRz3023
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 13:31:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx7bH2KcRz2ym4
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Jun 2021 13:31:20 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1543HCCM038825;
 Fri, 4 Jun 2021 11:17:12 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 11:30:43 +0800
Date: Fri, 4 Jun 2021 11:30:40 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 1/5] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
Message-ID: <20210604033039.GC25112@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-2-steven_lee@aspeedtech.com>
 <516bb11a-b75f-49e1-ba79-e5a4c344a7ab@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <516bb11a-b75f-49e1-ba79-e5a4c344a7ab@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1543HCCM038825
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

The 06/04/2021 07:25, Andrew Jeffery wrote:
> Hi Steven,
> 
> On Thu, 3 Jun 2021, at 19:48, Steven Lee wrote:
> > sgpio-aspeed bindings should be converted to yaml format.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  .../bindings/gpio/aspeed,sgpio.yaml           | 78 +++++++++++++++++++
> >  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 -----------
> >  2 files changed, 78 insertions(+), 46 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml 
> > b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > new file mode 100644
> > index 000000000000..e7c2113cc096
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > @@ -0,0 +1,78 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Aspeed SGPIO controller
> > +
> > +maintainers:
> > +  - Andrew Jeffery <andrew@aj.id.au>
> > +
> > +description:
> > +  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
> > +  AST2600 have two sgpio master one with 128 pins another one with 80 
> > pins,
> > +  AST2500/AST2400 have one sgpio master with 80 pins. Each of the 
> > Serial
> > +  GPIO pins can be programmed to support the following options
> > +  - Support interrupt option for each input port and various interrupt
> > +    sensitivity option (level-high, level-low, edge-high, edge-low)
> > +  - Support reset tolerance option for each output port
> > +  - Directly connected to APB bus and its shift clock is from APB bus 
> > clock
> > +    divided by a programmable value.
> > +  - Co-work with external signal-chained TTL components 
> > (74LV165/74LV595)
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2400-sgpio
> > +      - aspeed,ast2500-sgpio
> > +      - aspeed,ast2600-sgpiom1
> > +      - aspeed,ast2600-sgpiom2
> 
> You should have followed Rob's request here and made two patches for 
> the binding document:
> 
> 1. A 1-to-1 conversion of the text file to dt-schema
> 2. Add your new compatibles for the 2600.
> 

Sorry I forgot to remove compatibles and move them to a new patch.

> From a cursory glance it looks okay except for the new compatibles.
> 
> Regarding the compatibles, I'd prefer we use something a bit more 
> meaningful. What do you think of these?
> 
> - aspeed,ast2600-sgpiom-80
> - aspeed,ast2600-sgpiom-128
> 

Ok, I will change the name as you suggested.

BTW, I and development team have an internal discussion about the
current sgpio design.

In the current design, the base offset of gpio input and output
are calculated by the maximum number of gpio pins that SoC supported.
For instance, in AST2500, max_ngpios is 80(defined in MAX_NR_HW_SGPIO),
if ngpios is 16 in dts, gpio input pin id is from 0 to 15 and
gpio output pin id is from 80 to 95.

We are thinking of removing max_ngpios(and MAX_NR_HW_SGPIO) and
corresponding design to make the gpio input and output pin base
are determined by ngpios.
For instance, in any AST SoC, if ngpios is 16 in dts,
gpio input pin id is from 0 to 15 and gpio output pin id is from 16 to 31.
Thus we don't need to care about the max_ngpios of SoCs, and needn't to
add 2 compatibles for ast2600.

However, it might affect users who update kernel/driver from the
old kernel/driver as they may expect the gpio output pin base is start
from 80(MAX_NR_HW_SGPIO).
I was wondering if it is better to change the design as above.
It would be great to have your suggestion.

Thanks,
Steven

> Cheers,
> 
> Andrew
