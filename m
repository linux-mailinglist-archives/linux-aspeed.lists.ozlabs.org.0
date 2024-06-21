Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC69579B6
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKQ3lvBz7C1p
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=TD+GfSFp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wmq08T8z3cM2
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:10 +1000 (AEST)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5b5254f9c32so1170882eaf.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007929; x=1719612729; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=so6aBU+eDqnCDSaguZCLxm5y7z6KxLSHynmcPlHhQSc=;
        b=TD+GfSFpcwBipS26ZxKyUoNKFG7zVzzVGsiQcG+wdBs1AOTwhihdlVkyvuHoTfYpD9
         /fDpQcK9PDur0Lp4Z/sw/KifpPIb5Ajd0jtX2O5e8Q/p7JVzVjzgbI87RwssbQO8mJX2
         zLOIM+g3UlZNCqmjAbCweIegWuZNat8ytY/VIkNtIoQzLZTD33sWq+dBIm/nt8eaag4Y
         dlC2J2/oOee90HbaD6WUgmdJOt3C/RCDs8RnwZrUXaG2I6nNsFk6owbgzIiJQNbBFBo9
         v1m+WjaWPjiC94y7XBV8/KYhrqQxuuEIUXs8/OCxGdtX0HKeLgQcwLXwuG8i0vJFOIqn
         IXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007929; x=1719612729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=so6aBU+eDqnCDSaguZCLxm5y7z6KxLSHynmcPlHhQSc=;
        b=QBPr/1N5u1oG1jr0Qxa8w862EXC/20+WbkxBKvc49zmhbz19Os54EalUCN1tluXvtd
         cryNqRJ6YgwnBwdLE9b4CRlH7xppXgOtkreIYFu1kJArznerHLlIJSnstRhUDE4wSdYj
         V4V/tnwkgIDDAG6s3xJ3Fi0O832tWNRDtVv3q9IBzFQqXnBJrh3YRVWEP6J/5IUMU6cJ
         3HO+o8I1pW6cj7o+majSwdLxF7HhooQa4KfAiiW60HHKYrGWFexWdd5tGI4Vhm4xvhPA
         IClxDQclp6hwFXsf57+vzcjRTeRg8LT5qonU3t9a1w7BJ9qqQUykBrfSps3EUI4iJqw+
         Ha/g==
X-Forwarded-Encrypted: i=1; AJvYcCWRLN7sgfphPM6jhWSRWoR639TnrgcWmcn1d1dw+nh/ez5Mkt/c5mps4IGmhzVrlFY7fK5ELYJtnAXgRMRc0GJ5rzh1n6QdVrDulQB9dg==
X-Gm-Message-State: AOJu0YwzsFIoKYw6CSuRwKyc/r6YWrNueLP/nnFV3Prpf8wwmE3qI5T8
	BaBH+7HtdnjIVK2uCnXX+AYOkc/MWwd2dC6okyKFy8ZiDtAvEuCNvBJgLnsoPUQ=
X-Google-Smtp-Source: AGHT+IGCM/8sRsLCLqFNICTMywqS3PsKIuS/B/sed5essCH1YgcxL2TzQancR7MJmS3Wfz2Pkd4FGg==
X-Received: by 2002:a4a:3c5b:0:b0:5bb:294a:cb90 with SMTP id 006d021491bc7-5c1adbf1d68mr9897886eaf.5.1719007928519;
        Fri, 21 Jun 2024 15:12:08 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:08 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 07/10] iio: adc: ti-adc108s102: use devm_regulator_get_enable_read_voltage()
Date: Fri, 21 Jun 2024 17:11:54 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-7-49e50cd0b99a@baylibre.com>
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
 drivers/iio/adc/ti-adc108s102.c | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/iio/adc/ti-adc108s102.c b/drivers/iio/adc/ti-adc108s102.c
index 69fcbbc7e418..9758ac801310 100644
--- a/drivers/iio/adc/ti-adc108s102.c
+++ b/drivers/iio/adc/ti-adc108s102.c
@@ -58,7 +58,6 @@
 
 struct adc108s102_state {
 	struct spi_device		*spi;
-	struct regulator		*reg;
 	u32				va_millivolt;
 	/* SPI transfer used by triggered buffer handler*/
 	struct spi_transfer		ring_xfer;
@@ -216,11 +215,6 @@ static const struct iio_info adc108s102_info = {
 	.update_scan_mode	= &adc108s102_update_scan_mode,
 };
 
-static void adc108s102_reg_disable(void *reg)
-{
-	regulator_disable(reg);
-}
-
 static int adc108s102_probe(struct spi_device *spi)
 {
 	struct adc108s102_state *st;
@@ -236,25 +230,9 @@ static int adc108s102_probe(struct spi_device *spi)
 	if (ACPI_COMPANION(&spi->dev)) {
 		st->va_millivolt = ADC108S102_VA_MV_ACPI_DEFAULT;
 	} else {
-		st->reg = devm_regulator_get(&spi->dev, "vref");
-		if (IS_ERR(st->reg))
-			return PTR_ERR(st->reg);
-
-		ret = regulator_enable(st->reg);
-		if (ret < 0) {
-			dev_err(&spi->dev, "Cannot enable vref regulator\n");
-			return ret;
-		}
-		ret = devm_add_action_or_reset(&spi->dev, adc108s102_reg_disable,
-					       st->reg);
-		if (ret)
-			return ret;
-
-		ret = regulator_get_voltage(st->reg);
-		if (ret < 0) {
-			dev_err(&spi->dev, "vref get voltage failed\n");
-			return ret;
-		}
+		ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
+		if (ret < 0)
+			return dev_err_probe(&spi->dev, ret, "failed get vref voltage\n");
 
 		st->va_millivolt = ret / 1000;
 	}

-- 
2.45.2

