Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B863CAFC4E
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 14:16:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T18j1rQ3zF35Z
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 22:16:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jNQhVRyB"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NYR93zy3zDqlV
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2019 16:13:20 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id h195so5994906pfe.5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2019 23:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcvphgpWn7tbDDJiZUCc3MKLcIk2OmmEQ53eSSM6u4w=;
 b=jNQhVRyBcDpvNHDv68xzHndXZuDP2Tf+8P45PkhLYtWd1Axf03Uu2bywcULAhtprhu
 pWhjUsc6c8Qrnq6IyNTkrK8FZQ5PusKpSTPHG0jIwSVGbZv4WgpDkQ7ISPfDWPAbd3Y/
 PColdJktp6/LGSTlwZXBlQbq5QE6cjULI1m1Pi2vqh25fNY57JDpeU1z8IiruHQsGsbi
 U3k4VFvVaY2xF79yiTAGyU1O/tk453hrTMGI1niAB/GTHW+gURn2pKW+djr63fIPdWD5
 RxEm8upNkkx7oldlPwK788cos0dgfZq5C8idLH4sY70NxdFkOMsAYR+HYAkdBlUOLTMw
 z+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcvphgpWn7tbDDJiZUCc3MKLcIk2OmmEQ53eSSM6u4w=;
 b=h3K0YKivdIQNN43/KMoaBl8cF0jAUPn9bJHsRs+mqajvR7Z8w17aM0IB9fJouzvNZ3
 bXsK1ah9XvQvHqqwAKRtjRnUajfQhZlypqZiCZFlJgXsH0SkEraY+ose2qFBW6WqPB6F
 Fvrbv9q+MAy7coRUL95HDLcZDKIT87aTpQU5sUl7C934GvPls0KQBy1oFpa2s3VnvX27
 1DCR3+W/BxwA+QfrIKg1y2BxIpfjdDi9KoBbLUJdbrTz854NAEnBXwXiIgOcP0QUTmli
 KElB4PX7NAp21DCXGOKwsGcfqZ0B4gVnypc4i7nfBwrAjeMSmF+NO2VcT/1qh8pjw81/
 8xuQ==
X-Gm-Message-State: APjAAAXMluXhbajAi9iNbmjd5kfmNKAUeO10HA4ftRlrL43fjKD4Jshv
 NI891BeSuXYqDDxV8+g0tfw=
X-Google-Smtp-Source: APXvYqxRXrLMzZIzNt8qZ4xFJrSVL5VeAjzMYAlRa/+lOm18OY5vsAjxtxnph8GHTQK/X7yZQtwGfg==
X-Received: by 2002:a17:90a:8a94:: with SMTP id
 x20mr3353253pjn.102.1567577597161; 
 Tue, 03 Sep 2019 23:13:17 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id i9sm42443093pgo.46.2019.09.03.23.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 23:13:16 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 bgolaszewski@baylibre.com
Subject: [PATCH 1/4] gpio/aspeed: Fix incorrect number of banks
Date: Wed,  4 Sep 2019 16:12:42 +1000
Message-Id: <20190904061245.30770-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Sep 2019 22:16:16 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9defe25d4721..77752b2624e8 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = -1;
 
 	/* Allocate a cache of the output registers */
-	banks = gpio->config->nr_gpios >> 5;
+	banks = (gpio->config->nr_gpios >> 5) + 1;
 	gpio->dcache = devm_kcalloc(&pdev->dev,
 				    banks, sizeof(u32), GFP_KERNEL);
 	if (!gpio->dcache)
-- 
2.20.1

