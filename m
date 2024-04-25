Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 529398B1D71
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 11:07:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gn4rilKM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQ9455rTYz3dRY
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 19:07:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gn4rilKM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQ93v2cxxz3dJ5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Apr 2024 19:07:39 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so580358a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Apr 2024 02:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714036055; x=1714640855; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4wTUU05Xd7j3sy440urBnEwP2fHUD5P7kgF0xvHMjc=;
        b=gn4rilKMZS8uk0RQBSQbSoKhExWFRXCBebrckFIf0oPYM6bFGBjyGnv8B6dZGeepPW
         aliauPvZG5ouoV/3tJEIS2vYHX6vZAWBq86ATpjU4zdf0qN8IcJ2Q9wbwjS5UyhGoHsp
         5gLl3iUbFvirDhrVQYdK7oxTbLfomgfhiIOb0NbzjOLyE6DKQMcjNjJkxwWnSNtXYswH
         TavZR7zS1ngdNEqqawbiEWRMZIQVjFRBDxIITDeQDe6l3iQqorTOOYw3m92iVzD2ZhyB
         Fo+lWXQyJ2xgiWZe1cUt4H93fn6KlPV9ICKdu03VTgeWqICeNaXMlOWJbbWF+g3L/ci6
         1p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714036055; x=1714640855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4wTUU05Xd7j3sy440urBnEwP2fHUD5P7kgF0xvHMjc=;
        b=c0uacQzrtaV1V5grehACDp0WKLwUIpCqfV72eBQjN6jrn+FPJfK7quom2BKVQUolD+
         pN4MLvE9AybtWLDbtdv9igAEdIjIbQHV34bhrNHjF4o+bACPDqHRZcjtKOxnkrg64b3y
         4HL2hE+fBtTjDgWUbXGPhk0/QexKHF10vGssh8Nvyt+JTprUPM190Wg9PXzMmUJBsSIe
         dkt+j8Itid19DkjSeltpKfo0tB/cePOoKroZVy6hdKU1kTwqUSJ030xcxeJtu2CCemI+
         851V57qzPQPlSk8hUioHpyuUyZXFxXlgMeOlF1BGBsb36xCZGLLFM/SzaorJpNjqh71z
         YiHA==
X-Forwarded-Encrypted: i=1; AJvYcCVWZW3MN3FmFIsCcf06cYpBr396FgfEAk9jukg1mXTIFe2lvRRhiRusHAgEF4Dgim0p02n5ADOnWn8ZzieD7Xqi6/jUzdUhcMMxoUHo4g==
X-Gm-Message-State: AOJu0YziPGHuKn3ffdp3Bjx7B70W2UZn53kkUQfjkEDCi8lwYXauFh6c
	ZKzB+zo4wfQBSrq2sc6LB8AyEAdg4QrDpTnGaSMe1jJFnf9nb+PG
X-Google-Smtp-Source: AGHT+IH00G50r60em0IVFLInu1mkzKCgJhWo7ypEjI8FeXomqiULAZ2cCuQIn+gE3UsYxotvJkPddw==
X-Received: by 2002:a17:90a:7306:b0:2a2:9e5d:9bf9 with SMTP id m6-20020a17090a730600b002a29e5d9bf9mr3363222pjk.8.1714036055337;
        Thu, 25 Apr 2024 02:07:35 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e339-24b8-1743-5d70-cc45-1c02.emome-ip6.hinet.net. [2001:b400:e339:24b8:1743:5d70:cc45:1c02])
        by smtp.gmail.com with ESMTPSA id g21-20020a17090a7d1500b002a574ab7f5esm12489938pjl.53.2024.04.25.02.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 02:07:34 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/1] drivers: watchdog: revise watchdog bootstatus
Date: Thu, 25 Apr 2024 17:07:26 +0800
Message-Id: <20240425090727.3787160-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240425090727.3787160-1-peteryin.openbmc@gmail.com>
References: <20240425090727.3787160-1-peteryin.openbmc@gmail.com>
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

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 drivers/watchdog/aspeed_wdt.c | 109 ++++++++++++++++++++++++++++++++--
 1 file changed, 103 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..4c58593658bc 100644
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
@@ -82,6 +84,16 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define WDT_RESET_MASK1		0x1c
 #define WDT_RESET_MASK2		0x20
 
