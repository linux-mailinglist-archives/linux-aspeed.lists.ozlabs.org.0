Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1CA6B1CA6
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 08:46:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXLpc2kB4z3cM3
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 18:46:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LVaYC1uH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LVaYC1uH;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXLpL2hRNz3cDp
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 18:46:01 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id bi9so1173724lfb.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 23:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpj9iowK+fUp1eAd8JepT37zZC9XqDcnhD9hDARq2kU=;
        b=LVaYC1uHViSwQIwTtsQWwAe1lesXk5XAH+m8tsANxNLm8ZWQySYOnlqMTMrkgBKHra
         ZoCgaS0jAuZ1G56TqbjxcqO3X25zia57NoBxjobuvRccmpHolykoWf3Uuz/O2AM3orAc
         R93oTD3v95aaf560IINvCe7rMhHRRfBu1W81pMz1AzIkhqH1834ztCHpnxG05AF2zj3Q
         3n5BGjk7AgkSLSfuM7woK+BYozB6up/xzXd5+t684HJB8NNv3jvusxR1F6r4tbggUbxq
         i7D46OqOvnbcFXjLQ4xHc9ZEigur2mB6ShJazmvrLGp1nFo3OPSnf7e3bBhW8594CZE0
         msHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpj9iowK+fUp1eAd8JepT37zZC9XqDcnhD9hDARq2kU=;
        b=GN9Bh1PeoFC9VgtYNrsrM5aDDErsvnGXLyo1psMrxBP0eNQ768/JQdEX1IHu234bvN
         tcprmUZbiiS/Uc49dtnUbeefcvBY0uGCZzD/zFA5Cs8330keX6TWvHt9L9t4v6TlgtLu
         Y+yt5M68VovIp/vBy2Uc2s2gs+hJenR0Nx28foV972WOst9NcGmpkdEWEdneYFK1wjmo
         LGRtDeKUN5EDnb6dyzw5+d9YkqsNdN28nZyX75pi5ngTnAHYBiM86KzF4AQ41XtgZ/dR
         eFE8hny3/lxRwmv1JoeUmIjK/FcslTdD69K+hNQKO6heWIg78sU/hDjxx012XuNAYBTF
         VOvA==
X-Gm-Message-State: AO0yUKUhZrakzhZlzAKE2FMVfRap9fm+j1ynxYxNm/B4S0LFXcVLwdlD
	0t1sxblrO74gbVCzBoZdcjHhfQ==
X-Google-Smtp-Source: AK7set9jsf2WuGRz5LxAt7KqAy7iY8/0PXQZmq2Fb+Muy+D+yzkuBpmFzh1g/bSrLlMG71qOdJif9Q==
X-Received: by 2002:ac2:55ac:0:b0:4cc:a107:82f4 with SMTP id y12-20020ac255ac000000b004cca10782f4mr5734632lfg.64.1678347957440;
        Wed, 08 Mar 2023 23:45:57 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:45:57 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 09 Mar 2023 08:45:50 +0100
Subject: [PATCH v3 02/17] gpio: adnp: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-2-972542092a77@linaro.org>
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
Acked-by: Marc Zyngier <maz@kernel.org>
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

