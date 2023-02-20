Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938969CB44
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 13:44:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PL2Dk1J3mz3c9r
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 23:44:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=yang.lee@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 303 seconds by postgrey-1.36 at boromir; Mon, 20 Feb 2023 23:44:33 AEDT
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PL2Dd2bZZz3bh6
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 23:44:32 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0Vc6Ws8T_1676896763;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vc6Ws8T_1676896763)
          by smtp.aliyun-inc.com;
          Mon, 20 Feb 2023 20:39:23 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: davem@davemloft.net
Subject: [PATCH -next] crypto: Use devm_platform_ioremap_resource()
Date: Mon, 20 Feb 2023 20:39:21 +0800
Message-Id: <20230220123921.7191-1-yang.lee@linux.alibaba.com>
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
Cc: herbert@gondor.apana.org.au, linux-aspeed@lists.ozlabs.org, neal_liu@aspeedtech.com, linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to Use devm_platform_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/crypto/aspeed/aspeed-acry.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
index 1f77ebd73489..857a7a222922 100644
--- a/drivers/crypto/aspeed/aspeed-acry.c
+++ b/drivers/crypto/aspeed/aspeed-acry.c
@@ -712,7 +712,6 @@ static int aspeed_acry_probe(struct platform_device *pdev)
 {
 	struct aspeed_acry_dev *acry_dev;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int rc;
 
 	acry_dev = devm_kzalloc(dev, sizeof(struct aspeed_acry_dev),
@@ -724,13 +723,11 @@ static int aspeed_acry_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, acry_dev);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	acry_dev->regs = devm_ioremap_resource(dev, res);
+	acry_dev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(acry_dev->regs))
 		return PTR_ERR(acry_dev->regs);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	acry_dev->acry_sram = devm_ioremap_resource(dev, res);
+	acry_dev->acry_sram = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(acry_dev->acry_sram))
 		return PTR_ERR(acry_dev->acry_sram);
 
-- 
2.20.1.7.g153144c

