Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655DF88D991
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 09:54:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FesTdBRf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4L7c1Dtxz3dh2
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 19:54:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FesTdBRf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4L7Q6YJ1z3dwG
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 19:53:54 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1def3340682so53590795ad.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711529633; x=1712134433; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZEbTSOw9EjuXuuOhzMwhOK0HhVADXjRmiePaMQf/CY=;
        b=FesTdBRf9j7jIlqdAt0dLO4oCFo/7icA1QxuL9Cc3kRcl4qOmANFqEMJq4/ZCmNW78
         FaBFGr+SyC9F4faZ/r1aGYuoY2/+b7JpQ2CmmQUVfyM0ltSON1DTK00xRlnZTrmJjxHS
         OPjpSJZLuV9GJYAOGAnMyJPmHsLOSDUtgM9ri/GqMa81jF5tHU8m1CFS/P78wnaNQHiV
         eAjIn+agYPdjYAhojeCpfcXfuEuCKmiFQCawzcbVQ1TBa+kDtOTAirDilO9524cc2Mtb
         1ZuA513k3m5caTypq3jbvLUvteyKpGHhAlF/Nu1QpqQk61nZ1jptbWNbixprBdlvkFO4
         Cdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711529633; x=1712134433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZEbTSOw9EjuXuuOhzMwhOK0HhVADXjRmiePaMQf/CY=;
        b=Y28TCXZUFLmHHCDERkKkHrRJd3pj2PHtMyxeOHVyYq3e0HuCVbVmgFzw9KYfQ7GW7R
         o7exjmXM3neUG9lCuxXc7wZZDYo3nqYgjm0eddmLTa9DJWicqEzwTvuJueDvzk/HRo7v
         W0QTCDEh95SN650P2G8cE6aNTrZ76u0+TnNlUqrnfsutYmxwPdjx16DmFFnMqaOBnvur
         S0ZcoOrfNz81Pt5H4kPa+7uCNnJFECz8Hd17ApugYBx0jnZR4vdNZoZ9AhtajsAlKB+2
         +CPKo60DEmQ0okXJsxRoVAbYwgdZ6V0owZ45EyCrqridiwsWzm0NV91F4C0pkN78l5lx
         LZ8w==
X-Forwarded-Encrypted: i=1; AJvYcCW0K7pDyhKVR7wx5B/VsAIcPKg9kBghU/5cNQ4+GRyeaUDVyZSoiASDPT6/mHSbYxTvXX+pS/lGMkAE5JaGxirPi7772h/Uj8qi06L4Bg==
X-Gm-Message-State: AOJu0YwIcbSmEg9Fwa1KODJMp6D2O6990j48m0vyZCTfFXMmv1hb0nc1
	2xFkUT1yUofv0p6+6PbRoq/CCuvJ4DFlRe8uASsfh5SzPx+gUmhK
X-Google-Smtp-Source: AGHT+IFlw6rOiGuhTJ4vNythc7vqhRqSyiMQo9PeosfY33Phf1K75pTfq+88EaBWSjn9tJXb1tX3pQ==
X-Received: by 2002:a17:902:c94a:b0:1e0:acb1:7977 with SMTP id i10-20020a170902c94a00b001e0acb17977mr785333pla.49.1711529633261;
        Wed, 27 Mar 2024 01:53:53 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e383-3566-013c-5a87-9abc-381e.emome-ip6.hinet.net. [2001:b400:e383:3566:13c:5a87:9abc:381e])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902eecc00b001e0501d3058sm8356848plb.63.2024.03.27.01.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:53:52 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] drivers: watchdog: ast2500 and ast2600 support bootstatus
Date: Wed, 27 Mar 2024 16:53:30 +0800
Message-Id: <20240327085330.3281697-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
References: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
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

Add WDIOF_EXTERN1 and WDIOF_CARDRESET bootstatus in ast2600

Regarding the AST2600 specification, the WDTn Timeout Status Register
(WDT10) has bit 1 reserved. Bit 1 of the status register indicates
on ast2500 if the boot was from the second boot source.
It does not indicate that the most recent reset was triggered by
the watchdog. The code should just be changed to set WDIOF_CARDRESET
if bit 0 of the status register is set.

