Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56787B824
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Mar 2024 07:58:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hw/XvN/0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwJ9k5LXyz3brZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Mar 2024 17:58:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hw/XvN/0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwJ9Z2HBwz3by2
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Mar 2024 17:57:52 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so541822b6e.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Mar 2024 23:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710399469; x=1711004269; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W3XCzn158oeVoQis+pbpqZUpajHhpzGWGyFPRII2fyI=;
        b=hw/XvN/02Qdj1WxiHy7Vf+x31RSVZ/pVnBH4qoG0J7wcL5fiPO8Kr8DzxhvHOcX5tZ
         /1iYLQdNKJTMS1NocSV3udl7PoDsUKHuyKLzfOZG9ay+h0MBZT3qP85JBX0h585DPI+g
         7loxWp1t4nAVCaFbrFBFeEI0stEg7Qq3Z8o6DIy/Dv63Sdl24N6k6YzdiMYkF1L7gnll
         cCe8dOCRgc/NX0f5Xd9DyZNlfMCKZn5oBRBZJFuQU9SfMWboyIyAhpCiPoE/VPyqcAMb
         tUCn3o/fC6dNr+kdN1w8ri9LfqMbSWVsIdWh6TWUGKk2pa0sLpktmYiWLNLSQX36ZiCW
         ugaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710399469; x=1711004269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3XCzn158oeVoQis+pbpqZUpajHhpzGWGyFPRII2fyI=;
        b=u2e+hC4YE+rT37MnrsGalfi/Q+N4oAdoTl+4Z+TiwOVo6h3cKfjiMhOh7w8Qk355Gy
         ejBlgDcq9E1vupMxDh8e+kDHmzamO2Mps+QzA//orvBdukt1GEWLFsQMm05TMSxZ3M4B
         d/dbc9fe7MKMjPWXDWxsipTyppOSyYlhVk8TyOWg9q9NgyTd+BKB6j7p2aIqvvQmfpEl
         rysiR5VmCyMdpONxzHgOwVOFds6TbmnLllUSI+GcTOGpzVYCoFEk+G7s/gs7APTB5QWr
         N68wLyLZ89MK6SpL3mcw7uSI2csUNP6RATW4376eeq8dBeapCsS7IRZcVhNHLtYnVA90
         gAgA==
X-Forwarded-Encrypted: i=1; AJvYcCXFACxx6bp+mY/ISXZx+VPPe9+J7bQEm8hAZ0p00IOIJOCYaj2LOpCBaWIyf73TaMekGx58U2dOilJI/VkhCGiDrHxsrrN9R6R69hHRcw==
X-Gm-Message-State: AOJu0YztYtxz0dy0q4vXt/nuPrIpGg7k7G+PatNF5ZgA+TUinhYO4yLc
	iffslCU2/IeSW0i7Je+FApZK6mY/TrW2PFjexv8X1EE5AlUxE2N6
X-Google-Smtp-Source: AGHT+IEGDBPn5h1CV4s3eWeXANQ5Zk+Wc9Bse4rPgbtE2gjJ8e8WQd/zlGsODb+VhYWDWnMuXDgUpg==
X-Received: by 2002:a05:6808:399b:b0:3c2:36dd:a368 with SMTP id gq27-20020a056808399b00b003c236dda368mr980223oib.10.1710399468981;
        Wed, 13 Mar 2024 23:57:48 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e359-9e59-9ebb-2f4b-4781-fe3b.emome-ip6.hinet.net. [2001:b400:e359:9e59:9ebb:2f4b:4781:fe3b])
        by smtp.gmail.com with ESMTPSA id a5-20020aa78e85000000b006e6857da474sm733847pfr.178.2024.03.13.23.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 23:57:48 -0700 (PDT)
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
Subject: [PATCH v1] drivers: watchdog: ast2600 support bootstatus
Date: Thu, 14 Mar 2024 14:57:44 +0800
Message-Id: <20240314065744.1182701-1-peteryin.openbmc@gmail.com>
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

Add WDIOF_EXTERN1 bootstatus in ast2600

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Change log:

v1
  - Patch 0001 - Add WDIOF_EXTERN1 bootstatus
---
 drivers/watchdog/aspeed_wdt.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..8adadd394be6 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -81,6 +81,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
 #define WDT_RESET_MASK1		0x1c
 #define WDT_RESET_MASK2		0x20
+#define   WDT_EVENT_COUNTER_MASK       (0xFFF << 8)
 
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
@@ -459,8 +460,17 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	}
 
 	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
-	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
+		if (status & WDT_EVENT_COUNTER_MASK) {
+			/*
+			 * Reset cause by WatchDog
+			 */
+			wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+		}
+	} else {
+		if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
 
 		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
 		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
-- 
2.25.1

