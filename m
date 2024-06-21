Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FCC9579B4
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKQ0pp2z7C0P
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=LBeCihzM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wmq0Ps3z3cQs
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:08 +1000 (AEST)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5ba33b08550so1134561eaf.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007923; x=1719612723; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVRdFKhvRMw+/o8IRTEZqQPsLylWpccjPYBus1uBROU=;
        b=LBeCihzMaAbYz9nRrmt/y404wv5MZXpK4wR/5UoQrm4lYitpEC2U+RDwJa38mczWQE
         bpLjMju2NN/M116a+9YfldHf/MwVFIlp7JscihmRXWYh3JK0pHGDo21lRjHYL8ggZHIK
         Dj0MJzMQ2lJAnCwK1QTrPML9U5l9nk3G0W12QcA+nX5BOVdi4jbNarvdMg6yS2o/B51i
         RXH6iZXNG9Efa0738h2as4ZE/H034xAfSA2wu0JQl+vistZDGGLCVEFtG00CwyKtJNDQ
         uPSDuY0bkT7xgvOzE9Knfuyfu8ax5F2/o1nbmg7bXWQhOjmOklXJqLlAZJZWVtFFlTVU
         4F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007923; x=1719612723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVRdFKhvRMw+/o8IRTEZqQPsLylWpccjPYBus1uBROU=;
        b=JI4Rrs7uSRJZ7SGU36nWb1KlON3wkacjcgKtq9/puGtNHTI/L3JMTRGNGJg/IS/UV7
         o2Agv/SXrfwpvh6Wq2v5tjG96PFiqaHmQsFmmLStCAwalIx0KoEs7ui3Ad9ghXDvIOo4
         Ko9iVFnGCPiBdgM/F0TqdbolvpvXcvdd/kjOQpTrlw8OmJ/n0PiXHZsgSWfB7QQWs4K6
         Rme1asQf/ChXCP9zdW8REBs+NZ0SusnB1zby07AFnHqUuV72cLCoBqD09wyI9ImOlql3
         PLPpyWwxdzvQOCzZ9PT+/p9L3yEnjaKD4wQMt4Nf+EEkDjgHTs2sRcle+LLP9wFUhdjx
         9u4g==
X-Forwarded-Encrypted: i=1; AJvYcCWTI0FqFWX1ed0oplSyDIVy4zAfYkZ/+RDb/UTUAdxh2Y3ySTnXh2cf2Mgw3k4p9rVUGtcsKRke3vi+/r867q8F9EtZ9GxtRo9QjftxdQ==
X-Gm-Message-State: AOJu0YyEsCYgvPpMW2R/XC9oAVEqJ/uv6VAoy1236WBxW97YGTczHM4+
	1FViVKb7gBZhcoW/eS+1rNVyxhW9656SzAo039TXxYtl8bUOySbnnFSlbEK/xl8=
X-Google-Smtp-Source: AGHT+IEAf590qHVXQF6WIVmoewi4OMSB/t6gCupkb1CE8LPyqCFfpCApy+8JHvS/R19jM823AhGK8A==
X-Received: by 2002:a4a:ea0a:0:b0:5c1:b998:a861 with SMTP id 006d021491bc7-5c1b998a905mr8204856eaf.5.1719007923356;
        Fri, 21 Jun 2024 15:12:03 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:03 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 01/10] iio: adc: aspeed_adc: use devm_regulator_get_enable_read_voltage()
Date: Fri, 21 Jun 2024 17:11:48 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-1-49e50cd0b99a@baylibre.com>
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

This makes use of the devm_regulator_get_enable_read_voltage() helper
function to simplify the code.

The error return is moved closer to the function call to make it easier
to follow the logic. And a few blank lines are added for readability.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/aspeed_adc.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 998e8bcc06e1..090416c0d622 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -108,7 +108,6 @@ struct adc_gain {
 struct aspeed_adc_data {
 	struct device		*dev;
 	const struct aspeed_adc_model_data *model_data;
-	struct regulator	*regulator;
 	void __iomem		*base;
 	spinlock_t		clk_lock;
 	struct clk_hw		*fixed_div_clk;
@@ -404,13 +403,6 @@ static void aspeed_adc_power_down(void *data)
 	       priv_data->base + ASPEED_REG_ENGINE_CONTROL);
 }
 
-static void aspeed_adc_reg_disable(void *data)
-{
-	struct regulator *reg = data;
-
-	regulator_disable(reg);
-}
-
 static int aspeed_adc_vref_config(struct iio_dev *indio_dev)
 {
 	struct aspeed_adc_data *data = iio_priv(indio_dev);
@@ -423,18 +415,14 @@ static int aspeed_adc_vref_config(struct iio_dev *indio_dev)
 	}
 	adc_engine_control_reg_val =
 		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
-	data->regulator = devm_regulator_get_optional(data->dev, "vref");
-	if (!IS_ERR(data->regulator)) {
-		ret = regulator_enable(data->regulator);
-		if (ret)
-			return ret;
-		ret = devm_add_action_or_reset(
-			data->dev, aspeed_adc_reg_disable, data->regulator);
-		if (ret)
-			return ret;
-		data->vref_mv = regulator_get_voltage(data->regulator);
-		/* Conversion from uV to mV */
-		data->vref_mv /= 1000;
+
+	ret = devm_regulator_get_enable_read_voltage(data->dev, "vref");
+	if (ret < 0 && ret != -ENODEV)
+		return ret;
+
+	if (ret != -ENODEV) {
+		data->vref_mv = ret / 1000;
+
 		if ((data->vref_mv >= 1550) && (data->vref_mv <= 2700))
 			writel(adc_engine_control_reg_val |
 				FIELD_PREP(
@@ -453,8 +441,6 @@ static int aspeed_adc_vref_config(struct iio_dev *indio_dev)
 			return -EOPNOTSUPP;
 		}
 	} else {
-		if (PTR_ERR(data->regulator) != -ENODEV)
-			return PTR_ERR(data->regulator);
 		data->vref_mv = 2500000;
 		of_property_read_u32(data->dev->of_node,
 				     "aspeed,int-vref-microvolt",

-- 
2.45.2

