Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6588CC741
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 May 2024 21:36:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LT7H4e6n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vl1XT0V5rz78kH
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 05:27:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LT7H4e6n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vl1Wk01mtz3fpM;
	Thu, 23 May 2024 05:26:41 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MGw8t2002338;
	Wed, 22 May 2024 19:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oOQR3EwumdQdngc1R11QpJeuiet2OobvalhEs0uw1Nk=;
 b=LT7H4e6noHYKs12u9uz14Lw1kMlV5KPCAC1cJs6tscL3/pbVb90V28bKQXkfgiVcWMQU
 betF4r3X2zNVV91O6HPLdwtQGZQKsnLJYilOAsOZKNc9KOwCsrWmTNMY29JnIh1W71CZ
 9P5jrvs1InC3+2ar8MXxPJjyXUiFk82SUqBnOQEh9I9NMti2PuPLAMUyaTuCjzS2XL4g
 vgljYqAGscgvZ1UMv9qWGYV9KQNJxfgwZfdPw3pqEVMPPfkrA7s8GG6w+glT6MVx0wkC
 uuYU77FIbP4CqRYaZ+4RJk+qTogjge0eUr+ZFsb57uF7fkZ+XpoyS74JXph2ahP8tye0 Ng== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9mp70bhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:29 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJAHrM008100;
	Wed, 22 May 2024 19:25:28 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y79c359a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:28 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPPwm53412130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:27 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2BA658063;
	Wed, 22 May 2024 19:25:25 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72EFB58059;
	Wed, 22 May 2024 19:25:25 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:25 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v6 02/20] dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
Date: Wed, 22 May 2024 14:25:06 -0500
Message-Id: <20240522192524.3286237-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mCvHjNxr4_1fuoLDUoOd4b9hExumqjyr
X-Proofpoint-GUID: mCvHjNxr4_1fuoLDUoOd4b9hExumqjyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
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

The FSI2SPI bridge has several SPI controllers behind it, which
should be documented. Also, therefore the node needs to specify
address and size cells.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  | 36 ++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml b/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml
index e2ca0b0004714..ad5c83f484255 100644
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

