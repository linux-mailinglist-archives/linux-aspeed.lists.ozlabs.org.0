Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B96B1CD5
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 08:47:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXLqy6hXVz3cLB
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 18:47:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hfYUvbEJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hfYUvbEJ;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXLpd3yJBz3cHG
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 18:46:17 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id a32so933620ljq.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 23:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ycp1fOFRcqnvrXtuAswlNcdj2NkXI8qjDu7ztULp4g=;
        b=hfYUvbEJ/fIs0adm48Nn43F1+/5O7YPhYpEpE/GRRX2ZWZh6Gq+yCigTRjTLV/SkXN
         EpZ/VQupisd3fsrS7/H/gCFUoMeX5JGZkvaZ7xtzK4gRVZZ2UmkBx9v5BfV5eY5PQy3b
         sePtBA87IWZ8Ux7FBFpZ3wTFqe67boz1z867/kDMzJfoX82TaPRyMaelqKdFTikiOM8f
         rvPfgXQXjKPcVm9VeRxRb7H+zXL989U9EAzlfR2uqXTYXvu98NBxaLBdDuUmo7+Pilld
         0o3IRXZp5dLbQpnnOVuSp/qIX+2Ys07bLCdGkAgj0vbmtMvdKNe58z8YxfFQTFgwozP1
         Nw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ycp1fOFRcqnvrXtuAswlNcdj2NkXI8qjDu7ztULp4g=;
        b=pOMtgar7fTdX0EA/7ejWq66D4yRkd6AAT6IscIXvQfh6fP546roHgyTE26ofUANXWK
         4Y3/n9zf3sM5NETLvXcsFGR2OXvQgq5Nkev5gX0lcYtnyCMdq7G8rzqJSVCxeewl7jwL
         K8cJHyR4Vdwd1ZNA4BQaGSS3tYqL5W+n3yAsE3ELbUS6nR/KUW7amHZpgA/gBHNJjMzu
         UTnOEIvBUySEppFvs8nRU6KKQcOSSw56pqwR9Qn5JOuFeh/ULAc3ngO0hUel8TumTR/g
         FH4hVH6kw9LxuTx0pquzrhxq/GeIef2KeDUN9aId00R+B4bZpAUAJFty9Mb32PsoGnJd
         slSQ==
X-Gm-Message-State: AO0yUKV8s3GQ3EQm34+cupDPh6N129h3VB9Bgoyl4oeXiXcLnpHnKYGW
	zalGpAuoPuf9iF/0RtVEDjbTgA==
X-Google-Smtp-Source: AK7set+Rry5lPtiW93AZhDxq/Tyl/szlfsTGucmnPsQNNXqvYn6WiEk2+814+u0pUuLqnBF+Evuqnw==
X-Received: by 2002:a05:651c:88:b0:293:3dd6:89a4 with SMTP id 8-20020a05651c008800b002933dd689a4mr6194273ljq.34.1678347973846;
        Wed, 08 Mar 2023 23:46:13 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:46:13 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 09 Mar 2023 08:46:05 +0100
Subject: [PATCH v3 17/17] gpio: pcie-idio-24: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-17-972542092a77@linaro.org>
References: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
In-Reply-To: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
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
 drivers/gpio/gpio-pcie-idio-24.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 8a9b98fa418f..ac42150f4009 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -396,6 +396,8 @@ static void idio_24_irq_mask(struct irq_data *data)
 	}
 
 	raw_spin_unlock_irqrestore(&idio24gpio->lock, flags);
+
+	gpiochip_disable_irq(chip, irqd_to_hwirq(data));
 }
 
 static void idio_24_irq_unmask(struct irq_data *data)
@@ -408,6 +410,8 @@ static void idio_24_irq_unmask(struct irq_data *data)
 	const unsigned long bank_offset = bit_offset / 8;
 	unsigned char cos_enable_state;
 
+	gpiochip_enable_irq(chip, irqd_to_hwirq(data));
+
 	raw_spin_lock_irqsave(&idio24gpio->lock, flags);
 
 	prev_irq_mask = idio24gpio->irq_mask >> bank_offset * 8;
@@ -437,12 +441,14 @@ static int idio_24_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	return 0;
 }
 
-static struct irq_chip idio_24_irqchip = {
+static const struct irq_chip idio_24_irqchip = {
 	.name = "pcie-idio-24",
 	.irq_ack = idio_24_irq_ack,
 	.irq_mask = idio_24_irq_mask,
 	.irq_unmask = idio_24_irq_unmask,
-	.irq_set_type = idio_24_irq_set_type
+	.irq_set_type = idio_24_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t idio_24_irq_handler(int irq, void *dev_id)
@@ -535,7 +541,7 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	idio24gpio->chip.set_multiple = idio_24_gpio_set_multiple;
 
 	girq = &idio24gpio->chip.irq;
-	girq->chip = &idio_24_irqchip;
+	gpio_irq_chip_set_chip(girq, &idio_24_irqchip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;

-- 
2.34.1

