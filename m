Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B84210248
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jul 2020 05:01:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xQwP0CYZzDqnv
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jul 2020 13:01:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i6qIjUTN; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xQw92hW5zDqlD
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Jul 2020 13:00:56 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id q15so20783276wmj.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jun 2020 20:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r4FITRNPzoi7E+hue9JzjyaTaq1hky+n+G+/btPnRfI=;
 b=i6qIjUTNFxzbNAizwgneQ+Io9p3VzWLc0aojRuLi6gbt1UrbD6ueMDefILr66k+Ua7
 RrWp7VceNPMSWUsvIOmu5WWD6UoRA/pPp8CZmOqUwEa8fYISQ1vDyQ1djGGDIjtCOqbE
 c+WZ44GH3lSjHPPUY8LxeGPDUpLn4ORaT43qk18uZLSuHiccfuJdIMfagHMSKDyFZpbr
 kzQmPt7saSuLZchsKlMDnm8OVO980c5r1sV8baewHmfJ2QMqpdu8B5Y+maEGngoWvBub
 ZIcHRqaxset7QUcpt0m+VFTVlZn3BE39zAgMeRs3OheSRcoiimQCvgtFHe9p3NjxaOv0
 wXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=r4FITRNPzoi7E+hue9JzjyaTaq1hky+n+G+/btPnRfI=;
 b=NFDWAz8uUgKHxKfW6VHlSpiO63/BBFQ9LYfquYTQFMJ2ipnXnMQdbAbtay18odBT7n
 /0x5ssWmk9WcisaplyqJx1stU2DGzWRUFqUSPn3+CzYW02G6+ADJD1sfQmbLCyw5FyiJ
 iip9yszas1O0IS+yNCjn9z6Qp0uVk3radHtgPmVw8mudKw5FffV3ftKwLCi0HpNhDO13
 gamUuo26Iyw40LIMVTdayMJ62A3rdAfkGWS163SD66Xd0kbB6QGV4F16FPGu+6ysuS8j
 FiSHcMQfEVzjbPHeKvCOdig3QcFRHhYBDxBf8MmfSYCVWyChgqxnoviQ3drbvkGlD7qq
 GoAA==
X-Gm-Message-State: AOAM532kSKtC/39ezXLOqE3lUaij6VUOGHUJsGMT5ig3cdZuhl3A5fjd
 j4MuUbmf1ZLU4m5215s6f3Y=
X-Google-Smtp-Source: ABdhPJy/PfXS0TfxMhqYWbtqHG0GX+7dmC/JgofQQtsaFE9LbHywkjkpYaVTYjwgU8269m1oK17z8w==
X-Received: by 2002:a1c:544f:: with SMTP id p15mr23515461wmi.84.1593572452482; 
 Tue, 30 Jun 2020 20:00:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id u65sm5424796wmg.5.2020.06.30.20.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 20:00:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: aspeed: Improve debug output
Date: Wed,  1 Jul 2020 12:30:39 +0930
Message-Id: <20200701030039.2834418-1-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
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
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Andrew Jeffery <andrew@aj.id.au>

We need to iterate over each pin in a group for a function and
disable higher priority mux configurations on the pin before finally
muxing the relevant function's signal. With the current debug output it
is hard to track what register output is relevant to which operation, so
break up the actions in the debug output by providing some more context.

Before:

    [    5.446656] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: request pin 37 (B26) for 1e780000.gpio:341
    [    5.447377] Want SCU414[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.447854] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.448340] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000

After:

    [    5.298053] Muxing pin 37 for GPIO
    [    5.298294] Disabling signal NRI4 for NRI4
    [    5.298593] Want SCU414[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.298983] Disabling signal RGMII4RXD1 for RGMII4
    [    5.299309] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.299694] Disabling signal RMII4RXD1 for RMII4
    [    5.300014] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.300396] Enabling signal GPIOE5 for GPIOE5
    [    5.300687] Muxed pin 37 as GPIOE5

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index b625a657171e..53f3f8aec695 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -76,6 +76,9 @@ static int aspeed_sig_expr_enable(struct aspeed_pinmux_data *ctx,
 {
 	int ret;
 
+	pr_debug("Enabling signal %s for %s\n", expr->signal,
+		 expr->function);
+
 	ret = aspeed_sig_expr_eval(ctx, expr, true);
 	if (ret < 0)
 		return ret;
@@ -91,6 +94,9 @@ static int aspeed_sig_expr_disable(struct aspeed_pinmux_data *ctx,
 {
 	int ret;
 
+	pr_debug("Disabling signal %s for %s\n", expr->signal,
+		 expr->function);
+
 	ret = aspeed_sig_expr_eval(ctx, expr, true);
 	if (ret < 0)
 		return ret;
@@ -229,7 +235,7 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		const struct aspeed_sig_expr **funcs;
 		const struct aspeed_sig_expr ***prios;
 
-		pr_debug("Muxing pin %d for %s\n", pin, pfunc->name);
+		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
 
 		if (!pdesc)
 			return -EINVAL;
@@ -269,6 +275,9 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		ret = aspeed_sig_expr_enable(&pdata->pinmux, expr);
 		if (ret)
 			return ret;
+
+		pr_debug("Muxed pin %s as %s for %s\n", pdesc->name, expr->signal,
+			 expr->function);
 	}
 
 	return 0;
@@ -317,6 +326,8 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 	if (!prios)
 		return -ENXIO;
 
+	pr_debug("Muxing pin %s for GPIO\n", pdesc->name);
+
 	/* Disable any functions of higher priority than GPIO */
 	while ((funcs = *prios)) {
 		if (aspeed_gpio_in_exprs(funcs))
@@ -346,14 +357,22 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 	 * lowest-priority signal type. As such it has no associated
 	 * expression.
 	 */
-	if (!expr)
+	if (!expr) {
+		pr_debug("Muxed pin %s as GPIO\n", pdesc->name);
 		return 0;
+	}
 
 	/*
 	 * If GPIO is not the lowest priority signal type, assume there is only
 	 * one expression defined to enable the GPIO function
 	 */
-	return aspeed_sig_expr_enable(&pdata->pinmux, expr);
+	ret = aspeed_sig_expr_enable(&pdata->pinmux, expr);
+	if (ret)
+		return ret;
+
+	pr_debug("Muxed pin %s as %s\n", pdesc->name, expr->signal);
+
+	return 0;
 }
 
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-- 
2.27.0

