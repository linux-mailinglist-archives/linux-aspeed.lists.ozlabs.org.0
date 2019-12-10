Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BB01183D5
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Dec 2019 10:42:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XFTZ5Ny6zDqXt
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Dec 2019 20:42:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=mfe@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XFTM35DQzDqW6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Dec 2019 20:42:13 +1100 (AEDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iec1b-0006gj-AJ; Tue, 10 Dec 2019 10:41:47 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1iec1Y-0003yz-IK; Tue, 10 Dec 2019 10:41:44 +0100
Date: Tue, 10 Dec 2019 10:41:44 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191210094144.mxximpuouchy3fqu@pengutronix.de>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204134631.GT1998@sirena.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:09:56 up 25 days, 28 min, 32 users,  load average: 0.08, 0.04,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, support.opensource@diasemi.com,
 linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, kernel@pengutronix.de,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Mark,

On 19-12-04 13:46, Mark Brown wrote:
> On Fri, Nov 29, 2019 at 06:25:34PM +0100, Marco Felsch wrote:
> 
> > +  Optional regulator device-specific properties:
> > +  - dlg,vsel-sense-gpios : A GPIO reference to a local general purpose input,
> > +    the datasheet calls it GPI. The regulator sense the input signal and select
> > +    the active or suspend voltage settings. If the signal is active the
> > +    active-settings are applied else the suspend-settings are applied.
> > +    Attention: Sharing the same GPI for other purposes or across multiple
> > +    regulators is possible but the polarity setting must equal.
> 
> I'm really confused by this.  As far as I understand it it seems
> to be doing pinmuxing on the chip using the GPIO bindings which
> is itself a bit odd and I don't see anything here that configures
> whatever sets the state of the pins.  Don't we need another GPIO
> to set the vsel-sense inputs on the PMIC?

Yes the PMIC is very configurable and it took a while till I understand
it.. @Adam please correct me if I'm wrong.

The PMIC regulators regardless of the type: ldo or buck can be
simplified drawn as:



da9062-gpio               da9062-regulator
    
  +-------------------------------------------------------
  |                  PMIC
  |    
  > GPIO0            +--------------------------+
  |                  |         REGULATOR-0      |
  > GPIO1 -------+   |                          |
  |              +-- > vsel-in    voltage-a-out <
  > GPIO2        |   |                          |
  |              |   > enable-in  voltage-b-out <
  |              |   |                          |
  |              |   +--------------------------+
  |              |                              
  |              |   +--------------------------+                          
  |              |   |         REGULATOR-1      |                          
  |              |   |                          |                          
  |              +-- > vsel-in    voltage-a-out <                          
  |                  |                          |                          
  |                  > enable-in  voltage-b-out <
  |                  |                          |
  |                  +--------------------------+
  |

The 'vsel-in' and 'enable-in' regulator inputs must be routed to the
PMIC GPIOs which must be configured as input. If this is a pinmux in
your opinion, then yes we need to do that. IMHO it isn't a pinmux
because from the regulator point of view it is just a GPIO which comes
from our own gpio-dev (da9062-gpio). So the abstraction is vald. Anyway
I'm with you that this isn't the typical use-case.

Regards,
  Marco 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
