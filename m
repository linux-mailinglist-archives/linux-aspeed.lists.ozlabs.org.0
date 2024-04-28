Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 998CE8B4C2F
	for <lists+linux-aspeed@lfdr.de>; Sun, 28 Apr 2024 16:32:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nYzmTG5H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VS86h10pRz3cSM
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2024 00:31:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nYzmTG5H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VS86W41KTz3bq0
	for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2024 00:31:45 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e4266673bbso32290925ad.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Apr 2024 07:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714314703; x=1714919503; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXqf8F3SecFIk6T1Akuz7f4j9GlOgRtt8O4mjizvpu4=;
        b=nYzmTG5HvIGUKH/lW8O0OrjSmEYB583Vu4IDVs53o/c4hFukF0Ze5iKX3bBpB7IiGM
         Av6wwgATxwlJkm42XwFNnTVYSNhMhVL+4YTMANf6uAzt7NCrT2xvUfJUMbCs1v2QX1mQ
         LoiL1VdkE0GhV2AcbDqn0P69EeSpQbiNjx7IapIrCcy20MaJi/z8zW3kXADutJJ/UQYV
         WWN0I4TdGD3IoVwpeSenlwca0R/1RBlPyemtWCi95ZlIKQjbx3fCHEzfy82BHU8++HH4
         1FoobHxEg+G5xDY0io9XDnz6PVUy3c6CcPqgs38MqAow/+DDlvHdAIhY2Om7JqNU9OQT
         PflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714314703; x=1714919503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXqf8F3SecFIk6T1Akuz7f4j9GlOgRtt8O4mjizvpu4=;
        b=ChMkS4TDTggW57YYS8OEIsrtJFrzJo9QEJmy3CGd0SnSbml82ko9XCU8q4avz5PvjZ
         KAxyUaURHWy3Vw1gaWhMcF57HZcW3D1M2FpOwgLp6f8hfF1I53gSAhPjuw+q4BIzPCZq
         ps1UiX5m0m2pL/LGdAUEou4OiiJSMkX+DhX83BXZ7dTxqfTnbulFiMr/twHNSHX5FBjR
         NayjaOIo7C1kszwBDo14q5ylgXZ0go8m9njJM16UE/NWuqMAxGMIUyLDjH9HpKWS0/fm
         QlXRx8FkdNTy1sijbQpxMoVijEe8kG/7d0omL1zBktKN1WhaoF6ZoHHS8SA/q2709HWi
         GAxg==
X-Forwarded-Encrypted: i=1; AJvYcCWWT7EXwV0GVF/iKu7UeApjRmxfoufnwNbKXPV5v+k5Tfqs98DkILUcssxvuj0aAYiauZ0wL3MtWUkwihW/fN2s5CgH/qxWz/VIwVwccg==
X-Gm-Message-State: AOJu0YyuiYGJqSxOWz8u5zjgS93WlkS+TqAsUPQbKGfEEllnbgbL9jzR
	n1SiOopmJsPv1T7iRHpW45tGX85a1ONp0OTO/cem6rKSrL13kN/A
