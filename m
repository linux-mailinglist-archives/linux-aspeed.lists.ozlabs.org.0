Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C87BC8300DC
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jan 2024 08:56:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y5PCJtVk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFJ9r13GFz3bcJ
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jan 2024 18:56:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y5PCJtVk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFJ9X0Wnyz300v
	for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Jan 2024 18:56:30 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5534dcfdd61so18921308a12.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Jan 2024 23:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705478183; x=1706082983; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FNavL/OTqrT8QuQmqYgzyRhF/X5aNJJnuSYES95gWA=;
        b=y5PCJtVkkSDmtrfHq2FkaH2Bsn9lrX0jLY7MPgdEHgPE/mdhtK0oKIe/OTBjEn7FUO
         CEnbT+2uuhjfyRpP1b8AkAJFD+1d1/Kp4Dw5S6o5bjqmO3PdJOfl9mPxeMABllNKVquo
         V2r2ALl/pPj3EdPXXjXCGIQO0xkEfYduJsb5jxuncfquB4CpOmaZeHglhX7qNayDx2uI
         3aMG3cWmc1bqr1AJTAtBvK4UTvNzOSfAAdlu1kWUVHedm4tCdF2Nk6C53DmDAFmx2Lyo
         wtdq5TWe6H32aDteQpmxYsMYvVZIvg5SNC/ZMDPAN+l4yAmYK4oyc0GoV7a+9sSGiwTK
         93Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705478183; x=1706082983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FNavL/OTqrT8QuQmqYgzyRhF/X5aNJJnuSYES95gWA=;
        b=aVbXP/nuP0ZIUsbQoDaqJdhyxEd9NRFvo/U8nGKBTazT3vP1tqAKJfYw3JVDSFvZm1
         9BYHwabPMmyY0JhPTvng9aiMSH8gFoA4QLS4AMowGDSAYXg8zuYlrSgyWCaKOMrwY3Gi
         k/UQSzGBpDACx93NrchetZcV5WV/wcNpH76FRkyB8Y68JBiG6ARKlV3uMr3qNo77tHWj
         4pIm6DNtGGt116KFSZ4wV3iiv454SmJ3tFuqAcdKQz+k2tdAR7d2/sZWiicLATOuyfbv
         X4ykP25sdMOrpGneeDI3Ny9CAjIn4E93X4Cdsff8Xa/WCLYmTO2j8gvpUvjt6za7BdXe
         Z89A==
X-Gm-Message-State: AOJu0YzN+prREn62JiyTt1+asVk3fXvlGUoc0HGuV2bFf+xMOgNo3kWB
	Kn2H7P6PwNTVn2uH+irMncUvijyD+HtBXYDlttxruOqeSqz+jXUfcvIVgh3ZcxU=
X-Google-Smtp-Source: AGHT+IHZ7LpNoKqKOFo0lwT6GfpvlUHssOiVpCXLrPHhVFLIt2m/9etyIrgUMWQITv4qPN0OPi517Q==
X-Received: by 2002:a05:6402:959:b0:559:4572:72e1 with SMTP id h25-20020a056402095900b00559457272e1mr448379edz.16.1705478182863;
        Tue, 16 Jan 2024 23:56:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005593c83bdafsm3911729edb.45.2024.01.16.23.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 23:56:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
Date: Wed, 17 Jan 2024 08:56:16 +0100
Message-Id: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Drop the requirement of "-master" suffix in node names because:
1. "Master" word is discouraged and MIPI Alliance renamed it to
   "Controller".
2. Some devices can operate in Controller (Master) or Target mode, thus
   the name is not accurate in such cases.
3. Other buses, like I2C controllers, use simple "i2c".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml | 2 +-
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml    | 2 +-
 Documentation/devicetree/bindings/i3c/i3c.yaml                | 4 ++--
 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml       | 2 +-
 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 2 +-
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
index fcc3dbff9c9a..47be5d9a32d4 100644
--- a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
@@ -57,7 +57,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    i3c-master@2000 {
+    i3c@2000 {
         compatible = "aspeed,ast2600-i3c";
         reg = <0x2000 0x1000>;
         #address-cells = <3>;
diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
index cc40d25358ec..cad6d53d0e2e 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
@@ -41,7 +41,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    i3c-master@d040000 {
+    i3c@d040000 {
         compatible = "cdns,i3c-master";
         clocks = <&coreclock>, <&i3csysclock>;
         clock-names = "pclk", "sysclk";
diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index c816e295d565..c7900a1da8d9 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -17,7 +17,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^i3c-master@[0-9a-f]+$"
+    pattern: "^i3c@[0-9a-f]+$"
 
   "#address-cells":
     const: 3
@@ -153,7 +153,7 @@ additionalProperties: true
 
 examples:
   - |
-    i3c-master@d040000 {
+    i3c@d040000 {
         compatible = "cdns,i3c-master";
         clocks = <&coreclock>, <&i3csysclock>;
         clock-names = "pclk", "sysclk";
diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
index 5dda8cb44cdb..39bb1a1784c9 100644
--- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
+++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
@@ -43,7 +43,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    i3c-master@a0000000 {
+    i3c@a0000000 {
       compatible = "mipi-i3c-hci";
       reg = <0xa0000000 0x2000>;
       interrupts = <89>;
diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 133855f11b4f..c56ff77677f1 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -48,7 +48,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    i3c-master@a0000000 {
+    i3c@a0000000 {
         compatible = "silvaco,i3c-master-v1";
         clocks = <&zynqmp_clk 71>, <&fclk>, <&sclk>;
         clock-names = "pclk", "fast_clk", "slow_clk";
diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 7a76fd32962a..c0e805e531be 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -35,7 +35,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    i3c-master@2000 {
+    i3c@2000 {
         compatible = "snps,dw-i3c-master-1.00a";
         #address-cells = <3>;
         #size-cells = <0>;
-- 
2.34.1

