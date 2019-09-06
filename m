Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D96EBAB28E
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 08:38:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PntZ3gg4zDr24
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 16:37:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NXYnmP23"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PntS4HkHzDqXM
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2019 16:37:50 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id n9so2926238pgc.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 23:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yf6oL0tLck8RqjzG1KqIqd5PEbTcJ8AQ/ti24H7+Mz0=;
 b=NXYnmP230UycB9liYF3jNI9HXZKDZofvGwQCaNbCbErISaI2FlPzJFnF+Iq3hFaMqs
 Io12+fzGHh/IqGAPfw/c4YxEvW+pW7elVCHKqHBSZ3fa+dPw0AwKlLIs0PJcHc+dm1Vb
 WO/b0qmFMp+VMaQ2uWIUZyBxCtkmRl3fWfc4BNrapRQUCqbPpk5gG7CKbBoKEo7opIwm
 IUEzr8AlzTkF4F8w3heaAevoQVxdBZYCAsCEQvJHpwqnQeFvd975Vs9QEUnz14dMvExL
 +D3q/U47MzTli9y+P4yVgX/D+rMoMYWAeOa3y1QKNUrROcoFT0omsC4PkDTfC7xt1Xcm
 0TFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yf6oL0tLck8RqjzG1KqIqd5PEbTcJ8AQ/ti24H7+Mz0=;
 b=FCPZhNdJVOqgVBQjUtgl8QowidfAnDbxaL7mgt2SlSbT4WtX3W4Wuga51QIHaBRdeo
 TNGMWudqgAhEYKRtiLP08LcGS8CuY18fH6jDp2OFw0c27Wf9rok/WZS2GefuHhgA26X+
 KAiFRsGRq11Ico8YMaanUwV14ZlLIW8MSb6K1s7Rvqn3aRfUdB3QErJC5sFH3vJkCHX4
 qrHgUcjeYF82BtFD1634VBItd3+wzyqCksFxsin37pUw62KdRoSVImxUPYCk6/Tl5YMh
 j6x1dQo0i6UVbJmKTa0oAUTR5YJdnG6MOeglLtQL4k7ZujXzpx/Ti48jyGeXrSPszoLk
 xCgQ==
X-Gm-Message-State: APjAAAWkHEvBnUbr/xXMo7pRrBlq8ybfJJg4QfcPBoQJLFVYuFGFfjTW
 VAh15D1htuJYIoXzJyKpTvk=
X-Google-Smtp-Source: APXvYqxqn0tl04tewRdzFsJ8jiTYNrJ0tt+dZTao+RrY+oc5sIrQaCUmx/FsP0NVnoCH8qDg0es8Ug==
X-Received: by 2002:a62:8683:: with SMTP id x125mr8468525pfd.108.1567751867568; 
 Thu, 05 Sep 2019 23:37:47 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 207sm5017423pfu.129.2019.09.05.23.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 23:37:46 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v3 5/5] gpio: Add in ast2600 details to Aspeed driver
Date: Fri,  6 Sep 2019 16:37:37 +1000
Message-Id: <20190906063737.15428-1-rashmica.g@gmail.com>
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

The ast2600 is a new generation of SoC from ASPEED. Similarly to the
ast2400 and ast2500, it has a GPIO controller for it's 3.3V GPIO pins.
Additionally, it has a GPIO controller for 1.8V GPIO pins.

As the register names for both controllers are the same and the 36 1.8V
GPIOs and the first 36 of the 3.3V GPIOs are all bidirectional, we can
use the same configuration struct and use the ngpio property to
differentiate between the two sets of GPIOs.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index effcfaaf8c0c..22d482072632 100644
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
+	banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
+	for (i = 0; i < banks; i++) {
 		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
 
 		reg = ioread32(bank_reg(data, bank, reg_irq_status));
@@ -1134,9 +1136,25 @@ static const struct aspeed_gpio_config ast2500_config =
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
+	/*
+	 * ast2600 has two controllers one with 208 GPIOs and one with 36 GPIOs.
+	 * We expect ngpio being set in the device tree and this is a fallback
+	 * option.
+	 */
+	{ .nr_gpios = 208, .props = ast2600_bank_props, };
+
 static const struct of_device_id aspeed_gpio_of_table[] = {
 	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
 	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config, },
+	{ .compatible = "aspeed,ast2600-gpio", .data = &ast2600_config, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
-- 
2.20.1

