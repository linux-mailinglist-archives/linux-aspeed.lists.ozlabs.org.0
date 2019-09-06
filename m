Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25CAB278
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 08:27:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Pnfk6n0vzDr7x
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 16:27:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tYI7NDik"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Pnfd52SCzDr7F
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2019 16:27:37 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d3so2657189plr.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 23:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n30qcH046iWaW71uUfJO57qHyXMN57OJWxHknUR+29c=;
 b=tYI7NDikpxLUXtA/lqOpvKs/cEOU/szl6gmUMcA6n5Wqn7oOYYahU9r0V8AnAf0reF
 4nHQ1YC8+oXk9P+lJMfs0XzzTqyi09hRp9tSP67QUu5MoQSmzCfP9LXuuI7b9K3UuE5b
 mdN50wGfFfRALcDAkydIcx5fNlo6PYSgzXZ9PfXokso3Nqyswhlrapw1UpqxIMK/X767
 DjWdSGMBSz+cXvuh5vOE14GhX5xL26XbLSFsNS2jEX/CbeTssvrLih94s65BfzXQykgB
 xXXX99uB+tDkk2QMc1kyNw4OJPr4PKPFxd2Q7NMMnAWnetg7z9ZcbOcNvEgP28bB/QJP
 R/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n30qcH046iWaW71uUfJO57qHyXMN57OJWxHknUR+29c=;
 b=D+bUmmEv5VTkB5u7Y5W5qHwpTxUmbGMBkLCHO5OnrxiN5b/zCn6d71E/4E/8Vhf8JB
 PYsuHFNgoJMjHd+V4DJWow4anNQ/fW5670DqWiFt/BpcBw3vcQ96r/qIvM7CoyNPR/kp
 VKdFNMEZ9I/5l+5eX6tR/x1hWkhiy3lfPrRF+0BIW3d5Y6OxFeZs1/5RNAGSs/birSev
 ni/ya8j5/1VVZav+/Weue5oAEMYpudozLkcA0EhcNs+1QJSgYqqWF9PWzFEzKE/ECRMS
 RFLHA1h0KEb+9uCn8g7njZ3zuP+S+1Isf9Ohh4TUql1o0czfhik5eVkpBpe9gIa2lLiT
 jeBA==
X-Gm-Message-State: APjAAAUz+s9nQGzLmXxecJAvc4bTD15beb6VUzpES5rfgLusEjW0zRe8
 b+5WyLE0ynVph8Vxz5NL4OUFTNP8RZA=
X-Google-Smtp-Source: APXvYqzTYD4UT8lYUo5iEkHosGPzmhfer4sXZbHMDlzxTN6P9Gg1Nm+xU4PDIY7OW2IN4o6EWNWUmg==
X-Received: by 2002:a17:902:4a:: with SMTP id 68mr1975472pla.196.1567751255165; 
 Thu, 05 Sep 2019 23:27:35 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j2sm4752728pfe.130.2019.09.05.23.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 23:27:34 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v3 4/5] gpios: Use ngpio property from device tree if available
Date: Fri,  6 Sep 2019 16:27:26 +1000
Message-Id: <20190906062727.13521-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use the ngpio property from the device tree if it exists. If it doesn't
then fallback to the hardcoded value in the config.

This is in preparation for adding ast2600 support. The ast2600 SoC has
two GPIO controllers and so requires two instances of the GPIO driver.
We use the ngpio property to different between them as they have
different numbers of GPIOs.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 16c6eaf70857..c3d5ecba343b 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -694,7 +694,7 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
 		for_each_clear_bit(offset, &input, 32) {
 			unsigned int i = props->bank * 32 + offset;
 
-			if (i >= gpio->config->nr_gpios)
+			if (i >= gpio->chip.ngpio)
 				break;
 
 			clear_bit(i, gpio->chip.irq.valid_mask);
@@ -1007,10 +1007,10 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 	unsigned long flags;
 
 	if (!gpio->cf_copro_bankmap)
-		gpio->cf_copro_bankmap = kzalloc(gpio->config->nr_gpios >> 3, GFP_KERNEL);
+		gpio->cf_copro_bankmap = kzalloc(gpio->chip.ngpio >> 3, GFP_KERNEL);
 	if (!gpio->cf_copro_bankmap)
 		return -ENOMEM;
-	if (offset < 0 || offset > gpio->config->nr_gpios)
+	if (offset < 0 || offset > gpio->chip.ngpio)
 		return -EINVAL;
 	bindex = offset >> 3;
 
@@ -1055,7 +1055,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 	if (!gpio->cf_copro_bankmap)
 		return -ENXIO;
 
-	if (offset < 0 || offset > gpio->config->nr_gpios)
+	if (offset < 0 || offset > gpio->chip.ngpio)
 		return -EINVAL;
 	bindex = offset >> 3;
 
@@ -1119,7 +1119,8 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *gpio_id;
 	struct aspeed_gpio *gpio;
-	int rc, i, banks;
+	int rc, i, banks, err;
+	u32 ngpio;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -1145,7 +1146,10 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->config = gpio_id->data;
 
 	gpio->chip.parent = &pdev->dev;
-	gpio->chip.ngpio = gpio->config->nr_gpios;
+	err = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);
+	gpio->chip.ngpio = (u16) ngpio;
+	if (err)
+		gpio->chip.ngpio = gpio->config->nr_gpios;
 	gpio->chip.direction_input = aspeed_gpio_dir_in;
 	gpio->chip.direction_output = aspeed_gpio_dir_out;
 	gpio->chip.get_direction = aspeed_gpio_get_direction;
@@ -1158,7 +1162,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = -1;
 
 	/* Allocate a cache of the output registers */
-	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
+	banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
 	gpio->dcache = devm_kcalloc(&pdev->dev,
 				    banks, sizeof(u32), GFP_KERNEL);
 	if (!gpio->dcache)
-- 
2.20.1

