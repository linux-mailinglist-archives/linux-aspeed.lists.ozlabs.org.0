Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8B19579B3
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKP6WQGz7Byd
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=06ocrBth;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wmq0LRxz3cQm
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:09 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6fa11ac8695so1447754a34.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007927; x=1719612727; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VHcpSCSl+z9MULQ1sxanESbfc3kKx/Z7jY5Xhv+4kU=;
        b=06ocrBthlSA6K+zgM6RRv0R9+iMwsG1DijWAwpb6+gr1hVGKEFHaqVipXwE5JjcvcB
         hg5j6TVwYvq9vjX7zPg52Ux6OitYaLib1jFOl6psAyFtM+kuY/9dPYRpAhLnxq5YAZ+g
         zdsSbb+GZ+AqYT1oHfyALTq23sAVfiUaJ/qb2Y4TSaHh0wIy/L2e0CfmfBiwKp4A+HvR
         PYE0pyNmyMo3gxCiLNuWVVsuHO8Nt4rwjmjRleRDpBDRIdAjyA+wNQKzWcwl9TdPBdQn
         GKI1M1X3DHmy/WYSzvhATrfLsCP9uMiYusiA+t+ElzJBkHFUa5+Zgyv7pUr8l65TGbCj
         mFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007927; x=1719612727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VHcpSCSl+z9MULQ1sxanESbfc3kKx/Z7jY5Xhv+4kU=;
        b=IRlbDPj1BV/V56a+2WM2E8b4QveBJ0BfZQIvlOx84J8eANgbCl/4PoHyAzHfN1exSe
         9YrsRdHa5Y7gFB2DM84h9LJSJVN45KWpTnQoCBfoyIWGeA+Ic7IpffS93tpfnaZ3XEBg
         w4Jj9f4I7VEAYhPuK1gyjnQEMD69ZlMMG4pO15/bubAPo9Fnk0d1ykQnsMSFj9jL9xaF
         0X9SHGTlTIYeyQ+AhC4u4XKzdoXfWbYuSmEZ3oRAdAOztZ5O01z1Z5C0h9HidD1rT/4J
         3XY3IYRlI6k3kCDbWwzK0b7aG60rUSCZT/g1nle96gNi12Ya1q2AoudsWahDfXcfIxdL
         jzjw==
X-Forwarded-Encrypted: i=1; AJvYcCUajf/Ttl6i25KSP0ImXA4dvzm75kdJvmQIjeXegpfvYCE/eXjC+4VTipLOiYIN48QKRmLWh66lhnfL3mdz8i1tlz3oQ0OZoZ6f1QBeOg==
X-Gm-Message-State: AOJu0Yz2cz6NLIHi5xNb9D5wiePuy0QB5oIfwPTNoPa6NN/ZY0S5KjQG
	eJY8EQes4VBgic/cfsaRjquDpgNFvU6hx6RVWUjy1m/IO4t6llbVmKSnNGrKA1k=
X-Google-Smtp-Source: AGHT+IH97rOzv+89TB95LIhCbolye0EdHa9Rc661ctJrvuPP++dIiPj9NzWl+Xc/RagwgCrSd0GJLg==
X-Received: by 2002:a9d:7404:0:b0:6f9:7919:a33a with SMTP id 46e09a7af769-7007401b178mr10452707a34.19.1719007926913;
        Fri, 21 Jun 2024 15:12:06 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 05/10] iio: adc: ltc2309: use devm_regulator_get_enable_read_voltage()
Date: Fri, 21 Jun 2024 17:11:52 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-5-49e50cd0b99a@baylibre.com>
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
Error message is changed since there is only one error return now.
LTC2309_INTERNAL_REF_MV macro is added to make the internal reference
voltage value self-documenting.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ltc2309.c | 43 ++++++-------------------------------------
 1 file changed, 6 insertions(+), 37 deletions(-)

diff --git a/drivers/iio/adc/ltc2309.c b/drivers/iio/adc/ltc2309.c
index 8b3a89c1b840..888a71454070 100644
--- a/drivers/iio/adc/ltc2309.c
+++ b/drivers/iio/adc/ltc2309.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/consumer.h>
 
 #define LTC2309_ADC_RESOLUTION	12
+#define LTC2309_INTERNAL_REF_MV 4096
 
 #define LTC2309_DIN_CH_MASK	GENMASK(7, 4)
 #define LTC2309_DIN_SDN		BIT(7)
@@ -29,14 +30,12 @@
  * struct ltc2309 - internal device data structure
  * @dev:	Device reference
  * @client:	I2C reference
- * @vref:	External reference source
  * @lock:	Lock to serialize data access
  * @vref_mv:	Internal voltage reference
  */
 struct ltc2309 {
 	struct device		*dev;
 	struct i2c_client	*client;
-	struct regulator	*vref;
 	struct mutex		lock; /* serialize data access */
 	int			vref_mv;
 };
@@ -157,11 +156,6 @@ static const struct iio_info ltc2309_info = {
 	.read_raw = ltc2309_read_raw,
 };
 
-static void ltc2309_regulator_disable(void *regulator)
-{
-	regulator_disable(regulator);
-}
-
 static int ltc2309_probe(struct i2c_client *client)
 {
 	struct iio_dev *indio_dev;
@@ -175,7 +169,6 @@ static int ltc2309_probe(struct i2c_client *client)
 	ltc2309 = iio_priv(indio_dev);
 	ltc2309->dev = &indio_dev->dev;
 	ltc2309->client = client;
-	ltc2309->vref_mv = 4096; /* Default to the internal ref */
 
 	indio_dev->name = "ltc2309";
 	indio_dev->modes = INDIO_DIRECT_MODE;
@@ -183,36 +176,12 @@ static int ltc2309_probe(struct i2c_client *client)
 	indio_dev->num_channels = ARRAY_SIZE(ltc2309_channels);
 	indio_dev->info = &ltc2309_info;
 
-	ltc2309->vref = devm_regulator_get_optional(&client->dev, "vref");
-	if (IS_ERR(ltc2309->vref)) {
-		ret = PTR_ERR(ltc2309->vref);
-		if (ret == -ENODEV)
-			ltc2309->vref = NULL;
-		else
-			return ret;
-	}
+	ret = devm_regulator_get_enable_read_voltage(&client->dev, "vref");
+	if (ret < 0 && ret != -ENODEV)
+		return dev_err_probe(ltc2309->dev, ret,
+				     "failed to get vref voltage\n");
 
-	if (ltc2309->vref) {
-		ret = regulator_enable(ltc2309->vref);
-		if (ret)
-			return dev_err_probe(ltc2309->dev, ret,
-					     "failed to enable vref\n");
-
-		ret = devm_add_action_or_reset(ltc2309->dev,
-					       ltc2309_regulator_disable,
-					       ltc2309->vref);
-		if (ret) {
-			return dev_err_probe(ltc2309->dev, ret,
-					     "failed to add regulator_disable action: %d\n",
-					     ret);
-		}
-
-		ret = regulator_get_voltage(ltc2309->vref);
-		if (ret < 0)
-			return ret;
-
-		ltc2309->vref_mv = ret / 1000;
-	}
+	ltc2309->vref_mv = ret == -ENODEV ? LTC2309_INTERNAL_REF_MV : ret / 1000;
 
 	mutex_init(&ltc2309->lock);
 

-- 
2.45.2