X-Google-Smtp-Source: AGHT+IG6q6wHxQ91YJnCTGvVZFyYo0xYdTvqDFb5dXnQuTlsuMiga8xv5uzQdfDtcGTXR7Y0kjbYHg==
X-Received: by 2002:a17:902:fc4d:b0:1eb:2988:549d with SMTP id me13-20020a170902fc4d00b001eb2988549dmr8241260plb.40.1714314703323;
        Sun, 28 Apr 2024 07:31:43 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id h6-20020a636c06000000b00612dc2ec375sm1034834pgc.16.2024.04.28.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 07:31:42 -0700 (PDT)
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
Subject: [PATCH v8 1/1] drivers: watchdog: revise watchdog bootstatus
Date: Sun, 28 Apr 2024 22:29:36 +0800
Message-Id: <20240428142937.785925-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240428142937.785925-1-peteryin.openbmc@gmail.com>
References: <20240428142937.785925-1-peteryin.openbmc@gmail.com>
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
 drivers/watchdog/aspeed_wdt.c | 78 +++++++++++++++++++++++++++++++----
 1 file changed, 70 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..4393625c2e96 100644
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
@@ -22,10 +24,32 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+//AST SCU Register
+#define POWERON_RESET_FLAG		BIT(0)
+#define EXTERN_RESET_FLAG		BIT(1)
+
+#define AST2400_AST2500_SYSTEM_RESET_EVENT	0x3C
+#define   AST2400_WATCHDOG_RESET_FLAG	BIT(1)
+#define   AST2400_RESET_FLAG_CLEAR	GENMASK(2, 0)
+
+#define   AST2500_WATCHDOG_RESET_FLAG	GENMASK(4, 2)
+#define   AST2500_RESET_FLAG_CLEAR	(AST2500_WATCHDOG_RESET_FLAG | \
+					 POWERON_RESET_FLAG | EXTERN_RESET_FLAG)
+
+#define AST2600_SYSTEM_RESET_EVENT	0x74
+#define   AST2600_WATCHDOG_RESET_FLAG   GENMASK(31, 16)
+#define   AST2600_RESET_FLAG_CLEAR	(AST2600_WATCHDOG_RESET_FLAG | \
+					 POWERON_RESET_FLAG | EXTERN_RESET_FLAG)
+
 struct aspeed_wdt_config {
 	u32 ext_pulse_width_mask;
 	u32 irq_shift;
 	u32 irq_mask;
+	const char *compatible;
+	u32 reset_event;
+	u32 watchdog_reset_flag;
+	u32 extern_reset_flag;
+	u32 reset_flag_clear;
 };
 
 struct aspeed_wdt {
@@ -39,18 +63,33 @@ static const struct aspeed_wdt_config ast2400_config = {
 	.ext_pulse_width_mask = 0xff,
 	.irq_shift = 0,
 	.irq_mask = 0,
+	.compatible = "aspeed,ast2400-scu",
+	.reset_event = AST2400_AST2500_SYSTEM_RESET_EVENT,
+	.watchdog_reset_flag = AST2400_WATCHDOG_RESET_FLAG,
+	.extern_reset_flag = 0,
+	.reset_flag_clear = AST2400_RESET_FLAG_CLEAR,
 };
 
 static const struct aspeed_wdt_config ast2500_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 12,
 	.irq_mask = GENMASK(31, 12),
+	.compatible = "aspeed,ast2500-scu",
+	.reset_event = AST2400_AST2500_SYSTEM_RESET_EVENT,
+	.watchdog_reset_flag = AST2500_WATCHDOG_RESET_FLAG,
+	.extern_reset_flag = EXTERN_RESET_FLAG,
+	.reset_flag_clear = AST2500_RESET_FLAG_CLEAR,
 };
 
 static const struct aspeed_wdt_config ast2600_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 0,
 	.irq_mask = GENMASK(31, 10),
+	.compatible = "aspeed,ast2600-scu",
+	.reset_event = AST2600_SYSTEM_RESET_EVENT,
+	.watchdog_reset_flag = AST2600_WATCHDOG_RESET_FLAG,
+	.extern_reset_flag = EXTERN_RESET_FLAG,
+	.reset_flag_clear = AST2600_RESET_FLAG_CLEAR,
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
@@ -310,6 +349,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	const struct of_device_id *ofdid;
 	struct aspeed_wdt *wdt;
 	struct device_node *np;
+	struct regmap *scu_base;
 	const char *reset_type;
 	u32 duration;
 	u32 status;
@@ -458,14 +498,36 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
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
+	scu_base = syscon_regmap_lookup_by_compatible(wdt->cfg->compatible);
+	if (IS_ERR(scu_base))
+		return PTR_ERR(scu_base);
+
+	ret = regmap_read(scu_base, wdt->cfg->reset_event, &status);
+	if (ret)
+		return ret;
+
+	if (!(status & POWERON_RESET_FLAG) &&
+	      status & wdt->cfg->watchdog_reset_flag)
+		wdt->wdd.bootstatus = (status & wdt->cfg->extern_reset_flag) ?
+				WDIOF_EXTERN1 : WDIOF_CARDRESET;
+
+	status = wdt->cfg->reset_flag_clear;
+	ret = regmap_write(scu_base, wdt->cfg->reset_event, status);
+	if (ret)
+		return ret;
+
+	if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
+	    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
+		wdt->wdd.groups = bswitch_groups;
 
 	dev_set_drvdata(dev, wdt);
 
-- 
2.25.1

