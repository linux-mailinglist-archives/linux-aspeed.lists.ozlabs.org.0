Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA17B6C31
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Oct 2023 16:51:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=eRn16piV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0LPY157cz3cHH
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Oct 2023 01:51:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=eRn16piV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0LPN6XMRz3c7Q
	for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Oct 2023 01:51:35 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso9919285e9.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Oct 2023 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344689; x=1696949489; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdtmVBU6kbuKuNlqmo+NUmCZOtJiKsXYzRDePE/dKQY=;
        b=eRn16piVBbAqAHZa7zO5/l/0q0up0quCwApwbbjHxXXmp73xgmbL0HL6PfwT+3REpr
         5XSjfd+asuw/vdHBr+j3Xzt3H5J+9yj2JBQQllpsHbAEXbGI/3fu2vqhCt1hnOsh1Bhj
         4r4Q9Ck70FMwPMb2fs+fdpoJa8qaAS+wp4PA3EyC2nti2pvoOjFIEjtp620MFRmmEnjE
         fBsw8eDQ09inbuV52uoCgsOFGDLvbC9HhDOCFD5PIMR8jOF0hPKyySeZ2kXwoxQ0Sm2O
         zFVqRTrH2KC0l9QfZQjzriweNEwJifYy3aq96vZ1xFHLoEhpo6yjz1U9XGY2UhLQHPn0
         5JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344689; x=1696949489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdtmVBU6kbuKuNlqmo+NUmCZOtJiKsXYzRDePE/dKQY=;
        b=xG0oBH6GqTI9I19kB0I+joXByBmL2SwQie7AKHY/YErQglLCMiFKmiITwPSSYMNgF+
         499eer5ePIyhZtSH4fAXjW+1l3xo1xpr+U7ZcifsDPMCePGRe2sT8OWj2Q1bDq2aHI9G
         ZA8/zYPEykPiisWTLaDkgi01HAF6lHP38kWxYbQAUFKVFtmUDd1Hf/hOH13prM/NV8iF
         l5jJ97lWu2bTUrtfHRQYhA4RufidzRxLamxQV6HW77/Q9pr5K8lHa6x0UMVQjzrv9e2s
         GCveM7uAROTRN1s+DPX+hfZd+DE3aP29DePeM0ms2dSsBMnwJpGB1NXcGFwxkrBkG0nz
         1e3w==
X-Gm-Message-State: AOJu0YwnSn4YFtvEUIpBLl5ds1YpZhjbp+bjYf8weNXA55FEpQ6e9i6d
	e2LTSr96LEx/YFEmd39UkHaHBg==
X-Google-Smtp-Source: AGHT+IF2Yqjlf5dCLqftkIXWdnHlJncSeaVfR3l4v1vd7ez4EG86XwGi+KzTftAAZ+upVwzbWRH4WA==
X-Received: by 2002:a7b:ce95:0:b0:401:b2c7:349b with SMTP id q21-20020a7bce95000000b00401b2c7349bmr13017389wmj.7.1696344688864;
        Tue, 03 Oct 2023 07:51:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH 08/36] gpio: aspeed: use new pinctrl GPIO helpers
Date: Tue,  3 Oct 2023 16:50:46 +0200
Message-Id: <20231003145114.21637-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
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
Cc: linux-aspeed@lists.ozlabs.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index da33bbbdacb9..d3aa1cfd4ace 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -750,12 +750,12 @@ static int aspeed_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	if (!have_gpio(gpiochip_get_data(chip), offset))
 		return -ENODEV;
 
-	return pinctrl_gpio_request(chip->base + offset);
+	return pinctrl_gpio_request_new(chip, offset);
 }
 
 static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 }
 
 static int usecs_to_cycles(struct aspeed_gpio *gpio, unsigned long usecs,
@@ -973,7 +973,7 @@ static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	else if (param == PIN_CONFIG_BIAS_DISABLE ||
 			param == PIN_CONFIG_BIAS_PULL_DOWN ||
 			param == PIN_CONFIG_DRIVE_STRENGTH)
-		return pinctrl_gpio_set_config(offset, config);
+		return pinctrl_gpio_set_config_new(chip, offset, config);
 	else if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN ||
 			param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
 		/* Return -ENOTSUPP to trigger emulation, as per datasheet */
-- 
2.39.2

