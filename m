Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 78CF78CC740
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 May 2024 21:36:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WWuH/mz9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vl1YZ0Hdkz79B4
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 05:28:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WWuH/mz9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vl1Wp4j7fz3vXM;
	Thu, 23 May 2024 05:26:46 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJLV6T015654;
	Wed, 22 May 2024 19:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=OIDKBzV4R46Ee3i+0+LVrjvwR72HjZAzNH3F0jUagmE=;
 b=WWuH/mz9lJYHzL60d3BiDa61GwRNPCnyIbrPXuRWCvXtkKeakSdxK5QliJ1Aug9agseY
 MUH3mc5vsuY5YIkm+fjA9Ohg+Zlhde4x5x0Nc4DIOGZKIO6xTooB+dhgFt0goIbyaD7J
 u8GugXAR1a/wbTi70rl0NtgJiRG4UUDJezi+PYHwjLB1eqBDsfKSVHT6qgLiMIMSV7eP
 dAkb2/QDznyBO6mS+oIF5RNkq0e7vPTsO0OM9fcEQ1B7MTTfJgtJcqUUNq/T8M2dRXHf
 6zvSMSxd0QT98AtdkniPOboyATR+M5ImydZ/cNww1XMuTzTytQ+rdf5SJgHYPBksaviO 6g== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9n73r7e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:31 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MHFovF023485;
	Wed, 22 May 2024 19:25:30 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y77npdqqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:30 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPREW45482266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:29 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32F9958065;
	Wed, 22 May 2024 19:25:27 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9FCB58061;
	Wed, 22 May 2024 19:25:26 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:26 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v6 06/20] dt-bindings: fsi: Document the FSI controller common properties
Date: Wed, 22 May 2024 14:25:10 -0500
Message-Id: <20240522192524.3286237-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Um5Kc67XS9mpdeGbv2sqVvcivQrdJbNH
X-Proofpoint-ORIG-GUID: Um5Kc67XS9mpdeGbv2sqVvcivQrdJbNH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405220134
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

Since there are multiple FSI controllers documented, the common
properties should be documented separately and then referenced
from the specific controller documentation. Add bus-frequency for
the FSI bus and CFAM local bus frequencies. Add interrupt
controller properties.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v5:
 - Switch from clock-frequency to bus-frequency

 .../bindings/fsi/fsi-controller.yaml          | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-controller.yaml

diff --git a/Documentation/devicetree/bindings/fsi/fsi-controller.yaml b/Documentation/devicetree/bindings/fsi/fsi-controller.yaml
new file mode 100644
index 0000000000000..ffe191921b268
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi-controller.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/fsi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FSI Controller Common Properties
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  FSI (FRU (Field Replaceable Unit) Service Interface) is a two wire bus. The
+  FSI bus is connected to a CFAM (Common FRU Access Macro) which contains
+  various engines such as I2C controllers, SPI controllers, etc.
+
+properties:
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+  '#interrupt-cells':
+    const: 1
+
+  bus-frequency:
+    minimum: 1
+    maximum: 200000000
+
+  interrupt-controller: true
+
+  no-scan-on-init:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The FSI controller cannot scan the bus during initialization.
+
+patternProperties:
+  "cfam@[0-9a-f],[0-9a-f]":
+    type: object
+    properties:
+      chip-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Processor index, a global unique chip ID which is used to identify
+          the physical location of the chip in a system specific way.
+
+      bus-frequency:
+        minimum: 1
+        maximum: 100000000
+
+      reg:
+        maxItems: 1
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 1
+
+    required:
+      - reg
+
+    additionalProperties: true
+
+additionalProperties: true
-- 
2.39.3

