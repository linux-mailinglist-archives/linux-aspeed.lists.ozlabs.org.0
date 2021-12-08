Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E846D096
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Dec 2021 11:07:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8CWQ1ZDVz2yp1
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Dec 2021 21:06:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8CWD027Vz2ynG
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Dec 2021 21:06:45 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1B89eqpN032351;
 Wed, 8 Dec 2021 17:40:53 +0800 (GMT-8)
 (envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 8 Dec
 2021 18:05:52 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Cai Huoqing <caihuoqing@baidu.com>, Tao Ren
 <rentao.bupt@gmail.com>, Julia Lawall <julia.lawall@inria.fr>, "kernel test
 robot" <lkp@intel.com>, Sasha Levin <sashal@kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <benh@kernel.crashing.org>
Subject: [PATCH v3 2/4] usb: aspeed-vhub: fix remote wakeup failure in iKVM
 use case
Date: Wed, 8 Dec 2021 18:05:43 +0800
Message-ID: <20211208100545.1441397-3-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208100545.1441397-1-neal_liu@aspeedtech.com>
References: <20211208100545.1441397-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1B89eqpN032351
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

Signaling remote wakeup if an emulated USB device has any activity
if the device is allowed by host.

Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/epn.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 917892ca8753..ccc239b5cc17 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -381,6 +381,11 @@ static int ast_vhub_epn_queue(struct usb_ep* u_ep, struct usb_request *u_req,
 	} else
 		u_req->dma = 0;
 
+	if (ep->dev->wakeup_en) {
+		EPVDBG(ep, "Wakeup host first\n");
+		ast_vhub_hub_wake_all(vhub);
+	}
+
 	EPVDBG(ep, "enqueue req @%p\n", req);
 	EPVDBG(ep, " l=%d dma=0x%x zero=%d noshort=%d noirq=%d is_in=%d\n",
 	       u_req->length, (u32)u_req->dma, u_req->zero,
-- 
2.25.1

