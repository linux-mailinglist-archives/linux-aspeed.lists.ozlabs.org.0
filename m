Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30733F56DF
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 05:58:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtwLz73tvz2yLQ
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 13:58:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baidu.com (client-ip=111.202.115.85; helo=baidu.com;
 envelope-from=caihuoqing@baidu.com; receiver=<UNKNOWN>)
X-Greylist: delayed 2788 seconds by postgrey-1.36 at boromir;
 Mon, 23 Aug 2021 15:44:58 AEST
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GtLmW05jTz2xXn
 for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Aug 2021 15:44:49 +1000 (AEST)
Received: from BC-Mail-Ex18.internal.baidu.com (unknown [172.31.51.12])
 by Forcepoint Email with ESMTPS id DB02ED0727DB2C4EA62D;
 Mon, 23 Aug 2021 12:58:13 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex18.internal.baidu.com (172.31.51.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 23 Aug 2021 12:58:13 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 23 Aug 2021 12:58:13 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <balbi@kernel.org>, <gregkh@linuxfoundation.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>
Subject: [PATCH] usb: gadget: aspeed: Remove repeated verbose license text
Date: Mon, 23 Aug 2021 12:58:07 +0800
Message-ID: <20210823045807.49-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex19.internal.baidu.com (172.31.51.13) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Mailman-Approved-At: Tue, 24 Aug 2021 13:58:18 +1000
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
Cc: linux-usb@vger.kernel.org, Cai Huoqing <caihuoqing@baidu.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

remove it because SPDX-License-Identifier is already used

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 5 -----
 drivers/usb/gadget/udc/aspeed-vhub/dev.c  | 5 -----
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 5 -----
 drivers/usb/gadget/udc/aspeed-vhub/epn.c  | 5 -----
 drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 5 -----
 5 files changed, 25 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index d11d3d14313f..7a635c499777 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -5,11 +5,6 @@
  * core.c - Top level support
  *
  * Copyright 2017 IBM Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index d268306a7bfe..d918e8b2af3c 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -5,11 +5,6 @@
  * dev.c - Individual device/gadget management (ie, a port = a gadget)
  *
  * Copyright 2017 IBM Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
index 022b777b85f8..74ea36c19b1e 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
@@ -5,11 +5,6 @@
  * ep0.c - Endpoint 0 handling
  *
  * Copyright 2017 IBM Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index cb164c615e6f..917892ca8753 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -5,11 +5,6 @@
  * epn.c - Generic endpoints management
  *
  * Copyright 2017 IBM Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 5c7dea5e0ff1..b9960fdd8a51 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -5,11 +5,6 @@
  * hub.c - virtual hub handling
  *
  * Copyright 2017 IBM Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #include <linux/kernel.h>
-- 
2.25.1

