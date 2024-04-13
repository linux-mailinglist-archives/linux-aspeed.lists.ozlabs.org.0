Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59319957918
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHv47S3z3g67
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A4YvXdfL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VH4cY0pt9z3vhk
	for <linux-aspeed@lists.ozlabs.org>; Sun, 14 Apr 2024 06:22:52 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d8743ecebdso21302231fa.1
        for <linux-aspeed@lists.ozlabs.org>; Sat, 13 Apr 2024 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713039768; x=1713644568; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CF0jgJLN2j7M2dqxVXyrLhXc1ekWdPc5fPyMQy60sew=;
        b=A4YvXdfLOyKWqMrybEcodkIJuEPz6PXGGQsFYCZ7fSHMhBqgWNSPybclswWFrXhC+P
         7gOG0KEKnAGRD9R2HVvpVFRF0LRZeaIDW+4V2wkbslxD66TvF6k0OBmR/Qu3bak74KE/
         5URxSjc6JDTrbDkFRMbRutP+uyzcsCLFHB1YDZyf6HjvxGO+D2z17lO5BSgx/oLVx130
         bnC9/JMHyX9UmtbKlXbFc6MkicMi/8TxvoIoVlWvofLIxYo0A990L812N1WsXfTndpz/
         zNCHYZuJu+gu+r1s4Bc1Zm3AV8uw/3lnva6isJUdfOXaX+4mpc0/xnT3t/bqRx/uMk6R
         J4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713039768; x=1713644568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CF0jgJLN2j7M2dqxVXyrLhXc1ekWdPc5fPyMQy60sew=;
        b=Zc7uBOWIz2EBPM6ouNBnLX7H5abSS+Bn+gAickAPX5mDyz/9ul89cq9yVyKddzcoME
         nB57RLuBmiNy7nyuK4WDRAPK99Mgs5umyOGYayrPnl2BW+voKe3bEb80mSO/ysZvOsbR
         eUFNU513xY5MrdQWWYTa8MGzL5SnX6i/uCmjPtKEteNXeeLEk4szEI6PI2ARxDO/6aSb
         zos72OBsXZ+KGb06Zp7Dg8nvEP/diclQ8C0fBmReOkGbThTrv9vc/DnHVnuWecaBGy+8
         bdfAdjeCoLbfVDxLyXBDmvMh8CcVp6yYEpYwhokZeYVvoNlhpkH4Md0Ifec6WD0ipVs8
         +ibQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHF3ePyaxn2k3JwaJVwryPdUgDIyjhdpLmTtC552nDKIjn3fqIp/2sM2aF0IRxqjHCy209jpHncfW2qD7fxxGSkuG6hBZtUICqcqedhA==
X-Gm-Message-State: AOJu0Yw76oKtIa/1ihDJNus9xC6rxop7FKyvmd+NGbfReV7L/54nQfPv
	GeExbrBxuCWgN0qke6urr1mxz1Fr3UZonrpYSSYRtF8dUxqw4H+9
X-Google-Smtp-Source: AGHT+IHQNWJqKv41Jzxvn0wIsHmK6cmyIQ6yzwPOQYaGLP8EY7WLKlVhoMrqczp84kw65nen+gdDeg==
X-Received: by 2002:a2e:8799:0:b0:2d8:636c:b4ad with SMTP id n25-20020a2e8799000000b002d8636cb4admr3809892lji.35.1713039768192;
        Sat, 13 Apr 2024 13:22:48 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-64.cable.dynamic.surfer.at. [84.115.213.64])
        by smtp.gmail.com with ESMTPSA id f16-20020a056402161000b0056e2f1d9152sm2881222edv.93.2024.04.13.13.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 13:22:47 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 13 Apr 2024 22:22:17 +0200
Subject: [PATCH v3 2/4] dt-bindings: rtc: convert trivial devices into
 dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240413-rtc_dtschema-v3-2-eff368bcc471@gmail.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
