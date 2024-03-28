Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DAD88F540
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 03:23:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=abIXiOPy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4nQ05DQjz3vXX
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 13:23:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=abIXiOPy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4nPp5d63z3vYq
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 13:22:54 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e709e0c123so483711b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 19:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711592573; x=1712197373; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTnAwOa2uvPcM/ekFIY9I6q6Jkplpwwz1KPt6Wpm9+I=;
        b=abIXiOPy8pOWnzAUjf1+Glw0+R8+UlX8upwMFQ2oTCj+IslBWE9a47g+1hs7ZgfGP7
         +d+nVVudqBNWLPHMfUvngSLpzkqG6gow3rWTmyIXoTM+TWUPT0g7jAdd07TH673CBU72
         SRE2Z8fsg1OgdHfPY5aYO0ESAh4dPvy7djx/odzR9uhfTV8QXMjxw53GiPA8+DayEftE
         YFo2XZmMikLrE8NSzVqeCY9fFerWSsDjTpa/UblNPU4irQyNp4Jkw1+feJuaLnIzrmrT
         6qG8/O11EERYx3n64vC+X4zWn6ecWwjqelS5fNa+o+NYrkD1maOndfxD2tFdUji72VfS
         h0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711592573; x=1712197373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTnAwOa2uvPcM/ekFIY9I6q6Jkplpwwz1KPt6Wpm9+I=;
        b=QbmDeYgdVCqLlq/DyKr8vjbLCtm8uIcopwABeabPQUOtN2qqUS4iJBEb0Hfnrh88Zg
         lC/6Chn6W+sRrwRtat3OrVmWqurqh8tjEWzDUq1CEIS7XuK2IViXsnjrhLS+mWiilvFX
         9n84Axp7eiVGHeXXcxQKAg/QzboJWvajxnA7yC6ngQR5AEyaD6zmj/6Mo/ZTCAgL+pRp
         Gvnwqy6KwI8Dsn+Bl6VDMKxM7tnr7ny90bVUszvahSluutYe8CaMjlq1Og1T6iXL3KkU
         pnt1G8kFWncKzeltreqC73XaO1KMRnwyZ+TaX8eAqYlUTK31ga+6nU5t0EMMH3rFIOx7
         NvpA==
X-Forwarded-Encrypted: i=1; AJvYcCWT5z+7VlR5oXReoozsOfyvS+RoxaQ7cqBCoVkfznBd1KYp4530McSDGdQhWJNZ82/okHVEijD45mBB5P/lBubEuKfFsc7kYWhmf3enEg==
X-Gm-Message-State: AOJu0Yx3jxjdlgzd/wjlNnco689PNSTCMYqiF/hNii8g9BChyzNwhlJT
	MlEH1p7IjoSgbWMGpaGyj0C435TXpssGox5RGo/BozoI5wfyKV0X
X-Google-Smtp-Source: AGHT+IHyluQj3/cCpsmHi5qOqzz/QMCSs1jG33c9hrW1m6MP1TsWwfE6CQM9fOkeDUivtVwLq6k/8A==
X-Received: by 2002:a05:6a00:4b4a:b0:6ea:c634:ca0f with SMTP id kr10-20020a056a004b4a00b006eac634ca0fmr1790243pfb.21.1711592573087;
        Wed, 27 Mar 2024 19:22:53 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e355-7eb0-17c6-c47d-d4ee-f9e8.emome-ip6.hinet.net. [2001:b400:e355:7eb0:17c6:c47d:d4ee:f9e8])
        by smtp.gmail.com with ESMTPSA id d25-20020aa78699000000b006ea858ea901sm229256pfo.210.2024.03.27.19.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 19:22:52 -0700 (PDT)
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
Subject: [PATCH v6 4/4] drivers: watchdog: ast2500 and ast2600 support bootstatus
Date: Thu, 28 Mar 2024 10:22:31 +0800
Message-Id: <20240328022231.3649741-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
References: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
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
 drivers/watchdog/aspeed_wdt.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..0e7ef860cbdc 100644
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
@@ -77,11 +79,19 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define WDT_TIMEOUT_STATUS	0x10
 #define   WDT_TIMEOUT_STATUS_IRQ		BIT(2)
 #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
+#define   WDT_TIMEOUT_STATUS_EVENT		BIT(0)
 #define WDT_CLEAR_TIMEOUT_STATUS	0x14
 #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
 #define WDT_RESET_MASK1		0x1c
 #define WDT_RESET_MASK2		0x20
 
+/*
+ * Ast2600 SCU74 bit1 is External reset flag
+ * Ast2500 SCU3C bit1 is External reset flag
+ */
+#define AST2500_SYSTEM_RESET_EVENT	0x3C
+#define AST2600_SYSTEM_RESET_EVENT	0x74
+#define   EXTERN_RESET_FLAG		BIT(1)
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
  * enabled), specifically:
@@ -330,6 +340,11 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
+	struct regmap *scu_base = syscon_regmap_lookup_by_phandle(dev->of_node,
+							     "aspeed,scu");
+	if (IS_ERR(scu_base))
+		return PTR_ERR(scu_base);
+
 	wdt->wdd.info = &aspeed_wdt_info;
 
 	if (wdt->cfg->irq_mask) {
@@ -459,14 +474,26 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
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

