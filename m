Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE486ADFDE
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 14:06:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWG0Z63nSz3cM3
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 00:06:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WoDr9naT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WoDr9naT;
	dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWFzP1GtKz3cMl
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 00:05:04 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id h9so13079191ljq.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Mar 2023 05:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBLzNrziBJousn1yobeY2nHyRl+4RLWPBMZMMzuQhho=;
        b=WoDr9naT88KPAmWtmecnyXyKXIJdxVKHY3fSLJFVbGwG76jmxOMnW1et6daEkqtG8a
         ihRSCVa77byEIL8HXfej//ovzCXo2+wz4tewtmwIYanbdWMiw1u7VZSjs3FvkhLGWAAz
         8bU+ToyGYK5TQqxPFixsNJk3BwPb+xCmOtBb1wfh0vJiixcJpC+jZ6wCUl1pBey1Sfnj
         5O+2O/5WrBnQhSh/+P8FR0PuM04bQvZab0oLWH67mE9DsyTdVwceUHDEC87OzrOq7RJH
         NAeSyLCPgKw2C9ADzYlHWxkINSMPIl1OEVULA0x0k+31OVxFKBls9sFnQoFEVdHaeguW
         1tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBLzNrziBJousn1yobeY2nHyRl+4RLWPBMZMMzuQhho=;
        b=IoQ6qCNYSns5G/L01dOrWhrN1Dif8UndOSXDUvbDjcXOIRUh3+Y+VWC766NM/7Oqyz
         qbg8r4Dqe1SRRA8b70OFGNhqzoWzHez/pO1nkNgDZY3jK2YR9vv9Td0sozOWSTdc/Ts9
         c04Zcq3ff3ThSFcIfZNR/u+VxcLyNucb1XNUWyFc1ySvfziYOIiqUBn7BCtA4uIUYdXO
         GLVV7aD+sn/dcMHoptKKrgEyNV6ovf4ZP0rU+pX88WFCbpxdLwFaYDCSm5HFRs+74Z1G
         ZePZJhJxYYdNsgkt4IlRahSTwoDRPsDeyJY+sGCFbHyCGMsmS2GY76Tuqn0ih0x6yn4c
         hh9A==
X-Gm-Message-State: AO0yUKVNmdw0I/6KXmyM3naqZ+oRV0axSgMwiVBPVXoSzaNfEzwO1pP9
	qp7FuIV3tER3i3rg5TSe3PklJA==
X-Google-Smtp-Source: AK7set9FIRk+D02EpqNXIipxeF+W2c44Rc49IDIGvQg7pSf1+vwkxVbmpAXxb9VPe8SErITD4clMrg==
X-Received: by 2002:a2e:a99b:0:b0:28b:6525:e6b1 with SMTP id x27-20020a2ea99b000000b0028b6525e6b1mr4810829ljq.24.1678194301238;
        Tue, 07 Mar 2023 05:05:01 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:05:00 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Mar 2023 14:04:57 +0100
Subject: [PATCH v2 15/16] gpio: pci-idio-16: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v2-15-d6b0e3f2d991@linaro.org>
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
Acked-by: William Breathitt Gray <william.gray@linaro.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pci-idio-16.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index a86ce748384b..6726c32e31e6 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -107,6 +107,8 @@ static void idio_16_irq_mask(struct irq_data *data)
 
 		raw_spin_unlock_irqrestore(&idio16gpio->lock, flags);
 	}
+
+	gpiochip_disable_irq(chip, irqd_to_hwirq(data));
 }
 
 static void idio_16_irq_unmask(struct irq_data *data)
@@ -117,6 +119,8 @@ static void idio_16_irq_unmask(struct irq_data *data)
 	const unsigned long prev_irq_mask = idio16gpio->irq_mask;
 	unsigned long flags;
 
+	gpiochip_enable_irq(chip, irqd_to_hwirq(data));
+
 	idio16gpio->irq_mask |= mask;
 
 	if (!prev_irq_mask) {
@@ -138,12 +142,14 @@ static int idio_16_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	return 0;
 }
 
-static struct irq_chip idio_16_irqchip = {
+static const struct irq_chip idio_16_irqchip = {
 	.name = "pci-idio-16",
 	.irq_ack = idio_16_irq_ack,
 	.irq_mask = idio_16_irq_mask,
 	.irq_unmask = idio_16_irq_unmask,
-	.irq_set_type = idio_16_irq_set_type
+	.irq_set_type = idio_16_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
@@ -242,7 +248,7 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	idio_16_state_init(&idio16gpio->state);
 
 	girq = &idio16gpio->chip.irq;
-	girq->chip = &idio_16_irqchip;
+	gpio_irq_chip_set_chip(girq, &idio_16_irqchip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;

-- 
2.34.1

