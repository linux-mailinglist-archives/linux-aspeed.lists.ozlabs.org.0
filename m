Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52071AFC50
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 14:16:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T18w4rvxzF35j
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 22:16:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H0et8VQz"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NYRC4ZZ7zDqlV
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2019 16:13:27 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id w10so10635162pgj.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2019 23:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dwQylTZAjlDddzlsHBHSBMQ7EYoKKuHnayRWM7T5y0g=;
 b=H0et8VQzTf/uK3fL10utxIcqVuxPIx2H3Vl488KJZDiBDKzJLiUaTE6zesw/JS82fI
 TuAxT91S5OOEkThao21DilskqA0EVmzlPrw3COcOihDzsEHMcgxNeDf0wcyrmAmCtFGX
 bNSbnu9rLkEd8TMy68Udy4QbZwDYNXeTYmXAk+GvNf7Poyvc5FeFggyBAOhsSKGnnELr
 rhSQshNpztoyGRg76+SB9eSHPloob0uHEUyn3e4CGvSIWaiR5HfyJ0Fvf+cEBPub1lB1
 M3Vpy8wmoH9guLbEjXO9CidL+I0QejrU32T62EVqCCB6Uw/PbFNvkvQSKWdS1SoWiYzH
 tHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dwQylTZAjlDddzlsHBHSBMQ7EYoKKuHnayRWM7T5y0g=;
 b=qtTUr7fCElD6i1sfS6ykpcYIoKtWHv/DfUAhGByBeF8a+CLI5gvsDsnShblBPcX9F3
 6IzGudvyeNbldQv4G4Arzm57B82IPohrK58OJucxcs/q1Xwi6FXXGh7XVLJtmd0WE+Ti
 ipi609kcL9yZnQ+iEz3+KYmdUGmv42f4ToAzqSo1kn2cYPbbG3Vx3MlAn1cnT3Kk6EqG
 zMwIAClUgIJU0OCIQfBXOCy7FNzUeX610zQ41R9BvIsOE2TTNe1xmFenCVblkwRogdCH
 wLmJgqOvW577vCnxK+LXobN1XBMrBip2o0pHAMjEyIdTa2vLtwXpbG6GtQCb9/9CBVKS
 67sw==
X-Gm-Message-State: APjAAAXmw8cW2K3kqMGVd43HOex40ssL1zwBqcaHo5oU45OWj5eeaguW
 vLQYwzPd7spefesQ4HVvtF4CjY9rOYo=
X-Google-Smtp-Source: APXvYqyBhY/AnfgGoWby13Aai3moACfpQi6PDqg+npBn9MK9a3FjZAgErqSjzTgubNlEgXTLsfTHbA==
X-Received: by 2002:a17:90a:c305:: with SMTP id
 g5mr3396371pjt.58.1567577605456; 
 Tue, 03 Sep 2019 23:13:25 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id i9sm42443093pgo.46.2019.09.03.23.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 23:13:25 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 bgolaszewski@baylibre.com
Subject: [PATCH 3/4] gpio: Add in ast2600 details to Aspeed driver
Date: Wed,  4 Sep 2019 16:12:44 +1000
Message-Id: <20190904061245.30770-3-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904061245.30770-1-rashmica.g@gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Sep 2019 22:16:16 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The ast2600 has two gpio controllers, one for 3.6V GPIOS and one for 1.8V GPIOS.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 60ab042c9129..98881c99d0b9 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -662,12 +662,14 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct aspeed_gpio *data = gpiochip_get_data(gc);
-	unsigned int i, p, girq;
+	unsigned int i, p, girq, banks;
 	unsigned long reg;
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 
 	chained_irq_enter(ic, desc);
 
-	for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
+	banks = (gpio->config->nr_gpios >> 5) + 1;
+	for (i = 0; i < banks; i++) {
 		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
 
 		reg = ioread32(bank_reg(data, bank, reg_irq_status));
@@ -1108,9 +1110,32 @@ static const struct aspeed_gpio_config ast2500_config =
 	/* 232 for simplicity, actual number is 228 (4-GPIO hole in GPIOAB) */
 	{ .nr_gpios = 232, .props = ast2500_bank_props, };
 
+static const struct aspeed_bank_props ast2600_bank_props[] = {
+	/*     input	  output   */
+	{5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
+	{6, 0xffff0000,  0x0fff0000}, /* Y/Z */
+	{ },
+};
+
+static const struct aspeed_gpio_config ast2600_config =
+	/* 208 3.6V GPIOs */
+	{ .nr_gpios = 208, .props = ast2600_bank_props, };
+
+static const struct aspeed_bank_props ast2600_1_8v_bank_props[] = {
+	/*     input	  output   */
+	{1, 0x0000000f,  0x0000000f}, /* E */
+	{ },
+};
+
+static const struct aspeed_gpio_config ast2600_1_8v_config =
+	/* 36 1.8V GPIOs */
+	{ .nr_gpios = 36, .props = ast2600_1_8v_bank_props, };
+
 static const struct of_device_id aspeed_gpio_of_table[] = {
 	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
 	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config, },
+	{ .compatible = "aspeed,ast2600-gpio", .data = &ast2600_config, },
+	{ .compatible = "aspeed,ast2600-1-8v-gpio", .data = &ast2600_1_8v_config,},
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
-- 
2.20.1

