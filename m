Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0EA8CC749
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 May 2024 21:36:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cc5cBaiM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vl1Xr1r74z78tp
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 05:27:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cc5cBaiM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vl1Wm0P99z3gMF;
	Thu, 23 May 2024 05:26:43 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MHJT3x029312;
	Wed, 22 May 2024 19:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WrJOdbUhhAZwn9i/zoJWnFH2GnK6FZVl7c1t2eBgeek=;
 b=Cc5cBaiM8WTcgHtEkXD9sRskY5qxYSc1l1xlUBYz4a4iN7+uOOO7cgCaSUs5eWMVq7uW
 OkqglzK0WFjcfMOHncjEScwPqoNsvGs5T8y98wyS1IijwXuqyiWyGS9DejXqoukkdq5/
 CkgpZmMNIzgqcznRvCIUoc0tu1X+oJfh76DMWKn6FqhQvdkVTuSwiRdtsHTKKRdZBXvc
 zG6YB8ctAfy8wHszvVMXaj8m7/qosWkZfAzwc+S0a6yw+fHlwAxSW5/FGFpIFczNjOLx
 6zqCocFzxBVXVxs8FBW1usbOAJ5xheExd+TxiPHDCCa01JD0N+NXbSMd3yiaQG2Ldplz EQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9n0cr8p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:32 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MI4P2Q026457;
	Wed, 22 May 2024 19:25:31 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y785mnk92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:31 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPSRi26083986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:30 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D8EB58062;
	Wed, 22 May 2024 19:25:28 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3A1D58063;
	Wed, 22 May 2024 19:25:27 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:27 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v6 09/20] dt-bindings: fsi: Document the AST2700 FSI controller
Date: Wed, 22 May 2024 14:25:13 -0500
Message-Id: <20240522192524.3286237-10-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1KLFoWEtZ0oH0DXeAQHPylir24ZR1kwS
X-Proofpoint-ORIG-GUID: 1KLFoWEtZ0oH0DXeAQHPylir24ZR1kwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=950 clxscore=1015
 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add the appropriate compatible string, and document the new reg
properties of the AST2700 FSI controller, which can directly access
the FSI controller registers as well as the FSI link address space.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v5:
 - Add the AST2700-specific regs properties since that controller can
   map the FSI control registers and FSI link space.

 .../fsi/aspeed,ast2600-fsi-master.yaml        | 47 +++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
index 2f531c47994bc..dfcc2fafa68dc 100644
--- a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
+++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
@@ -17,9 +17,7 @@ properties:
   compatible:
     enum:
       - aspeed,ast2600-fsi-master
-
-  reg:
-    maxItems: 1
+      - aspeed,ast2700-fsi-master
 
   clocks:
     maxItems: 1
@@ -42,6 +40,30 @@ properties:
   interrupts:
     maxItems: 1
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - aspeed,ast2600-fsi-master
+then:
+  properties:
+    reg:
+      maxItems: 1
+else:
+  properties:
+    reg:
+      minItems: 1
+      items:
+        - description: OPB control registers
+        - description: FSI controller registers
+        - description: FSI link address space
+    reg-names:
+      items:
+        - const: opb
+        - const: ctrl
+        - const: fsi
+
 required:
   - compatible
   - reg
@@ -78,3 +100,22 @@ examples:
             chip-id = <0>;
         };
     };
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        fsi-master@21800000 {
+            compatible = "aspeed,ast2700-fsi-master";
+            reg = <0x0 0x21800000 0x0 0x100>,
+                  <0x0 0x21000000 0x0 0x1000>,
+                  <0x0 0x20000000 0x0 0x1000000>;
+            reg-names = "opb", "ctrl", "fsi";
+            #interrupt-cells = <1>;
+            interrupt-controller;
+            interrupts-extended = <&intc 6>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_fsi0_default>;
+            clocks = <&syscon 40>;
+        };
+    };
-- 
2.39.3