In-Reply-To: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713039763; l=8648;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=SMORReniNUS8EgdHY4G4puGMUqdzjxeYHUZ9LEa5vlY=;
 b=Fl2XNLJxa6lw01zpCPzyEZi5S29wfcWITgmEUkQVLHUskiJSAU+3OGa5zFVmGo4QSKic660vW
 cid2ouXGKcyBMDfSDwzshAhhoqK7SSoRqGWlZKRaLsk9Cor5ExxnTQ6
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

These RTCs meet the requirements for a direct conversion into
trivial-rtc:

- google,goldfish-rtc
- maxim,ds1742
- lpc32xx-rtc
- orion-rtc
- rtc-aspeed
- spear-rtc
- via,vt8500-rtc

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

dt-bindings: rtc: lpc32xx-rtc: convert to dtschema

Convert existing binding to dtschema to support validation.

Add the undocumented 'clocks' property.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../bindings/rtc/google,goldfish-rtc.txt           | 17 -----------------
 .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 ---------------
 .../devicetree/bindings/rtc/maxim,ds1742.txt       | 12 ------------
 .../devicetree/bindings/rtc/orion-rtc.txt          | 18 ------------------
 .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 ----------------------
 .../devicetree/bindings/rtc/spear-rtc.txt          | 15 ---------------
 .../devicetree/bindings/rtc/trivial-rtc.yaml       | 18 ++++++++++++++++++
 .../devicetree/bindings/rtc/via,vt8500-rtc.txt     | 15 ---------------
 MAINTAINERS                                        |  1 -
 9 files changed, 18 insertions(+), 115 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt b/Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
