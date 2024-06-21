Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB49579B8
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKQ6dMrz3cfg
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tg4NTKVF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wmp6rqsz3cGM
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:08 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5b5254f9c32so1170850eaf.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007924; x=1719612724; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cA2vZ5H4zhrRVMGC41BbSeo0sgv1/DHDpLqlssCbQtI=;
        b=tg4NTKVFaQNKgDEQjccZDm2CUrBREoqmXybqX+Uzeb9KbLBZPbItsdmb5V11FLmfte
         RtDEAJAvPpGFRtTsvTJkvJ0weZX9IzcM/YtlYFTEtkd8xkrEAwONgCqX0bMWV5qd9HEH
         FBZlpGCx9SBAX08whsWNvqiwh++9lfIO5GVoNB5lo+9DGyJ95WTYC7oJpGSAz836p3NJ
         ZfslKNbcAx1FltFf4dIBS+vxagfPJNExxTdK9NAm6OUKTkNv+4ZXrLbnynfvPUuIFVKZ
         sHy5jqRQQ1LFrq8rOtneGlSfDG4znZFkc1QvzavXusO6gA03+R7JmQufrWyNGIKVsDCc
         7YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007924; x=1719612724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cA2vZ5H4zhrRVMGC41BbSeo0sgv1/DHDpLqlssCbQtI=;
        b=WPHW1ebHC81+RUQ/c/Vv3b3fEbJt50zXo6wpILffWgCjKQ7ouKLRQFi/xHlJSKBUpX
         eu0VwI81JlpvSMggvPX9Azb/Uj9WAEyh42YJ5sUQmajjAFK0cMEL2PPrQrQZkfLd4h43
         C/zGlG+uneeTlm9C4homMQ80q2EfDAWiN8pEs5HR6YI3aO7UfoGdpozyf7UkpuhdHU1v
         rj8BUVzyqPQR5rbQRVePzi8+8nhJ7twZby8SjeaVq6vvIUtGKz/u83O03Q4AFoF45sfm
         h6JbJ+yGnXhBqHvo+FJ/JDet3KFTWtbBgObq9ziqUKUVqGdxUqFw1O5bq2vEQDjvy8AH
         uCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiHrnpqYHiKgrlm/+xV2+32zoR385LoyBYgQ8XET5zNd/44Zlc61yNE+a5AGKVJfkAXtDPYs/6O7jSHPryTN6OmxEzmmnU7PdfEU5EgA==
X-Gm-Message-State: AOJu0YyaVPr0QNazOouo9nxGv25Uv+5zaDirnrZbf/881Nvs0woX7j0O
	K9QWVj+xYFxzUIJHy6GjapPsYzZERsjc0cTiO2Ny/WufRO4kPKJYu/nna3+FbbQ=
X-Google-Smtp-Source: AGHT+IGPEjYzZuYy0PUyybo/Jr5W5tkGRhnX5VFZ0jGpJucieHOIXpFu0GRrOvhhGuVkoDgVWKm7XQ==
X-Received: by 2002:a4a:7619:0:b0:5bb:288:e955 with SMTP id 006d021491bc7-5c1adc6fb4emr9863944eaf.8.1719007924414;
        Fri, 21 Jun 2024 15:12:04 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:04 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 02/10] iio: adc: hx711: use devm_regulator_get_enable_read_voltage()
Date: Fri, 21 Jun 2024 17:11:49 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-2-49e50cd0b99a@baylibre.com>
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

Use the devm_regulator_get_enable_read_voltage() helper to simplify the
code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/hx711.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index fef97c1d226a..6efdc971689c 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -80,7 +80,6 @@ struct hx711_data {
 	struct device		*dev;
 	struct gpio_desc	*gpiod_pd_sck;
 	struct gpio_desc	*gpiod_dout;
-	struct regulator	*reg_avdd;
 	int			gain_set;	/* gain set on device */
 	int			gain_chan_a;	/* gain for channel A */
 	struct mutex		lock;
@@ -497,11 +496,7 @@ static int hx711_probe(struct platform_device *pdev)
 		return PTR_ERR(hx711_data->gpiod_dout);
 	}
 
-	hx711_data->reg_avdd = devm_regulator_get(dev, "avdd");
-	if (IS_ERR(hx711_data->reg_avdd))
-		return PTR_ERR(hx711_data->reg_avdd);
-
-	ret = regulator_enable(hx711_data->reg_avdd);
+	ret = devm_regulator_get_enable_read_voltage(dev, "avdd");
 	if (ret < 0)
 		return ret;
 
@@ -517,9 +512,6 @@ static int hx711_probe(struct platform_device *pdev)
 	 * approximately to fit into a 32 bit number:
 	 * 1 LSB = (AVDD * 100) / GAIN / 1678 [10^-9 mV]
 	 */
-	ret = regulator_get_voltage(hx711_data->reg_avdd);
-	if (ret < 0)
-		goto error_regulator;
 
 	/* we need 10^-9 mV */
 	ret *= 100;
@@ -559,7 +551,7 @@ static int hx711_probe(struct platform_device *pdev)
 							hx711_trigger, NULL);
 	if (ret < 0) {
 		dev_err(dev, "setup of iio triggered buffer failed\n");
-		goto error_regulator;
+		return ret;
 	}
 
 	ret = iio_device_register(indio_dev);
@@ -573,25 +565,17 @@ static int hx711_probe(struct platform_device *pdev)
 error_buffer:
 	iio_triggered_buffer_cleanup(indio_dev);
 
-error_regulator:
-	regulator_disable(hx711_data->reg_avdd);
-
 	return ret;
 }
 
 static void hx711_remove(struct platform_device *pdev)
 {
-	struct hx711_data *hx711_data;
 	struct iio_dev *indio_dev;
 
 	indio_dev = platform_get_drvdata(pdev);
-	hx711_data = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
-
 	iio_triggered_buffer_cleanup(indio_dev);
-
-	regulator_disable(hx711_data->reg_avdd);
 }
 
 static const struct of_device_id of_hx711_match[] = {

-- 
2.45.2

