Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB92D1FF1
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 02:26:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqjFh5QMJzDqcJ
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 12:26:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=cE2ZfwXb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=i9zSxN7T; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqjFQ1x78zDqb9
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 12:26:33 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5467D5C0163;
 Mon,  7 Dec 2020 20:26:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 07 Dec 2020 20:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=hZfUYNzWks7sMD7swrLWpVN+8Y
 yq1wkFBcKSEXJGg+A=; b=cE2ZfwXblWVIgt3yUG94/+D/hn/KKfNN8KkkzEVuvr
 tJl84lq8j9ErBzN/Bje/ROJjDD7FfKc90s/NIa4RJBWLWa5M6yXSslMpxu/Ak3BM
 uEPtsA1aC+1R6CA1EOU0e0S1FsnnNeeM/3Ji0V/O1Qz65oStTLaxUgFg9qgBMVYW
 sW08JNmblYciAJndgggF1jW2ZV39WU7fKy/EhPe7vfCWm8ZkVqa0qM+z3XgDqFrN
 hCin4xJCfkFYc5LZ5iPxGHqfQV/EKOViASUqSqYf96ORzd1yhDe2FFj8HKz/d/RL
 iEtoJiDwSRmwzEs3COQxQeQM3e7kdP/1ju8o9H7Vu2Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hZfUYNzWks7sMD7sw
 rLWpVN+8Yyq1wkFBcKSEXJGg+A=; b=i9zSxN7TlwzVy5DKhln78ONxGUsbHUz4A
 2Ae8fyadFUPUrXUF08kSQ3G1iPAZXfpEkukTKZeKYfjwDDa04d5NeHcDCGMnYRmu
 jud1fQ6V9xgEGHCwAZ7aV67rRFMD/f07mR13uNszuMSb4BHQ3a8ztAvnVvXO95uR
 hhXfIkhTAsU8biPWESvPVN6cGEygXv8lkAUqPPHnv+cZMF9pzuO3hHmwrXOz36MS
 1OQwdPHHDJxFmDqot/5Op2vM6FO6eAE2EG8Bmh1FLq/9WDCskXvaPlccGhi5mFSF
 q3qE0G/O/BayQn6BmKRlOGyQR4oOzMNDkxecRu3j07K4FRggjVc1Q==
X-ME-Sender: <xms:Q9bOXx9OTp6eTR1UMQlHjpLjfU2UHZKiwWIwf3QhLEIV87J05mUquw>
 <xme:Q9bOX1s5EfDKnWdrY_L4HQSNxaQSqmHwIlxJ7j8mFee8cD8_N8aEmatqan7FSXtat
 DMhMh7faEySP1R-AA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejhedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepieetheduveelhfdvvdejleeuhfelteevhe
 ffgfeitdefgeekjeefieevgfehhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
 ucfkphepvddtfedrheejrddvtdekrddugeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Q9bOX_CFIXK3xNU27Y63aco7jJbHQ6n4YxM17T_MJn8f1xgWjbmdng>
 <xmx:Q9bOX1cTv5SnvLVjO-BaqvuQURAOWFrwD7-Jad2amJa6NZWwId5AUw>
 <xmx:Q9bOX2MqM4OYnQ0mp49qUqX0IbAjMZY-goRoFWcMQDAD4r8OCs_U5g>
 <xmx:RdbOX1fQdyb2V83SLxnNd5XgoQkZ5Kk8AqdrXBAW6FAPE_0vPZhlPw>
Received: from localhost.localdomain (203-57-208-146.dyn.iinet.net.au
 [203.57.208.146])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7CDF108005C;
 Mon,  7 Dec 2020 20:26:23 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v5 0/6] mmc: sdhci-of-aspeed: Expose phase delay tuning
Date: Tue,  8 Dec 2020 11:56:09 +1030
Message-Id: <20201208012615.2717412-1-andrew@aj.id.au>
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

v5 fixes some build issues identified by the kernel test robot.

v4 can be found here:

https://lore.kernel.org/linux-mmc/20201207142556.2045481-1-andrew@aj.id.au/

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
 drivers/mmc/core/host.c                      |  44 ++++
 drivers/mmc/host/Kconfig                     |  14 ++
 drivers/mmc/host/Makefile                    |   1 +
 drivers/mmc/host/sdhci-of-aspeed-test.c      | 100 ++++++++
 drivers/mmc/host/sdhci-of-aspeed.c           | 251 ++++++++++++++++++-
 include/linux/mmc/host.h                     |  17 ++
 8 files changed, 426 insertions(+), 11 deletions(-)
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed-test.c

-- 
2.27.0

