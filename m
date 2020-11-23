Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7002C0017
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Nov 2020 07:31:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cfcjk4TbZzDqMx
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Nov 2020 17:31:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=VGt0OtlE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=irMEwFn/; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfcjG1DBMzDqMX
 for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Nov 2020 17:30:41 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B129E5C00E0;
 Mon, 23 Nov 2020 01:30:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 23 Nov 2020 01:30:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=VUpiAH9rXjm/ZsT72ET9GIyEmE
 3rMp0L6k52KA3xg/A=; b=VGt0OtlEce5bdu74DlG7Inr70Wp27gu3H53cs+DpMD
 +e9x/i3fASf+Gk46O4aYU4B9cpkXybzOMUErzv+WvH3cGDJ8PonKnV11Eiv4zI2J
 4rOzOToX9SemuFXGxYKgbdEQG54A7uPuZYveP7oaDpMVMeOY3lgI79mISC8i43Xo
 YviYs62iyPCYyMlHYPPvX8bPq5N5NDLQ6CQNT5H65YSuJIdt1qAw2kalvcwPjOxs
 3fmkkgATPEl5G5EdcaYkoy/CEpuwkNyWqVKW5G/Duq1K7xg8tCYmRAZMoGiIG5O0
 CaXDUClZhkageAN7fzYNNcTiXaAXYcUDNPiqWTD57Z0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VUpiAH9rXjm/ZsT72
 ET9GIyEmE3rMp0L6k52KA3xg/A=; b=irMEwFn/2EyvFECDbRHaPyFNMJsSV1Lcx
 AAA/fuXafTQfPl+NZshialdEUxt0vAfOoNSAYToffbBGebHCYV5RXK9nrrTCfVR7
 4uamjJoV+ZE4psc0ZsJ9SpZRmBna7BtEb36soDZHEDUlD0J1IGQYqn+y5iwhRiBd
 +DsN4sgY4rBQSWExS4QoAen6Obf3O9S1Y4WhNGDEDB/Sfmxdnt6iK1jiTyjtxSdC
 5NhKPxBM17HmWTpICHk4TNWsjIcqMiu/JGxaW/U0JRouL9LJ4yoYAQJUAwlCjXzp
 JplCHJqBYQtytxhJkXc1ej680MAQj4Hv/35nvE9dJvWwhDp7Sjn4Q==
X-ME-Sender: <xms:DFe7Xxdh8s9XdhIsjaRR640RZ2pE6ixHtWmym2KR09gyRu4sFftaxg>
 <xme:DFe7X_McmAhFIb7QwejoY3vh4ar6OUREpwUJRE05BIavqb7_cy6vcoBFYW74GBqCg
 8oB8D_8ormKFIFwbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeghedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepieetheduveelhfdvvdejleeuhfelteevhe
 ffgfeitdefgeekjeefieevgfehhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
 ucfkphepvddtfedrheejrddvtdekrddugeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:DFe7X6j9KrReJN4pSm6fWjJ4qDcf-LxuT6S5gH-BumgP9w8lKIqsiA>
 <xmx:DFe7X69c9iFXuM2BvTCGQtfyoxzpgksqnoqoZ6Zwk2cQeRbuXGe0mA>
 <xmx:DFe7X9t0wjzBJouKTnzXuAZU0HdSX4uWFw0CDlIEgv9OYMZs488ZNg>
 <xmx:DVe7X-_JXo-I77eWR2qDePxgbQAqhGfTvbPmvkFJHgjBEhLjAX0tEA>
Received: from localhost.localdomain (203-57-208-146.dyn.iinet.net.au
 [203.57.208.146])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE59B3064AAA;
 Mon, 23 Nov 2020 01:30:32 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v3 0/3] mmc: sdhci-of-aspeed: Expose phase delay tuning
Date: Mon, 23 Nov 2020 17:00:01 +1030
Message-Id: <20201123063004.337345-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series implements support for the MMC core clk-phase-* devicetree bindings
in the Aspeed SD/eMMC driver. The relevant register was introduced on the
AST2600 and is present for both the SD/MMC controller and the dedicated eMMC
controller.

Previously, v1 and v2 of the series implemented custom bindings. Thanks to Ulf
for pointing out that this functionality already existed in the core bindings.
For historical reference, v2 can be found here:

https://lore.kernel.org/linux-arm-kernel/20200911074452.3148259-1-andrew@aj.id.au/

The series has had light testing on an AST2600-based platform which requires
180deg of input and output clock phase correction at HS200, as well as some
synthetic testing under qemu.

Please review!

Cheers,

Andrew

Andrew Jeffery (3):
  mmc: sdhci-of-aspeed: Expose phase delay tuning
  mmc: sdhci-of-aspeed: Add AST2600 bus clock support
  ARM: dts: rainier: Add eMMC clock phase compensation

 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |   1 +
 drivers/mmc/host/sdhci-of-aspeed.c           | 310 ++++++++++++++++++-
 2 files changed, 300 insertions(+), 11 deletions(-)

-- 
2.27.0

