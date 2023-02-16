Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD269901F
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:38:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHVHb0Km4z3cjP
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:38:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GxKGRRhH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GxKGRRhH;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVGW4Q41z3cgv
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:37:23 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id br9so2041980lfb.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0M1pC0INpYl+CXS8Dns9xjvleXqdjGQq3X1BFk3EBQ=;
        b=GxKGRRhHLh6q02DnIHnu5KYNkcTneUuEswYrHE39BakqGtlXzlqP6k5Z/Ibb1xVZ9o
         sB0xYZU81v8ZuuWYlaGGdvr4zOwwG7fYNfQYjgqGAiI9hcWUZjDhymZonSZHfFYD1MCf
         7MoAGMSvd2Lho9OUF223H0CUljPdV+nezQSMRa994BlbFF08qxMbIE1BBMawIkcKo/Ms
         4KzeQW46uYYY6BGTwqTSqIAoe+cFL0mTniS4TRJrylCanR5O//HCZhRE5kSO3SyM/8Rk
         yFQgbkDVnQh5PAp+AdJYIiwgKiH3pXwTP2XtYaUZReVh3IJLUn4eS1MEG9BLNljOMZbP
         CJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0M1pC0INpYl+CXS8Dns9xjvleXqdjGQq3X1BFk3EBQ=;
        b=OcHMF+jzkhsdbz3g6sBZj7zT5mgA5Wy/GKmJskYD1aRWz4xzWF4OwkCxiS5nJ96uir
         0W+y5m1IqM7jhAqPM4AfGR+BUnuXRQ6Q4S6EBB8jHIqbJaYfESIpnmP7vpf8S1sOgyl1
         /n3X9S+lsBfJF95kK54IvDRPwJpsWMxzoaGBSelO0k5rJ3GlNh6coiGV2tIQM5CG78Qe
         EX8CywKG84Uxmb2sp4O8LmciH+5vsQw234ACuTL20qd8FjrK0ESTKW8+bHmvEw9ykCwW
         nOpnDyltvfoKwPSHrYmK7wW9PGr+q4P0ZhmrhFNZeDy6Us85+E7XSMGjIWlGXWFZ8KXV
         u3WA==
X-Gm-Message-State: AO0yUKXcRRLn7ZWCMHablE0g8ppEQ03UyyOKxMvUTKLsX2vVdc6oPupr
	ZcUE2IjJxmD29vaUZHxBYyf79Q==
X-Google-Smtp-Source: AK7set8L107Wug45SX7aDpf2p4wlQiYyYomYtZyXZNZlXQ6SDxaJfLOVPkxsQ3mzBosrSxmlzdyi1g==
X-Received: by 2002:ac2:44ab:0:b0:4d8:8ad1:a05f with SMTP id c11-20020ac244ab000000b004d88ad1a05fmr1234138lfm.48.1676540240506;
        Thu, 16 Feb 2023 01:37:20 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Feb 2023 10:37:14 +0100
Subject: [PATCH 13/17] gpio: max732x: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-13-51a8f224a5d0@linaro.org>
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
 drivers/gpio/gpio-max732x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 68e982cdee73..7f2fde191755 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -351,6 +351,7 @@ static void max732x_irq_mask(struct irq_data *d)
 	struct max732x_chip *chip = gpiochip_get_data(gc);
 
 	chip->irq_mask_cur &= ~(1 << d->hwirq);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void max732x_irq_unmask(struct irq_data *d)
@@ -358,6 +359,7 @@ static void max732x_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct max732x_chip *chip = gpiochip_get_data(gc);
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	chip->irq_mask_cur |= 1 << d->hwirq;
 }
 
@@ -429,7 +431,7 @@ static int max732x_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
-static struct irq_chip max732x_irq_chip = {
+static const struct irq_chip max732x_irq_chip = {
 	.name			= "max732x",
 	.irq_mask		= max732x_irq_mask,
 	.irq_unmask		= max732x_irq_unmask,
@@ -437,6 +439,8 @@ static struct irq_chip max732x_irq_chip = {
 	.irq_bus_sync_unlock	= max732x_irq_bus_sync_unlock,
 	.irq_set_type		= max732x_irq_set_type,
 	.irq_set_wake		= max732x_irq_set_wake,
+	.flags			= IRQCHIP_IMMUTABLE,
+	 GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static uint8_t max732x_irq_pending(struct max732x_chip *chip)
@@ -517,7 +521,7 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 		}
 
 		girq = &chip->gpio_chip.irq;
-		girq->chip = &max732x_irq_chip;
+		gpio_irq_chip_set_chip(girq, &max732x_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;

-- 
2.34.1

