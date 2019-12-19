Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8DC13513D
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 03:05:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tTwq20cwzDqWg
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 13:05:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=mafeng.ma@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dhhV47j1zDqlY
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Dec 2019 17:25:42 +1100 (AEDT)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6F5BBCEFE6931D3BD258;
 Thu, 19 Dec 2019 14:09:48 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 19 Dec 2019 14:09:40 +0800
From: Ma Feng <mafeng.ma@huawei.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rrichter@marvell.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] EDAC/aspeed: Remove unneeded semicolon
Date: Thu, 19 Dec 2019 14:10:35 +0800
Message-ID: <1576735835-114453-1-git-send-email-mafeng.ma@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 09 Jan 2020 13:05:38 +1100
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
Cc: linux-kernel@vger.kernel.org, Ma Feng <mafeng.ma@huawei.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fixes coccicheck warning:

drivers/edac/aspeed_edac.c:246:2-3: Unneeded semicolon
drivers/edac/aspeed_edac.c:255:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
---
 drivers/edac/aspeed_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 09a9e3d..b194658b 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -243,7 +243,7 @@ static int init_csrows(struct mem_ctl_info *mci)
 	if (!np) {
 		dev_err(mci->pdev, "dt: missing /memory node\n");
 		return -ENODEV;
-	};
+	}

 	rc = of_address_to_resource(np, 0, &r);

@@ -252,7 +252,7 @@ static int init_csrows(struct mem_ctl_info *mci)
 	if (rc) {
 		dev_err(mci->pdev, "dt: failed requesting resource for /memory node\n");
 		return rc;
-	};
+	}

 	dev_dbg(mci->pdev, "dt: /memory node resources: first page r.start=0x%x, resource_size=0x%x, PAGE_SHIFT macro=0x%x\n",
 		r.start, resource_size(&r), PAGE_SHIFT);
--
2.6.2

