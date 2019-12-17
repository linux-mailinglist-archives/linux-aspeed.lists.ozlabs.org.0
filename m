Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2703312258F
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Dec 2019 08:36:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cVLV3dw7zDqdc
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Dec 2019 18:36:02 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cVLD4VHKzDqbY
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Dec 2019 18:35:46 +1100 (AEDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1ih7OK-00044B-An; Tue, 17 Dec 2019 08:35:36 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1ih7OH-0008Gx-Pm; Tue, 17 Dec 2019 08:35:33 +0100
Date: Tue, 17 Dec 2019 08:35:33 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191217073533.GC31182@pengutronix.de>
References: <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
 <20191216114454.GB4161@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216114454.GB4161@sirena.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:51:55 up 109 days, 19:06, 74 users,  load average: 0.31, 0.39,
 0.44
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 19-12-16 11:44, Mark Brown wrote:
> On Mon, Dec 16, 2019 at 09:55:25AM +0100, Marco Felsch wrote:
> > On 19-12-12 16:51, Mark Brown wrote:
> 
> > > Something needs to say what that thing is, especially if it's runtime
> > > controllable.  In your case from the point of view of software there is
> > > actually no enable control so we shouldn't be providing an enable
> > > operation to the framework.
> 
> > The enabel control signal is always available, please check [1] table
> > 63. There is a mux in front of the enable pin so:
> 
> What I'm saying is that I think the binding needs to explicitly talk
> about that since at the minute it's really confusing reading it as it
> is, it sounds very much like it's trying to override that in a chip
> specific fashion as using gpiolib and the GPIO bindings for pinmuxing is
> really quite unusual.

Hm.. I still think that we don't mux the pin to some special function.
It is still a gpio input pin and if we don't request the pin we could
read the input from user-space too and get a 'valid' value. Muxing would
happen if we change the pad to so called _alternate_ function. Anyway,
lets find a binding description:

name:
 - dlg,vsel-sense-gpios

IMHO this is very descriptive and needs no update.

description:
 - A GPIO reference to a local general purpose input, [1] calls it GPI.
   The DA9062 regulators can select between voltage-a/-b settings.
   Each regulator has a VBUCK*_GPI or VLDO*_GPI input to determine the
   active setting. In front of the VBUCK*_GPI/VLDO*_GPI input is a mux
   to select between different signal sources, valid sources are: the
   internal sequencer, GPI1, GPI2 and GPI3. See [1] table 63 for more
   information. Most the time the internal sequencer is fine but
   sometimes it is necessary to use the signal from the DA9062 GPI
   pads. This binding covers the second use case.
   Attention: Sharing the same GPI for other purposes or across multiple
   regulators is possible but the polarity setting must equal.

[1] https://www.dialog-semiconductor.com/sites/default/files/da9062_datasheet_3v6.pdf

Regards,
  Marco


> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

