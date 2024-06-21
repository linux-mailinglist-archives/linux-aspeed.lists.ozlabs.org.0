Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCAC9579BB
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKR4M3Kz3blg
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=A00B5gpH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wms24hYz3cGM
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:13 +1000 (AEST)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5c1b27e0a34so1177580eaf.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007931; x=1719612731; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPjR6392Ufeq3m10Ix6LPhMsFgNag95fnEsJNBcmUuQ=;
        b=A00B5gpHH06Ct3AS3lo6+qVYedWMbht7g6Sau9ieUrosq/o/e+lFXOUgmDKbZC0rjN
         gIzmA4ufa7CfhInTvI6Qve6hJQxRvayUlJnse40adlNeIT1MulgFHLTSrrDOwkIjlOGy
         Sc/Bof2x9bQBzHGxlkb3imt3L4+ZkuR0EJvjJU8j9WWn0aOxo9I3pJ//zlzExIBv78r6
         bGjHZ+UeNKySWoYEKeDe/k1L9TP0h1UDXkU4nv0Xk+USzEb5/40c+OlQfruGkvHZsUYo
         7U5MBxKb4fJaQ3DKe5FUqdInkTdN8ZqtRbAypv/HUFevSxOWQkW3jRO192GQbmEK0cgr
         /2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007931; x=1719612731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPjR6392Ufeq3m10Ix6LPhMsFgNag95fnEsJNBcmUuQ=;
        b=Usa/02xhA7J/UHQdfCNp6XFcqftF6Nls5uytLZG/PYwDviyN3/Qs88l2UjsKbN7XuI
         loF3/UlzKoDXT7MRHmKkHKcF2/5dBZwGQFvS/2ooIwNyoUfKMrJIfyuxPo5AQWJ6noJH
         Fpwl3M+iaX69c66r3XzjTfDyW1lwE1J7NqDmn6krzFPlQS9AjIJMmzBlCrjzrmgHoXpL
         v+WWLcevipR9N/DRzMKSGSrHdKUv+b0Pl1CDnkckB2ye99uahkMYNaQak1nPQw0bXGbg
         /gS+TpezsWC+E7Zde1XSowPoWL5GMGSc9QsyR5Aw+Lc3lu+HkkxHkdi0IOIjUOFoMPAM
         Pemw==
X-Forwarded-Encrypted: i=1; AJvYcCXg3PztFdYgoRCdmkRuA7kFnCUsu2qDFuO4SwmlFgsQ03n2D4S+veBSPl4TjaJR1ByJxJ8+F8w0PrIAXrCVsbu5OEHEegClFU9sDusquQ==
X-Gm-Message-State: AOJu0YxMG5fvtQh8IusXOzaPoUt/kyPdwODRrMlMN3knqJAqwFEgdiQ/
	xBmTxb2MeXk4sLGYnv2xmwRZQHrDaZ0WArBsw7Ie8A3LqtHdJ/5Z95Wwfvc5zzJw/D7FUCFhuzr
	M
X-Google-Smtp-Source: AGHT+IEZFPUw/XU0YHoyLTOHieCDVAaUFIHc6OhfOtS4ST7uXP3bkvHoDIBYZQsAHj40tSg6bAcgew==
X-Received: by 2002:a4a:8685:0:b0:5bd:c0b4:cf67 with SMTP id 006d021491bc7-5c1b8b70a84mr8390692eaf.1.1719007931232;
        Fri, 21 Jun 2024 15:12:11 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:10 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 10/10] iio: dac: ad3552r: use devm_regulator_get_enable_read_voltage()
Date: Fri, 21 Jun 2024 17:11:57 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-10-49e50cd0b99a@baylibre.com>
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
Error message is slightly changed since there is only one error return
now.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/dac/ad3552r.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/dac/ad3552r.c b/drivers/iio/dac/ad3552r.c
index ddc6c262f801..bd37d304ca70 100644
--- a/drivers/iio/dac/ad3552r.c
+++ b/drivers/iio/dac/ad3552r.c
@@ -857,15 +857,9 @@ static int ad3552r_configure_custom_gain(struct ad3552r_desc *dac,
 	return 0;
 }
 
-static void ad3552r_reg_disable(void *reg)
-{
-	regulator_disable(reg);
-}
-
 static int ad3552r_configure_device(struct ad3552r_desc *dac)
 {
 	struct device *dev = &dac->spi->dev;
-	struct regulator *vref;
 	int err, cnt = 0, voltage, delta = 100000;
 	u32 vals[2], val, ch;
 
@@ -874,30 +868,16 @@ static int ad3552r_configure_device(struct ad3552r_desc *dac)
 		return dev_err_probe(dev, PTR_ERR(dac->gpio_ldac),
 				     "Error getting gpio ldac");
 
-	vref = devm_regulator_get_optional(dev, "vref");
-	if (IS_ERR(vref)) {
-		if (PTR_ERR(vref) != -ENODEV)
-			return dev_err_probe(dev, PTR_ERR(vref),
-					     "Error getting vref");
+	voltage = devm_regulator_get_enable_read_voltage(dev, "vref");
+	if (voltage < 0 && voltage != -ENODEV)
+		return dev_err_probe(dev, voltage, "Error getting vref voltage\n");
 
+	if (voltage == -ENODEV) {
 		if (device_property_read_bool(dev, "adi,vref-out-en"))
 			val = AD3552R_INTERNAL_VREF_PIN_2P5V;
 		else
 			val = AD3552R_INTERNAL_VREF_PIN_FLOATING;
 	} else {
-		err = regulator_enable(vref);
-		if (err) {
-			dev_err(dev, "Failed to enable external vref supply\n");
-			return err;
-		}
-
-		err = devm_add_action_or_reset(dev, ad3552r_reg_disable, vref);
-		if (err) {
-			regulator_disable(vref);
-			return err;
-		}
-
-		voltage = regulator_get_voltage(vref);
 		if (voltage > 2500000 + delta || voltage < 2500000 - delta) {
 			dev_warn(dev, "vref-supply must be 2.5V");
 			return -EINVAL;

-- 
2.45.2

