Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF6D551231
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 10:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRMlX0KJdz3c7H
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 18:10:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhengbin13@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP2sd1Db7z3000
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jun 2022 23:22:42 +1000 (AEST)
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LP2pY36XlzhXZK;
	Thu, 16 Jun 2022 21:20:05 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemi500015.china.huawei.com
 (7.221.188.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 16 Jun
 2022 21:22:04 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <neal_liu@aspeedtech.com>, <balbi@kernel.org>,
	<gregkh@linuxfoundation.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<linux-aspeed@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] usb: gadget: aspeed_udc: fix missing spin_unlock_irqrestore in ast_udc_ep_queue
Date: Thu, 16 Jun 2022 21:35:08 +0800
Message-ID: <20220616133508.3655864-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 20 Jun 2022 18:06:19 +1000
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
Cc: zhengbin13@huawei.com, gaochao49@huawei.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

ast_udc_ep_queue misses spin_unlock_irqrestore in an error path,
this patch fixes that.

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 1fc15228ff15..6c91f7f288a2 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -665,7 +665,8 @@ static int ast_udc_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
 	if (ep->ep.desc == NULL) {
 		if ((req->req.dma % 4) != 0) {
 			dev_warn(dev, "EP0 req dma alignment error\n");
-			return -ESHUTDOWN;
+			rc = -ESHUTDOWN;
+			goto end;
 		}

 		ast_udc_ep0_queue(ep, req);
--
2.31.1

