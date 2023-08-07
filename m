Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE4F7719D6
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Aug 2023 08:02:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b1ZGL++s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK5Lb39Rjz309D
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Aug 2023 16:01:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b1ZGL++s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RH3lZ1LrMz2ydW;
	Fri,  4 Aug 2023 08:43:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 132BD61ED0;
	Thu,  3 Aug 2023 22:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCD6C433C7;
	Thu,  3 Aug 2023 22:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691102581;
	bh=ENRnyG3da4GOMsyMnnkqd5l4ksii3jE/UxcP8TpIUp0=;
	h=From:Subject:Date:List-Id:To:Cc:From;
	b=b1ZGL++s9M6a2QHtVlyaW5BkQWjjk7R4o8bbCtbBfjTixFJ8iJSFJHFMEb4Tg0fOg
	 KCYaw+oqdTE2YKp0a2HE/Q959aB5N0lVPUjq9HEx56OuaefXQaotpqTbM/17tNjHog
	 uGZpeAIJBsTwfPqe8OatJ88SBO7knIcWDilyvDoub3Sftq6jTXOSFUivD/gBQTXxZ+
	 7+CKDmQUaqkgaTx2n6WyIkETT1jpARNb6ZLZFM8qCbuJutqzeHF88ZUgbzAZjvABdQ
	 EvdKnHaz9mUH5TCCYg62M3f+16EDkMndxHd2Hr1zsvn2xlf8+KzWG0+GzTjz6bUdU6
	 AbRwrjD39EpnA==
Received: (nullmailer pid 3693749 invoked by uid 1000);
	Thu, 03 Aug 2023 22:42:55 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 00/23] ARM: DT include cleanups
Date: Thu, 03 Aug 2023 16:42:40 -0600
Message-Id: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGAtzGQC/x2NQQrCMBAAv1L27GJIsahfEQ+bZGMCmpTdVAqlf
 zf1OAzMbKAsmRXuwwbC36y5lg72NIBPVF6MOXQGa+xormbE0DAxBRb0b6ayzIqxCmr16OPtEhx
 PZnIBesCRMjqh4tORKLy284e0sRx2Fo55/a8fz33/AVubj5GKAAAA
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Has
 him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
X-Mailer: b4 0.13-dev
X-Mailman-Approved-At: Mon, 07 Aug 2023 16:01:50 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Arnd, This is all the remaining ARM and SoC related patches of DT 
include cleanups which have not be applied by sub-arch maintainers.

A few of these are v2, but most are just resends of v1.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (23):
      ARM: l2x0: Add explicit includes for init and types
      ARM: sti: Drop unused includes
      ARM: alpine: Drop unused includes
      ARM: berlin: Drop unused includes
      ARM: dove: Drop unused includes
      ARM: hpe: Drop unused includes
      ARM: mmp: Drop unused includes
      ARM: nomadik: Drop unused includes
      ARM: npcm: Drop unused includes
      ARM: nspire: Drop unused includes
      ARM: pxa: Drop unused includes
      ARM: rockchip: Drop unused includes
      ARM: versatile: Drop unused includes
      ARM: mvebu: Explicitly include correct DT includes
      ARM: spear: Explicitly include correct DT includes
      bus: Explicitly include correct DT includes
      firmware: Explicitly include correct DT includes
      soc: aspeed: Explicitly include correct DT includes
      soc: mediatek: Explicitly include correct DT includes
      soc: rockchip: Explicitly include correct DT includes
      soc: sunxi: Explicitly include correct DT includes
      soc: xilinx: Explicitly include correct DT includes
      soc: fsl: Explicitly include correct DT includes

 arch/arm/include/asm/hardware/cache-l2x0.h |  2 ++
 arch/arm/mach-alpine/alpine_machine.c      |  2 --
 arch/arm/mach-berlin/berlin.c              |  5 -----
 arch/arm/mach-dove/common.c                |  2 --
 arch/arm/mach-hpe/gxp.c                    |  1 -
 arch/arm/mach-mmp/mmp-dt.c                 |  3 ---
 arch/arm/mach-mmp/mmp2-dt.c                |  4 ----
 arch/arm/mach-mmp/mmp3.c                   |  4 ----
 arch/arm/mach-mvebu/kirkwood.c             |  1 +
 arch/arm/mach-mvebu/pmsu.c                 |  2 +-
 arch/arm/mach-nomadik/cpu-8815.c           | 13 -------------
 arch/arm/mach-npcm/platsmp.c               |  3 ---
 arch/arm/mach-nspire/nspire.c              |  9 +--------
 arch/arm/mach-pxa/pxa-dt.c                 |  6 ------
 arch/arm/mach-rockchip/rockchip.c          |  6 +-----
 arch/arm/mach-spear/spear1340.c            |  2 +-
 arch/arm/mach-sti/board-dt.c               |  2 --
 arch/arm/mach-versatile/realview.c         |  2 --
 drivers/bus/fsl-mc/fsl-mc-bus.c            |  1 +
 drivers/bus/fsl-mc/fsl-mc-msi.c            |  2 --
 drivers/bus/hisi_lpc.c                     |  2 +-
 drivers/bus/omap_l3_smx.c                  |  1 -
 drivers/bus/simple-pm-bus.c                |  2 ++
 drivers/bus/sunxi-rsb.c                    |  2 +-
 drivers/bus/ti-pwmss.c                     |  2 +-
 drivers/firmware/arm_scmi/driver.c         |  4 ++--
 drivers/firmware/imx/imx-dsp.c             |  1 -
 drivers/firmware/imx/imx-scu-irq.c         |  1 +
 drivers/firmware/imx/imx-scu.c             |  1 +
 drivers/firmware/mtk-adsp-ipc.c            |  1 -
 drivers/firmware/raspberrypi.c             |  1 +
 drivers/firmware/scpi_pm_domain.c          |  3 ++-
 drivers/firmware/stratix10-rsu.c           |  1 -
 drivers/firmware/tegra/bpmp.c              |  3 +--
 drivers/firmware/xilinx/zynqmp.c           |  1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c      |  1 -
 drivers/soc/aspeed/aspeed-p2a-ctrl.c       |  2 +-
 drivers/soc/aspeed/aspeed-uart-routing.c   |  3 +--
 drivers/soc/fsl/dpaa2-console.c            |  3 ++-
 drivers/soc/fsl/qe/qe.c                    |  3 ++-
 drivers/soc/fsl/qe/qe_common.c             |  1 -
 drivers/soc/fsl/qe/qe_tdm.c                |  4 +---
 drivers/soc/mediatek/mtk-cmdq-helper.c     |  1 +
 drivers/soc/mediatek/mtk-devapc.c          |  2 +-
 drivers/soc/mediatek/mtk-mmsys.c           |  2 +-
 drivers/soc/mediatek/mtk-mutex.c           |  3 +--
 drivers/soc/mediatek/mtk-pmic-wrap.c       |  3 ++-
 drivers/soc/rockchip/grf.c                 |  2 +-
 drivers/soc/sunxi/sunxi_sram.c             |  2 +-
 drivers/soc/xilinx/zynqmp_power.c          |  1 +
 50 files changed, 38 insertions(+), 93 deletions(-)
---
base-commit: fb4327106e5250ee360d0d8b056c1eef7eeb9a98
change-id: 20230803-dt-header-cleanups-for-soc-cf95dbe606bd

Best regards,
-- 
Rob Herring <robh@kernel.org>

