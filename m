Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A009579BA
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKR2vGyz7C4P
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WR5Ys5Ku;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wmr2lVhz3cGM
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:12 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6f977acff19so1206614a34.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007930; x=1719612730; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTLhWXGcYPpFvPhVLNSGQecQSX/f3kZ7bOMANlmHk/s=;
        b=WR5Ys5Kumpi6hmfipc0PyfzlPjOYStYscVUAenaiKJMSkiqpx/JC28lQKJlPa2baqL
         OZCN/mji98VHa9Vo0OAlZOyfTxav9u8lTwCmFKyxyOugL01rwTuVeySxbPfiBaxI0wWE
         4GXipgTlC/Cyi4EBWpc6XUG9ySLpSmaaYIB1On+KKeojAPP/Ph9Eg3E2vFjyyjQrrzr5
         tGS3CGK6PJNDxYIAkPN45E0uwgQNfjpewU/bQuPeFCujSji0dFS8u+G44V4IR9v69Duw
         lzd9SiPi6mECC95OuFqdV5bzmcB7wjcoSwF+zT2HeBRFqkACM/fdh/lflB7S5ODPLhmN
         hKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007930; x=1719612730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTLhWXGcYPpFvPhVLNSGQecQSX/f3kZ7bOMANlmHk/s=;
        b=adVwJ7I4KuBn7z8XFVJrQr1snsgppW2lobx8B5fxmZjZRg/dPj7pYDV25bAODWEBL1
         Cmvy6DBGhXiLfAr3oo08/8EhpPODSnaF8Cgurx8j5QWqhaokTwGICXkoN5OpW0iI+aHk
         W7QEIElGxWN10S5SjThsS/ylYyPpEpSAIJ2X05Km3++5AYWV8H+yaOsl1NhN/ZgBlR+r
         VIXD//l4VnEltH041rhjVC3IlRfbfB4E98cj7Qio6okJpVC/AJ9R2hAWmwf0Zt57XDpI
         giQkyAnLKJIGjvVPjp93Sj2YRH3ZnJ5caQuiXlp/i9heuc0VVtQ3mOWvdw1h1OoPoMGI
         meCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5fKuPR3ThOQqqojSsunw2+wM3JlDf9M5pACb9AkPxzQyXyEyOVALsiYp3MjIdbI1Ps9a9YNB7n1nAly0ScBMPnMwHV3CnvZZOGd6+sg==
X-Gm-Message-State: AOJu0Yw1OApq5def7iEGAox4h+oLw+6shshwKyhwse2qshuUAD2+O44Y
	lD7HZYq6zOZx/KGQ4JxMXEJqGzYPxfS3obQ06wGB/0Ytr7lQ5yoKrEgHuHD7sT0=
X-Google-Smtp-Source: AGHT+IF2SgOBJxuK1mN8+m/jYX05pEOQGH/eglbTypLzjQRP70yZxGSEzwMMU70XpDgEFsNdBCoitQ==
X-Received: by 2002:a05:6830:4121:b0:6fb:d9b0:c17e with SMTP id 46e09a7af769-700767308a6mr11026891a34.35.1719007930440;
        Fri, 21 Jun 2024 15:12:10 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:10 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 09/10] iio: adc: ti-ads8688: drop ads8688_remove()
Date: Fri, 21 Jun 2024 17:11:56 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-9-49e50cd0b99a@baylibre.com>
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

By using a few devm_ functions, we can simplify the driver and remove
the ads8688_remove() function.

spi_set_drvdata() is removed since there are no more callers of
spi_get_drvdata().

Also use dev_err_probe() to simplify error return.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads8688.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/iio/adc/ti-ads8688.c b/drivers/iio/adc/ti-ads8688.c
index fca3032c59d9..7a79f0cebfbf 100644
--- a/drivers/iio/adc/ti-ads8688.c
+++ b/drivers/iio/adc/ti-ads8688.c
@@ -432,8 +432,6 @@ static int ads8688_probe(struct spi_device *spi)
 
 	spi->mode = SPI_MODE_1;
 
-	spi_set_drvdata(spi, indio_dev);
-
 	st->spi = spi;
 
 	indio_dev->name = spi_get_device_id(spi)->name;
@@ -446,30 +444,13 @@ static int ads8688_probe(struct spi_device *spi)
 
 	mutex_init(&st->lock);
 
-	ret = iio_triggered_buffer_setup(indio_dev, NULL, ads8688_trigger_handler, NULL);
-	if (ret < 0) {
-		dev_err(&spi->dev, "iio triggered buffer setup failed\n");
-		return ret;
-	}
-
-	ret = iio_device_register(indio_dev);
-	if (ret)
-		goto err_buffer_cleanup;
-
-	return 0;
-
-err_buffer_cleanup:
-	iio_triggered_buffer_cleanup(indio_dev);
-
-	return ret;
-}
-
-static void ads8688_remove(struct spi_device *spi)
-{
-	struct iio_dev *indio_dev = spi_get_drvdata(spi);
+	ret = devm_iio_triggered_buffer_setup(&spi->dev, indio_dev, NULL,
+					      ads8688_trigger_handler, NULL);
+	if (ret < 0)
+		return dev_err_probe(&spi->dev, ret,
+				     "iio triggered buffer setup failed\n");
 
-	iio_device_unregister(indio_dev);
-	iio_triggered_buffer_cleanup(indio_dev);
+	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
 static const struct spi_device_id ads8688_id[] = {
@@ -492,7 +473,6 @@ static struct spi_driver ads8688_driver = {
 		.of_match_table = ads8688_of_match,
 	},
 	.probe		= ads8688_probe,
-	.remove		= ads8688_remove,
 	.id_table	= ads8688_id,
 };
 module_spi_driver(ads8688_driver);

-- 
2.45.2

