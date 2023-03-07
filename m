Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 125766ADFBD
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 14:05:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWFzs6wrRz3bh9
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 00:05:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SefXo38Q;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SefXo38Q;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWFzB30WTz3cGk
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 00:04:54 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id f18so16985990lfa.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Mar 2023 05:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhXTDSkBpSBmoLnt16h1xxcFV0v4vmTT7mnJI/zNpFI=;
        b=SefXo38QgFexmgMWTApFnWYCQ1D38J1mZxECZRSEWq2DgCPStiPBhN7E0gHFh/oKnO
         a/ctUs9MCxRKx/PwkqBSuaAB9/QSurcpyPlLYRJZRoTDIGaTgrOK/hZQY9Km0isk5eNW
         tufwKDB5XDxiA5gOxd4mKIwwT5bnjIKlugZWVVDZAI2TpZeoTWm3uKyZOPHaVDjhrJfC
         az++FZPBChNabjvBHtcIEGQGaesTb5YHV7pL8kUK0kQZ7fOLQSq3DvGw0XCmrGOaOA9I
         /zR1FzEAt3kDie5OWkpsVikEaTD3X+hsElGVMnrs4J7XEzHTfupYzB0bMTmreCDN4qhI
         GUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhXTDSkBpSBmoLnt16h1xxcFV0v4vmTT7mnJI/zNpFI=;
        b=zEWymroRLc4XaTelWWahNuiAYzENhmVOxAhpHje9BdPVKobMgb787N0CDH2AV0y3n4
         qGmuDPxijgA/v6hBTWu21/LnEGvPsMoxGkDX+sfau3fp79Q6E/pUYvLZj4aR0oMLEMdX
         ikiwOt8gV4uo98C3ZFT7dOlnRF7gLNtnBxYoFYPaNKPlxjpYPfgJWdTilmS6qu/uJdti
         pbzosHtaZ5xRvO+1G4NDEJ1NOf7vKbkx/Ep5MGj/lIqB9IHgtC8xYmGx35Tq//SbahWC
         9HIMzZ0YpqiY74LPDMmxUxh/wIbEmRpLrVheb8w5oDF4rAFLp0TPYFhqmivlXzuI8rmu
         ObWA==
X-Gm-Message-State: AO0yUKWv+GOpxCTaf8jKElAFKqRzuJQDGb7jWYDz3dCkXjA6vI577CiM
	UVWWCv/Oggm5YqgBRGpoxNTHqg==
X-Google-Smtp-Source: AK7set8nsY/rRbAZWm3TfUBvnameO4Ctl8qcGn09Lr/8Fou/gwAjzMt5HC6aZdFoEzU5RDjFzeFs6A==
X-Received: by 2002:a05:6512:4c2:b0:4dd:cbf3:e981 with SMTP id w2-20020a05651204c200b004ddcbf3e981mr3773006lfq.28.1678194293760;
        Tue, 07 Mar 2023 05:04:53 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:53 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Mar 2023 14:04:50 +0100
Subject: [PATCH v2 08/16] gpio: hlwd: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v2-8-d6b0e3f2d991@linaro.org>
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
 drivers/gpio/gpio-hlwd.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index 4e13e937f832..c208ac1c54a6 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 
 /*
@@ -48,7 +49,7 @@
 
 struct hlwd_gpio {
 	struct gpio_chip gpioc;
-	struct irq_chip irqc;
+	struct device *dev;
 	void __iomem *regs;
 	int irq;
 	u32 edge_emulation;
@@ -123,6 +124,7 @@ static void hlwd_gpio_irq_mask(struct irq_data *data)
 	mask &= ~BIT(data->hwirq);
 	iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
 	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
+	gpiochip_disable_irq(&hlwd->gpioc, irqd_to_hwirq(data));
 }
 
 static void hlwd_gpio_irq_unmask(struct irq_data *data)
@@ -132,6 +134,7 @@ static void hlwd_gpio_irq_unmask(struct irq_data *data)
 	unsigned long flags;
 	u32 mask;
 
+	gpiochip_enable_irq(&hlwd->gpioc, irqd_to_hwirq(data));
 	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
 	mask = ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
 	mask |= BIT(data->hwirq);
@@ -202,6 +205,24 @@ static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	return 0;
 }
 
+static void hlwd_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
+{
+	struct hlwd_gpio *hlwd =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+
+	seq_printf(p, dev_name(hlwd->dev));
+}
+
+static const struct irq_chip hlwd_gpio_irq_chip = {
+	.irq_mask = hlwd_gpio_irq_mask,
+	.irq_unmask = hlwd_gpio_irq_unmask,
+	.irq_enable = hlwd_gpio_irq_enable,
+	.irq_set_type = hlwd_gpio_irq_set_type,
+	.irq_print_chip = hlwd_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int hlwd_gpio_probe(struct platform_device *pdev)
 {
 	struct hlwd_gpio *hlwd;
@@ -216,6 +237,8 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(hlwd->regs))
 		return PTR_ERR(hlwd->regs);
 
+	hlwd->dev = &pdev->dev;
+
 	/*
 	 * Claim all GPIOs using the OWNER register. This will not work on
 	 * systems where the AHBPROT memory firewall hasn't been configured to
@@ -259,14 +282,8 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 			return hlwd->irq;
 		}
 
-		hlwd->irqc.name = dev_name(&pdev->dev);
-		hlwd->irqc.irq_mask = hlwd_gpio_irq_mask;
-		hlwd->irqc.irq_unmask = hlwd_gpio_irq_unmask;
-		hlwd->irqc.irq_enable = hlwd_gpio_irq_enable;
-		hlwd->irqc.irq_set_type = hlwd_gpio_irq_set_type;
-
 		girq = &hlwd->gpioc.irq;
-		girq->chip = &hlwd->irqc;
+		gpio_irq_chip_set_chip(girq, &hlwd_gpio_irq_chip);
 		girq->parent_handler = hlwd_gpio_irqhandler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(&pdev->dev, 1,

-- 
2.34.1

