Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7AF957A08
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL348hQz87r4
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fJfE2cpV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+forbidden405.outlook.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlYjn4Sqxz3cJl;
	Thu, 29 Feb 2024 12:37:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2869619C2;
	Thu, 29 Feb 2024 01:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBC2BC433B2;
	Thu, 29 Feb 2024 01:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709170617;
	bh=ZAX9Em2I3TtnHcZcltf0TchJ6NPlrQE8PyBaCkDKCT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fJfE2cpVEv1aeWqnrwcrBCiXfVeXoJr1Ghu5XQPrnDCiL9ZrkmyE6d1bKmEKHZiIm
	 E5x2f8SMzHYv2Ww9py8mhD6do31O3vcUjIa9yz70zEJnveGNTlz6vb4sooZsbHrbHO
	 cwXRJ7TuHftHZYYOrHc8AYw6yjO1O7pFmR3l1BXA8QWmTY923UlAdlgq9rN+q7wqPX
	 f6tqgf/2jlP+cg9F6D6Fgy+cF6ZwGdlc31jaOK6H6YNJJoy/MiP0YiQ2QZpDtzNIyk
	 M7AEC8tRUr68CFqVp90pB6LtQkCRZVmKEaPhfn1Uz6hA+17gsXxpdAqUWQgE583ln/
	 0U3oieBm8cueA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF22C54E58;
	Thu, 29 Feb 2024 01:36:56 +0000 (UTC)
From: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Date: Thu, 29 Feb 2024 09:36:21 +0800
Subject: [PATCH v7 3/5] dt-bindings: mmc: dw-mshc-hi3798cv200: convert to
 YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-b4-mmc-hi3798mv200-v7-3-10c03f316285@outlook.com>
References: <20240229-b4-mmc-hi3798mv200-v7-0-10c03f316285@outlook.com>
In-Reply-To: <20240229-b4-mmc-hi3798mv200-v7-0-10c03f316285@outlook.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709170614; l=4709;
 i=forbidden405@outlook.com; s=20240228; h=from:subject:message-id;
 bh=z5/cBD8zJzGgT2WFAWSZ2rRYPe9PGIgRVLWNL1lYtXo=;
 b=rrz0p4sOIrPNdi1gVfnAyczCSjjccKIOPM/v2Yyb5PUYvEd3TPkyAtFBFTRgEn3Zwn/rFDB/e
 EBC4BW3ON6VA9BQ8beQAiDIwAF+tBxcYmafgpcR73ft2y85RS+TDR34
X-Developer-Key: i=forbidden405@outlook.com; a=ed25519;
 pk=KAWv6ZzFsT54MGllOczJgFiWB+DuayEmyn24iiVVThU=
X-Endpoint-Received:  by B4 Relay for forbidden405@outlook.com/20240228 with auth_id=136
X-Original-From: Yang Xiwen <forbidden405@outlook.com>
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
Reply-To: forbidden405@outlook.com
Cc: devicetree@vger.kernel.org, tianshuliang <tianshuliang@hisilicon.com>, linux-aspeed@lists.ozlabs.org, Igor Opaniuk <igor.opaniuk@linaro.org>, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, Yang Xiwen <forbidden405@outlook.com>, David Yang <mmyangfl@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Yang Xiwen <forbidden405@outlook.com>

convert the legacy txt binding to modern YAML and rename to
hisilicon,hi3798cv200-dw-mshc.yaml. No semantic change.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
---
 .../bindings/mmc/hi3798cv200-dw-mshc.txt           | 40 ------------
 .../mmc/hisilicon,hi3798cv200-dw-mshc.yaml         | 75 ++++++++++++++++++++++
 2 files changed, 75 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/hi3798cv200-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/hi3798cv200-dw-mshc.txt
deleted file mode 100644
index a0693b7145f2..000000000000
--- a/Documentation/devicetree/bindings/mmc/hi3798cv200-dw-mshc.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-* Hisilicon Hi3798CV200 specific extensions to the Synopsys Designware Mobile
-  Storage Host Controller
-
-Read synopsys-dw-mshc.txt for more details
-
-The Synopsys designware mobile storage host controller is used to interface
-a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
-differences between the core Synopsys dw mshc controller properties described
-by synopsys-dw-mshc.txt and the properties used by the Hisilicon Hi3798CV200
-specific extensions to the Synopsys Designware Mobile Storage Host Controller.
-
-Required Properties:
-- compatible: Should contain "hisilicon,hi3798cv200-dw-mshc".
-- clocks: A list of phandle + clock-specifier pairs for the clocks listed
-  in clock-names.
-- clock-names: Should contain the following:
-	"ciu" - The ciu clock described in synopsys-dw-mshc.txt.
-	"biu" - The biu clock described in synopsys-dw-mshc.txt.
-	"ciu-sample" - Hi3798CV200 extended phase clock for ciu sampling.
-	"ciu-drive"  - Hi3798CV200 extended phase clock for ciu driving.
-
-Example:
-
-	emmc: mmc@9830000 {
-		compatible = "hisilicon,hi3798cv200-dw-mshc";
-		reg = <0x9830000 0x10000>;
-		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&crg HISTB_MMC_CIU_CLK>,
-			 <&crg HISTB_MMC_BIU_CLK>,
-			 <&crg HISTB_MMC_SAMPLE_CLK>,
-			 <&crg HISTB_MMC_DRV_CLK>;
-		clock-names = "ciu", "biu", "ciu-sample", "ciu-drive";
-		fifo-depth = <256>;
-		clock-frequency = <200000000>;
-		cap-mmc-highspeed;
-		mmc-ddr-1_8v;
-		mmc-hs200-1_8v;
-		non-removable;
-		bus-width = <8>;
-	};
diff --git a/Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml
new file mode 100644
index 000000000000..f3dc973cb490
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/hisilicon,hi3798cv200-dw-mshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hisilicon Hi3798CV200 SoC specific extensions to the Synopsys DWMMC controller
+
+maintainers:
+  - Yang Xiwen <forbidden405@outlook.com>
+
+properties:
+  compatible:
+    enum:
+      - hisilicon,hi3798cv200-dw-mshc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: bus interface unit clock
+      - description: card interface unit clock
+      - description: card input sample phase clock
+      - description: controller output drive phase clock
+
+  clock-names:
+    items:
+      - const: ciu
+      - const: biu
+      - const: ciu-sample
+      - const: ciu-drive
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: synopsys-dw-mshc-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/histb-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmc@9830000 {
+        compatible = "hisilicon,hi3798cv200-dw-mshc";
+        reg = <0x9830000 0x10000>;
+        interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&crg HISTB_MMC_CIU_CLK>,
+                 <&crg HISTB_MMC_BIU_CLK>,
+                 <&crg HISTB_MMC_SAMPLE_CLK>,
+                 <&crg HISTB_MMC_DRV_CLK>;
+        clock-names = "ciu", "biu", "ciu-sample", "ciu-drive";
+        resets = <&crg 0xa0 4>;
+        reset-names = "reset";
+        pinctrl-names = "default";
+        pinctrl-0 = <&emmc_pins_1 &emmc_pins_2
+                     &emmc_pins_3 &emmc_pins_4>;
+        fifo-depth = <256>;
+        clock-frequency = <200000000>;
+        cap-mmc-highspeed;
+        mmc-ddr-1_8v;
+        mmc-hs200-1_8v;
+        non-removable;
+        bus-width = <8>;
+    };

-- 
2.43.0

