Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C592D138B
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Dec 2020 15:26:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqQcH0LZZzDqWf
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 01:26:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=JUrEe5rg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=MoAPougR; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqQbW45j0zDqW7
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 01:26:13 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DD37A5C012B;
 Mon,  7 Dec 2020 09:26:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 07 Dec 2020 09:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=+JKVbKtQK/Yw154DgEA/vvstAw
 x3uCRVJdxZ6QvqULE=; b=JUrEe5rgN8zH1Gmmo6hJ2FQYyIHiNWbOrl6cSMUAYe
 yb04A2Q5FMHTVgW0FEeBGRWY4R4TOV7ib003/DvCLWE3bkww6T4Sn2a+iih+iJc8
 7hzbcc3mzWrBRi66cb8K3DrQ5td1I4iek72W0o4DifgnFbVVFpfbYhZgEMeOIknk
 Hxf/8RYik0vUZQ2L89ii5gTP0GZnR2U7HXMbxjvrl9+tycZDraNLiTl8pzaS5FzQ
 zLeqthDxFJ0dYL0Fuih/beAfDTEoqQB+NsxNDhwYwJFlU3ECGiiBgwFISfzW90fF
 7sjoZ1ymXREtS09RlntLidFbbVsZVIP6tiP57ac1NG0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+JKVbKtQK/Yw154Dg
 EA/vvstAwx3uCRVJdxZ6QvqULE=; b=MoAPougRjMheTLjHEFak2mfQSVuIZ9W0H
 FE/h/v9xUnEdYQhDKOu0N0CRoxnhGd+yqUO7NdaI6/FAcocIkOKCsX6oc4oY3ea9
 PvvBSU4uwcosOm/O42NoSNWW78uzW6g93tuIV3QchA6rxLV/fqiIWGFw1k8lbQlR
 vaC27o343cPi92Dd3nJM4FCoI/TJFiQKLOATnbbeZtdfQ5FlhhnBkDLTPz5Gxmt+
 7e/f/1HE1upltKSTJ0JwENGIP754/D1sNCywC5cmPWNBDLlslUEFsAyf09f/u8du
 zBurpEFPwua5RNtPEHcOkm9hRMTxPXif1VRUGL3TZjyyp9xzP9tFw==
X-ME-Sender: <xms:gDvOX8SGkvS_-dJAM6G_d1sOMruJdqdqELNp3_axlIspQL7B_S-3cA>
 <xme:gDvOX5yVHUSAGRPvzSD4P_0s3N3ajw2wH-uIv_QhIwEg43StZ2PMhs3V3JHeS-nGD
 HiUkLV6yWr-PlMzhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepieetheduveelhfdvvdejleeuhfelteevhe
 ffgfeitdefgeekjeefieevgfehhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
 ucfkphepvddtfedrheejrddvtdekrddugeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:gDvOX50zM8CzP5QFD-Usr8TVjQNwVWH8uRRfWgsU3Oxymvsgk7vi6w>
 <xmx:gDvOXwB0y9XoSPnuqQG32pZ4Oeb69yoHBzrtE0AF_m1gXgdWxulopw>
 <xmx:gDvOX1goHP47OvHA6UKXG0x3PzNPrTGkemotiu4fXBWG2zBaoGoCkg>
 <xmx:gTvOX9i-x8PWX7Mkq12OZVHeJ3fqWLcXPMamDq5Av_lpFTPXfCa2Tg>
Received: from localhost.localdomain (203-57-208-146.dyn.iinet.net.au
 [203.57.208.146])
 by mail.messagingengine.com (Postfix) with ESMTPA id 38BDC108006B;
 Mon,  7 Dec 2020 09:26:03 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v4 0/6] mmc: sdhci-of-aspeed: Expose phase delay tuning
Date: Tue,  8 Dec 2020 00:55:50 +1030
Message-Id: <20201207142556.2045481-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series implements support for the MMC core clk-phase-* devicetree bindings
in the Aspeed SD/eMMC driver. The relevant register was exposed on the AST2600
and is present for both the SD/MMC controller and the dedicated eMMC
controller.

There are a couple of prominent changes from v3 in v4 of the series:

1. The devicetree phase parsing helper has been moved to the MMC core
2. KUnit tests have been added for the phase calculations in the ASPEED driver

Other than that I've updated MAINTAINERS to add myself as the maintainer of the
driver.

v3 can be found here:

https://lore.kernel.org/linux-mmc/20201123063004.337345-1-andrew@aj.id.au/

The series has had light testing on an AST2600-based platform which requires
180deg of input and output clock phase correction at HS200, as well as some
synthetic testing under qemu and KUnit.

Please review!

Cheers,

Andrew

Andrew Jeffery (6):
  mmc: core: Add helper for parsing clock phase properties
  mmc: sdhci-of-aspeed: Expose clock phase controls
  mmc: sdhci-of-aspeed: Add AST2600 bus clock support
  mmc: sdhci-of-aspeed: Add KUnit tests for phase calculations
  MAINTAINERS: Add entry for the ASPEED SD/MMC driver
  ARM: dts: rainier: Add eMMC clock phase compensation

 MAINTAINERS                                  |   9 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |   1 +
 drivers/mmc/core/host.c                      |  43 ++++
 drivers/mmc/host/Kconfig                     |  14 ++
 drivers/mmc/host/Makefile                    |   1 +
 drivers/mmc/host/sdhci-of-aspeed-test.c      | 100 ++++++++
 drivers/mmc/host/sdhci-of-aspeed.c           | 251 ++++++++++++++++++-
 include/linux/mmc/host.h                     |  17 ++
 8 files changed, 425 insertions(+), 11 deletions(-)
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed-test.c

-- 
2.27.0

