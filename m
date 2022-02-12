Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CD34B3296
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Feb 2022 03:12:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwYsF0Rr8z3bdG
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Feb 2022 13:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=H1NArBIb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amazon.com (client-ip=207.171.190.10;
 helo=smtp-fw-33001.amazon.com; envelope-from=prvs=035d8392d=eduval@amazon.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256
 header.s=amazon201209 header.b=H1NArBIb; 
 dkim-atps=neutral
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwYs50LQCz3bP1
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Feb 2022 13:12:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1644631930; x=1676167930;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ZdFF+bThzOqaGF0GLmUjP5ltWoniFt4/T378NNzf4jM=;
 b=H1NArBIbPS3IipVV0OLo7/mKQHo9YTLOBgQlD6+SRqB9+XQD8nrtTSgl
 7sZ2cifib3aOtoGtdXaMwzv8buyGUN24fRH/oQwQQJEqaHkh0Yca5ivfZ
 l1ZEeJ0XBNC6z3DZlCGqGlMpCfSYXZMLLhZ0Morr+NJtSKs5ktIcFmHDq c=;
X-IronPort-AV: E=Sophos;i="5.88,361,1635206400"; d="scan'208";a="175587638"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-a264e6fe.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 12 Feb 2022 02:11:05 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-a264e6fe.us-west-2.amazon.com (Postfix) with
 ESMTPS id 4957D419DC; Sat, 12 Feb 2022 02:11:04 +0000 (UTC)
Received: from EX13D05UWB001.ant.amazon.com (10.43.161.181) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Sat, 12 Feb 2022 02:11:04 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D05UWB001.ant.amazon.com (10.43.161.181) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Sat, 12 Feb 2022 02:11:03 +0000
Received: from localhost (10.106.101.26) by mail-relay.amazon.com
 (10.43.161.249) with Microsoft SMTP Server id 15.0.1497.28 via Frontend
 Transport; Sat, 12 Feb 2022 02:11:03 +0000
From: Eduardo Valentin <eduval@amazon.com>
To: <eduval@amazon.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, "Guenter
 Roeck" <linux@roeck-us.net>
Subject: [PATCH 1/1] watchdog: aspeed: add nowayout support
Date: Fri, 11 Feb 2022 18:10:33 -0800
Message-ID: <20220212021033.2344-1-eduval@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Eduardo
 Valentin <evalenti@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add support for not stopping the watchdog
when the userspace application quits. At
closing of the device, the driver cannot
determine if this was a graceful closure
or if the app crashed. If the support
of nowayout on this driver, the system integrator
can select the behaviour by setting the kernel
config and enabling it.

Cc: Wim Van Sebroeck <wim@linux-watchdog.org> (maintainer:WATCHDOG DEVICE DRIVERS)
Cc: Guenter Roeck <linux@roeck-us.net> (maintainer:WATCHDOG DEVICE DRIVERS)
Cc: Joel Stanley <joel@jms.id.au> (supporter:ARM/ASPEED MACHINE SUPPORT)
Cc: Andrew Jeffery <andrew@aj.id.au> (reviewer:ARM/ASPEED MACHINE SUPPORT)
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS)
Cc: linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
Cc: linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
Cc: linux-kernel@vger.kernel.org (open list)
Signed-off-by: Eduardo Valentin <eduval@amazon.com>
Signed-off-by: Eduardo Valentin <evalenti@kernel.org>
---
 drivers/watchdog/aspeed_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 436571b6fc79..bd06622813eb 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -13,6 +13,11 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
 struct aspeed_wdt {
 	struct watchdog_device	wdd;
 	void __iomem		*base;
@@ -266,6 +271,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.timeout = WDT_DEFAULT_TIMEOUT;
 	watchdog_init_timeout(&wdt->wdd, 0, dev);
 
+	watchdog_set_nowayout(&wdt->wdd, nowayout);
+
 	np = dev->of_node;
 
 	ofdid = of_match_node(aspeed_wdt_of_table, np);
-- 
2.17.1

