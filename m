Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3332852E850
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 May 2022 11:07:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4LTy0dQWz3bmw
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 May 2022 19:07:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4LTs4RdJz3bkT
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 May 2022 19:07:41 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24K8qZVf003709;
 Fri, 20 May 2022 16:52:35 +0800 (GMT-8)
 (envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 20 May
 2022 17:06:21 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>, Felipe Balbi <balbi@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "Li
 Yang" <leoyang.li@nxp.com>
Subject: [PATCH v4 3/3] dt-bindings: usb: add documentation for aspeed udc
Date: Fri, 20 May 2022 17:06:17 +0800
Message-ID: <20220520090617.2225080-4-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520090617.2225080-1-neal_liu@aspeedtech.com>
References: <20220520090617.2225080-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24K8qZVf003709
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add device tree binding documentation for the Aspeed USB2.0 Device
Controller.

Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/aspeed,ast2600-udc.yaml      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml

diff --git a/Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml b/Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
new file mode 100644
index 000000000000..c3b6be3d8002
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 Facebook Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/aspeed,ast2600-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED USB 2.0 Device Controller
+
+maintainers:
+  - Neal Liu <neal_liu@aspeedtech.com>
+
+description: |+
+  The ASPEED USB 2.0 Device Controller implements 1 control endpoint and
+  4 generic endpoints for AST260x.
+
+  Supports independent DMA channel for each generic endpoint.
+  Supports 32/256 stages descriptor mode for all generic endpoints.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-udc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    udc: usb@1e6a2000 {
+        compatible = "aspeed,ast2600-udc";
+        reg = <0x1e6a2000 0x300>;
+        interrupts = <9>;
+        clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_usb2bd_default>;
+    };
-- 
2.25.1

