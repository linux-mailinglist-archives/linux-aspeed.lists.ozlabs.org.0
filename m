Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D24ED5FB10D
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 13:09:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmtN95L1dz3c5D
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 22:09:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RPtaD6F/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RPtaD6F/;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmVX421F4z3dqN;
	Tue, 11 Oct 2022 07:15:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665432916; x=1696968916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CqemTGOdGp4RFKaxsArxDkHX9Dedwc8sdTjVd9O3UKk=;
  b=RPtaD6F/o/fecLriqX+qZH4ShcaN2nlt2PXPfoRxBW5W76ZBQoAGaocR
   E25Azio2Z0Jt99p+nssPBqNVM3r6X/wdg49ARCHdFlO3prLVR1lgNMvOI
   BtvVvQmV+j7TBacXthlO4PUECakvk7n0px+Q6ZhqlefYxwAt6gWojAZ/w
   sDLMCEL5S5g368LeQgn04GqPGZvmIvf+Qtb+FWrHwhPWae4h4bgxVr++Z
   +F9gX8p9XnHZzjHskAHAX5tGAEC8y6XtkCp/XkF6f1R7n1/7d7n7Q5Yng
   TzbO5XmeB/xtYRO8bnPOo5QA2pJIBJMEAbmJGptPv8MAiqjV2AyAryuWO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="304314145"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="304314145"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 13:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="603862808"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="603862808"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 10 Oct 2022 13:15:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B3C0FD0; Mon, 10 Oct 2022 23:15:11 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Zyngier <maz@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kent Gibson <warthog618@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Prathamesh Shete <pshete@nvidia.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 05/36] pinctrl: aspeed: Add missed header(s)
Date: Mon, 10 Oct 2022 23:14:21 +0300
Message-Id: <20221010201453.77401-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jacky Bai <ping.bai@nxp.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Tomer Maimon <tmaimon77@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, soc@kernel.org, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-li
 st@broadcom.com>, Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Patrice Chotard <patrice.chotard@foss.st.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Shevchenko <andy@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>, Scott Branden <sbranden@broadcom.com>, Patrick Venture <venture@google.com>, Sean Wang <sean.wang@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Avi Fishman <avifishman70@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner 
 Berthing <kernel@esmil.dk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Do not imply that some of the generic headers may be always included.
Instead, include explicitly what we are direct user of.

While at it, sort headers alphabetically.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index a30912a92f05..3945612900e6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -5,6 +5,7 @@
 
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include "../core.h"
-- 
2.35.1

