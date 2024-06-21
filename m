Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7FF957964
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJL5ycvz7Bbc
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CpJXgrqU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wmq0RTZz3cQx
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:09 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5bad217c51aso1329285eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007928; x=1719612728; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x480k30HvbgguxGycHu5EFcSQYfeSDwQqt26z/bkWhw=;
        b=CpJXgrqUz50O2Fdw8JE/qy39m1J+6i1oD2zZNAajc+IEzfASraq52WqJNokFi+829/
         RUEbZ1HBWIdM/eAqIWoF4n8oXPAzXKlxBfZ/UqvNGsERKSAQ72rz3mZ9jbSU8O7hNGke
         LzIHplEn0mEvXLgSczH0+yF/sR9NaKgTmwL3wuFIsAUAGodiL9OjLGp7FdzH3jqJTXqC
         ZJYpwewziHdsC3CMjeYXFc7iVQTvVapKDUYNWs/bIUYrVXPvBqotmcjNYpQ4+Sh65PLZ
         FPlUTLOMhASx/p8YdMeR2Klm36ksF3Wa1DpZhKECCe9XtNss5pQGhvhld08sGahGKxie
         rgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007928; x=1719612728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x480k30HvbgguxGycHu5EFcSQYfeSDwQqt26z/bkWhw=;
        b=MAL5SYwkRZQiJZx3a4u95NRH+8hMK8CoNc0lyrWVhWtzsiuR2L9OBPG1YSXvcLCaG9
         UzMCL918pqWEfHpjjgK2I8wmCozV7fr2c2L5vX3x+CKpo7VIH6H+1rV1JWfvcTnLDbNd
         3V2n11cBe+drpJtn8NMsicNO32yKy6DrELlaAIqtB7pHfeBNoeGZmuqxew+OuXoh+lMA
         gib7JjJBM4wdK3klwDU8uMvwWdaRM1Z/pfJYYh7qNIM2oxlQ6CfaH+Pfnx+QnDxtHwcM
         ph9NNm0ijZo70NXWz5DdLte+JG+5HXtKcmXRZ2jZf3mt7P9a0RGqErt9G3dCO3jqom1w
         kxXw==
X-Forwarded-Encrypted: i=1; AJvYcCWu87a8zxajmEIU0B4QdJm9bLe68+fE8us3f4DbYywOlv06cTT5r2VEoy3AcvFWCeF8kgMOnUieIM/lP8j4mdutRvMgRp/9/dzkmABA7g==
X-Gm-Message-State: AOJu0Yy7/vYnAqpAC0XmIXyyBHoyeSfaoM9oZnBwEBegMVtxGDf8fL2y
	SOL2J/WGTUoDZ2oSmumXTG82sHp+z5/pGXUfI+wc59/tJgeAgN+j9NrawL4VO4Q=
X-Google-Smtp-Source: AGHT+IG+VM3BqlCHEFeC4J9E/NMCgNrxfHHKT6M7Y8Cy0YuF/8Q782d8FLdKsjcTjtElrN8SZRNxMQ==
X-Received: by 2002:a4a:3c1e:0:b0:5bd:b100:8ab1 with SMTP id 006d021491bc7-5c1adbeb0e3mr9929583eaf.7.1719007927729;
        Fri, 21 Jun 2024 15:12:07 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:07 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 06/10] iio: adc: max1363: use devm_regulator_get_enable_read_voltage()
Date: Fri, 21 Jun 2024 17:11:53 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-6-49e50cd0b99a@baylibre.com>
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

Use devm_regulator_get_enable_read_voltage() to simplify the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/max1363.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
index 8b5bc96cb9fb..bf4b6dc53fd2 100644
--- a/drivers/iio/adc/max1363.c
+++ b/drivers/iio/adc/max1363.c
@@ -1561,18 +1561,12 @@ static const struct of_device_id max1363_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, max1363_of_match);
 
-static void max1363_reg_disable(void *reg)
-{
-	regulator_disable(reg);
-}
-
 static int max1363_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	int ret;
 	struct max1363_state *st;
 	struct iio_dev *indio_dev;
-	struct regulator *vref;
 
 	indio_dev = devm_iio_device_alloc(&client->dev,
 					  sizeof(struct max1363_state));
@@ -1589,26 +1583,12 @@ static int max1363_probe(struct i2c_client *client)
 	st->chip_info = i2c_get_match_data(client);
 	st->client = client;
 
-	st->vref_uv = st->chip_info->int_vref_mv * 1000;
-	vref = devm_regulator_get_optional(&client->dev, "vref");
-	if (!IS_ERR(vref)) {
-		int vref_uv;
-
-		ret = regulator_enable(vref);
-		if (ret)
-			return ret;
-
-		ret = devm_add_action_or_reset(&client->dev, max1363_reg_disable, vref);
-		if (ret)
-			return ret;
+	ret = devm_regulator_get_enable_read_voltage(&client->dev, "vref");
+	if (ret < 0 && ret != -ENODEV)
+		return ret;
 
-		st->vref = vref;
-		vref_uv = regulator_get_voltage(vref);
-		if (vref_uv <= 0)
-			return -EINVAL;
 
-		st->vref_uv = vref_uv;
-	}
+	st->vref_uv = ret == -ENODEV ? st->chip_info->int_vref_mv * 1000 : ret;
 
 	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		st->send = i2c_master_send;

-- 
2.45.2

