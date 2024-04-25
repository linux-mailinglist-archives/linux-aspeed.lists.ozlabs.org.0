Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC228B2AF4
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 23:38:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CrLK4kTT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQTk049Kqz3dXj
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 07:38:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CrLK4kTT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQTj11y9kz3dSC;
	Fri, 26 Apr 2024 07:37:25 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLXRYK021292;
	Thu, 25 Apr 2024 21:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=IV4ptqaik0l/OCopguJ6uRDDYvBPfw1P1RAeUjJr97E=;
 b=CrLK4kTT1sWdXao0YqGUlUgBkiuSTLFngA4cRLBXC+a+VHKoQujIeznFIEd0y93fiIaA
 BSYBnTt05s5FgURbtzEFi9jHpiJF+TeX0YcYLVQevl7mjQ0mNMtTQiKEBrWMLf2GZ5M0
 jvopi69D67eA6HCIcYZzQmHBEKRRtcBq6AKcnbqHKxbm84O+2Q/EL8RafM3cE2tkEAnD
 jsb3Kk125az+E3NXxqPh+Bw65A0xsKHolc/rq15nHx9jwm0Q85ifztzXtiuLAx409dPj
 JV7pN3yk+4Oj4UPB8Is7sbYa7ZBnjb5uT/0X854IoHTmLZRKn+5O2vsESxFU0VqVe16M OQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy6ag05n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:15 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PK1Yeu005736;
	Thu, 25 Apr 2024 21:37:14 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmx3ctwv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:14 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLbBYN18940508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:13 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E55D258064;
	Thu, 25 Apr 2024 21:37:09 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40E2558045;
	Thu, 25 Apr 2024 21:37:09 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.133.34])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Apr 2024 21:37:09 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v3 09/14] dt-bindings: fsi: Document the FSI Hub Controller
Date: Thu, 25 Apr 2024 16:36:56 -0500
Message-Id: <20240425213701.655540-10-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240425213701.655540-1-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CWAvWVwxg-Yv_LEFFkq0mnVx-G0Wpt45
X-Proofpoint-ORIG-GUID: CWAvWVwxg-Yv_LEFFkq0mnVx-G0Wpt45
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250157
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the FSI Hub Controller CFAM engine.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../bindings/fsi/ibm,hub-fsi-controller.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml

diff --git a/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml b/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
new file mode 100644
index 000000000000..d96d777d4d9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/ibm,hub-fsi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM FSI-attached FSI Hub Controller
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description: |
+  The FSI Hub Controller is an FSI controller, providing a number of FSI links,
+  located on a CFAM. Therefore this node will always be a child of an FSI CFAM
+  node.
+
+properties:
+  compatible:
+    enum:
+      - ibm,hub-fsi-controller
+
+  reg:
+    items:
+      - description: FSI slave address
+
+allOf:
+  - $ref: fsi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+   fsi@3400 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        compatible = "ibm,hub-fsi-controller";
+        reg = <0x3400 0x400>;
+
+        cfam@0,0 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            reg = <0 0>;
+        };
+    };
-- 
2.39.3

