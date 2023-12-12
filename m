Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866E80E542
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:54:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VHEZvKDj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9rH4zvSz3cLL
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:54:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VHEZvKDj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qq75Nyz3c5X
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:31 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2866fe08b32so3730759a91.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367669; x=1702972469; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4mYkdYycHvWmTb171qbHq/sz7aJZKJF/gRqwbu8etE=;
        b=VHEZvKDjqdUuZqjznsymbOefPSoq1nb7Y0pZPqbTwlH0mlS4v5Kp1mXdwOFBSg/LTF
         yCo6aUsF2e8rsdS3j4TFvVcJxQYryFuBMQJ2251BFuIL2arWVAI4JiWfbvT5Gdlyzzwj
         ibEhQZOz83dwJyvek6qlsaG8wViFurvt2wphTOFX/5b35OMSLTisrvHGA3ppC7qnrRpy
         ky2rnMI3y7EHaYfIXcc2P7H+7gDq9QhMtQe9iV2EjH3SXhPOBshCnChcX3/oJ7EpjRBc
         SM8tCx9Qq53tNBG4n6dZ3BqKV0hmft4i2WWX64My1iSSRLvLCno6QJFc4vRDKNkg/gEb
         mqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367669; x=1702972469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4mYkdYycHvWmTb171qbHq/sz7aJZKJF/gRqwbu8etE=;
        b=RMIY5gKgGsFgyJ/+mH3DSd+uRRt/B/4P5eccP4i65PDV5TuJNg2YUFy1SZVNtBQNFu
         j2O0yRaqUmxLrYvrMRaSBfBE3UL7OYBNQyj4vxx5B0iOV5VrhycD8XbluTkZ7NiujhTl
         xr4TUEf38JH2abb3An1HY3vbgzOPpHSTtQYdx+RLuJSw9PG/f8y4coFfTlc6sWH4tXhO
         zffm5/hABzA2xNplcm2LHCf/uJ7wkJBNmvzqosBnAkQPoqVO/2HEX16jihS7awb80h82
         ru6l11k8N85GzwuxbeWa6muB1dik/E8ZQb4RbEwmWyP3+jmOelTB1WgHIIjWHCMPObHB
         497Q==
X-Gm-Message-State: AOJu0YyRB6sOD8Wmo0MgnwZDjhE6AqH5ydzAN1HTrS1a9vjGvb0cvlZ/
	Lfrt8+QS6NhGsxoHdJSZeBQ=
X-Google-Smtp-Source: AGHT+IFhcUk3+zn1WOPec1hfNcGWO7RYN20xNkP0qg6H1/aL9nQaFz6qfkOIai5Ug1sjkeV10C5dHg==
X-Received: by 2002:a17:90a:cb94:b0:286:9cdc:c2e1 with SMTP id a20-20020a17090acb9400b002869cdcc2e1mr2369677pju.13.1702367669434;
        Mon, 11 Dec 2023 23:54:29 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:29 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] ARM: dts: aspeed: minerva: Add led-fan-fault gpio
Date: Tue, 12 Dec 2023 15:51:58 +0800
Message-Id: <20231212075200.983536-10-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
References: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jerry.Lin@quantatw.com, Leslie.Tong@quantatw.com, EasonChen1@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add led-fan-fault gpio pin on the PCA9555 on the i2c bus 0.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-minerva.dts  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index c7445c819baf..090fe2f6b1d8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -39,6 +39,16 @@ iio-hwmon {
 			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
 			<&adc1 2>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-fan-fault {
+			label = "led-fan-fault";
+			gpios = <&leds_gpio 9 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
 };
 
 &uart6 {
@@ -118,6 +128,13 @@ power-monitor@68 {
 		compatible = "adi,ltc2945";
 		reg = <0x68>;
 	};
+
+	leds_gpio: gpio@19 {
+		compatible = "nxp,pca9555";
+		reg = <0x19>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
 };
 
 &i2c1 {
-- 
2.34.1

