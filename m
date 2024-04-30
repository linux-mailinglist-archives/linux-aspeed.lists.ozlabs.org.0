Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77D98B79C5
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2024 16:33:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jbTvpyjy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTN3c2fMWz3cRy
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 00:33:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jbTvpyjy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTN3R2XDSz2yts
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 00:33:23 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e65a1370b7so53627495ad.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2024 07:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714487601; x=1715092401; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9+uw12LzVsx3wU8adlXBHs43wHbzfmBsLnbaFarO2I=;
        b=jbTvpyjy0ouT2hNUIKslFmHQkGDRaOj+3vtZavUogAImLNKTUFJgO6bGZLIcUoxgKS
         C2rBiytXyuBMoJAr9lUj/Zrhwa4j1PYClOWi1Mq0RbGS8cuPlQI97ifovXCs/dznRDpD
         ras2Ty6Jscj8ZDPX0cwYIJQh3M8O23uz8YZEomCusbofC6va7udq+9smUHleX4BeP2gf
         B7h7tDhok3RMBVZInfMAu3K+Jv+cUQsR+4R9gfICz51nfS5/s6NdEz0t9B3wb+1ldBHK
         W1luf8gWMare5pTNwz2slu/pHTCsoo6iwy/mNVH5qqJoWmdINSjCNgR/dsdGTMrgvdBQ
         XrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714487601; x=1715092401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9+uw12LzVsx3wU8adlXBHs43wHbzfmBsLnbaFarO2I=;
        b=AC5s2FVeRxm/k6dTSkv0aMvpsn434ylr8ljdtuEYlIk+msudlHKJpHeq574kbiK8P0
         9HFPMAvz6MS9dknITvSP5B5MCrVzj1uaPhSHvMbedKLsdrRTZ6H8KqcLpw1dL/E8TjRU
         jgoWp3FN0r9VxchPN/MBp6VCJ3uigLoR1EARCUlrVmBbdE+T8646TRJlwazVJKUDRE7e
         dK6WoseAwYwJVxbRXoq7ITzysKLKcd6fv/ssBiIN1y51jzWsl24Arxb5A55r5Mro/p9Z
         huw5a5ErGA0ZnmyxR5rynUs/ECxVoXHN6SxowBCex2XDJ6GHVDwBnwaLv8VFuDmp12mq
         DDiA==
X-Forwarded-Encrypted: i=1; AJvYcCWkmw4cfXbEHV9JuYXu+PS5lL4kvmh4exEb548UIU6KVo33DsvCZp/6xsiPCtS2WUVI7flx4YocbTDvX6R330HhdHhjUy7L1JMMy3m8sQ==
X-Gm-Message-State: AOJu0YyPYUeyUd//a2N0wRR23mHtkGP7QLp/0IBGG3r3x2BE0Q4ZvMiD
	psY+IxtqpB/1a7Z196b1lOYHWW/S2xiXCwimb8nPLXmSayq4oAI3
X-Google-Smtp-Source: AGHT+IH4UdZbzfvSJo3QJfZt+JphuB4AEFpA9cZMcuqalJRWHwyT3Ed+65xfdEtezZjfDmHJFi8NrA==
X-Received: by 2002:a17:902:e806:b0:1e2:81c1:b35e with SMTP id u6-20020a170902e80600b001e281c1b35emr17906114plg.54.1714487600758;
        Tue, 30 Apr 2024 07:33:20 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902db0100b001e47972a2casm1682431plx.96.2024.04.30.07.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:33:20 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Eddie James <eajames@linux.vnet.ibm.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/1] watchdog: aspeed: Revise handling of bootstatus
Date: Tue, 30 Apr 2024 22:31:14 +0800
Message-Id: <20240430143114.1323686-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430143114.1323686-1-peteryin.openbmc@gmail.com>
References: <20240430143114.1323686-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Regarding the AST2600 specification, the WDTn Timeout Status Register
(WDT10) has bit 1 reserved. Bit 1 of the status register indicates
on ast2500 if the boot was from the second boot source.
It does not indicate that the most recent reset was triggered by
the watchdog. The code should just be changed to set WDIOF_CARDRESET
if bit 0 of the status register is set. However, this bit can be clear when
watchdog register 0x0c bit1(Reset System after timeout) is enabled.
Thereforce include SCU register to veriy WDIOF_EXTERN1 and WDIOF_CARDRESET
in ast2600 SCU74 or ast2400/ast2500 SCU3C.

