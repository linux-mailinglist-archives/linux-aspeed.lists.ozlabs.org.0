Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D134111D1A0
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 16:58:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ydk31gl6zDqsG
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Dec 2019 02:58:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YdgD5FZNzDr3S
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Dec 2019 02:55:27 +1100 (AEDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1ifQo8-0002KX-2S; Thu, 12 Dec 2019 16:55:16 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1ifQo5-000678-TI; Thu, 12 Dec 2019 16:55:13 +0100
Date: Thu, 12 Dec 2019 16:55:13 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191212155513.fevajupxi6omphzf@pengutronix.de>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <CACRpkda4PFA=99u33xsXzQND1FaP=8GXGRQULngcd5a=zFepXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda4PFA=99u33xsXzQND1FaP=8GXGRQULngcd5a=zFepXg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:51:05 up 27 days,  7:09, 36 users,  load average: 0.12, 0.17, 0.13
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 Mark Brown <broonie@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On 19-12-12 16:08, Linus Walleij wrote:
> On Wed, Dec 11, 2019 at 6:09 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > I discussed it with a colleague again and he mentioned that pinctrl
> > should be named pinctrl instead it should be named padctrl.
> 
> Quoting Documentation/driver-api/pinctl.rst:
> 
> (...)
> Definition of PIN:
> 
> - PINS are equal to pads, fingers, balls or whatever packaging input or
>   output line you want to control and these are denoted by unsigned integers
>   in the range 0..maxpin.
> (...)

Okay there is the definition.

> > We don't
> > reconfigure the pad to a other function it is still a device general
> > purpose input pad. The hw-signal flow goes always trough the gpio block
> > so one argument more for my solution. Also we don't configure the "pad"
> > to be a vsel/ena-pin. The hw-pad can only be a gpio or has an alternate
> > function (WDKICK for GPIO0, Seq. SYS_EN for GPIO2, Seq. PWR_EN for GPIO4).
> > Instead we tell the regulator to use _this_ GPIO e.g. for voltage
> > selection so we go the other way around. My last argument why pinctrl
> > isn't the correct place is that the GPIO1 can be used for
> > regulator-0:vsel-in and for regulator-1:enable-in. So this pad would
> > have different states which is invalid IMHO.
> 
> Yeah it is just one of these cases where the silicon designer pulled
> a line of polysilicone over to the regulator enable signal and put a
> switch on it and say "so you can also enable the regulator
> with a signal from here", it can be used in parallel with anything
> else, which is especially messy.

I didn't say that the design isn't messy ;) I just wanna make the right
abstraction and IMHO this is the correct abstraction.

Regards,
  Marco

> Special cases require special handling, since the electronic design
> of this thing is a bit Rube Goldberg.
> 
> Yours,
> Linus Walleij
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
