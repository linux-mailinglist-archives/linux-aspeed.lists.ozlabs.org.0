Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313DE87E361
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Mar 2024 06:52:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YnFJjp1g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TykXR6jWMz3cDd
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Mar 2024 16:52:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YnFJjp1g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TykXH5QqXz3bPV
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Mar 2024 16:52:30 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e00896dfdcso3876885ad.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 17 Mar 2024 22:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710741145; x=1711345945; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=90ypWIse8KDEw4JedjK1HuYEeI8yW2/WFlhRVCHxDPE=;
        b=YnFJjp1gBE/ftLG1lv4vMH0rtjJRgY7Z3RmI+hKdUlvHnNgk8oMWLqBBPmKYhEKVgM
         TEX7+NJvSxayorMYstpOD/bbaU6JKmU1v/A5OEAxgQfv+uSfs8D8LmECxRemTEM81GJ3
         BwzQdnhS4oy+dZY94ynJ83yx62uByY7V7VJvvNOpPerdlDoFk7eS+v2zKBELQT1xSqQ0
         XNEATOJn3i7JENM+/EHqATecsusvUcemq7Rxvj1dAlZz7Rv5bhRi0pvkjQmm55DYeEq2
         JZfefJ990jp/XhfOnEKa3zzdJ3aBKYugiM0pi5UsE3SS42nVGL8cLovTAuvwzvk5YBsp
         kWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710741145; x=1711345945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90ypWIse8KDEw4JedjK1HuYEeI8yW2/WFlhRVCHxDPE=;
        b=ieUCFlAIHCQJ0b+Ch23N6OgM3b7ZQSmz/GzTzq1iLl7x8dpUCDCKCSeF3uGvjNY8nU
         zlO0m2wtrtpR0gw2FGNKdeGJdzCQPau2bD5vW5l1+dQOl6sqGl+66gHgtg9XXNeFHEsZ
         ZRaLMN1H7seBf/2wyDfMJFEhOpMFWoNz7Ec4+xLeHIWhTg0gXFRcx8ea+/El4D0f81Wq
         9qzamh/0tJhu5R2r587JzEUUGj3sfckHwWxdZL0B3aAe0FwK+tKYxTfdc5FatVlH/jk5
         Q/JUbLzWehIXGl8Zepxys/4xZO+2yIyvO5nkRms0B1+N6fhztGZEJCyQNW57JMppZztS
         6TLw==
X-Forwarded-Encrypted: i=1; AJvYcCVsTpMyAbH19oMtfpGYDgxi1PjpTDJJnQDDdi2yQNZ7BYYcKrH35qum/pPHUpVvM6doY0Dn2LjQmDvPV3734VdlHxafJQjxVesrxXs0GA==
X-Gm-Message-State: AOJu0Yzp4sILMHaQSPoZO2fN/N/argkkGhmGWPZHHQMKQ43cf/Zeg4d0
	b/rcTlmt2XdkMKQHkzuVXVvqWBOxUM2WXIyJGV7tjb21JtuTRTzQ
X-Google-Smtp-Source: AGHT+IEzjVGGcpD2wdQdh4nNr8UA/bFIGmLYxCfglYwg6FzxomdZCRU5LfqgjRQaFqyKaDckZNH2Sg==
X-Received: by 2002:a17:902:c412:b0:1dd:76f0:4455 with SMTP id k18-20020a170902c41200b001dd76f04455mr13656970plk.49.1710741145494;
        Sun, 17 Mar 2024 22:52:25 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e454-a466-01a3-78b9-4898-3442.emome-ip6.hinet.net. [2001:b400:e454:a466:1a3:78b9:4898:3442])
        by smtp.gmail.com with ESMTPSA id j9-20020a170902da8900b001dd6c0800b4sm3975907plx.188.2024.03.17.22.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 22:52:25 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v2] drivers: watchdog: ast2600 support bootstatus
