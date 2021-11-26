Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60745EC9E
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 12:27:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0stD0Tsgz3cGW
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 22:27:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0sYX4RWNz2x9R
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Nov 2021 22:13:20 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1AQAjlFB048316;
 Fri, 26 Nov 2021 18:45:47 +0800 (GMT-8)
 (envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Nov
 2021 19:10:03 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Cai Huoqing <caihuoqing@baidu.com>, Tao Ren
 <rentao.bupt@gmail.com>, Julia Lawall <julia.lawall@inria.fr>, "kernel test
 robot" <lkp@intel.com>, Sasha Levin <sashal@kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 2/3] usb: aspeed-vhub: support remote wakeup feature
Date: Fri, 26 Nov 2021 19:09:53 +0800
Message-ID: <20211126110954.2677627-3-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126110954.2677627-1-neal_liu@aspeedtech.com>
References: <20211126110954.2677627-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AQAjlFB048316
X-Mailman-Approved-At: Fri, 26 Nov 2021 22:27:41 +1100
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
Cc: Neal Liu <neal_liu@aspeedtech.com>, BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Remote wakeup signaling will be automatically issued
whenever any write commands has been received in suspend
state.

Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c |  3 +++
 drivers/usb/gadget/udc/aspeed-vhub/dev.c  | 18 ++++++++++++++----
 drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 22 ++++++++++++++++------
 3 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index 7a635c499777..122ee7ef0b03 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -240,6 +240,9 @@ void ast_vhub_init_hw(struct ast_vhub *vhub)
 	if (vhub->force_usb1)
 		ctrl |= VHUB_CTRL_FULL_SPEED_ONLY;
 
+	/* Enable auto remote wakeup */
+	ctrl |= VHUB_CTRL_AUTO_REMOTE_WAKEUP;
+
 	ctrl |= VHUB_CTRL_UPSTREAM_CONNECT;
 	writel(ctrl, vhub->regs + AST_VHUB_CTRL);
 
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index d918e8b2af3c..4462f4b73b04 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -110,15 +110,25 @@ static int ast_vhub_dev_feature(struct ast_vhub_dev *d,
 				u16 wIndex, u16 wValue,
 				bool is_set)
 {
+	u32 val;
+
 	DDBG(d, "%s_FEATURE(dev val=%02x)\n",
 	     is_set ? "SET" : "CLEAR", wValue);
 
-	if (wValue != USB_DEVICE_REMOTE_WAKEUP)
-		return std_req_driver;
+	if (wValue == USB_DEVICE_REMOTE_WAKEUP) {
+		d->wakeup_en = is_set;
+		return std_req_complete;
 
-	d->wakeup_en = is_set;
+	} else if (wValue == USB_DEVICE_TEST_MODE) {
+		val = readl(d->vhub->regs + AST_VHUB_CTRL);
+		val &= ~GENMASK(10, 8);
+		val |= VHUB_CTRL_SET_TEST_MODE((wIndex >> 8) & 0x7);
+		writel(val, d->vhub->regs + AST_VHUB_CTRL);
 
-	return std_req_complete;
+		return std_req_complete;
+	}
+
+	return std_req_driver;
 }
 
 static int ast_vhub_ep_feature(struct ast_vhub_dev *d,
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index d76f83bc7762..ac589d3ba7a2 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -212,17 +212,27 @@ static int ast_vhub_hub_dev_feature(struct ast_vhub_ep *ep,
 				    u16 wIndex, u16 wValue,
 				    bool is_set)
 {
+	u32 val;
+
 	EPDBG(ep, "%s_FEATURE(dev val=%02x)\n",
 	      is_set ? "SET" : "CLEAR", wValue);
 
-	if (wValue != USB_DEVICE_REMOTE_WAKEUP)
-		return std_req_stall;
+	if (wValue == USB_DEVICE_REMOTE_WAKEUP) {
+		ep->vhub->wakeup_en = is_set;
+		EPDBG(ep, "Hub remote wakeup %s\n",
+		      is_set ? "enabled" : "disabled");
+		return std_req_complete;
 
-	ep->vhub->wakeup_en = is_set;
-	EPDBG(ep, "Hub remote wakeup %s\n",
-	      is_set ? "enabled" : "disabled");
+	} else if (wValue == USB_DEVICE_TEST_MODE) {
+		val = readl(ep->vhub->regs + AST_VHUB_CTRL);
+		val &= ~GENMASK(10, 8);
+		val |= VHUB_CTRL_SET_TEST_MODE((wIndex >> 8) & 0x7);
+		writel(val, ep->vhub->regs + AST_VHUB_CTRL);
 
-	return std_req_complete;
+		return std_req_complete;
+	}
+
+	return std_req_stall;
 }
 
 static int ast_vhub_hub_ep_feature(struct ast_vhub_ep *ep,
-- 
2.25.1

