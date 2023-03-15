Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A166BA761
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Mar 2023 06:50:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbzyP6tKtz3cdB
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Mar 2023 16:50:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.118; helo=out30-118.freemail.mail.aliyun.com; envelope-from=yang.lee@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbzyH1BXNz3c6v
	for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Mar 2023 16:50:29 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0Vduqdhc_1678859423;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vduqdhc_1678859423)
          by smtp.aliyun-inc.com;
          Wed, 15 Mar 2023 13:50:24 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: ulf.hansson@linaro.org
Subject: [PATCH -next] mmc: sdhci-of-aspeed: Use devm_platform_get_and_ioremap_resource()
Date: Wed, 15 Mar 2023 13:50:23 +0800
Message-Id: <20230315055023.61779-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: oel@jms.id.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

According to commit 890cc39a8799 ("drivers: provide
devm_platform_get_and_ioremap_resource()"), convert
platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index ba6677bf7372..25b4073f698b 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -547,8 +547,7 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	sdc->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	sdc->regs = devm_ioremap_resource(&pdev->dev, sdc->res);
+	sdc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &sdc->res);
 	if (IS_ERR(sdc->regs)) {
 		ret = PTR_ERR(sdc->regs);
 		goto err_clk;
-- 
2.20.1.7.g153144c

