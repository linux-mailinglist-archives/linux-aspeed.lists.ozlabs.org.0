Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 685848B640D
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2024 23:02:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=naqXmfdo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSwkx0M2Mz3cmg
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2024 07:02:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=naqXmfdo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSwk73gmtz3cYn;
	Tue, 30 Apr 2024 07:01:51 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TL18bo018990;
	Mon, 29 Apr 2024 21:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6c1TCEQs9gZ+Y3ncosYoigtRD3qDitcaSq8+vFlxO8g=;
 b=naqXmfdooz6h24rAmfEwyUQ7nlU9WmgaKKi4fZSKho0Qshz/skaj38zQxZxDwLzyPbif
 dnVQHPmZAnhgq+ogp/XMW4JFUey2aE559iLOIOXxZfRuZBdX6wGQ/lHwSchbTLYsVfo+
 EHSzxqDc8dOUAIHGjfDV50TpAw3PzEzlcyJH86UUh9RUVtwXYjDqtrzQAIKnJTPfev7t
 8cWtPpvatrfx8ABdtDPg2GzQ1c+fyYbd3KcPMCEa2vsGOZQhv14F94N016KcnI1xyTIi
 pyxjxJrKswOwQJtVO4gYGWQTXtc52PbBHF4HVYM0gE8FiEkeHUdrFSFSs6rd96Z5BdMq NA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtjrrg186-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:38 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TIDivP003210;
	Mon, 29 Apr 2024 21:01:38 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xscpp9gb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:38 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1Y4Q39649562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:37 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB68158063;
	Mon, 29 Apr 2024 21:01:34 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1081358065;
	Mon, 29 Apr 2024 21:01:34 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:33 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v4 02/17] dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
Date: Mon, 29 Apr 2024 16:01:16 -0500
Message-Id: <20240429210131.373487-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Blvp46_nAUJj_qUX_ZV9vIYWOW2bN_I7
X-Proofpoint-ORIG-GUID: Blvp46_nAUJj_qUX_ZV9vIYWOW2bN_I7
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

The FSI2SPI bridge has several SPI controllers behind it, which
should be documented. Also, therefore the node needs to specify
address and size cells.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  | 36 ++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml b/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml
index e2ca0b000471..ad5c83f48425 100644
--- a/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml
+++ b/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml
@@ -9,11 +9,10 @@ title: IBM FSI-attached SPI controllers
 maintainers:
   - Eddie James <eajames@linux.ibm.com>
 
-description: |
+description:
   This binding describes an FSI CFAM engine called the FSI2SPI. Therefore this
-  node will always be a child of an FSI CFAM node; see fsi.txt for details on
-  FSI slave and CFAM nodes. This FSI2SPI engine provides access to a number of
-  SPI controllers.
+  node will always be a child of an FSI CFAM node. This FSI2SPI engine provides
+  access to a number of SPI controllers.
 
 properties:
   compatible:
@@ -24,6 +23,17 @@ properties:
     items:
       - description: FSI slave address
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^spi@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/spi/ibm,spi-fsi.yaml
+
 required:
   - compatible
   - reg
@@ -35,4 +45,22 @@ examples:
     fsi2spi@1c00 {
         compatible = "ibm,fsi2spi";
         reg = <0x1c00 0x400>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        spi@0 {
+            compatible = "ibm,spi-fsi";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eeprom@0 {
+                compatible = "atmel,at25";
+                reg = <0>;
+                address-width = <24>;
+                pagesize = <256>;
+                size = <0x80000>;
+                spi-max-frequency = <1000000>;
+            };
+        };
     };
-- 
2.39.3

