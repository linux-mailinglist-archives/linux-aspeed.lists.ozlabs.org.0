Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E685D3E7
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 10:42:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hL4iuA7J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfrs50C7Cz3dRJ
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:42:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hL4iuA7J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfrrm5kSLz3cVd
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 20:41:44 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6dc8b280155so272461a34.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 01:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708508501; x=1709113301; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+fqIWtBV/T+80XSNaZFcmZX/ftnbYEEAJ0ueKG+0WM=;
        b=hL4iuA7JfYnmbehvPjls8Wkq5MP5biJYOiQh0GHOzbO/RxOuHRbxITavU0WQUdFmL7
         MIJml8IqrPDinVFMVnN2C8ISRBhYjqQGIc1X0REOchUBiS4Q3niRo3+44PZEuo7fDCNe
         zMldJdMOHxaBeDX3UXczknibzdnQ033RAjgNzgrx4zPfWUUQPpf/IjZtA8QqTQ1BQOtp
         8q1pYt4jwTNaEVjkv0YoV/C2c3ZUXHYIRtYk/bMQ3BUtDgmuN1T07pnLuP9cXP+4V9G8
         STGlko7Vc2lsp335OxZsnnf/O6fjr52j64gocEoG7hpxRCfF2Uf3vy4ltlcE5xUh13hR
         oWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508501; x=1709113301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+fqIWtBV/T+80XSNaZFcmZX/ftnbYEEAJ0ueKG+0WM=;
        b=blN0A4i8Gt94S8FbQU4gJscQIa+Hf8gD9r2Bxu/KL5KTtmY0DoBin+8o/xdARMkqRZ
         iPLQ5ZE7odkzshV2KXYqOA24+UxVypcO5eKysts8kWgBYMW/JCyKFs6Qtz70bwD9Fr+X
         QHrbsMdEaKnqhV68nGy8WNwtRSgMBxBbixPR3iVJp0YZH5JIPPosh1eXmncGddQ/rg0I
         b4/dymuj2D+2Qoy/tG2R5NcUtOFk1+NME6Nndn9j4RSsd85npr0C+KI0XfHmoNgbaTQs
         UgJbjPGaIF0/eV9Vzt0yeko4PIm9AvOsWhw0enCJ7rVm+31QnS214BiRSLi28ckUEoMx
         GhUw==
X-Forwarded-Encrypted: i=1; AJvYcCUWGUkWek596LV+WjZS/0zmzpzZSKhWcnZb46+mBbH4ezMNbPaoXCh/Uen7qJAaLXf+g4uB0Tg4cNEQKiEW0ppF3fKew2hQhH6SemWNvw==
X-Gm-Message-State: AOJu0YxDaqgjRFnaL7aplfcQmRTgI35uIAS2TkA19DdXNfbCSNcFlboA
	TmnVSH8Q/6TR8d/NaOA116DoR5t6/K22dw02vmK0tyZ/oLAZZmJW
X-Google-Smtp-Source: AGHT+IF1GoYh7XXEdgap6KD6EGkJ/IAtnwN7zdRfDtlSN78cbe1OxDqtEK1736aeFfZZVDCfAOCrJg==
X-Received: by 2002:a05:6358:7e52:b0:17b:583d:63d9 with SMTP id p18-20020a0563587e5200b0017b583d63d9mr1482811rwm.7.1708508501647;
        Wed, 21 Feb 2024 01:41:41 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id lm4-20020a056a003c8400b006e488553f09sm1645026pfb.81.2024.02.21.01.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:41:40 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] ARM: dts: aspeed: Harma: Add spi-gpio
Date: Wed, 21 Feb 2024 17:39:20 +0800
Message-Id: <20240221093925.2393604-6-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
References: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add spi-gpio for tpm device.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 36aad01dda20..ca3052cce0e0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -28,6 +28,8 @@ aliases {
 		i2c29 = &imux29;
 		i2c30 = &imux30;
 		i2c31 = &imux31;
+
+		spi1 = &spi_gpio;
 	};
 
 	chosen {
@@ -67,6 +69,25 @@ led-2 {
 			gpios = <&gpio0 124 GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	spi_gpio: spi-gpio {
+		status = "okay";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 // HOST BIOS Debug
-- 
2.25.1

