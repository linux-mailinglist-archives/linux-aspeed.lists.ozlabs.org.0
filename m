Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C9990562
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2019 18:04:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4697Rz4gL2zDrg0
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Aug 2019 02:04:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hcp099JL"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4697RY2lTrzDrTQ
 for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Aug 2019 02:04:09 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id 4so2611034pld.10
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2019 09:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrRMkjc2qGWCZLIX9694c7JW7Gvf0FMcBkwT0dY+kis=;
 b=hcp099JLXcAtr20hVTLWgVQYFXbhVo4XXLQW1gdi3X8wRO/iMDfVRxkZdA5NU7sAQh
 voXm3CvwWdBYwGJz329n7nQ8rE8+eLKw/vWJpi8Vovk6mb3R8BEURRIiFAo9gYUrP5OU
 bPQkYgp6sSWijbk+aWW8MqL9P2yCokXbfiOzbpgVJ/T3OaYnbYTg3JrwH0ELewheo8Op
 ArXIuD2xkn+/ugivUTwZGh4XmqUo89Feh6zy5EIJ6BvpS3OQ80lWi/FFPmDleMc4gu0g
 jBkFdbXQFne1ffs23n8Yt6XafDq894mNsogG9+FL7rU0hfCNzuDO2ClfSF8v/MYWG5/e
 AV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BrRMkjc2qGWCZLIX9694c7JW7Gvf0FMcBkwT0dY+kis=;
 b=h0DKkGHmXwWxgOnm+HXnEFdyCzA41GiTPe7Ly1JlVeqao1l8e+3qwsABN6i/S2gOXG
 35ozGoAa5Z7FcImVNhWJiHn4ItiTM+wnabDXmmVY0T6BOjENWmfFPfugpXq+L1UqPn9s
 0oShYyfzPoPkDf//hiJrjZKLlYBRAwRLFIQAyPhsOZ8vH26eM/+2FrL84ZrUiS0KGyOv
 wRt3O1s9Svbz5EPEUDoDmKPjpbe/MXNrPQTATRwnTnHc8Kmpz7WFVliVIMSqpdLVTn09
 2oadZbf2AkfCg1K8WWm9LyRtyf9i9IgQYND2PVJklZ1cGMGfThgZTg+zxPmuTM+pyhGV
 wPag==
X-Gm-Message-State: APjAAAWa1k8Kf9S3Gx3EmT1LWUEPKbdoCxOO9U5k4Bmkc0n2NWtnwEkb
 yq9Ay1PImXIOU1ECkfDSkGc=
X-Google-Smtp-Source: APXvYqxiGn8dbBBUwz6+A3QeDJEhGVLcHKlXkwSQ70P6UKBPE5EgJgZ0TGRQnwNFfsCB+8cciHU9ng==
X-Received: by 2002:a17:902:a01:: with SMTP id
 1mr10269948plo.278.1565971445900; 
 Fri, 16 Aug 2019 09:04:05 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id m20sm7578607pff.79.2019.08.16.09.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 09:04:05 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/2] watchdog: aspeed: Add support for AST2600
Date: Sat, 17 Aug 2019 01:33:47 +0930
Message-Id: <20190816160347.23393-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190816160347.23393-1-joel@jms.id.au>
References: <20190816160347.23393-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ryan Chen <ryan_chen@aspeedtech.com>

The ast2600 can be supported by the same code as the ast2500.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/watchdog/aspeed_wdt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index cc71861e033a..94f73796ba9d 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -31,9 +31,14 @@ static const struct aspeed_wdt_config ast2500_config = {
 	.ext_pulse_width_mask = 0xfffff,
 };
 
+static const struct aspeed_wdt_config ast2600_config = {
+	.ext_pulse_width_mask = 0xfffff,
+};
+
 static const struct of_device_id aspeed_wdt_of_table[] = {
 	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
 	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
+	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
@@ -259,7 +264,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
-	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
+	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
+		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
 
 		reg &= config->ext_pulse_width_mask;
-- 
2.23.0.rc1

