Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 993967B629D
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Oct 2023 09:39:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=uV2o6IlO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S08qJ2wTYz3cB6
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Oct 2023 18:39:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=uV2o6IlO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S08q8197bz2yPq
	for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Oct 2023 18:39:46 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50308217223so684450e87.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Oct 2023 00:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696318782; x=1696923582; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3tmSPARAlc4pAu0fx6WWRS8V/BeHfaSNDUWviGGzaOk=;
        b=uV2o6IlOfKYI9s/PKaMjsq7W29U1z5RkLPRQ2j8vgM1NZxTNmMHXnw73Qf/hxRiaqE
         /BntBMkqr6IaXDrGi6gw1f2qPc7zsRIGXGbiTYMRDu3M6etESvr4zQ4SK6XUzU9zzix9
         zf0uNKD+GiTmKbEYXku/kSGO/og5B7bNf7B7g8PsukJdxsPB6QFZM8JHcGfTx/0xiIN6
         1E1pBpjHlH0zu1NrP5Uhe4sGwbzm+J6Z1tYn5oS7AUSAI6otDuDgMvwzSi5ftcOp3ca9
         KQr3Hj/IuwaX2SNqYQi2jYx4pbVrqadomF11BX4EGIKRwIQ54XXC5usjeaTzbBfm/vmw
         4WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696318782; x=1696923582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tmSPARAlc4pAu0fx6WWRS8V/BeHfaSNDUWviGGzaOk=;
        b=iwCANx/kbjNrGkELvI5VTaRnFvvSn6K1RD7R1Pie1atgbFz7iChjaHH0pbMpYABNeN
         Nol4KlcL/szCVP0k1nxBd8ecnFC9vmesZHPWrp3g96XE952KpSeg880vQi8SZntSQOzS
         aR+0LlPrxz7kr+9vCDxZh5vp1FhGLe6MR7zig/DzYsfb00IDZAz9sMCRtQebi8/wxG5n
         kieI59+CqR9VGN6wSEgxI2XLJ6UhJJFzkO44zzZ1rn1FmJL9vNnJbxRY9/btIXUzsF8K
         9rm38SsmcEFGDaqQ+gyr8EVve7IWRraaVAucGe1KeYe8f/9iIL4gVkxHLPH3Q0jqoN9e
         LQVg==
X-Gm-Message-State: AOJu0Yzlvn+E4Zv14U+fUYtt2eqdXzZ6MboCD0jDsPxpgeEOlpeMJHd4
	apxT0P0xw3+gEpyGAewMnAnVqg==
X-Google-Smtp-Source: AGHT+IHvsE0u2jtEjXnhMBmdfrInIMp2SgRhm3O6etKbIOM9cTHyQjMpPOT4GNx3cIxDcZSUH1zWBg==
X-Received: by 2002:a19:644f:0:b0:501:bee7:487b with SMTP id b15-20020a19644f000000b00501bee7487bmr10092366lfj.11.1696318782149;
        Tue, 03 Oct 2023 00:39:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d6843000000b003143867d2ebsm889516wrw.63.2023.10.03.00.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 00:39:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] gpio: aspeed: fix the GPIO number passed to pinctrl_gpio_set_config()
Date: Tue,  3 Oct 2023 09:39:26 +0200
Message-Id: <20231003073926.10771-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

pinctrl_gpio_set_config() expects the GPIO number from the global GPIO
numberspace, not the controller-relative offset, which needs to be added
to the chip base.

Fixes: 5ae4cb94b313 ("gpio: aspeed: Add debounce support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index da33bbbdacb9..58f107194fda 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -973,7 +973,7 @@ static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	else if (param == PIN_CONFIG_BIAS_DISABLE ||
 			param == PIN_CONFIG_BIAS_PULL_DOWN ||
 			param == PIN_CONFIG_DRIVE_STRENGTH)
-		return pinctrl_gpio_set_config(offset, config);
+		return pinctrl_gpio_set_config(chip->base + offset, config);
 	else if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN ||
 			param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
 		/* Return -ENOTSUPP to trigger emulation, as per datasheet */
-- 
2.39.2

