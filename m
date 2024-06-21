Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2B9957965
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJM0FPXz3bkX
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Zj5ST7UV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wmq1BGnz3cRJ
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:09 +1000 (AEST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5b96a78639aso976352eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007925; x=1719612725; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqnA463lWGmo1DkYd27gIKH1c3eeWL6q+1Fm9JrS/t8=;
        b=Zj5ST7UVg5KTMvAgQSnCgHnE0SCk1SlA8a/VD/v91N6GlyCe0RmC8F7UgrO26w+OJl
         6DDUoAy7QrcdL9zbe2EPkQt0hEodHbcsLSQK4qqjLrkQMo6a3Lx85zX1OlJyqS/C2PHQ
         5/53gsiwOVogZbiZra9sijqlK4PaZoqq8PlpvyoCLfXT8uRfcqms6pPNbEG0dKcZ0MXn
         1tkoqW88tDk1cA61Bn3anHTqwVvF9RxHQc1YlYPxvBWP7tI6QN1WzO3XipfLfwnJNzKA
         g3EKnEw/vZEkAZjY7BNv8IMt3f7kf87YV9E8O24NJ2nRqg576yXxMFhXYmDS81SbpCGR
         Rwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007925; x=1719612725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqnA463lWGmo1DkYd27gIKH1c3eeWL6q+1Fm9JrS/t8=;
        b=CkvxwSo28CMU4V+89R/cTFXInWBnky/PnierqbRKkJteCPOvljl0nvY+RYEVoHAvTD
         CyWvO/6lJLhplwOPBvh0Bjw09VamLhs9ENebry8aDl5zPoj5i69lVf9Lrc+3X5QsJ1wq
         nWaMCu/rH1WfABTrs6jOxPtXgPRcPNoUQNj9LRpzLFEW0mga0Y9ileq/Rr3rZj+2A7JA
         /Kf9C+bMWsquomc+QgvOLoQn0x2Char/yykLucv58FG/rQ+WSdSVZx1fzM1xOwNfLin+
         iv2/IGHpbiuZzeEMmHoo+eDfi90Cpp1lqiPyVD4gTnuXeEEbe2hcSXpGsbPasyAJ959J
         Akwg==
X-Forwarded-Encrypted: i=1; AJvYcCVls+jqxg7rNzjGdk+WMnKDQGIPkIiCc4gjF0RJfdL8cU1Jy4Y/7/CVtG22MF7cpBpsrw0cbQdTOSPEuTJrP2WWbHkR/yH6S/Ooh0BRjw==
X-Gm-Message-State: AOJu0YzUcN7V4PYRiHgcy9dVLgBUT/VKVdyCcMXUFFa5aBuEG7jj0g11
	DO1eD49D4Tb9LkPQVLT55mpvowcspQ6/q4vxfy2TWk2XZ2EcS35YRXcPTYk3ibg=
X-Google-Smtp-Source: AGHT+IGyOuPixSMNWTrgJ93EOZnRr5Mc7Ev97HbXaH84J6/Bv30RS8z/PVagDiDtAkY5vq1kH6S7MA==
X-Received: by 2002:a4a:6251:0:b0:5bf:aa53:2de7 with SMTP id 006d021491bc7-5c1adbca083mr9462944eaf.5.1719007925247;
        Fri, 21 Jun 2024 15:12:05 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:04 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 03/10] iio: adc: hx711: remove hx711_remove()
Date: Fri, 21 Jun 2024 17:11:50 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-3-49e50cd0b99a@baylibre.com>
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

By using a few more devm_ functions, we can remove the hx711_remove()
function in the hx711 driver.

platform_set_drvdata() is also removed since there are no more
callers of platform_get_drvdata().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/hx711.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 6efdc971689c..8461b1fe6bad 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -539,43 +539,27 @@ static int hx711_probe(struct platform_device *pdev)
 	hx711_data->data_ready_delay_ns =
 				1000000000 / hx711_data->clock_frequency;
 
-	platform_set_drvdata(pdev, indio_dev);
-
 	indio_dev->name = "hx711";
 	indio_dev->info = &hx711_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = hx711_chan_spec;
 	indio_dev->num_channels = ARRAY_SIZE(hx711_chan_spec);
 
-	ret = iio_triggered_buffer_setup(indio_dev, iio_pollfunc_store_time,
-							hx711_trigger, NULL);
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
+					      iio_pollfunc_store_time,
+					      hx711_trigger, NULL);
 	if (ret < 0) {
 		dev_err(dev, "setup of iio triggered buffer failed\n");
 		return ret;
 	}
 
-	ret = iio_device_register(indio_dev);
+	ret = devm_iio_device_register(dev, indio_dev);
 	if (ret < 0) {
 		dev_err(dev, "Couldn't register the device\n");
-		goto error_buffer;
+		return ret;
 	}
 
 	return 0;
-
-error_buffer:
-	iio_triggered_buffer_cleanup(indio_dev);
-
-	return ret;
-}
-
-static void hx711_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev;
-
-	indio_dev = platform_get_drvdata(pdev);
-
-	iio_device_unregister(indio_dev);
-	iio_triggered_buffer_cleanup(indio_dev);
 }
 
 static const struct of_device_id of_hx711_match[] = {
@@ -587,7 +571,6 @@ MODULE_DEVICE_TABLE(of, of_hx711_match);
 
 static struct platform_driver hx711_driver = {
 	.probe		= hx711_probe,
-	.remove_new	= hx711_remove,
 	.driver		= {
 		.name		= "hx711-gpio",
 		.of_match_table	= of_hx711_match,

-- 
2.45.2

