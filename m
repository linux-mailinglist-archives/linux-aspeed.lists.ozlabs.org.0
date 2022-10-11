Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68785FB140
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 13:12:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmtRk5M2lz3bjk
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 22:12:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ST4q9Wxz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ST4q9Wxz;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmqcJ3srXz2xG8;
	Tue, 11 Oct 2022 20:05:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665479105; x=1697015105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ph4t/XlDBkX7oHU07HBNp4WniF3GSEowp5Yspa5Yt60=;
  b=ST4q9WxzBSm+Hd/o8XdJuQeOVe3ePAgLV4Tg6AgPbkEe4S0UXkLuk15h
   R03akxqoiQTLwIVj2Y5zgGsP/7iSnj8FMyu/0U6QP9d+OskO7XYMZJo4z
   lKHFhWtw7kSclp7IomlvfVdaxAOC33s9J5b5OnMh/K5U77C+s2GRsHtKg
   lPKvCM2A3astW9M5Tp8d04P3DK4Uejttijx7mKEjsHCS14qImbhpAVuAd
   ANobSpUCGPKS9eoKH3N1lz1KsfmU6GPKT/9Qjr8Vn0xPWYBQm1sOl6akX
   2n5EkuOwN3OJTUVuCEcWqxs3ZY7XO4UF4xka1Fl6/B4OKvVibshG8kZxH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291766727"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="291766727"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 02:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="621337854"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="621337854"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2022 02:04:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oiBBh-005EeG-1H;
	Tue, 11 Oct 2022 12:04:33 +0300
Date: Tue, 11 Oct 2022 12:04:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Basavaraj Natikar <bnatikar@amd.com>
Subject: Re: [PATCH v2 36/36] pinctrl: Clean up headers
Message-ID: <Y0UxoV+zn5MadWbm@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-37-andriy.shevchenko@linux.intel.com>
 <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 11 Oct 2022 22:08:23 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Horatiu Vultur <horatiu.vultur@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>, Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.d
 e>, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-media@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, soc@kernel.org, linux-rpi-kernel@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, alsa-devel@alsa-proj
 ect.org, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wenst@chromium.org>, Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Shawn Guo <shawnguo@kernel.org>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, openbmc
 @lists.ozlabs.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 11, 2022 at 01:00:11PM +0530, Basavaraj Natikar wrote:
> On 10/11/2022 1:44 AM, Andy Shevchenko wrote:

...

> > --- a/drivers/pinctrl/core.h
> > +++ b/drivers/pinctrl/core.h

> > -#include <linux/pinctrl/pinconf.h>
> 
> Removing pinconf.h from the core.h may cause build failure in other files
> because where-ever core.h is included to use “struct pinconf_ops”, there
> is a need to include pinconf.h.

Yes, I compiled only few drivers with the core changes. Still I got a few
reports by LKP. Thank you for spotting this!

> With that fixed,
> 
> Reviewed-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


