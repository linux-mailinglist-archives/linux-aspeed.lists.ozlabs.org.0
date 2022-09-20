Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6965BDAD0
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Sep 2022 05:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWn0G1fr7z309f
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Sep 2022 13:22:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWn0B4gVqz2yX3
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Sep 2022 13:21:59 +1000 (AEST)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MWmth1N0gzlW4N;
	Tue, 20 Sep 2022 11:17:16 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 20 Sep
 2022 11:21:21 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <neal_liu@aspeedtech.com>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<johnny_huang@aspeedtech.com>, <dphadke@linux.microsoft.com>
Subject: [PATCH -next] crypto: aspeed - Fix check for platform_get_irq() errors
Date: Tue, 20 Sep 2022 11:21:18 +0800
Message-ID: <20220920032118.6440-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: linux-arm-kernel@lists.infradead.org, YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The platform_get_irq() function returns negative on error and
positive non-zero values on success. It never returns zero, but if it
did then treat that as a success.

Also remove redundant dev_err() print as platform_get_irq() already
prints an error.

Fixes: 108713a713c7 ("crypto: aspeed - Add HACE hash driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/aspeed/aspeed-hace.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-hace.c b/drivers/crypto/aspeed/aspeed-hace.c
index 3f880aafb6a2..f7f1d33defb1 100644
--- a/drivers/crypto/aspeed/aspeed-hace.c
+++ b/drivers/crypto/aspeed/aspeed-hace.c
@@ -130,10 +130,8 @@ static int aspeed_hace_probe(struct platform_device *pdev)
 
 	/* Get irq number and register it */
 	hace_dev->irq = platform_get_irq(pdev, 0);
-	if (!hace_dev->irq) {
-		dev_err(&pdev->dev, "Failed to get interrupt\n");
+	if (hace_dev->irq < 0)
 		return -ENXIO;
-	}
 
 	rc = devm_request_irq(&pdev->dev, hace_dev->irq, aspeed_hace_irq, 0,
 			      dev_name(&pdev->dev), hace_dev);
-- 
2.17.1

