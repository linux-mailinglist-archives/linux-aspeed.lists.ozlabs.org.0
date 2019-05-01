Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DC610F0F
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 00:38:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vYGL29YpzDqMy
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 08:38:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=00246b06a9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="j8s/grND"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vYGC5151zDqN0
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 08:38:42 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x41MYheB004397
 for <linux-aspeed@lists.ozlabs.org>; Wed, 1 May 2019 15:38:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=iIazPrlt7tOWnA4QOJ1iZhFr3bvbXxhMyXLj+/1AyVo=;
 b=j8s/grND7dbtTkbGg4Oidn9G/lEmLB02oSc61IkhyEn3fGtswvwxqTDQrbR3yMYO++fH
 GKRJBJ8SlfhOrFRRYkZFht5+pf4oQOPYmsukdQOAxG3SW26cY5DXPhTBf76pX0bYx/3A
 0JmjbboaRFUQr6QNa+Ecx4SUhq2FKPjo+cA= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2s7d0q1mhm-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Wed, 01 May 2019 15:38:40 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Wed, 1 May 2019 15:38:38 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 8A7AAD5ED26F; Wed,  1 May 2019 15:38:38 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH] misc: aspeed-lpc-ctrl: Correct return values
Date: Wed, 1 May 2019 15:38:36 -0700
Message-ID: <20190501223836.1670096-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-01_10:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
Cc: sdasari@fb.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Corrected some of return values with appropriate meanings.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 drivers/misc/aspeed-lpc-ctrl.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
index 332210e06e98..97ae341109d5 100644
--- a/drivers/misc/aspeed-lpc-ctrl.c
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -68,7 +68,6 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
 		unsigned long param)
 {
 	struct aspeed_lpc_ctrl *lpc_ctrl = file_aspeed_lpc_ctrl(file);
-	struct device *dev = file->private_data;
 	void __user *p = (void __user *)param;
 	struct aspeed_lpc_ctrl_mapping map;
 	u32 addr;
@@ -93,8 +92,8 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
 
 		/* If memory-region is not described in device tree */
 		if (!lpc_ctrl->mem_size) {
-			dev_err(dev, "Didn't find reserved memory\n");
-			return -EINVAL;
+			pr_err("aspeed_lpc_ctrl: ioctl: Didn't find reserved memory\n");
+			return -ENXIO;
 		}
 
 		map.size = lpc_ctrl->mem_size;
@@ -134,16 +133,16 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
 
 		if (map.window_type == ASPEED_LPC_CTRL_WINDOW_FLASH) {
 			if (!lpc_ctrl->pnor_size) {
-				dev_err(dev, "Didn't find host pnor flash\n");
-				return -EINVAL;
+				pr_err("aspeed_lpc_ctrl: ioctl: Didn't find host pnor flash\n");
+				return -ENXIO;
 			}
 			addr = lpc_ctrl->pnor_base;
 			size = lpc_ctrl->pnor_size;
 		} else if (map.window_type == ASPEED_LPC_CTRL_WINDOW_MEMORY) {
 			/* If memory-region is not described in device tree */
 			if (!lpc_ctrl->mem_size) {
-				dev_err(dev, "Didn't find reserved memory\n");
-				return -EINVAL;
+				pr_err("aspeed_lpc_ctrl: ioctl: Didn't find reserved memory\n");
+				return -ENXIO;
 			}
 			addr = lpc_ctrl->mem_base;
 			size = lpc_ctrl->mem_size;
@@ -239,7 +238,7 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 		of_node_put(node);
 		if (rc) {
 			dev_err(dev, "Couldn't address to resource for reserved memory\n");
-			return -ENOMEM;
+			return -ENXIO;
 		}
 
 		lpc_ctrl->mem_size = resource_size(&resm);
-- 
2.17.1

