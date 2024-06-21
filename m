Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EE59579B5
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKQ26w5z3cYb
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=zlL/tZl4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wmp6yytz3cGY
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:08 +1000 (AEST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5c1acd482e4so1366651eaf.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007926; x=1719612726; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PD+YDF/bIrSJ5as8z+S1ghdz1Anzvn+XbfX57fqHPgE=;
        b=zlL/tZl4R6j9xXD0MqsWhUIo3uYXfXqKbAqqT5RpEe9c3vf/srS0ds/nOHK79eDkJ+
         fxZsFT/BS9S8YADawalmU4W4n8DbI1u5/Dg5+I+7QW0WGhMW5W088cyUE2YTkY2n6T44
         CuRQRvm+shqG5gMQEaQDJEBKaHV2aSosxMmiHZK1/xo221W0gpYV7fNislCOZZvrYTAz
         HoCqKScbvk0EMwZhsNTeC5zSX5Vu+nvQq8QeaAeawg2BY5UDMlRlmxfn4rZvu+f4lU2y
         HPJ0tkihGSP768LxVfmP/jX+nmqLVJVWr6g/Dwp2YCGs6XPxrb1rWzm8ovNiAecmjLph
         0i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007926; x=1719612726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PD+YDF/bIrSJ5as8z+S1ghdz1Anzvn+XbfX57fqHPgE=;
        b=FTxErVMIJuYH6kmYloVO3V3r9dBG33dLD7H5cg9goQ4+xOCGfeXCdjWSnw5rOStrhi
         1mmphIIxCqVFV6nt/1Rm7VQblN05qWd8p1Q/umtLmEM7ivR0hzc1YsoWDlpLM3dYZ+Lr
         GEAq8hscjskK19FaPKrkG/FJWSbcfoBFFFFbDcQbrNjwnAJzfZrUvmlwZs8JbKaDmEeu
         CzNHpaCT8Ws8P/k1je0LlSuGwzwtHo5TwrZa76jfPAiF+nbVzSNtyOdI7ckmgk9motbM
         +DzuCmy6qT4diz4OxStDrXJEtbw7iNIkusJZA69KCOb8MoyHLof1tlgIPJgLBYP0g/tm
         QbwA==
X-Forwarded-Encrypted: i=1; AJvYcCXuAugR+HZYa01MKMToKaks1I2HqNUlopwRKLkMPwBkhg3k+UJX+TWUGCMfZnqd4gTX85epXeBa9hxkSSf99lh2JLJx8/lixjd9sFe4Eg==
X-Gm-Message-State: AOJu0YwQgiTz37AgqO+RIxvnpZpG/fhyeDrSjzstGzkNl4gt+GwrEng9
	Cz5yMUXiLOinHMUW5MH8Y5CxrdQvzzpWJAaee26paZYD5rxNmd2Ei6gl5Z92cZ4=
X-Google-Smtp-Source: AGHT+IG8VExe3m+Cltyn4mwfelEWS/KdStFcap+oMybDTEkuUDcJh0MBpt38tdnWmKzNqDCnxsogbA==
X-Received: by 2002:a4a:dcd7:0:b0:5ba:ffcb:c756 with SMTP id 006d021491bc7-5c1b8b70a91mr8440535eaf.1.1719007926083;
        Fri, 21 Jun 2024 15:12:06 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:05 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 04/10] iio: adc: hx711: use dev_err_probe()
Date: Fri, 21 Jun 2024 17:11:51 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-4-49e50cd0b99a@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621-iio-regulator-refactor-round-2-v1-0-49e50cd0b99a@baylibre.com>
References: <20240621-iio-regulator-refactor-round-2-v1-0-49e50cd0b99a@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: David Lechner <dlechner@baylibre.com>, linux-aspeed@lists.ozlabs.org, Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, Andreas Klinger <ak@it-klinger.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use dev_err_probe() to simplify error returns in the probe function.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/hx711.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 8461b1fe6bad..b3372ccff7d5 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -464,10 +464,8 @@ static int hx711_probe(struct platform_device *pdev)
 	int i;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(struct hx711_data));
-	if (!indio_dev) {
-		dev_err(dev, "failed to allocate IIO device\n");
-		return -ENOMEM;
-	}
+	if (!indio_dev)
+		return dev_err_probe(dev, -ENOMEM, "failed to allocate IIO device\n");
 
 	hx711_data = iio_priv(indio_dev);
 	hx711_data->dev = dev;
@@ -479,22 +477,18 @@ static int hx711_probe(struct platform_device *pdev)
 	 * in the driver it is an output
 	 */
 	hx711_data->gpiod_pd_sck = devm_gpiod_get(dev, "sck", GPIOD_OUT_LOW);
-	if (IS_ERR(hx711_data->gpiod_pd_sck)) {
-		dev_err(dev, "failed to get sck-gpiod: err=%ld\n",
-					PTR_ERR(hx711_data->gpiod_pd_sck));
-		return PTR_ERR(hx711_data->gpiod_pd_sck);
-	}
+	if (IS_ERR(hx711_data->gpiod_pd_sck))
+		return dev_err_probe(dev, PTR_ERR(hx711_data->gpiod_pd_sck),
+				     "failed to get sck-gpiod\n");
 
 	/*
 	 * DOUT stands for serial data output of HX711
 	 * for the driver it is an input
 	 */
 	hx711_data->gpiod_dout = devm_gpiod_get(dev, "dout", GPIOD_IN);
-	if (IS_ERR(hx711_data->gpiod_dout)) {
-		dev_err(dev, "failed to get dout-gpiod: err=%ld\n",
-					PTR_ERR(hx711_data->gpiod_dout));
-		return PTR_ERR(hx711_data->gpiod_dout);
-	}
+	if (IS_ERR(hx711_data->gpiod_dout))
+		return dev_err_probe(dev, PTR_ERR(hx711_data->gpiod_dout),
+				     "failed to get dout-gpiod\n");
 
 	ret = devm_regulator_get_enable_read_voltage(dev, "avdd");
 	if (ret < 0)
@@ -548,16 +542,13 @@ static int hx711_probe(struct platform_device *pdev)
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
 					      iio_pollfunc_store_time,
 					      hx711_trigger, NULL);
-	if (ret < 0) {
-		dev_err(dev, "setup of iio triggered buffer failed\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "setup of iio triggered buffer failed\n");
 
 	ret = devm_iio_device_register(dev, indio_dev);
-	if (ret < 0) {
-		dev_err(dev, "Couldn't register the device\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Couldn't register the device\n");
 
 	return 0;
 }

-- 
2.45.2

