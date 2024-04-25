Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0D8B2AD4
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 23:37:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ak36ax/V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQTj80jRyz3dSC
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 07:37:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ak36ax/V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQThw335Jz3cGM;
	Fri, 26 Apr 2024 07:37:19 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLRZpQ023945;
	Thu, 25 Apr 2024 21:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=vljfLK7IdmW1h+WmlMs60MBJIB+Xr90wGR2klKX6RpU=;
 b=Ak36ax/VDbcK9GhBIGMVPhy1edgiJbFugxBDNfkVGZU/Pc5S3oDUCGQI8kM9RgfX5bqa
 4F6z5nSSqHu3ts3aChW/LvqLXPN2hmIjsPJjtyy+ySdGXGu+gFP5TyKaAEtffVArMmx3
 9Eb65bnejXjkGnjui0z40Z4/80HFJjdqOCM7dr6kfWsIjUGHxHed4IDEwmfPBs9PwwPd
 Vvm3OQMa9o7KLK9cLslhlpIhGRHz6Yj80aNypUVXXdHGBhRj0cjynjvBUMQQBdRUtJNa
 lafZVwC9Nr9rRiX24BEtrouz4NSlPaI2vjHB/yyeUqWD06171C0th+KtfxjWV0h1xdQN ww== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy3qg0gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:07 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLK7O4029905;
	Thu, 25 Apr 2024 21:37:06 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmr1tvck6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:06 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLb3Gc48693872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:06 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B04F458062;
	Thu, 25 Apr 2024 21:37:03 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0832E58050;
	Thu, 25 Apr 2024 21:37:03 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.133.34])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Apr 2024 21:37:02 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v3 01/14] dt-bindings: spi: Document the IBM Power SPI controller
Date: Thu, 25 Apr 2024 16:36:48 -0500
Message-Id: <20240425213701.655540-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240425213701.655540-1-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: L2CB35zkDOgx9l7mycCD7d5qdof1u4bU
X-Proofpoint-GUID: L2CB35zkDOgx9l7mycCD7d5qdof1u4bU
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The IBM Power chips have a basic SPI controller. Document it.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../devicetree/bindings/spi/ibm,p10-spi.yaml  | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml b/Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml
new file mode 100644
index 000000000000..9bf57b621c1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/ibm,p10-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM SPI Controller
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  A basic SPI controller found on IBM Power chips, accessed over FSI. This
+  node will always be a child node of an ibm,fsi2spi node.
+
+properties:
+  compatible:
+    enum:
+      - ibm,p10-spi
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    fsi2spi@1c00 {
+        compatible = "ibm,fsi2spi";
+        reg = <0x1c00 0x400>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        spi@0 {
+            compatible = "ibm,p10-spi";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eeprom@0 {
+                compatible = "atmel,at25";
+                reg = <0>;
+                size = <0x80000>;
+                address-width = <24>;
+                pagesize = <256>;
+                spi-max-frequency = <1000000>;
+            };
+        };
+    };
-- 
2.39.3

