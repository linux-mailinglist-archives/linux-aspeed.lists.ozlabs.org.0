Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1F996F471
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 14:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0bTS5rS9z30J8
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 22:42:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725366911;
	cv=none; b=Vk1urs3x0nF/d4z10xqgkHDFQOjO589Hhs3y2Z8k6OcbfuhAo6M8fh9tV6hzziHP6EbhAdBi9Nonc+B/XNOLNSyLR4SOjjtteQxt5OAj1apo5ZRe8gah6YGaXr6jwI1xvuehSwlYSfXAW9zwLWKWpXRzyMBupd7LQPoJivXXB8OEXe3ERq5dngxLyumWC8CTiGYtVsWVI8gkFWa6du0MtDLBrZ9WVhcqNtyw571xsUCsSza/OUx+mnuCbXi0GBudrx4dh4DsgzdCgwsscVtulyLkITzDEV+k1D6xcQKjTKePcBJgLcBZ7ElNy5qA8s1EwpNGbOvDF4GIEdPxYlLv7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725366911; c=relaxed/relaxed;
	bh=GHEoScZF8S/j9jUjNfU0PDFLUR0xitGOh3TxFw6WR0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=on/x1G3CRuplPAnhY38oQXmu2t75yY1zcndGPOz7E4Q7HqqO0L9iOykKbLZT7s553gNVgvTgfSynUmJLmx7gnB0gDkgZu7doz3yJ4pa6cmyEYnFv+AV1cCFjRwzp5aLNuF9WCuMbVdc2Rj+vzW6Vmx+ooGx9tSHpAsVeYPyN7QZBRKRTVSjMWTepi3UbcKReEZU2AYu20YE4dS3RpGnOXj7LB05eQzCUHPWCzXBXjWozWeSR7v7u07OwqQBbqM2pzMEyQqzHM2E++w2B1UsACbHD7KY1DSgjebygM9zaQDTJ4msIwj41gjX5/eZKbdcaZ1nVk5JShtHdQgaPtbvC2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass (client-ip=111.22.67.135; helo=cmccmta2.chinamobile.com; envelope-from=tangbin@cmss.chinamobile.com; receiver=lists.ozlabs.org) smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cmss.chinamobile.com (client-ip=111.22.67.135; helo=cmccmta2.chinamobile.com; envelope-from=tangbin@cmss.chinamobile.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 182 seconds by postgrey-1.37 at boromir; Tue, 03 Sep 2024 22:35:10 AEST
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WylSt2Yjmz2xbC
	for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Sep 2024 22:35:10 +1000 (AEST)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee766d701c22c9-dd2cf;
	Tue, 03 Sep 2024 20:32:04 +0800 (CST)
X-RM-TRANSID: 2ee766d701c22c9-dd2cf
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea66d701c1cbf-e51bd;
	Tue, 03 Sep 2024 20:32:04 +0800 (CST)
X-RM-TRANSID: 2eea66d701c1cbf-e51bd
From: tangbin <tangbin@cmss.chinamobile.com>
To: neal_liu@aspeedtech.com,
	gregkh@linuxfoundation.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH] usb: gadget: aspeed_udc: use the defined variable to simplify code
Date: Tue,  3 Sep 2024 20:31:52 +0800
Message-Id: <20240903123152.6980-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Sep 2024 22:42:03 +1000
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
Cc: linux-usb@vger.kernel.org, tangbin <tangbin@cmss.chinamobile.com>, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use the defined variable 'dev' to make the code cleaner.

Signed-off-by: tangbin <tangbin@cmss.chinamobile.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index f4781e611..702d4806c 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1479,7 +1479,7 @@ static int ast_udc_probe(struct platform_device *pdev)
 	struct ast_udc_dev *udc;
 	int rc;
 
-	udc = devm_kzalloc(&pdev->dev, sizeof(struct ast_udc_dev), GFP_KERNEL);
+	udc = devm_kzalloc(dev, sizeof(struct ast_udc_dev), GFP_KERNEL);
 	if (!udc)
 		return -ENOMEM;
 
@@ -1494,32 +1494,32 @@ static int ast_udc_probe(struct platform_device *pdev)
 
 	udc->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(udc->reg)) {
-		dev_err(&pdev->dev, "Failed to map resources\n");
+		dev_err(dev, "Failed to map resources\n");
 		return PTR_ERR(udc->reg);
 	}
 
 	platform_set_drvdata(pdev, udc);
 
-	udc->clk = devm_clk_get(&pdev->dev, NULL);
+	udc->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(udc->clk)) {
 		rc = PTR_ERR(udc->clk);
 		goto err;
 	}
 	rc = clk_prepare_enable(udc->clk);
 	if (rc) {
-		dev_err(&pdev->dev, "Failed to enable clock (0x%x)\n", rc);
+		dev_err(dev, "Failed to enable clock (0x%x)\n", rc);
 		goto err;
 	}
 
 	/* Check if we need to limit the HW to USB1 */
-	max_speed = usb_get_maximum_speed(&pdev->dev);
+	max_speed = usb_get_maximum_speed(dev);
 	if (max_speed != USB_SPEED_UNKNOWN && max_speed < USB_SPEED_HIGH)
 		udc->force_usb1 = true;
 
 	/*
 	 * Allocate DMA buffers for all EPs in one chunk
 	 */
-	udc->ep0_buf = dma_alloc_coherent(&pdev->dev,
+	udc->ep0_buf = dma_alloc_coherent(dev,
 					  AST_UDC_EP_DMA_SIZE *
 					  AST_UDC_NUM_ENDPOINTS,
 					  &udc->ep0_buf_dma, GFP_KERNEL);
@@ -1534,7 +1534,7 @@ static int ast_udc_probe(struct platform_device *pdev)
 	 */
 	udc->desc_mode = AST_UDC_DESC_MODE;
 
-	dev_info(&pdev->dev, "DMA %s\n", udc->desc_mode ?
+	dev_info(dev, "DMA %s\n", udc->desc_mode ?
 		 "descriptor mode" : "single mode");
 
 	INIT_LIST_HEAD(&udc->gadget.ep_list);
@@ -1556,26 +1556,26 @@ static int ast_udc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	rc = devm_request_irq(&pdev->dev, udc->irq, ast_udc_isr, 0,
+	rc = devm_request_irq(dev, udc->irq, ast_udc_isr, 0,
 			      KBUILD_MODNAME, udc);
 	if (rc) {
-		dev_err(&pdev->dev, "Failed to request interrupt\n");
+		dev_err(dev, "Failed to request interrupt\n");
 		goto err;
 	}
 
-	rc = usb_add_gadget_udc(&pdev->dev, &udc->gadget);
+	rc = usb_add_gadget_udc(dev, &udc->gadget);
 	if (rc) {
-		dev_err(&pdev->dev, "Failed to add gadget udc\n");
+		dev_err(dev, "Failed to add gadget udc\n");
 		goto err;
 	}
 
-	dev_info(&pdev->dev, "Initialized udc in USB%s mode\n",
+	dev_info(dev, "Initialized udc in USB%s mode\n",
 		 udc->force_usb1 ? "1" : "2");
 
 	return 0;
 
 err:
-	dev_err(&pdev->dev, "Failed to udc probe, rc:0x%x\n", rc);
+	dev_err(dev, "Failed to udc probe, rc:0x%x\n", rc);
 	ast_udc_remove(pdev);
 
 	return rc;
-- 
2.33.0



