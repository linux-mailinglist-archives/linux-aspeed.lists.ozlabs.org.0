Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 317EA95790D
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHr68gLz30VM
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C916U0r+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF6qr1Hh3z3cZM
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Apr 2024 01:55:52 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a52140ea1b5so83041566b.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Apr 2024 08:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712764548; x=1713369348; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzWm9MO6MRh2JhYRh9d9r60JurAw8zbzSiBG8Vp4F7A=;
        b=C916U0r+EGJkYNByijdtR2vJTI9rV2Os1AARPbguQ1VyURrNr+J9nqGhAl2/jUFdtk
         jKZ0HcQ78Cc2A0DMkbS3uBDFxl1/4STpqRFNMH/+k3fw9LeId4PGp+jyrqJ919RNTGXE
         EM1BCygQwX7TKzTQ0CZjAFmh51X9tGC2bWXR9Cvamz7KoB/jKSb0da84nS72r+nTBx3O
         8zpBEFJWQMLw5SFxj4EaPBQSQud7v8bcqyqKyZiC8zt70Bcs7TzeLXS1JCQafHqzsQ0m
         PL6ZAK7SsY/oxhIVnF7dhSrsQ34j4O72H8Vtlys5n3c9OqLNzMc0gmZBTMZnlLhfAjN7
         fV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764548; x=1713369348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzWm9MO6MRh2JhYRh9d9r60JurAw8zbzSiBG8Vp4F7A=;
        b=ZVbzwbkF3Z86bSX8CI374+BVrzsdARpqn/RJBmO/J1WMDyhi9nA9a6i+/DODVkrCr5
         PfTWDMDQzEkO3H6Uqse6BsaqYA6lL4HHQZrPeFFwjFOlUNN3CNuERY81sGkhhGqiAlHR
         MpzdgLb3kPmoZNbS3Si9xmohqL/reiXX0BDX0etaHeHYbDJewBQoTf0Di36FwocUbH6h
         UVPYQn420qjv7e9TYSNB1Y0wn38yvhpirQVU6mOyDpmwn5T8nWUTj/yBoaVQ5zEZ0d77
         0TVIBwuSSwDBN47aentUqLtvZg7ozAMaXh+uHPKDkj5cLJqjb/IyTarFsYYdxNiGNX5M
         WfAg==
X-Forwarded-Encrypted: i=1; AJvYcCUx6rfgS20qG+L8ZCwn+YpcVJNZFn5FAGhJXdfzsSDrRVxxACx5UlUxjGttiaVmAK/ZCU84RAYXQXjQdOyXAsjMDrydJ2FtYMTnjTMMiQ==
X-Gm-Message-State: AOJu0YyIgeDVCvvloskqv2dhv+9SIzt37wy4gpdqnP3b6KUDWapwVr65
	X7R5Tis3IXe4x4gTIqZqNKxG7rOvy3N0t6TicYARa1R3ZGfr5LLm
X-Google-Smtp-Source: AGHT+IGWT0zg2GfhSFE2SOFKfpvXgozYERgxjlvwRfCaQ5TT835wuPhVMQ4kvDupf6tnP6/hPhy/bQ==
X-Received: by 2002:a17:906:ee87:b0:a51:962d:cf0d with SMTP id wt7-20020a170906ee8700b00a51962dcf0dmr2330371ejb.12.1712764548277;
        Wed, 10 Apr 2024 08:55:48 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id qw6-20020a1709066a0600b00a52172808c9sm279884ejc.56.2024.04.10.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:55:47 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 10 Apr 2024 17:55:34 +0200
Subject: [PATCH v2 2/4] dt-bindings: rtc: lpc32xx-rtc: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-rtc_dtschema-v2-2-d32a11ab0745@gmail.com>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
In-Reply-To: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712764543; l=2099;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ZJ06gPeNSTQ2DySuOzdESjyZIxHEy/NT6VtQopAeiQc=;
 b=OWv7GNhwJh5KCDkRW7ERfspAklaTpWgWcxbYfHhi4SlqF6l+Dk6ATof15wOpkwnTCDEg8Vawt
 6TzRRYUgVEgA0j8sdfATE22NOBeslYc9HH6g4bJakYvCUttKWqZHKL9
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert existing binding to dtschema to support validation.

Add the undocumented 'clocks' property.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
 .../devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml   | 41 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 15 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
new file mode 100644
index 000000000000..62ddeef961e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,lpc32xx-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC Real Time Clock
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: nxp,lpc3220-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    rtc@40024000 {
+        compatible = "nxp,lpc3220-rtc";
+        reg = <0x40024000 0x1000>;
+        interrupts = <52 0>;
+    };

-- 
2.40.1

