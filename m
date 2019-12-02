Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEAD10E51D
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 05:42:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RCC44fq2zDqRm
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 15:42:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Iwzb7B00"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="xycrquaq"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RCBn4z1TzDqRm
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Dec 2019 15:42:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F358822486;
 Sun,  1 Dec 2019 23:42:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 01 Dec 2019 23:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=IKA+jd7OY4n+Q/wgyh1srRVYoa
 AqL85S33bS34sBvP4=; b=Iwzb7B00DBvxx5xICJBKsN+3qEJlfBN+Zgpig4FU9P
 hkKMYOJdA8et+ruDutI8Bd3apgwtu1++g8Pt4jjkulMM02wUmGeKALE121z+uZSf
 xfriG05wVFCd+ibtIzFMk2pSf4fkljG9tmBgunaWd22Hpydvxtavac0Pid6c7Dgk
 21vQMqcvGmgqapZzLmyyJa5pFHJ2esknxI1Rgh8/WYgnkA3b85ZspUsSoJ1VGHAs
 ZpVZa+50IBTy+d7P8c1+mL5tnL/W2GnLxoS7asJDDhLrcFHF35EsYQRxg439noZ+
 Xauy9Q7zy1nsF6cTTCtUX+ZgJw1cOhNFwbJwFpJQqv0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IKA+jd7OY4n+Q/wgy
 h1srRVYoaAqL85S33bS34sBvP4=; b=xycrquaqo9dcSLsNomUgVK2uQVQeO/2FZ
 wnnzuT2G02A2ShIyAu1UXYVhHBzv+ssEqCQkJQ+Jn+I0ZGw+Cu2mUQe1CRifyxM/
 HdjmZ7BlMOM1mSGXf0JHho7LBA9r2zYXmiM/dz/WtlFJWp9rW1xgL06rTKWeJe+c
 +c8A0S2kXlZGhT8rrWKCRJ1y9RkXbAZDlCgH4NOTi11qElKhNeGrP4ry+XcB5MTJ
 V0LG/593yYCypPTvI4Ww3htGaDPun74z9Imes59vA9o1gBFjsGghI6Youu3Qkps5
 sh3c6UzUzk6wEAkwgVWpAj4PKlC9H3O6W4hPqjk9VoUbGJgacCG8w==
X-ME-Sender: <xms:G5bkXTkVZfywS2coZmyn3GmSIyxFmeqrMXcq_JI0qg6vsbdHVqEBVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejgedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecukfhppeduudekrddvuddurdelvddrudefnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:G5bkXShp0iQfF5ca8XFVQcyEVgGIDP2hlUR2oNADDSoCRqnEVjHm7A>
 <xmx:G5bkXZZMExfNIxdpAyB4nYcN45r9BNgjxOYbbw6XfLnC6upt-hrxOg>
 <xmx:G5bkXexf9CDOKyD_kT3RdFxrKUPTWfHSZ0Q7nB_h2-6dNFFNfkj9fg>
 <xmx:HJbkXQfIQrLvIOMYEnx00eHSnNJ8deaxhD7Sn2wIZUaLEBGb-W0JyQ>
Received: from localhost.localdomain (unknown [118.211.92.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6970530600BD;
 Sun,  1 Dec 2019 23:42:01 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH] soc: aspeed: Fail probe of lpc-ctrl if reserved memory is not
 aligned
Date: Mon,  2 Dec 2019 15:13:47 +1030
Message-Id: <20191202044347.14508-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Alignment is a hardware constraint of the LPC2AHB bridge, and misaligned
reserved memory will present as corrupted data.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index 01ed21e8bfee..fec17948cda0 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/log2.h>
 #include <linux/mfd/syscon.h>
 #include <linux/miscdevice.h>
 #include <linux/mm.h>
@@ -241,6 +242,18 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 
 		lpc_ctrl->mem_size = resource_size(&resm);
 		lpc_ctrl->mem_base = resm.start;
+
+		if (!is_power_of_2(lpc_ctrl->mem_size)) {
+			dev_err(dev, "Reserved memory size must be a power of 2, got %zu\n",
+			       (size_t)lpc_ctrl->mem_size);
+			return -EINVAL;
+		}
+
+		if (!IS_ALIGNED(lpc_ctrl->mem_base, lpc_ctrl->mem_size)) {
+			dev_err(dev, "Reserved memory must be naturally aligned for size %zu\n",
+			       (size_t)lpc_ctrl->mem_size);
+			return -EINVAL;
+		}
 	}
 
 	lpc_ctrl->regmap = syscon_node_to_regmap(
-- 
2.20.1

