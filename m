Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E6698FF6
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:37:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHVGV4dyBz3cfX
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:37:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y2mQvmmU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y2mQvmmU;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVGH2pP3z3cdg
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:37:10 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id b3so2051412lfv.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTDvGM9p1jJCryqrt+aMoXej/NnnEuuvfQsw+EzO32s=;
        b=y2mQvmmUVj3HR0h5kau6zCrKsh4HXqe/j4fug+zGCIRzs7GU3A0y8VkVmN/AnB4t+I
         Rkdjb2Znj4eZUteiBWpj0wCeSBmKzOqWYDccpcouTRnGsszTJVYP+8lwINCQ+u3lx+0I
         PE5VPgdzWxC/djxtmhCEwjGPrMT8ug832gann1eOu+EjyS8Y1Iym3kNGwmDGaOdWCIDe
         UOwuAe5FEW3xV9Ag6i//giVsAR7eWTT4NNz/gv5lpwaH0uIqcNGULCo6FAG41MHbhnNO
         1BMKNh/xGUkN3eFlxy3jMFR3hhNnJ/uspr9BEr3wGz5WDeF7+yJkoOmdUk7xBoP+HKlo
         GUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTDvGM9p1jJCryqrt+aMoXej/NnnEuuvfQsw+EzO32s=;
        b=vT77MU7njUK8pwMg2/8jGkFGN6wS1gJinWIQl9iDsYGUzEjeavDodT/1zBtxyVLpsz
         c3ubobju28dNXNfHdx+3fQAxueL3TfI4ISWmMvmfH7h9q3aZAsksAwigpZSYArT9xheY
         t4CMlEdGkdblYyXBCcTkmutGBRUisQ/ilz0B7BmHrN1FSsa3oSGAoL0KqhnLhGe8tFEh
         8JtpI9zBZbDdqMWfWu2+0G3k7Fn6HSpPShzxL9a5qgLCgOxG3lXYAEIpSRB0TF8ZwAwQ
         jFYFRqxgDUwzwizqkQFGoepyynX+ocMyoRrQSH+x5qiWFjlydpUe+dJWqV53Iy6Za+qA
         i80w==
X-Gm-Message-State: AO0yUKX9xINeu8G4ntSmCzpLPURbTwb3Yf5iaDtWIFO7X2Rvdd/OmyxJ
	UtZqtYT7HZJFMF3c/mAW2TgwQQ==
X-Google-Smtp-Source: AK7set/UuZ3iGPgCIG1LjJxkZdfB0cTOEeTV65m/CJRDE6EpngVKikEyoHCuLAvayFQk+4GEcnqLMw==
X-Received: by 2002:ac2:4c29:0:b0:4b3:d6e1:26bb with SMTP id u9-20020ac24c29000000b004b3d6e126bbmr1460112lfq.29.1676540226776;
        Thu, 16 Feb 2023 01:37:06 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:06 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Feb 2023 10:37:03 +0100
Subject: [PATCH 02/17] gpio: adnp: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-2-51a8f224a5d0@linaro.org>
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
 drivers/gpio/gpio-adnp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index a6439e3daff0..9b01c391efce 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -307,6 +307,7 @@ static void adnp_irq_mask(struct irq_data *d)
 	unsigned int pos = d->hwirq & 7;
 
 	adnp->irq_enable[reg] &= ~BIT(pos);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void adnp_irq_unmask(struct irq_data *d)
@@ -316,6 +317,7 @@ static void adnp_irq_unmask(struct irq_data *d)
 	unsigned int reg = d->hwirq >> adnp->reg_shift;
 	unsigned int pos = d->hwirq & 7;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	adnp->irq_enable[reg] |= BIT(pos);
 }
 
@@ -372,13 +374,15 @@ static void adnp_irq_bus_unlock(struct irq_data *d)
 	mutex_unlock(&adnp->irq_lock);
 }
 
-static struct irq_chip adnp_irq_chip = {
+static const struct irq_chip adnp_irq_chip = {
 	.name = "gpio-adnp",
 	.irq_mask = adnp_irq_mask,
 	.irq_unmask = adnp_irq_unmask,
 	.irq_set_type = adnp_irq_set_type,
 	.irq_bus_lock = adnp_irq_bus_lock,
 	.irq_bus_sync_unlock = adnp_irq_bus_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int adnp_irq_setup(struct adnp *adnp)
@@ -469,7 +473,8 @@ static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios,
 			return err;
 
 		girq = &chip->irq;
-		girq->chip = &adnp_irq_chip;
+		gpio_irq_chip_set_chip(girq, &adnp_irq_chip);
+
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;

-- 
2.34.1