Fixes: 49d4d277ca54 ("aspeed: watchdog: Set bootstatus during probe")
Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 drivers/watchdog/aspeed_wdt.c | 90 +++++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..556493763793 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -11,10 +11,12 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/kstrtox.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/watchdog.h>
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
@@ -22,10 +24,38 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+/* AST SCU Register for System Reset Event Log Register Set
+ * ast2600 is scu074 ast2400/2500 is scu03c
+ */
+#define AST_SCU_SYS_RESET_POWERON_MASK	BIT(0)
+#define AST_SCU_SYS_RESET_EXTERN_FLAG	BIT(1)
+
+#define AST2400_SYSTEM_RESET_STATUS	0x3C
+#define   AST2400_WATCHDOG_RESET_MASK	BIT(1)
+#define   AST2400_RESET_FLAG_CLEAR	GENMASK(2, 0)
+
+#define   AST2500_WATCHDOG_RESET_MASK	GENMASK(4, 2)
+#define   AST2500_RESET_FLAG_CLEAR	(AST2500_WATCHDOG_RESET_MASK | \
+					 AST_SCU_SYS_RESET_POWERON_MASK | \
+					 AST_SCU_SYS_RESET_EXTERN_FLAG)
+
+#define AST2600_SYSTEM_RESET_STATUS	0x74
+#define   AST2600_WATCHDOG_RESET_MASK   GENMASK(31, 16)
+#define   AST2600_RESET_FLAG_CLEAR	(AST2600_WATCHDOG_RESET_MASK | \
+					 AST_SCU_SYS_RESET_POWERON_MASK | \
+					 AST_SCU_SYS_RESET_EXTERN_FLAG)
+
 struct aspeed_wdt_config {
 	u32 ext_pulse_width_mask;
 	u32 irq_shift;
 	u32 irq_mask;
+	struct {
+		const char *compatible;
+		u32 reset_status_reg;
+		u32 watchdog_reset_mask;
+		u32 extern_reset_mask;
+		u32 reset_flag_clear;
+	} scu;
 };
 
 struct aspeed_wdt {
@@ -39,18 +69,39 @@ static const struct aspeed_wdt_config ast2400_config = {
 	.ext_pulse_width_mask = 0xff,
 	.irq_shift = 0,
 	.irq_mask = 0,
+	.scu = {
+		.compatible = "aspeed,ast2400-scu",
+		.reset_status_reg = AST2400_SYSTEM_RESET_STATUS,
+		.watchdog_reset_mask = AST2400_WATCHDOG_RESET_MASK,
+		.extern_reset_mask = 0,
+		.reset_flag_clear = AST2400_RESET_FLAG_CLEAR,
+	}
 };
 
 static const struct aspeed_wdt_config ast2500_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 12,
 	.irq_mask = GENMASK(31, 12),
+	.scu = {
+		.compatible = "aspeed,ast2500-scu",
+		.reset_status_reg = AST2400_SYSTEM_RESET_STATUS,
+		.watchdog_reset_mask = AST2500_WATCHDOG_RESET_MASK,
+		.extern_reset_mask = AST_SCU_SYS_RESET_EXTERN_FLAG,
+		.reset_flag_clear = AST2500_RESET_FLAG_CLEAR,
+	}
 };
 
 static const struct aspeed_wdt_config ast2600_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 0,
 	.irq_mask = GENMASK(31, 10),
+	.scu = {
+		.compatible = "aspeed,ast2600-scu",
+		.reset_status_reg = AST2600_SYSTEM_RESET_STATUS,
+		.watchdog_reset_mask = AST2600_WATCHDOG_RESET_MASK,
+		.extern_reset_mask = AST_SCU_SYS_RESET_EXTERN_FLAG,
+		.reset_flag_clear = AST2600_RESET_FLAG_CLEAR,
+	}
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
@@ -310,6 +361,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	const struct of_device_id *ofdid;
 	struct aspeed_wdt *wdt;
 	struct device_node *np;
+	struct regmap *scu;
 	const char *reset_type;
 	u32 duration;
 	u32 status;
@@ -458,14 +510,36 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
 	}
 
-	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
-	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
-
-		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
-		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
-			wdt->wdd.groups = bswitch_groups;
-	}
+	/*
+	 * Power on reset is set when triggered by AC or SRSRST.
+	 * Thereforce, we clear flag to ensure
+	 * next boot cause is a real watchdog case.
+	 * We use the external reset flag to determine
+	 * if it is an external reset or card reset.
+	 * However, The ast2400 watchdog flag is cleared by an external reset,
+	 * so it only supports WDIOF_CARDRESET.
+	 */
+	scu = syscon_regmap_lookup_by_compatible(wdt->cfg->scu.compatible);
+	if (IS_ERR(scu))
+		return PTR_ERR(scu);
+
+	ret = regmap_read(scu, wdt->cfg->scu.reset_status_reg, &status);
+	if (ret)
+		return ret;
+
+	if (!(status & AST_SCU_SYS_RESET_POWERON_MASK) &&
+	      status & wdt->cfg->scu.watchdog_reset_mask)
+		wdt->wdd.bootstatus = (status & wdt->cfg->scu.extern_reset_mask)
+					 ? WDIOF_EXTERN1 : WDIOF_CARDRESET;
+
+	status = wdt->cfg->scu.reset_flag_clear;
+	ret = regmap_write(scu, wdt->cfg->scu.reset_status_reg, status);
+	if (ret)
+		return ret;
+
+	if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
+	    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
+		wdt->wdd.groups = bswitch_groups;
 
 	dev_set_drvdata(dev, wdt);
 
-- 
2.25.1

