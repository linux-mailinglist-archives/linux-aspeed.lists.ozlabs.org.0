Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E827699026
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:38:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHVHm1whCz3cjJ
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:38:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qKMWDE0s;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qKMWDE0s;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVGZ2N5Sz3f4C
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:37:26 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id br9so2042223lfb.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HayiibrRJAE6+zZp+nCHddL7slKdhuxnPg1rl6oYz5s=;
        b=qKMWDE0s9gCjjzGUaa5+s3tvuBsUkE0qi/wuilD+whMwslm0svnZJI11oI/ANtCxyr
         tSezoe6cs/9PgRpGaEWw5TJvkt45RTEGNEPpeFcPvOqah64RIlnu6RsN5xtcWBQr7LsJ
         ETwh4QmDtDbJsqq+XjvUwu+/vMfzuLqNffr2Na9YHlJYZRg8NTKW+fINpDylckBgZncY
         umEZRSCcHJALCB06rFriNrL6zi8U6X2EzPf+Tvoyi/6V9ZgADxxaAYL9t6f6rBU/YemE
         XaN7iI5wHh8DmB9z6z9umaK8nn6hTUeR5bpcIGHk2zE1GMESh73345f8DvJmiAMHdUeF
         ZI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HayiibrRJAE6+zZp+nCHddL7slKdhuxnPg1rl6oYz5s=;
        b=FNAW8+z35kxP3jK1bn5mVPa7/PocrhTtoRTTbNWgk82WD4jQ8GJ5JT2WeW4ygyqXfe
         y3rQwujeRil1Pa4ASKo4e73Ix4oMy7zs6bTOlJMnPQEvGZ32oQHxTfNb7fZKadFWf94g
         rhKUPrPQ2pvZ+HMnATVqFq7NVkV5PINhCXPWSHu+CJuUMxEqwSrwMT9hF5X8Yjkkr+9B
         MuE+MAkLeCJAXpEPIVNECWzvhIulzlGpP6ATddwKLXPEGH9dSIB40+a2rXXYDiwquMWB
         XD7T/xpr49Z7iERMHgIY1ChYprUMV55Dsr4yGiVSoHCkq9ykwOSOgL9lmqfuFBKzgoEG
         PFrQ==
X-Gm-Message-State: AO0yUKUPzc28qB4EBZyzoyvZjltafdn9lF9WkLJBk3snyiAIssqo1baB
	LXaVhIp15rmFUFkICubuoSHnzA==
X-Google-Smtp-Source: AK7set9mJ54fVQopM5T/C3b/5InJm9ineYC8yOOFm5D6dwmMqRFJZHeuUywp8DfZxXwnhCAoox4kEg==
X-Received: by 2002:ac2:53aa:0:b0:4a4:68b7:d621 with SMTP id j10-20020ac253aa000000b004a468b7d621mr1410066lfh.8.1676540245705;
        Thu, 16 Feb 2023 01:37:25 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:25 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Feb 2023 10:37:17 +0100
Subject: [PATCH 16/17] gpio: pci-idio-16: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-16-51a8f224a5d0@linaro.org>
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

