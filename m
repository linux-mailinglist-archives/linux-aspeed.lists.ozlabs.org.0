Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1AF699019
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:38:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHVHH3Xb5z3cj1
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:38:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hpYsra12;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hpYsra12;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVGQ2W69z3ch3
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:37:18 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id cf42so2054845lfb.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/dqNs4X5iSfka0hfuY27CeHMaWnAeagcVCir2pT8YQ=;
        b=hpYsra128kYFx2qsXrfh3LOEKO6yGW/uOLTCORhMtSVO3vgo6DwnGr9BIOlCH5s+49
         Poe81uVHjs7Oyytay+DDHBWsYiAQNATUXlgS3sRM2xCmP9VPhsw7Ff1X/1DuLTk7ucUW
         q4tapmku1Kr2uCtScROVHgpKaeNcL1Xg/NFiEuTsfaXHi+OQwjZirJ5YMhWbcmEsVt8W
         BrhnpB1QrIJ/ARyO3Jx4l2kPQfYC9XlrUJFZ5q77TBb5XfCeG8EQlD074j4fKbjLd1xg
         d361LgSSUC2iMwYc+A3pFhobQsi448fCHeRjT9NeJ9qVZnQNB78p/rYFbIzTWPpWxNSL
         hTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/dqNs4X5iSfka0hfuY27CeHMaWnAeagcVCir2pT8YQ=;
        b=3q7Jz6ozNaiP5LYQG9yGUYBNJs5H3Z5fkAB2ETTS+pU1f2/RjkBVFk5Qcv2EsEGqnF
         CbEuc4/oVd07oljNfjRkH8kOovjtPjldcx01wDeYPghVZO1cxi2IoyVWNwZH9QxCN9wL
         lWSNMjuR4kQjavzWAJD8yg2ZrPUm75X5VJcAV7Etp4NQ+C9QGusXjK2vvbzMLx8ca9yb
         eh9Jkp/uGAXFOUYnhEa3mZeH6Ar3+RZqlUFPJfFB/F6/QBN89MnfvLmESfrISF/gsCPZ
         n8qkRc0BjUVZ9LhTcM5kdS6s5tmDBt9T7zGtDd4i/Q+bSgBRKNuLOZ2CgqB4TVxiTadd
         1F4Q==
X-Gm-Message-State: AO0yUKUdYEr8cpm/w6HTACmhe5plGDvbdyY7IHCAX0JyIu29HSAh9phC
	WROXpYuf1kyQ4bwOF2IlbFXozg==
X-Google-Smtp-Source: AK7set9tZ/hHDovw7frWdWaQFE8ree2ICLok1KVoOoKyyw1NNiJGuOUD5bPWUjtxjfKcVpE/bPYzTA==
X-Received: by 2002:ac2:52ab:0:b0:4dc:4d75:9b73 with SMTP id r11-20020ac252ab000000b004dc4d759b73mr844030lfm.40.1676540235123;
        Thu, 16 Feb 2023 01:37:15 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Feb 2023 10:37:10 +0100
Subject: [PATCH 09/17] gpio: hlwd: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-9-51a8f224a5d0@linaro.org>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
In-Reply-To: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
To: Mun Yew Tham <mun.yew.tham@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jay Fang <f.fangjian@huawei.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
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

