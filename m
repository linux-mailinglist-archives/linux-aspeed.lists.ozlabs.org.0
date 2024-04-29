Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70E8B6418
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2024 23:02:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oF1NjT8U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSwlM5V7fz3dJm
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2024 07:02:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oF1NjT8U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSwk83TzSz3cYx;
	Tue, 30 Apr 2024 07:01:52 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TKrZpD019009;
	Mon, 29 Apr 2024 21:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=awURC8WLXvL6ltX4hsCAU2OtEHP0gz9pgdajLuRUruw=;
 b=oF1NjT8U1JfhXijsU46ufDdljrSAThLIGPwsn3ybvUKr1DIkUTAeaGOH9VW05YvnoI2t
 +U7jO2YHNbKtXzjzpKkZ1/5ILzbOQQ+hRrv64nRXi4zt8xAkQmx56tpxPhkL/cq8+83X
 CxDaN48Pld6VF4jSHn4rvJsxdPZfVWbwmLA1RVIcUoMwDnSFjqyUQ8hx14zp1NSGyJpY
 F+CfDDxcmUrCbrmNcl7PfgSX21Huj7kJP8kRjs4uuAKAu9weCIIxiV9jj79a6IFva+k2
 gGf1GqJPWvX2dACp3vrYm+5S4Ikv4P3yIiUqOg35GAmilctxS18p3/AnHV9GWOuOfjMw rQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtjyj01cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:40 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TJobvA015530;
	Mon, 29 Apr 2024 21:01:40 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsed2s46h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:39 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1amC27853428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:38 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 823845804B;
	Mon, 29 Apr 2024 21:01:36 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE39A5805B;
	Mon, 29 Apr 2024 21:01:35 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v4 04/17] dt-bindings: fsi: p9-occ: Convert to json-schema
Date: Mon, 29 Apr 2024 16:01:18 -0500
Message-Id: <20240429210131.373487-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uxB-mqcTT8SxDZAg02th1_66CK6Bt5Io
X-Proofpoint-GUID: uxB-mqcTT8SxDZAg02th1_66CK6Bt5Io
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_18,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290138
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

Conver to json-schema for the OCC documentation. Also document the fact
that the OCC "bridge" device will often have the hwmon node as a
child.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v3:
 - Move required below other properties
 - Drop "occ-" in child node
 - Drop hwmon unit address
 - Complete example
 - Change commit message to match similar commits

 .../devicetree/bindings/fsi/ibm,p9-occ.txt    | 16 --------
 .../devicetree/bindings/fsi/ibm,p9-occ.yaml   | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
deleted file mode 100644
index e73358075a90..000000000000
--- a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Device-tree bindings for FSI-attached POWER9/POWER10 On-Chip Controller (OCC)
------------------------------------------------------------------------------
-
-This is the binding for the P9 or P10 On-Chip Controller accessed over FSI from
-a service processor. See fsi.txt for details on bindings for FSI slave and CFAM
-nodes. The OCC is not an FSI slave device itself, rather it is accessed
-through the SBE FIFO.
-
-Required properties:
- - compatible = "ibm,p9-occ" or "ibm,p10-occ"
-
-Examples:
-
-    occ {
-        compatible = "ibm,p9-occ";
-    };
diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
new file mode 100644
index 000000000000..3ab2582cb8a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM FSI-attached On-Chip Controller (OCC)
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  The POWER processor On-Chip Controller (OCC) helps manage power and
+  thermals for the system, accessed through the FSI-attached SBEFIFO
+  from a service processor.
+
+properties:
+  compatible:
+    enum:
+      - ibm,p9-occ
+      - ibm,p10-occ
+
+patternProperties:
+  "^hwmon":
+    type: object
+    $ref: /schemas/hwmon/ibm,occ-hwmon.yaml
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    occ {
+        compatible = "ibm,p9-occ";
+
+        hwmon {
+            compatible = "ibm,p9-occ-hwmon";
+        };
+    };
-- 
2.39.3

