Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 937869924F2
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 08:36:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMTtn4k44z3bjt
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 17:36:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728282960;
	cv=none; b=Re8zRXsiCQN2df+48PvSkIp4n32n9AzchfDQg6JiqC5H68F0X17m4KEA15Ha46ffMrNrHOlFUflOZDFuWCY6wL5FrNJqf45JlRBc+s9vv/i4csLwGQ7hc1x9VnA+TK3xXDo/l1aofhEvYeDdhMf/04ELM3YrpMlroX6WArCktBwhRFoueLQ1jCM+y+o4992kx6+vPAvyS9+eU9QwblX6PaM5FawoD9cR14NPdcGnGZQ18twpZgakOMJPg+CmVk45SEdQNMDXTPWwew40cE8hbJJKMK+Q+rrmNW4wDhf66uAc3rSDh7QinjxXJrkdyuQautiAFSP1uhLalD/E4LwFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728282960; c=relaxed/relaxed;
	bh=NkrE9/31Fc1p/Lh2D9loLc3hpnTR+ltsn1I4oP5hYGc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LyxjPK1S/RLC6hLaylOVqvytO4kNiXOZdxhZ55zo3oXHz5UFZkb7r6j911pJrLdFUNFJ64u0/b8IXFxa2hTt0QX+K1FIJtIKNNqkFDJGREuWKhOeWDMRqGQdYP1EQ+49xGQfQDrthJOx89Z0qmUqJa8DSdPARFGr9uh+d7oU/48KbGaLxkfOAx644U8Id/ZopxecbntiEqTCUzZZwuFq3Ts84G5Ej5o5RW14D8uAHK2Q7/rJtbp4lrJPbzTrcLInPSuE9MrnJnezW9WS95Pw+cfni3A0Iwnndd/kcFDKGqIAAVZGjBq+6XihFLioObtqVjc3UujV+a6x6y10+PoTog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMTtl6gjBz2yY1
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Oct 2024 17:35:59 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 7 Oct
 2024 14:34:09 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 7 Oct 2024 14:34:09 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] watchdog: aspeed: Add support for SW restart
Date: Mon, 7 Oct 2024 14:34:08 +0800
Message-ID: <20241007063408.2360874-5-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: BMC-SW@aspeedtech.com, Bonnie_Lo@wiwynn.com, Patrick_NC_Lin@wiwynn.com, DELPHINE_CHIU@wiwynn.com, Peter.Yin@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

WDT reset can be triggered when system hangs or a deliberate
SW restart scenario. Originally, system can only know it is
reset by WDT through a reset flag. However, since AST2600,
a SW reset mechanism is created, SW can trigger the reset
event consciously and directly without wait for WDT timeout.
This function can be achieved by adding "aspeed,restart-sw"
property in dts. After that, an independent reset event flag
will be set after system reset by SW.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 40 ++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 68eaada8a564..eefca972dfa4 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -61,6 +61,7 @@ struct aspeed_wdt {
 	int			idx;
 	u32			ctrl;
 	const struct aspeed_wdt_config *cfg;
+	u32			flags;
 };
 
 static const struct aspeed_wdt_config ast2400_config = {
@@ -130,6 +131,11 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
 #define WDT_RESET_MASK1		0x1c
 #define WDT_RESET_MASK2		0x20
+#define WDT_SW_RESET_CTRL	0x24
+#define   WDT_SW_RESET_COUNT_CLEAR	0xDEADDEAD
+#define   WDT_SW_RESET_ENABLE	0xAEEDF123
+#define WDT_SW_RESET_MASK1	0x28
+#define WDT_SW_RESET_MASK2	0x2c
 
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
@@ -170,6 +176,9 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define WDT_DEFAULT_TIMEOUT	30
 #define WDT_RATE_1MHZ		1000000
 
+/* WDT behavior control flag */
+#define WDT_RESTART_SYSTEM_SW	0x00000001
+
 static struct aspeed_wdt *to_aspeed_wdt(struct watchdog_device *wdd)
 {
 	return container_of(wdd, struct aspeed_wdt, wdd);
@@ -249,11 +258,31 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static void aspeed_wdt_sw_reset(struct watchdog_device *wdd)
+{
+	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
+	u32 ctrl = WDT_CTRL_RESET_MODE_SOC |
+		   WDT_CTRL_RESET_SYSTEM;
+
+	writel(ctrl, wdt->base + WDT_CTRL);
+	writel(WDT_SW_RESET_COUNT_CLEAR,
+	       wdt->base + WDT_SW_RESET_CTRL);
+	writel(WDT_SW_RESET_ENABLE, wdt->base + WDT_SW_RESET_CTRL);
+
+	/* system must be reset immediately */
+	mdelay(1000);
+}
+
 static int aspeed_wdt_restart(struct watchdog_device *wdd,
 			      unsigned long action, void *data)
 {
 	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
 
+	if (wdt->flags & WDT_RESTART_SYSTEM_SW) {
+		aspeed_wdt_sw_reset(wdd);
+		return 0;
+	}
+
 	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
 	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
 
@@ -521,8 +550,11 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		ret = of_property_read_u32_array(np, "aspeed,reset-mask", reset_mask, nrstmask);
 		if (!ret) {
 			writel(reset_mask[0], wdt->base + WDT_RESET_MASK1);
-			if (nrstmask > 1)
+			writel(reset_mask[0], wdt->base + WDT_SW_RESET_MASK1);
+			if (nrstmask > 1) {
 				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
+				writel(reset_mask[1], wdt->base + WDT_SW_RESET_MASK2);
+			}
 		}
 	}
 
@@ -552,6 +584,12 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
 	}
 
+	wdt->flags = 0;
+	if (!of_device_is_compatible(np, "aspeed,ast2400-wdt") &&
+	    !of_device_is_compatible(np, "aspeed,ast2500-wdt") &&
+	    of_property_read_bool(np, "aspeed,restart-sw"))
+		wdt->flags |= WDT_RESTART_SYSTEM_SW;
+
 	ret = aspeed_wdt_get_bootstatus(dev, wdt);
 	if (ret)
 		return ret;
-- 
2.34.1