Include SCU register to veriy WDIOF_EXTERN1 in ast2600 SCU74 or
ast2500 SCU3C when bit1 is set.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 drivers/watchdog/aspeed_wdt.c | 60 +++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..29e9afdee619 100644
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
@@ -65,23 +67,32 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define WDT_RELOAD_VALUE	0x04
 #define WDT_RESTART		0x08
 #define WDT_CTRL		0x0C
-#define   WDT_CTRL_BOOT_SECONDARY	BIT(7)
-#define   WDT_CTRL_RESET_MODE_SOC	(0x00 << 5)
-#define   WDT_CTRL_RESET_MODE_FULL_CHIP	(0x01 << 5)
-#define   WDT_CTRL_RESET_MODE_ARM_CPU	(0x10 << 5)
-#define   WDT_CTRL_1MHZ_CLK		BIT(4)
-#define   WDT_CTRL_WDT_EXT		BIT(3)
-#define   WDT_CTRL_WDT_INTR		BIT(2)
-#define   WDT_CTRL_RESET_SYSTEM		BIT(1)
-#define   WDT_CTRL_ENABLE		BIT(0)
+#define WDT_CTRL_BOOT_SECONDARY	BIT(7)
+#define WDT_CTRL_RESET_MODE_SOC	(0x00 << 5)
+#define WDT_CTRL_RESET_MODE_FULL_CHIP	(0x01 << 5)
+#define WDT_CTRL_RESET_MODE_ARM_CPU	(0x10 << 5)
+#define WDT_CTRL_1MHZ_CLK		BIT(4)
+#define WDT_CTRL_WDT_EXT		BIT(3)
+#define WDT_CTRL_WDT_INTR		BIT(2)
+#define WDT_CTRL_RESET_SYSTEM		BIT(1)
+#define WDT_CTRL_ENABLE		BIT(0)
 #define WDT_TIMEOUT_STATUS	0x10
-#define   WDT_TIMEOUT_STATUS_IRQ		BIT(2)
-#define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
+#define WDT_TIMEOUT_STATUS_IRQ		BIT(2)
+#define WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
+#define WDT_TIMEOUT_STATUS_EVENT		BIT(0)
 #define WDT_CLEAR_TIMEOUT_STATUS	0x14
-#define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
+#define WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
 #define WDT_RESET_MASK1		0x1c
 #define WDT_RESET_MASK2		0x20
 
+/*
+ * Ast2600 SCU74 bit1 is External reset flag
+ * Ast2500 SCU3C bit1 is External reset flag
+ */
+#define EXTERN_RESET_FLAG		BIT(1)
+#define AST2500_SYSTEM_RESET_EVENT	0x3C
+#define AST2600_SYSTEM_RESET_EVENT	0x74
+
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
  * enabled), specifically:
@@ -330,6 +341,11 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
+	struct regmap *scu_base = syscon_regmap_lookup_by_phandle(dev->of_node,
+							     "aspeed,scu");
+	if (IS_ERR(scu_base))
+		return PTR_ERR(scu_base);
+
 	wdt->wdd.info = &aspeed_wdt_info;
 
 	if (wdt->cfg->irq_mask) {
@@ -459,14 +475,26 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	}
 
 	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
-	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
+	if (status & WDT_TIMEOUT_STATUS_EVENT)
 		wdt->wdd.bootstatus = WDIOF_CARDRESET;
 
-		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
-		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
-			wdt->wdd.groups = bswitch_groups;
+	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
+		ret = regmap_read(scu_base,
+				  AST2600_SYSTEM_RESET_EVENT,
+				  &status);
+	} else {
+		ret = regmap_read(scu_base,
+				  AST2500_SYSTEM_RESET_EVENT,
+				  &status);
+		wdt->wdd.groups = bswitch_groups;
 	}
 
+	/*
+	 * Reset cause by Extern Reset
+	 */
+	if (status & EXTERN_RESET_FLAG && !ret)
+		wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+
 	dev_set_drvdata(dev, wdt);
 
 	return devm_watchdog_register_device(dev, &wdt->wdd);
-- 
2.25.1

