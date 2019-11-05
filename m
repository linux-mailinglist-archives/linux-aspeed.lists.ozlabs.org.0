Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 669ECF2B38
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:48:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477z9r0YSrzF6K9
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:48:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476rKW5KnKzF52m
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Nov 2019 00:36:14 +1100 (AEDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iRz0B-000869-V7; Tue, 05 Nov 2019 14:36:07 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iRz08-0007MZ-9i; Tue, 05 Nov 2019 14:36:04 +0100
Date: Tue, 5 Nov 2019 14:36:04 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 00/62] Add definition for GPIO direction
Message-ID: <20191105133604.d2xcasxw7pwzwvh7@pengutronix.de>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
 <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
 <20191105131038.duol3rwwkbuvgvwv@pengutronix.de>
 <938a5ec7b41ae9ce7b0de83764d6b774cfdaa781.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <938a5ec7b41ae9ce7b0de83764d6b774cfdaa781.camel@fi.rohmeurope.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
X-Mailman-Approved-At: Thu, 07 Nov 2019 20:47:03 +1100
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
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>,
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "info@metux.net" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 05, 2019 at 01:30:20PM +0000, Vaittinen, Matti wrote:
> On Tue, 2019-11-05 at 14:10 +0100, Uwe Kleine-König wrote:
> > Hello,
> > 
> > On Tue, Nov 05, 2019 at 12:54:55PM +0000, Vaittinen, Matti wrote:
> > > On Tue, 2019-11-05 at 14:20 +0200, Andy Shevchenko wrote:
> > > > I would also like to see bloat-o-meter statistics before and
> > > > after
> > > > your patch.
> > > > My guts tell me that the result will be not in the favour of
> > > > yours
> > > > solution.
> > > 
> > > Can you please tell me what type of stats you hope to see? I can
> > > try
> > > generating what you are after. The cover letter contained typical
> > > +/-
> > > change stats from git and summary:
> > > 
> > > 62 files changed, 228 insertions(+), 104 deletions(-)
> > 
> > I guess he wants to see
> > 
> > 	scripts/bloat-o-meter vmlinuz.old vmlinuz
> > 
> > . I would expect a 0 there. I didn't look in detail, but in general I
> > like the idea to give 0 and 1 a symbolic name.
> 
> Thanks Uwe. This far I have only cross-compiled the series for arm
> which I use for developing the ROHM PMICs. scripts/bloat-o-meter /
> tools it uses does not seem to recognize the image format (not a big
> surprize as my host is x86_64).

It works for me, I guess that's because my binutils support several
architectures:

	$ nm --help
	...
	nm: supported targets: elf64-x86-64 elf32-i386 elf32-iamcu elf32-x86-64
	pei-i386 pei-x86-64 elf64-l1om elf64-k1om elf64-little elf64-big
	elf32-little elf32-big elf64-littleaarch64 elf64-bigaarch64
	elf32-littleaarch64 elf32-bigaarch64 elf32-littlearm elf32-bigarm
	elf64-alpha ecoff-littlealpha elf32-littlearm-fdpic elf32-bigarm-fdpic
	elf32-hppa-linux elf32-hppa elf64-ia64-little elf64-ia64-big pei-ia64
	elf32-m32r-linux elf32-m32rle-linux elf32-m68k elf32-tradbigmips
	elf32-tradlittlemips ecoff-bigmips ecoff-littlemips elf32-ntradbigmips
	elf64-tradbigmips elf32-ntradlittlemips elf64-tradlittlemips
	elf32-powerpc aixcoff-rs6000 elf32-powerpcle ppcboot elf64-powerpc
	elf64-powerpcle aixcoff64-rs6000 aix5coff64-rs6000 elf64-littleriscv
	elf32-littleriscv elf32-s390 elf64-s390 elf32-sh-linux elf32-shbig-linux
	elf32-sh-fdpic elf32-shbig-fdpic elf32-sparc elf64-sparc pe-x86-64
	pe-bigobj-x86-64 pe-i386 plugin srec symbolsrec verilog tekhex binary
	ihex

(added line breaks for easier reading). I got this by installing
binutils-multiarch (on Debian).

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
