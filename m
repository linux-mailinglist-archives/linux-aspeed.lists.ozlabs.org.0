Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A24CAF2B2B
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:47:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477z985TVPzF5Z0
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:47:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476ph44dJ3zF51Q
 for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Nov 2019 23:22:12 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 04:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="192084709"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007.jf.intel.com with ESMTP; 05 Nov 2019 04:20:45 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iRxpC-0002Sh-HQ; Tue, 05 Nov 2019 14:20:42 +0200
Date: Tue, 5 Nov 2019 14:20:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 00/62] Add definition for GPIO direction
Message-ID: <20191105122042.GO32742@smile.fi.intel.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, David Daney <david.daney@cavium.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Peter Tyser <ptyser@xes-inc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, mazziesaccount@gmail.com,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nandor Han <nandor.han@ge.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 05, 2019 at 12:09:10PM +0200, Matti Vaittinen wrote:
> The patch series adds definitions for GPIO line directions.
> 
> For occasional GPIO contributor like me it is always a pain to remember
> whether 1 or 0 was used for GPIO direction INPUT/OUTPUT. Judging the
> fact that I removed few comments like:
> 
> /* Return 0 if output, 1 if input */
> /* This means "out" */
> return 1; /* input */
> return 0; /* output */
> 
> it seems at least some others may find it hard to remember too. Adding
> defines for these values helps us who really have good - but short
> duration - memory :]
> 
> Please also see the last patch. It adds warning prints to be emitted
> from gpiolib if other than defined values are used. This patch can be
> dropped out if there is a reason for that to still be allowed.
> 
> This idea comes from RFC series for ROHM BD71828 PMIC and was initially
> discussed with Linus Walleij here:
> https://lore.kernel.org/lkml/c06725c3dd34118a324907137758d8b85b3d4043.camel@fi.rohmeurope.com/
> but as this has no dependencies to BD71828 work (which probably takes a
> while) I decided to make it independent series.
> 
> Patches are compile-tested only. I have no HW to really test them. Thus I'd
> appreciate carefull review. This work is mainly about converting zeros
> and ones to the new defines but it wouldn't be first time I get it wrong
> in one of the patches :)

For all patches I have been Cc'ed to, NAK.

I don't see the advantages now since all known hardware uses the single bit to
describe direction (even for Intel where we have separate gating for in and out
buffers the direction we basically rely on the bit that enables out buffer).

So, that said the direction is always 1 bit and basically 0/1 value. Which one
is in and which one is out just a matter of an agreement we did.

I would also like to see bloat-o-meter statistics before and after your patch.
My guts tell me that the result will be not in the favour of yours solution.

-- 
With Best Regards,
Andy Shevchenko


