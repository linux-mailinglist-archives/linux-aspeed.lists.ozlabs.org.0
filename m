Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A569579B9
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKR0xzbz3bjg
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=BicR1gHc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wmq3bT6z3cRy
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:11 +1000 (AEST)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5c1cabcb0c1so1133519eaf.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007929; x=1719612729; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU5eFUTN0Hk2LWl03tYr+7EwkXmonIPdLeN7oZJP5hY=;
        b=BicR1gHcLEZz5JKi+qxiSeSOJ4fP2+DdU0NvZpmW8K0twoz49lVEg2ADZZNdxn1r/K
         jwjjy0Ide60pgyL8VExuiXSIO3WC+NQAYboeMUyYcalflcA9mvJ/al/keVhlEd+j0NBf
         hWBlQeiV7+eceBt5HlfJGyW0+l//LybQo41e896C1Mv5qR/Gb/Fl1l2wENShtwdsolgv
         nUlnLIQsWyW+h73U9nZs5I7H66SpzhpsKB2avhQNC7avIe8O4as1IKEi7rvtmG5+Vj+a
         Q2c0swdWvBhEeFggEZaE+XPzOawSkoBc4upSNQebnpQpfCNUWqUXpazsZeMiSynp6+e5
         LCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007929; x=1719612729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YU5eFUTN0Hk2LWl03tYr+7EwkXmonIPdLeN7oZJP5hY=;
        b=olmde6DEXx1ODqBR8DLssvXzTlTW07AnknRucBGUuNJRtMVgrlf2mamRkVx3SxRLM/
         WIE1/w5ylRV4LXu2exprAoo7uInNx3xVlCIXfE11JnNh2AwAYVMpbgjDl8y4fRUpHv/d
         b4H8De0kJNaj4YFqnjYyWLzRo5Hxg61y7aXe2VtnVRu1QJFo71DhREZvV9UIEmjGRnPi
         DKfMSKH/+wQr4gjrALRDkIWSTaUy0F4hzFgfDNydPuPF3mTu2spaO125oMhTHXs+AggP
         u/zncoGZchxG8RhZ0tJQmTBWWBSe9Hq0uVr0ijmoOJxce0wZ+g6K9ACGnyfG+UoclD1X
         pHRA==
X-Forwarded-Encrypted: i=1; AJvYcCUL7oez2MN/AwjeOP864z9rG7BEahId9gtl6xkvCMlqqdf0U2rune2KCu5BEXKu8h3oPZjR9B4eJrUpYlh1pztHNWdmSRASDcKGSoxhYA==
X-Gm-Message-State: AOJu0YwmtguhUo3CVQz78DC4Yqhokw7ecw/QH8ScSWMoyDr0pv93FE+B
	8tEt7sll5WpcmRbt7eF5k66HrogSmGPuVUNWbPoRowUYrPFDNL0BVZQyxPeF0tg=
X-Google-Smtp-Source: AGHT+IEKaEnaN52GJyDtdHtvEb/BI9UwWkmlr8jo82XfbDm4o52uxvo39sqUISJ/G4+mET8wMIvNRQ==
X-Received: by 2002:a4a:240f:0:b0:5bb:79d:1c6e with SMTP id 006d021491bc7-5c1adc06d8bmr10632688eaf.8.1719007929621;
        Fri, 21 Jun 2024 15:12:09 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 08/10] iio: adc: ti-ads8688: use devm_regulator_get_enable_read_voltage()
Date: Fri, 21 Jun 2024 17:11:55 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-8-49e50cd0b99a@baylibre.com>
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
 drivers/iio/adc/ti-ads8688.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/adc/ti-ads8688.c b/drivers/iio/adc/ti-ads8688.c
index 9440a268a78c..fca3032c59d9 100644
--- a/drivers/iio/adc/ti-ads8688.c
+++ b/drivers/iio/adc/ti-ads8688.c
@@ -65,7 +65,6 @@ struct ads8688_state {
 	struct mutex			lock;
 	const struct ads8688_chip_info	*chip_info;
 	struct spi_device		*spi;
-	struct regulator		*reg;
 	unsigned int			vref_mv;
 	enum ads8688_range		range[8];
 	union {
@@ -423,21 +422,11 @@ static int ads8688_probe(struct spi_device *spi)
 
 	st = iio_priv(indio_dev);
 
-	st->reg = devm_regulator_get_optional(&spi->dev, "vref");
-	if (!IS_ERR(st->reg)) {
-		ret = regulator_enable(st->reg);
-		if (ret)
-			return ret;
-
-		ret = regulator_get_voltage(st->reg);
-		if (ret < 0)
-			goto err_regulator_disable;
+	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
+	if (ret < 0 && ret != -ENODEV)
+		return ret;
 
-		st->vref_mv = ret / 1000;
-	} else {
-		/* Use internal reference */
-		st->vref_mv = ADS8688_VREF_MV;
-	}
+	st->vref_mv = ret == -ENODEV ? ADS8688_VREF_MV : ret / 1000;
 
 	st->chip_info =	&ads8688_chip_info_tbl[spi_get_device_id(spi)->driver_data];
 
@@ -460,7 +449,7 @@ static int ads8688_probe(struct spi_device *spi)
 	ret = iio_triggered_buffer_setup(indio_dev, NULL, ads8688_trigger_handler, NULL);
 	if (ret < 0) {
 		dev_err(&spi->dev, "iio triggered buffer setup failed\n");
-		goto err_regulator_disable;
+		return ret;
 	}
 
 	ret = iio_device_register(indio_dev);
@@ -472,23 +461,15 @@ static int ads8688_probe(struct spi_device *spi)
 err_buffer_cleanup:
 	iio_triggered_buffer_cleanup(indio_dev);
 
-err_regulator_disable:
-	if (!IS_ERR(st->reg))
-		regulator_disable(st->reg);
-
 	return ret;
 }
 
 static void ads8688_remove(struct spi_device *spi)
 {
 	struct iio_dev *indio_dev = spi_get_drvdata(spi);
-	struct ads8688_state *st = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
 	iio_triggered_buffer_cleanup(indio_dev);
-
-	if (!IS_ERR(st->reg))
-		regulator_disable(st->reg);
 }
 
 static const struct spi_device_id ads8688_id[] = {

-- 
2.45.2

