Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A426188C623
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Mar 2024 16:01:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zcf3hZbd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3tKd2HNcz3vd3
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 02:01:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zcf3hZbd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3tKG1lgRz3vcS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 02:00:50 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e74bd85f26so4453518b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Mar 2024 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711465248; x=1712070048; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxIIBTP4rXppfPhTT/4q0S1EVkuGtE5Ah2bvfj9/Kl4=;
        b=Zcf3hZbd9EjN/9/GGrcLKfWNRgihIIVWsfSwRk/S+CuzLrbzRNhfUatHLQ+K+ZFkeB
         8j1Z5p0pTQleOjL4EUQraZ23+2INaYY/WMvBA3TQIJ7YypUTZ40XJjf5H0J1fewPxPh3
         4Vl9ZYLjm9vR7LYT/FO+/+Xeqe3lp3CUWdnLkEENfZOMxlQOirVMW9e6ohHf194Ybzvo
         nphe4wm1FuMX+GFmgKqVBpqTI+zQ1nUPejFRoKxkSrX7hyMGPxLq91cHpYa3N1Gplj4J
         kyxeGWHxEEqETQc9pKuqNl6PNA5dCz2Ylf1AgYdwxFC1DoeuAEHl/wiAgLxe5vvsi3Yh
         xusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465248; x=1712070048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxIIBTP4rXppfPhTT/4q0S1EVkuGtE5Ah2bvfj9/Kl4=;
        b=AcWafIMdOoAQTUhnlPEUu/eAFI7WietPcO5JwFMLrt5IHV1//aLZzX56xRmqPttEsd
         qXuc156QHUCBGW1k6wYpUBb5aT8iaJsuwHAKXfjfrwJwLcmNQCt1uVxjbAEhLotg5jDY
         bLSi1Gn0czOD/oXz1hS8jWu1YDsB3dliALvXaVvhVpIqyeXhxuILNfmSkfo2D5I6skYx
         1orCpKD+SZumKXzW3EOyO9ZLEiFkh0IPGMtFr91p/pkwQqeWCQAmg1ZTZYpt3lLDig2Q
         lNDYcLffUKYLXyZ2eqjlTg91tVEIeUDQumX1Bj3mj2mTv8zqQnhDCQ8aiS3/5AZaZZtP
         /KxA==
X-Forwarded-Encrypted: i=1; AJvYcCVE2qqiwSDCxptDnoLCPTaM4KBR+0Vl4rGQErdTyva2wFLHFZiPvdUl+828JP3ahbfVG2vGgz5s8HFwrOXXDcyt3xyKi2u4kY21vWamew==
X-Gm-Message-State: AOJu0YzomMLXdQtmRF5zyGW9uB47woD3uKBaAT8nDDOn9oRRgSCFQ1IU
	KqEkW8TmgqvjWY/z+a1sywGXe8G/oFrA2W8sMqQ/0Cs0R7K4MERk
X-Google-Smtp-Source: AGHT+IH1cX47UcVDJeEEPc3BtsiLHnch3pmt/eT/zXRUGHXwiIA0NbF5hbSlAoW8eYDLcPteprOuGw==
X-Received: by 2002:a05:6a20:6a22:b0:1a3:c3e6:aef7 with SMTP id p34-20020a056a206a2200b001a3c3e6aef7mr7554771pzk.54.1711465248497;
        Tue, 26 Mar 2024 08:00:48 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id l27-20020a635b5b000000b005dcbb855530sm7658404pgm.76.2024.03.26.08.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:00:48 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] drivers: watchdog: ast2500 and ast2600 support bootstatus
Date: Tue, 26 Mar 2024 23:00:27 +0800
Message-Id: <20240326150027.3015958-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240326150027.3015958-1-peteryin.openbmc@gmail.com>
References: <20240326150027.3015958-1-peteryin.openbmc@gmail.com>
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
 drivers/watchdog/aspeed_wdt.c | 53 ++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..52afc5240b1c 100644
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
+#define   EXTERN_RESET_FLAG		BIT(1)
+#define   AST2500_SYSTEM_RESET_EVENT	(0x3C)
+#define   AST2600_SYSTEM_RESET_EVENT	(0x74)
+
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
  * enabled), specifically:
@@ -458,15 +469,25 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
 	}
 
+	struct regmap *scu_base = syscon_regmap_lookup_by_phandle(dev->of_node,
+							     "aspeed,scu");
 	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
-	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
+	if (status & WDT_TIMEOUT_STATUS_EVENT)
 		wdt->wdd.bootstatus = WDIOF_CARDRESET;
 
-		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
-		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
-			wdt->wdd.groups = bswitch_groups;
+	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
+		regmap_read(scu_base, AST2600_SYSTEM_RESET_EVENT, &status);
+	} else {
+		regmap_read(scu_base, AST2500_SYSTEM_RESET_EVENT, &status);
+		wdt->wdd.groups = bswitch_groups;
 	}
 
+	/*
+	 * Reset cause by Extern Reset
+	 */
+	if (status & EXTERN_RESET_FLAG)
+		wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+
 	dev_set_drvdata(dev, wdt);
 
 	return devm_watchdog_register_device(dev, &wdt->wdd);
-- 
2.25.1

