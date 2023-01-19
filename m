Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1139677465
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:30:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bGC413mz3bVD
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:30:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Missing IP4: 74.116.198.153) smtp.mailfrom=zte.com.cn (client-ip=58.251.27.85; helo=mxct.zte.com.cn; envelope-from=ye.xingchen@zte.com.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 380 seconds by postgrey-1.36 at boromir; Thu, 19 Jan 2023 18:44:33 AEDT
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyF5F5CSzz3bVf
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 18:44:33 +1100 (AEDT)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4NyDxs2Y13z1Ds6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 15:38:09 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4NyDxR3RnvzBRK7Y
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 15:37:47 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxus.zte.com.cn (FangMail) with ESMTPS id 4NyDwl3gV0z9tyJc
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 15:37:11 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NyDwW38z3z6FK2Q;
	Thu, 19 Jan 2023 15:36:59 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 30J7ak41021725;
	Thu, 19 Jan 2023 15:36:47 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Thu, 19 Jan 2023 15:36:49 +0800 (CST)
Date: Thu, 19 Jan 2023 15:36:49 +0800 (CST)
X-Zmail-TransId: 2af963c8f31135184eee
X-Mailer: Zmail v1.0
Message-ID: <202301191536493046780@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <herbert@gondor.apana.org.au>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGNyeXB0bzogYXNwZWVkIC0gVXNlIGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 30J7ak41021725
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 63C8F360.000 by FangMail milter!
X-FangMail-Envelope: 1674113889/4NyDxs2Y13z1Ds6/63C8F360.000/10.35.20.121/[10.35.20.121]/mxde.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63C8F360.000/4NyDxs2Y13z1Ds6
X-Mailman-Approved-At: Mon, 23 Jan 2023 14:29:55 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, neal_liu@aspeedtech.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/crypto/aspeed/aspeed-hace.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-hace.c b/drivers/crypto/aspeed/aspeed-hace.c
index 656cb92c8bb6..d2871e1de9c2 100644
--- a/drivers/crypto/aspeed/aspeed-hace.c
+++ b/drivers/crypto/aspeed/aspeed-hace.c
@@ -99,7 +99,6 @@ static int aspeed_hace_probe(struct platform_device *pdev)
 	const struct of_device_id *hace_dev_id;
 	struct aspeed_engine_hash *hash_engine;
 	struct aspeed_hace_dev *hace_dev;
-	struct resource *res;
 	int rc;

 	hace_dev = devm_kzalloc(&pdev->dev, sizeof(struct aspeed_hace_dev),
@@ -118,11 +117,9 @@ static int aspeed_hace_probe(struct platform_device *pdev)
 	hash_engine = &hace_dev->hash_engine;
 	crypto_engine = &hace_dev->crypto_engine;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
 	platform_set_drvdata(pdev, hace_dev);

-	hace_dev->regs = devm_ioremap_resource(&pdev->dev, res);
+	hace_dev->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(hace_dev->regs))
 		return PTR_ERR(hace_dev->regs);

-- 
2.25.1
