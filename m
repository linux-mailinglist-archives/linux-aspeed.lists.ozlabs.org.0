Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 915838B641A
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2024 23:03:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sI1RYV/4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSwlZ1Wslz3cbB
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2024 07:03:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sI1RYV/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSwkC3V32z3cYx;
	Tue, 30 Apr 2024 07:01:55 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TL14t0018912;
	Mon, 29 Apr 2024 21:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=i4N/GVS2N3SxR6Bd0nLRGp60v6K7y1JqlZvTn+jf4Yc=;
 b=sI1RYV/4MqdQK5s+BpInd9jOWcbai/b0ZqNQ+NtyjYxWuiPHrMAIDFMzAaZP6wdOaAuA
 2WaG+KOiLysDMopwqhp3k/9kTyXfc+haTYXH1nwvAaQaQ/l1hJ1AYNOEoHRm6cTKoK1I
 EUz1vM1kWtprsbDwjuO528nB1PU1G049HUY2lzfXx1sInVsveslJ6OocLDJTSSoYVRyl
 lztbItJNVLEIF71QbenoZ4n+nUG9/Zai7O6v8nuIuwPra07YOfS/brUA2JhH4aKrJBaj
 f84vXFWyzSJzSEYtgzOD6QxdJ0/5hnl2K/az35HRGp4VGVFGS4MIY9hSVmkoXCe1qLZ4 MQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtjrrg18r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:45 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TJagQ4015582;
	Mon, 29 Apr 2024 21:01:45 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsed2s475-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:45 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1frQ18547314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:43 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 975095806C;
	Mon, 29 Apr 2024 21:01:41 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5D4E58065;
	Mon, 29 Apr 2024 21:01:40 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:40 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v4 10/17] dt-bindings: i2c: i2c-fsi: Convert to json-schema
Date: Mon, 29 Apr 2024 16:01:24 -0500
Message-Id: <20240429210131.373487-11-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DyOZQJRCJvkqjJVpN1eqMB1CbuH6knyI
X-Proofpoint-ORIG-GUID: DyOZQJRCJvkqjJVpN1eqMB1CbuH6knyI
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_18,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404290138
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert to json-schema for the FSI-attached I2C controller.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v3:
 - Update MAINTAINERS
 - Change commit message to match similar commits

 .../devicetree/bindings/i2c/i2c-fsi.txt       | 40 -------------
 .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  | 58 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 59 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-fsi.txt b/Documentation/devicetree/bindings/i2c/i2c-fsi.txt
deleted file mode 100644
index b1be2ceb7e69..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-fsi.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Device-tree bindings for FSI-attached I2C master and busses
------------------------------------------------------------
-
-Required properties:
- - compatible = "ibm,i2c-fsi";
- - reg = < address size >;		: The FSI CFAM address and address
-					  space size.
- - #address-cells = <1>;		: Number of address cells in child
-					  nodes.
- - #size-cells = <0>;			: Number of size cells in child nodes.
- - child nodes				: Nodes to describe busses off the I2C
-					  master.
-
-Child node required properties:
- - reg = < port number >		: The port number on the I2C master.
-
-Child node optional properties:
- - child nodes				: Nodes to describe devices on the I2C
-					  bus.
-
-Examples:
-
-    i2c@1800 {
-        compatible = "ibm,i2c-fsi";
-        reg = < 0x1800 0x400 >;
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        i2c-bus@0 {
-            reg = <0>;
-        };
-
-        i2c-bus@1 {
-            reg = <1>;
-
-            eeprom@50 {
-                compatible = "vendor,dev-name";
-            };
-        };
-    };
diff --git a/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml b/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
new file mode 100644
index 000000000000..8ff5585a3aa5
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ibm,i2c-fsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM FSI-attached I2C controller
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  This I2C controller is an FSI CFAM engine, providing access to a number of
+  I2C busses. Therefore this node will always be a child of an FSI CFAM node.
+
+properties:
+  compatible:
+    enum:
+      - ibm,i2c-fsi
+
+  reg:
+    items:
+      - description: FSI slave address
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@1800 {
+        compatible = "ibm,i2c-fsi";
+        reg = <0x1800 0x400>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-bus@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+
+        i2c-bus@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eea74166a2d9..9021e6ec4e6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8924,7 +8924,7 @@ M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-i2c@vger.kernel.org
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-fsi.txt
+F:	Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
 F:	drivers/i2c/busses/i2c-fsi.c
 
 FSI-ATTACHED SPI DRIVER
-- 
2.39.3

