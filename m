Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4FA97F8
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 03:18:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P2rL6MLRzDqS4
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 11:18:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ImiaCR4z"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P2qY6nLJzDqss
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 11:17:45 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id x15so403584pgg.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 18:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8b8JTddlNjepQv6Et6Ofu7H5cTa0ZFtL5UnNYenz5Ik=;
 b=ImiaCR4z4YjsLdGPtkli/vpoEyohlGYmidyJCVskHO+y5Lo5ENb+8/5TAAE//R/5W1
 20XhyHodIXgTEnUzmSpYxLUWba+SokhMvK75/lqxqAsf+wsR8dI/IH/D4tl/H0LyNyA+
 VxgWnj9vVBdnzcYwDvjUhHYLp4GqEEXt/TiFb+adAYRg4gZy86qQXpVi37wLSm+wwPbW
 P12hb/5RCmbnjvlOqOzIdZTen13U1sjGG7HJdbgYgt3uOu2GB5BL/kH2rIhCoxMTJYup
 pJoGJEwh+LRZPe3oS7iotltWGaKvNpTXqCasN2kj1Zasnjdq4+/7Y7M1YU+5u5gKr9Tz
 qLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8b8JTddlNjepQv6Et6Ofu7H5cTa0ZFtL5UnNYenz5Ik=;
 b=I06TUh/+Ef8OYyb2YkZaMvBqEPAbDj1/xKRFaBk4mzPM9L9otDhuBHdnBGu+Yv8XcV
 piUllXfEuEG+ijmC/hV/AaufKZdmTbKYj6vd1mZKZiHOG9aKJjlDsXRz/da3Xy9onUVG
 imCmCePyO0zxickc7l75LvBZO0ys7p3o/HIsrC1DvPLbF4Vous5KJEvXnha3tQvXUbB3
 KmF1ucYAR0mxOym0v1oxwpjozg0rDy28d+WyQERkM/mKclJFiTmTPZQnqmaneEp1sE+s
 OEuLHYtPR4wBWT+PC0QyAg7yKV9b046HTaV0zt5QMjitwtQNoKgsD+EJvBRkOQIfpKpE
 vACQ==
X-Gm-Message-State: APjAAAWrCoJxlDzkfPsSpD0LbAM4A9sFi+l+/4ownsUWtCeNROJJNN9C
 GwjKfMS5YFaDPS0UC5C6H+8=
X-Google-Smtp-Source: APXvYqwo7QKr0i7hZZv/zgo7jyZpDVEZUvySKhDUw2ropW4zGMZGwYJmQ4tAdDvYAs9+X1JPyH87YQ==
X-Received: by 2002:a62:e910:: with SMTP id j16mr690815pfh.123.1567646263758; 
 Wed, 04 Sep 2019 18:17:43 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id h66sm5434430pjb.0.2019.09.04.18.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 18:17:43 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v2 3/4] gpio: Add in ast2600 details to Aspeed driver
Date: Thu,  5 Sep 2019 11:17:32 +1000
Message-Id: <20190905011732.16059-1-rashmica.g@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The ast2600 is a new generation of SoC from ASPEED. Similarly to the
ast2400 and ast2500, it has a GPIO controller for it's 3.6V GPIO pins.
Additionally, it has a GPIO controller for 36 1.8V GPIO pins. These
voltages are fixed and cannot be configured via pinconf, so we need two
separate drivers for them.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 16c6eaf70857..4723b8780a8c 100644
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
+	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
+	for (i = 0; i < banks; i++) {
 		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
 
 		reg = ioread32(bank_reg(data, bank, reg_irq_status));
@@ -1108,9 +1110,33 @@ static const struct aspeed_gpio_config ast2500_config =
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
+	{ .compatible = "aspeed,ast2600-1-8v-gpio",
+	  .data = &ast2600_1_8v_config, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
-- 
2.20.1

