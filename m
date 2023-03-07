Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 915B46ADFBC
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 14:05:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWFzn2rPrz3bg5
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 00:05:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QXsMqYlK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QXsMqYlK;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWFzB21d7z3bby
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 00:04:54 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id d36so13812166lfv.8
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Mar 2023 05:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PUEBNIWi9XlpGpt5vSwoRNt6H80aDlupNA++Rohdv4=;
        b=QXsMqYlKGC8BIFrpVBwoMJw3jitiZ7aT6M1ELBa0ist/N1XoxIZooLBDUNVrnzAbmI
         yoXGbnY4TSmgf7jXGuGWkHGSWiFEoZeK9OgM+GuB3nUBU5Ke2z7KpZ3l9kUew9rHrG0T
         ol3sQvqoMY69wVHCoaCRgnJEegNl1rfkzA3Z5O+Rt9DKDg7otFNmc1o5JfFzrjGu6q0M
         D4p3rjfwpy1JfLOnf7q2X8U382eYyVR2/3/VsmU20rB8GUKl2jXuqGEf/lzImnl3K4fb
         55e+VC3ry3ANQT3FMYt24J9jaXKivzjNPkSdFSrMaCq2O8ubTy47vf8VvC9W30vfVpQs
         w2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PUEBNIWi9XlpGpt5vSwoRNt6H80aDlupNA++Rohdv4=;
        b=pCloX9MTzP4OwEynYh/DyxUDmAMcyRdz+ydot2kUxVSqeLxLg7nOYwf8lanfHMcmhs
         nD1bkYWEOoiAkgEKckn2/hQXv5pLWf9Lk0nC5qantX8kHphaf+lHr0vJ35FS2z1Uk7bW
         f03GOuFxXKYLQj9GEbBsnOewbLA3i7dRAYeHhc0ld+BpmJu61i0x4sMwMf4qmMhe5Fhs
         RwQbJfZwXQa91hlSh1pJ7ECVhThVUvFIn0h8R4Uml2rGN9h+HJKpyFqjBRkO6FBDFBiw
         OYlDuinV57gzwmbAlO8IY3litT1BVbimB4LkqDWF/HXUdwsw8ZlHSfJ/hc/j5ZEE/WkM
         oVXA==
X-Gm-Message-State: AO0yUKXmGfDmO9/kkfiB97I2Pya6OFJKaLgpzH3Kkilg36z9W5QdhVjy
	4pVztVnJlYlwSeIIptaZKK3TpQ==
X-Google-Smtp-Source: AK7set/0PjNNMhMg48I9ruK+nxErAAJX2QK/D8hZmLrkYx7SI2vEk66DRWyhtM1nOMOYCHefMnN4Lw==
X-Received: by 2002:a19:c208:0:b0:4df:9ce8:300 with SMTP id l8-20020a19c208000000b004df9ce80300mr3966975lfc.52.1678194290600;
        Tue, 07 Mar 2023 05:04:50 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:50 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Mar 2023 14:04:47 +0100
Subject: [PATCH v2 05/16] gpio: ath79: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v2-5-d6b0e3f2d991@linaro.org>
References: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
In-Reply-To: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
To: Mun Yew Tham <mun.yew.tham@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jay Fang <f.fangjian@huawei.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
 William Breathitt Gray <william.gray@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: linux-aspeed@lists.ozlabs.org, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert the driver to immutable irq-chip with a bit of
intuition.

Cc: Marc Zyngier <maz@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 3958c6d97639..aa0a954b8392 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -71,6 +71,7 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
+	gpiochip_enable_irq(&ctrl->gc, irqd_to_hwirq(data));
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
@@ -85,6 +86,7 @@ static void ath79_gpio_irq_mask(struct irq_data *data)
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+	gpiochip_disable_irq(&ctrl->gc, irqd_to_hwirq(data));
 }
 
 static void ath79_gpio_irq_enable(struct irq_data *data)
@@ -169,13 +171,15 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 	return 0;
 }
 
-static struct irq_chip ath79_gpio_irqchip = {
+static const struct irq_chip ath79_gpio_irqchip = {
 	.name = "gpio-ath79",
 	.irq_enable = ath79_gpio_irq_enable,
 	.irq_disable = ath79_gpio_irq_disable,
 	.irq_mask = ath79_gpio_irq_mask,
 	.irq_unmask = ath79_gpio_irq_unmask,
 	.irq_set_type = ath79_gpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void ath79_gpio_irq_handler(struct irq_desc *desc)
@@ -274,7 +278,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	/* Optional interrupt setup */
 	if (!np || of_property_read_bool(np, "interrupt-controller")) {
 		girq = &ctrl->gc.irq;
-		girq->chip = &ath79_gpio_irqchip;
+		gpio_irq_chip_set_chip(girq, &ath79_gpio_irqchip);
 		girq->parent_handler = ath79_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),

-- 
2.34.1

