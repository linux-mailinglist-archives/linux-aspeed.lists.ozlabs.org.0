Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBD78CC73F
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 May 2024 21:36:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qbQLiOVl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vl1Xg0NPFz78q5
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 05:27:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qbQLiOVl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vl1Wk6VrSz3gLL;
	Thu, 23 May 2024 05:26:42 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MHWGgJ025789;
	Wed, 22 May 2024 19:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=XjgnUZWmeVjWGk6G9DJaRRfibUtUKh+By+McotnzT7A=;
 b=qbQLiOVl0e9PJvD1GW1Aj+uaU477CBzu6C4nZq8FBRsYtVt9pKJjiToEBvREYnng0uKR
 QJTcnZ8T5zLHAVb95k8W/htOsbJMQy9KqOzYsILXCfHdEulsHnRa2NSLR1YckzSkIXML
 vcG+3sf8T2jxl2xxxBWv2TzxhnFYseps/20qa5oyUyzakIa0+i8cfZtOIxQLiI44hrNH
 6YEAR1maNnT7o9g2kYTD5qsl52ELhIRsC4pAYpbgwv/aW9a+bvCw2ROb4g8YsmkzE2bz
 HiCAQF6RmhMIZ4mNYpBDCZ52h8OdJ/TGz3E3Z2Dw8cb2uccM07mkM5zatsqjy5qWxQJE Mg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9k7tgkpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:32 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MGhrQe022240;
	Wed, 22 May 2024 19:25:31 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y76ntwyfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:31 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPSRn24314622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:30 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB94B58064;
	Wed, 22 May 2024 19:25:27 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D01D58061;
	Wed, 22 May 2024 19:25:27 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:27 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v6 08/20] dt-bindings: fsi: ast2600-fsi-master: Convert to json-schema
Date: Wed, 22 May 2024 14:25:12 -0500
Message-Id: <20240522192524.3286237-9-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y1UFs4LTdzlugRx2_gCNsTxQC_lQzS6l
X-Proofpoint-GUID: y1UFs4LTdzlugRx2_gCNsTxQC_lQzS6l
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert to json-schema for the AST2600 FSI master documentation.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../fsi/aspeed,ast2600-fsi-master.yaml        | 80 +++++++++++++++++++
 .../bindings/fsi/fsi-master-aspeed.txt        | 36 ---------
 2 files changed, 80 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
 delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt

diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
new file mode 100644
index 0000000000000..2f531c47994bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed FSI master
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  The AST2600 and later contain two identical FSI masters. They share a
+  clock and have a separate interrupt line and output pins.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-fsi-master
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  cfam-reset-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin for CFAM reset
+
+  fsi-routing-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin for setting the FSI mux (internal or cabled)
+
+  fsi-mux-gpios:
+    maxItems: 1
+    description:
+      Input GPIO pin for detecting the desired FSI mux state
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
+allOf:
+  - $ref: fsi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    #include <dt-bindings/gpio/aspeed-gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    fsi-master@1e79b000 {
+        compatible = "aspeed,ast2600-fsi-master";
+        reg = <0x1e79b000 0x94>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_fsi1_default>;
+        clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
+        fsi-routing-gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
+        fsi-mux-gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
+        cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
+
+        cfam@0,0 {
+            reg = <0 0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            chip-id = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
deleted file mode 100644
index 9853fefff5d83..0000000000000
--- a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Device-tree bindings for AST2600 FSI master
--------------------------------------------
-
-The AST2600 contains two identical FSI masters. They share a clock and have a
-separate interrupt line and output pins.
-
-Required properties:
- - compatible: "aspeed,ast2600-fsi-master"
- - reg: base address and length
- - clocks: phandle and clock number
- - interrupts: platform dependent interrupt description
- - pinctrl-0: phandle to pinctrl node
- - pinctrl-names: pinctrl state
-
-Optional properties:
- - cfam-reset-gpios: GPIO for CFAM reset
-
- - fsi-routing-gpios: GPIO for setting the FSI mux (internal or cabled)
- - fsi-mux-gpios: GPIO for detecting the desired FSI mux state
-
-
-Examples:
-
-    fsi-master {
-        compatible = "aspeed,ast2600-fsi-master", "fsi-master";
-        reg = <0x1e79b000 0x94>;
-	interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_fsi1_default>;
-	clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
-
-	fsi-routing-gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
-	fsi-mux-gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
-
-	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
-    };
-- 
2.39.3

