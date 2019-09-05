Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC38A97E7
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 03:16:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P2pZ0TWtzDqx6
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 11:16:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rfio1YTO"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P2pS6cj7zDqS4
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 11:16:48 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 205so584656pfw.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 18:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOasyZt6sdsNwBn8Gt+vfPwKrru431DH9AuzyGk0MuE=;
 b=Rfio1YTOgo6pg+zve3gTIxmDdPAyguIP5ao4mD3EW1H3R3pwjr/wjhxDn0mTuBoLDb
 jhkvz2jscbKJ83LdJFeb7QPvgQhC6+fpObLqg4NgUA9c7jsFm2LIixt+nnSoWHrZ16Jp
 SbXQiJHsCdwbl9tWrbitPt95fQyxPOnAOBeAgasuMLFSE2zmTK/LtD4/1YuX+jb+NBdf
 vxaCY1HEU2SAvrt+GoBj1klUkN5hJpGfk4sZQRk6OT3mJL7H0BFF8GEsNSxvn8nlcO5h
 tATs6goGtXHeV6kAGYx0Myl/2uRjs2WWqd+9wLX3SDbN53fZVqqgVRNDWXe2TCeI9GXy
 KYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOasyZt6sdsNwBn8Gt+vfPwKrru431DH9AuzyGk0MuE=;
 b=HnM9fOXty49UxF2ut1pJcdg3TZJ2+TcCHdw4UmM5PsaOiok8sMmPVb8WUyrEBHqD62
 fvD9jrL9rRCSvc+kiL9sAAETQbtLk4XwWuX3NgwMuKBaclNzi6e2LeS5WT7bu+t5R5dR
 LCV4st7M405K2ouxoyqs7rK+VjG9k3g15hsLSb14t8HKEwgQfbV7FuHsYwTNWtZZS3ci
 XKujGL9uPuSSTYZEnIxx8ssTjvGs+IqW7Ha2mBFztNJNVNoCl388sZYwatW5pqTfhz/m
 PGCK2TLkpiDnFoEw2xoJcAzjmz7itWlsZvuQmwsRFUq4EYzN2vu9qb6fTPElgt6xDIeD
 VDdw==
X-Gm-Message-State: APjAAAXkIv+DATDIREJ0yOELqH+HjlMXSmAtU94xiHa0BJT1FI2yd45m
 DwRAoHmCuzv4k/zgnHXFkMY=
X-Google-Smtp-Source: APXvYqzTX/4P+wtUjwav6k/1/i7Nh0oj0E26EmN9zScuJ0JIlRTGuq0FjCWnfFgRvHJ73C7n7rDdow==
X-Received: by 2002:a17:90a:350:: with SMTP id
 16mr1054780pjf.110.1567646206375; 
 Wed, 04 Sep 2019 18:16:46 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id v27sm329968pgn.76.2019.09.04.18.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 18:16:45 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v2 1/4] gpio/aspeed: Fix incorrect number of banks
Date: Thu,  5 Sep 2019 11:16:35 +1000
Message-Id: <20190905011635.15902-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The current calculation for the number of GPIO banks is only correct if
the number of GPIOs is a multiple of 32 (if there were 31 GPIOs we would
currently say there are 0 banks, which is incorrect).

Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9defe25d4721..b83e23aecd18 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = -1;
 
 	/* Allocate a cache of the output registers */
-	banks = gpio->config->nr_gpios >> 5;
+	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
 	gpio->dcache = devm_kcalloc(&pdev->dev,
 				    banks, sizeof(u32), GFP_KERNEL);
 	if (!gpio->dcache)
-- 
2.20.1