Date: Mon, 18 Mar 2024 13:52:19 +0800
Message-Id: <20240318055219.3460121-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
(WDT10) has bit 1 reserved. To verify the second boot source,
we need to check SEC14 bit 12 and bit 13.
The bits 8-23 in the WDTn Timeout Status Register are the Watchdog
Event Count, which we can use to verify WDIOF_EXTERN1.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Change log:

v1 -> v2
  - Add comment and support WDIOF_CARDRESET in ast2600

v1
  - Patch 0001 - Add WDIOF_EXTERN1 bootstatus
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi |  8 ++---
 drivers/watchdog/aspeed_wdt.c           | 45 ++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index e0b44498269f..23ae7f0430e9 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -556,24 +556,24 @@ uart5: serial@1e784000 {
 
 			wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2600-wdt";
-				reg = <0x1e785000 0x40>;
+				reg = <0x1e785000 0x40>, <0x1e6f2000 0x20>;
 			};
 
 			wdt2: watchdog@1e785040 {
 				compatible = "aspeed,ast2600-wdt";
-				reg = <0x1e785040 0x40>;
+				reg = <0x1e785040 0x40>, <0x1e6f2000 0x020>;
 				status = "disabled";
 			};
 
 			wdt3: watchdog@1e785080 {
 				compatible = "aspeed,ast2600-wdt";
-				reg = <0x1e785080 0x40>;
+				reg = <0x1e785080 0x40>, <0x1e6f2000 0x020>;
 				status = "disabled";
 			};
 
 			wdt4: watchdog@1e7850c0 {
 				compatible = "aspeed,ast2600-wdt";
-				reg = <0x1e7850C0 0x40>;
+				reg = <0x1e7850C0 0x40>, <0x1e6f2000 0x020>;
 				status = "disabled";
 			};
 
diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..65118e461130 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -33,6 +33,7 @@ struct aspeed_wdt {
 	void __iomem		*base;
 	u32			ctrl;
 	const struct aspeed_wdt_config *cfg;
+	void __iomem		*sec_base;
 };
 
 static const struct aspeed_wdt_config ast2400_config = {
@@ -82,6 +83,15 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define WDT_RESET_MASK1		0x1c
 #define WDT_RESET_MASK2		0x20
 
+/*
+ * Only Ast2600 support
+ */
+#define   WDT_EVENT_COUNTER_MASK	(0xFFF << 8)
+#define   WDT_SECURE_ENGINE_STATUS	(0x14)
+#define   ABR_IMAGE_SOURCE		BIT(12)
+#define   ABR_IMAGE_SOURCE_SPI		BIT(13)
+#define   SECOND_BOOT_ENABLE		BIT(14)
+
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
  * enabled), specifically:
@@ -313,6 +323,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	const char *reset_type;
 	u32 duration;
 	u32 status;
+	u32 sec_st;
 	int ret;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
@@ -330,6 +341,12 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
+	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
+		wdt->sec_base = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(wdt->sec_base))
+			return PTR_ERR(wdt->sec_base);
+	}
+
 	wdt->wdd.info = &aspeed_wdt_info;
 
 	if (wdt->cfg->irq_mask) {
@@ -459,12 +476,30 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	}
 
 	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
-	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
 
-		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
-		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
-			wdt->wdd.groups = bswitch_groups;
+	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
+		/*
+		 * The WDTn Timeout Status Register bit 1 is reserved.
+		 * To verify the second boot source,
+		 * we need to check SEC14 bit 12 and bit 13.
+		 */
+		sec_st = readl(wdt->sec_base + WDT_SECURE_ENGINE_STATUS);
+		if( sec_st & SECOND_BOOT_ENABLE)
+			if (sec_st & ABR_IMAGE_SOURCE ||
+			    sec_st & ABR_IMAGE_SOURCE_SPI)
+				wdt->wdd.bootstatus |= WDIOF_CARDRESET;
+
+		/*
+		 * To check Watchdog Event Count for WDIOF_EXTERN1
+		 */
+		if (status & WDT_EVENT_COUNTER_MASK) {
+			wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+		}
+	} else {
+		wdt->wdd.groups = bswitch_groups;
+
+		if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
 	}
 
 	dev_set_drvdata(dev, wdt);
-- 
2.25.1

