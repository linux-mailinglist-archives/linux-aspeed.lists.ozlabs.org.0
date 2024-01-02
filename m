Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1178F821706
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 05:48:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=POzk4v+O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T40jF5WW5z3cSQ
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 15:48:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=POzk4v+O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T40g61K6Wz3bn8
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Jan 2024 15:46:26 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-28c075ad8e7so6445431a91.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Jan 2024 20:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704170785; x=1704775585; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfJIsodrpZIIAMpybgAC7qz4iEokdxJ5UnhS1fS4za0=;
        b=POzk4v+OBAD6S5jjVL1tjZScU4AdgxPXwW8qwNtG3h4VpmGdpTc9+jDCnWl5mVvzy4
         fvgKAC5d++tioq57XrsxukWwkSocuWrMpTijgKNf3lEk8Kr0bOo2H+U4fB46qum0HCpN
         RmCurBQNv5fuE73tWSaOjOf5wSInHbHuQKcLdZ7vhWmxSGKDRy8JlSwPTIqLLyYTCt7U
         7t3yH+8rLDmcXZXfXl52ojM3GQ/gXWyr+kPLjB/34EWNHxsn1jraznCKQ1GZ93awKqSr
         uAyQnhnefN4+Tc9UMlO1JGFdXSBFoY+R00G0HwlSzp3KsW6JOctMwvc9WJseshQppXMl
         dpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704170785; x=1704775585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfJIsodrpZIIAMpybgAC7qz4iEokdxJ5UnhS1fS4za0=;
        b=wKDOKrcW+HQKrl+V+tzVsZsLj3FS3kbw2ChNlzEGVKAMeaSE/jA+b6BRHgkQD9BjuX
         ImpJ1E867lLy8fjnW01VBfGUxy4kXU45rm4oKraBnfqpwx447QFXuPGfuXlUaKTzuWc8
         oIqa8PPc7Rm3WrvxBtkvIR5j4fbUM7A3aFZuTO3bYubvzbm7N/SxSZdV+C7EZwV7m9hU
         3qUZpaEYXvHmXvokDnqqT2wBKBTKPHP9B3XmIY8QC14mIDmY/lsW+A/2Km//CtWIk4Z4
         +Tz+dS21HWi07HG49oNvtVbJVB2Y/XmCn2tdw5p40/AU57x0MLrgY/a0vc4MPyRUPKCD
         1bZg==
X-Gm-Message-State: AOJu0YyZarEQ6VrIthz3IL3lkL6pixmsy2fctV73Uk1SritLCggqAW1V
	couZ24k7MnUP7stiBNSREBI=
X-Google-Smtp-Source: AGHT+IHqRXcCWjxv7N4EPqiNsAsagi/uGM9jN5nqeDXbh3ZChgvTzpXvqFuFgkHctP21eOphDhuWJQ==
X-Received: by 2002:a17:90b:1b41:b0:28c:2e37:bd97 with SMTP id nv1-20020a17090b1b4100b0028c2e37bd97mr7354431pjb.80.1704170784753;
        Mon, 01 Jan 2024 20:46:24 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090abf9500b0028c2b2b76c0sm17308392pjs.22.2024.01.01.20.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:46:24 -0800 (PST)
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
Subject: [PATCH v1 5/5] ARM: dts: aspeed: Harma: Add spi-gpio
Date: Tue,  2 Jan 2024 12:44:09 +0800
Message-Id: <20240102044409.3810873-6-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
References: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
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
index 36aad01dda20..25ae044cd176 100644
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
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 // HOST BIOS Debug
-- 
2.25.1

