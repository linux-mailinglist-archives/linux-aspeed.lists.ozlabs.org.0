Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C11CF957919
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHv5lDZz3g6q
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dhDGRsKe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VH4cb3stjz3vhk
	for <linux-aspeed@lists.ozlabs.org>; Sun, 14 Apr 2024 06:22:55 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2d8863d8a6eso24366601fa.3
        for <linux-aspeed@lists.ozlabs.org>; Sat, 13 Apr 2024 13:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713039771; x=1713644571; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bf5pKtth7HyQMR2CRAxRCRRYX77dJfg+HACjzgrcpPA=;
        b=dhDGRsKegR6cWv2xPQMKNRYG+KfkQGM16TTkm09rn4oUIeoUD2c8o8gISSy2eXxxl8
         By93t31VSQTTELstiDREmA1LzJ0btRF8HzOmkdVnAa3NFqp4K5A+hgvdhgDD4StulwKc
         PO6R3yovhp4rpqM1V3UCThTBFR2SkanExkf+urCMippakogtk/MZLj07kRHjlVgZ8txO
         bF2PzIvPJeXlq+lqvzeo+sRW0nWQ1ETfnebygoWntL8bflnnFdKpQVwsv7dWDpxNKNyu
         HHn3OAFoiJrSMIxTw9NEINQOU1lhBCtpLHA9xk+vWDkJGNWRXqSiphyCEYxLDtMbY4HZ
         WvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713039771; x=1713644571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bf5pKtth7HyQMR2CRAxRCRRYX77dJfg+HACjzgrcpPA=;
        b=es2DP6ZcwMTBG2NCxY9vFqN+MuiI2eStLJBX1XAhobACNtjbJiSlqIgoe8UaK2+tQN
         D3AKOr3DPENot1Nv1HM/AkjTI6rKnWjI6MMVo9iqgSvAlhr4TGoXwDaux1ftO9Z0GypF
         s/wnRMNdd9Oh1llUcubMpV5TWO0cogPKF2ZIKUlUCYekUmUdld9SfRaO2rhcr1qEaDYH
         2Y6auR6Idrj6TdVwxlE92TCT7aH6TG4OIBQKsgxn8SvYGXaslJX3DrM+xWFwFKnRfoEs
         yJHPL6Luq9YZsySpxc+XBaTvNFgt29LMCj9hi3MUadKK7r5RVvTYeBnVMCM4xTDIdT9a
         fqFA==
X-Forwarded-Encrypted: i=1; AJvYcCVuBQssF22X5FGUilMP4ictwVTh9OCm6uxLzwQzcsI7d3bh5tHnZvQQ+IOuheS2SQuN/TrgktLrPvtEhjoe0XLWukeFWbS+PTDzxytgjw==
X-Gm-Message-State: AOJu0YzcvPjt5lWEzPziiSKRyA8DxIUXs+5cpgwjGHTz4NpPSIp246RK
	cn0tucUblx99WqvwYXpNLQkVX+SzXztYBSqPEfU0C3H1KGOVPa7s
X-Google-Smtp-Source: AGHT+IH8pm98C+MIRAOaUO30GuhCqlA7nqVnCkzi+qWv1twrQuvRXLCHEscsJF51tgcr39Bl8I72wA==
X-Received: by 2002:a2e:b98a:0:b0:2d8:7320:e36a with SMTP id p10-20020a2eb98a000000b002d87320e36amr3641252ljp.17.1713039771430;
        Sat, 13 Apr 2024 13:22:51 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-64.cable.dynamic.surfer.at. [84.115.213.64])
        by smtp.gmail.com with ESMTPSA id f16-20020a056402161000b0056e2f1d9152sm2881222edv.93.2024.04.13.13.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 13:22:51 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 13 Apr 2024 22:22:19 +0200
Subject: [PATCH v3 4/4] dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240413-rtc_dtschema-v3-4-eff368bcc471@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713039763; l=2723;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=BajpLIZvweL+aLqlkIOgDvaU5J35KCKUJstIeHQsxoU=;
 b=S/47bucyIciRGwOyIDM4sCMC2ax8kTneRsSd1bLRdQE94vG3Y0Nxyh/wm8FM1t7r6CkFTA87M
 btFBUkYaNdOD81nx3eSUsBIfPwCF1xZL4/z7cQjrzsUTpq8WroVMQuO
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

Convert existing binding to dtschema to support validation and
add the undocumented compatible 'fsl,imx23-rtc'.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 51 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ---------
 2 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml
new file mode 100644
index 000000000000..534de4196a4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/fsl,stmp3xxx-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMP3xxx/i.MX28 Time Clock Controller
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx28-rtc
+              - fsl,imx23-rtc
+          - const: fsl,stmp3xxx-rtc
+      - const: fsl,stmp3xxx-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  stmp,crystal-freq:
+    description:
+      Override crystal frequency as determined from fuse bits.
+      Use <0> for "no crystal".
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 32000, 32768]
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
+    rtc@80056000 {
+        compatible = "fsl,imx28-rtc", "fsl,stmp3xxx-rtc";
+        reg = <0x80056000 2000>;
+        interrupts = <29>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt b/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
deleted file mode 100644
index fa6a94226669..000000000000
--- a/Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-* STMP3xxx/i.MX28 Time Clock controller
-
-Required properties:
-- compatible: should be one of the following.
-    * "fsl,stmp3xxx-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: rtc alarm interrupt
-
-Optional properties:
-- stmp,crystal-freq: override crystal frequency as determined from fuse bits.
-  Only <32000> and <32768> are possible for the hardware.  Use <0> for
-  "no crystal".
-
-Example:
-
-rtc@80056000 {
-	compatible = "fsl,imx28-rtc", "fsl,stmp3xxx-rtc";
-	reg = <0x80056000 2000>;
-	interrupts = <29>;
-};

-- 
2.40.1