deleted file mode 100644
index 634312dd95ca..000000000000
--- a/Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish RTC
-
-Android Goldfish RTC device used by Android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-rtc"
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_timer@9020000 {
-		compatible = "google,goldfish-rtc";
-		reg = <0x9020000 0x1000>;
-		interrupts = <0x3>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt b/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
deleted file mode 100644
index a87a1e9bc060..000000000000
--- a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* NXP LPC32xx SoC Real Time Clock controller
-
-Required properties:
-- compatible: must be "nxp,lpc3220-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The RTC interrupt
-
-Example:
-
-	rtc@40024000 {
-		compatible = "nxp,lpc3220-rtc";
-		reg = <0x40024000 0x1000>;
-		interrupts = <52 0>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt b/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
deleted file mode 100644
index d0f937c355b5..000000000000
--- a/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-* Maxim (Dallas) DS1742/DS1743 Real Time Clock
-
-Required properties:
-- compatible: Should contain "maxim,ds1742".
-- reg: Physical base address of the RTC and length of memory
-  mapped region.
-
-Example:
-	rtc: rtc@10000000 {
-		compatible = "maxim,ds1742";
-		reg = <0x10000000 0x800>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/orion-rtc.txt b/Documentation/devicetree/bindings/rtc/orion-rtc.txt
deleted file mode 100644
index 3bf63ffa5160..000000000000
--- a/Documentation/devicetree/bindings/rtc/orion-rtc.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Mvebu Real Time Clock
-
-RTC controller for the Kirkwood, the Dove, the Armada 370 and the
-Armada XP SoCs
-
-Required properties:
-- compatible : Should be "marvell,orion-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: IRQ line for the RTC.
-
-Example:
-
-rtc@10300 {
-        compatible = "marvell,orion-rtc";
-        reg = <0xd0010300 0x20>;
-        interrupts = <50>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt b/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt
deleted file mode 100644
index 2e956b3dc276..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-ASPEED BMC RTC
-==============
-
-Required properties:
- - compatible: should be one of the following
-   * aspeed,ast2400-rtc for the ast2400
-   * aspeed,ast2500-rtc for the ast2500
-   * aspeed,ast2600-rtc for the ast2600
-
- - reg: physical base address of the controller and length of memory mapped
-   region
-
- - interrupts: The interrupt number
-
-Example:
-
-   rtc@1e781000 {
-           compatible = "aspeed,ast2400-rtc";
-           reg = <0x1e781000 0x18>;
-           interrupts = <22>;
-           status = "disabled";
-   };
diff --git a/Documentation/devicetree/bindings/rtc/spear-rtc.txt b/Documentation/devicetree/bindings/rtc/spear-rtc.txt
deleted file mode 100644
index fecf8e4ad4b4..000000000000
--- a/Documentation/devicetree/bindings/rtc/spear-rtc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* SPEAr RTC
-
-Required properties:
-- compatible : "st,spear600-rtc"
-- reg : Address range of the rtc registers
-- interrupt: Should contain the rtc interrupt number
-
-Example:
-
-	rtc@fc000000 {
-		compatible = "st,spear600-rtc";
-		reg = <0xfc000000 0x1000>;
-		interrupt-parent = <&vic1>;
-		interrupts = <12>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index c9e3c5262c21..c48d0dfa28b2 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -24,6 +24,12 @@ properties:
       - abracon,abb5zes3
       # AB-RTCMC-32.768kHz-EOZ9: Real Time Clock/Calendar Module with I2C Interface
       - abracon,abeoz9
+      # ASPEED BMC ast2400 Real-time Clock
+      - aspeed,ast2400-rtc
+      # ASPEED BMC ast2500 Real-time Clock
+      - aspeed,ast2500-rtc
+      # ASPEED BMC ast2600 Real-time Clock
+      - aspeed,ast2600-rtc
       # I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
       - dallas,ds1374
       # Dallas DS1672 Real-time Clock
@@ -41,16 +47,24 @@ properties:
       - epson,rx8571
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
       - epson,rx8581
+      # Android Goldfish Real-time Clock
+      - google,goldfish-rtc
       # Intersil ISL1208 Low Power RTC with Battery Backed SRAM
       - isil,isl1208
       # Intersil ISL1218 Low Power RTC with Battery Backed SRAM
       - isil,isl1218
+      # Mvebu Real-time Clock
+      - marvell,orion-rtc
+      # Maxim DS1742/DS1743 Real-time Clock
+      - maxim,ds1742
       # SPI-BUS INTERFACE REAL TIME CLOCK MODULE
       - maxim,mcp795
       # Real Time Clock Module with I2C-Bus
       - microcrystal,rv3029
       # Real Time Clock
       - microcrystal,rv8523
+      # NXP LPC32xx SoC Real-time Clock
+      - nxp,lpc3220-rtc
       # Real-time Clock Module
       - pericom,pt7c4338
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
@@ -67,6 +81,10 @@ properties:
       - ricoh,rv5c387a
       # 2-wire CMOS real-time clock
       - sii,s35390a
+      # ST SPEAr Real-time Clock
+      - st,spear600-rtc
+      # VIA/Wondermedia VT8500 Real-time Clock
+      - via,vt8500-rtc
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - whwave,sd3078
       # Xircom X1205 I2C RTC
diff --git a/Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt b/Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt
deleted file mode 100644
index 3c0484c49582..000000000000
--- a/Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-VIA/Wondermedia VT8500 Realtime Clock Controller
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-rtc"
-- reg : Should contain 1 register ranges(address and length)
-- interrupts : alarm interrupt
-
-Example:
-
-	rtc@d8100000 {
-		compatible = "via,vt8500-rtc";
-		reg = <0xd8100000 0x10000>;
-		interrupts = <48>;
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index aea47e04c3a5..f24469714f1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1442,7 +1442,6 @@ F:	drivers/irqchip/irq-goldfish-pic.c
 ANDROID GOLDFISH RTC DRIVER
 M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
 F:	drivers/rtc/rtc-goldfish.c
 
 AOA (Apple Onboard Audio) ALSA DRIVER

-- 
2.40.1

