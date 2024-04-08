Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FADA957907
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHq3mb1z3fsL
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fuUz0+Hw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCtsx0Rlqz3bvd
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 01:53:25 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-56e67286bf5so1265239a12.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Apr 2024 08:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712591601; x=1713196401; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDBj+TCOT5An3iT1ZW/BVrmcXlQmpT8xuPifrvWWcJQ=;
        b=fuUz0+Hw+YfHNmzZcFRMmN9Lbc/XjqQgfNlXOCiuBnh1v6PB5+CHP2V6IJ7gLdhtZK
         PLXZ5na20Q2xOL7RCGxKTNueGJCBTk+DdpnwiUVVRkHZHHKhVUG5dYkvXntIYg/iQxVp
         etjHuBfebP0F7D6kgfLVUvJt/QnoKputV0fmjMjjZEngv6jtK+58tlsz/qZNU4WSEd1k
         gmhbySKdpms1Fz/r8A1V53Yl4U/CNPqbIwQ/OMQ5HGCl9pWpVRkTQEs+86899TOHZUi6
         LmsDJv/9JwnaSD6BbjEb6waWvRE25zhDulzsx6Nto1YJF4wVmttT0UYQvKFj1kg9l6Pq
         YpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591601; x=1713196401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDBj+TCOT5An3iT1ZW/BVrmcXlQmpT8xuPifrvWWcJQ=;
        b=jMX/Mkiwg6w5929QkZLI/X16yh7iTcOiKypYXik0sfoq5NTM3T7SS4F1OVIgJgOOHa
         Yr7jLizs1+HqEZxQDCXzdXFjrn0pNz3nYsb/DxtbCMQutAujdPBO+uQPFr3DLrPm3H87
         T3kUYLNaJ2lVg1KQIWzTs5cWtNQsktSjVZnc+/Hrd0XdG18V9lp6dvZmMZQ8mBWA48nS
         Okb4B4PWFTge/SeGAYXDOLCAxUQJfI6Z8YNpLz6LTnKiPnc98wM4RvaXpgr+mYBdMZbJ
         7kPbr0jneglE7o+yT7csBaFBcqnu9WRSY4/IZK+QNYJSpvt3wm7/jzHrxqtQ6vTJNIhC
         R9yw==
X-Forwarded-Encrypted: i=1; AJvYcCX9NHKIcOX8zJekKInCXpxvysWPj/00X6ZYAsQzC3zPlMl9cAmWIYcTpcFGiK2W8YKtNTiKS44bd2EmSe7mhDG1c7M59gEJvE31pMPoRQ==
X-Gm-Message-State: AOJu0Yz1wps+cL+WoO/b0fJGK40ElkCS0paR74Lp2hOQnMRfcKOU8Vdb
	MZ9LnLQhOvK7buTFkfnE9h3tOiqGGYcb1sZzjUd8qRwwvlShMaG4
X-Google-Smtp-Source: AGHT+IHo3PjOjthzlX7he+eTIQsbLTIBOyRGKiO637648HaP0Ncp071D/7W6Vx2fN1EcekWna6nuhQ==
X-Received: by 2002:a17:906:af16:b0:a51:c1f7:93 with SMTP id lx22-20020a170906af1600b00a51c1f70093mr75351ejb.13.1712591601329;
        Mon, 08 Apr 2024 08:53:21 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:20 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:06 +0200
Subject: [PATCH 6/9] dt-bindings: rtc: pxa-rtc: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-rtc_dtschema-v1-6-c447542fc362@gmail.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
In-Reply-To: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=2057;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=XuizmZ/AsI4sUrNbkhEaUlA+sS0KeXhc44fqmRoI0ks=;
 b=TEcS/yNABbU+N66YYIMs81/pFUYAYXLO65ZbwiLZUk8cK0LytDNhrbnd05Bbryb15/GpV6iW2
 jf1CGGu8AmBA3oq3KEyQFN5EDyUUA0/E99wDgmrlSsZqOp61i9vtUnd
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

The missing 'reg' and 'interrupts' properties have been added, taking
the 2 supported interrupts into account to fix the example.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 ++++++++++++++++++++++
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 --------
 2 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml b/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml
new file mode 100644
index 000000000000..43d68681a1bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/marvell,pxa-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PXA Real Time Clock
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: marvell,pxa-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: 1 Hz
+      - description: Alarm
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
+    rtc@40900000 {
+        compatible = "marvell,pxa-rtc";
+        reg = <0x40900000 0x3c>;
+        interrupts = <30>, <31>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/pxa-rtc.txt b/Documentation/devicetree/bindings/rtc/pxa-rtc.txt
deleted file mode 100644
index 8c6672a1b7d7..000000000000
--- a/Documentation/devicetree/bindings/rtc/pxa-rtc.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* PXA RTC
-
-PXA specific RTC driver.
-
-Required properties:
-- compatible : Should be "marvell,pxa-rtc"
-
-Examples:
-
-rtc@40900000 {
-	compatible = "marvell,pxa-rtc";
-	reg = <0x40900000 0x3c>;
-	interrupts = <30 31>;
-};

-- 
2.40.1