+//AST SCU Register
+#define AST2400_AST2500_SYSTEM_RESET_EVENT	0x3C
+#define   AST2400_WATCHDOG_RESET_FLAG	BIT(1)
+#define   AST2400_RESET_FLAG_CLEAR	GENMASK(2, 0)
+#define   AST2500_WATCHDOG_RESET_FLAG	GENMASK(4, 2)
+#define AST2600_SYSTEM_RESET_EVENT	0x74
+#define   POWERON_RESET_FLAG		BIT(0)
+#define   EXTERN_RESET_FLAG		BIT(1)
+#define   AST2600_WATCHDOG_RESET_FLAG   GENMASK(31, 16)
+
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
  * enabled), specifically:
@@ -310,6 +322,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	const struct of_device_id *ofdid;
 	struct aspeed_wdt *wdt;
 	struct device_node *np;
+	struct regmap *scu_base;
 	const char *reset_type;
 	u32 duration;
 	u32 status;
@@ -458,15 +471,99 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
 	}
 
-	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
-	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	/*
+	 * Power on reset is set when triggered by AC or SRSRST.
+	 * Thereforce, we clear flag to ensure
+	 * next boot cause is a real watchdog case.
+	 * We use the external reset flag to determine
+	 * if it is an external reset or card reset
+	 */
+	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
+		scu_base = syscon_regmap_lookup_by_compatible(
+							"aspeed,ast2600-scu");
+		if (IS_ERR(scu_base))
+			return PTR_ERR(scu_base);
+
+		ret = regmap_read(scu_base,
+				  AST2600_SYSTEM_RESET_EVENT,
+				  &status);
+		if (ret)
+			return ret;
+
+		if ((status & POWERON_RESET_FLAG) == 0 &&
+		     status & AST2600_WATCHDOG_RESET_FLAG) {
+			if(status & EXTERN_RESET_FLAG)
+				wdt->wdd.bootstatus = WDIOF_EXTERN1;
+			else
+				wdt->wdd.bootstatus = WDIOF_CARDRESET;
+		}
+		status = AST2600_WATCHDOG_RESET_FLAG |
+			 POWERON_RESET_FLAG |
+			 EXTERN_RESET_FLAG;
+
+		ret = regmap_write(scu_base,
+				  AST2600_SYSTEM_RESET_EVENT,
+				  status);
+	} else if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
+		scu_base = syscon_regmap_lookup_by_compatible(
+							"aspeed,ast2500-scu");
+		if (IS_ERR(scu_base))
+			return PTR_ERR(scu_base);
+
+		ret = regmap_read(scu_base,
+				  AST2400_AST2500_SYSTEM_RESET_EVENT,
+				  &status);
+		if (ret)
+			return ret;
+
+		if ((status & POWERON_RESET_FLAG) == 0 &&
+		     status & AST2500_WATCHDOG_RESET_FLAG) {
+			if(status & EXTERN_RESET_FLAG)
+				wdt->wdd.bootstatus = WDIOF_EXTERN1;
+			else
+				wdt->wdd.bootstatus = WDIOF_CARDRESET;
+		}
+
+		status = AST2500_WATCHDOG_RESET_FLAG |
+			 POWERON_RESET_FLAG |
+			 EXTERN_RESET_FLAG;
+
+		ret = regmap_write(scu_base,
+				  AST2400_AST2500_SYSTEM_RESET_EVENT,
+				  status);
 
-		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
-		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
-			wdt->wdd.groups = bswitch_groups;
+		wdt->wdd.groups = bswitch_groups;
+	} else {
+		scu_base = syscon_regmap_lookup_by_compatible(
+							"aspeed,ast2400-scu");
+		if (IS_ERR(scu_base))
+			return PTR_ERR(scu_base);
+
+		ret = regmap_read(scu_base,
+				  AST2400_AST2500_SYSTEM_RESET_EVENT,
+				  &status);
+		if (ret)
+			return ret;
+		/*
+		 * Ast2400 external reset can clear watdog dog rest flag, so
+		 * only support WDIOF_CARDRESET
+		 */
+		if ((status & POWERON_RESET_FLAG) == 0 &&
+		     status & AST2400_WATCHDOG_RESET_FLAG)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+		status = AST2400_RESET_FLAG_CLEAR;
+
+		ret = regmap_write(scu_base,
+				  AST2400_AST2500_SYSTEM_RESET_EVENT,
+				  status);
+
+		wdt->wdd.groups = bswitch_groups;
 	}
 
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(dev, wdt);
 
 	return devm_watchdog_register_device(dev, &wdt->wdd);
-- 
2.25.1

