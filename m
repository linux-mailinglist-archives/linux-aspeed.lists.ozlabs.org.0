Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FF35E737
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Apr 2021 21:43:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKbcp2kbfz3bTP
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Apr 2021 05:43:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=azUqtoKD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=azUqtoKD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKbcj5zxBz304V
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Apr 2021 05:43:17 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DJX8Zd179564; Tue, 13 Apr 2021 15:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4aS5khuOidVQwp4Dw3klN5DsgjFRN7NQ1ELhIUPhmEk=;
 b=azUqtoKDzAYsXQ8lq8410zlu/cP/ZPzbBr0b27UOao+rNvIBnUzuIsJ1i+uUwScAZWGq
 7a78xrnBLVlzbsvVlZ8ZKAr+vVEur4Jd5nEMPOst2R2Zx2wXYgRoyUCg98StYlvCzGsl
 ImiHFeRzuvgHu2ACgI3qDQZXR17QZ2hn7c3p2dJGWvwQITlJ9Gen5lpUgv2gAc6FqsLA
 p5nhnqFtR/xl8L7oc7XYBL0sKqbPMEquRkDE6SCe4Uj1RVMvazYmvQjHCSMriKHA+boI
 4NuwI6SOqMYJ6uvuPhKuqcM/nmHa3W7qrFoN8In+CZScaec1K8C3x4yHxB9DYZFhnryb qw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37webgwaeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 15:43:14 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DJXxkM016363;
 Tue, 13 Apr 2021 19:43:13 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 37uhcmqn1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 19:43:13 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DJhDqB29753740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 19:43:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D5ACAE05F;
 Tue, 13 Apr 2021 19:43:13 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9C1FAE063;
 Tue, 13 Apr 2021 19:43:12 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.32])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 19:43:12 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 1/4] ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
Date: Tue, 13 Apr 2021 14:43:05 -0500
Message-Id: <20210413194308.36930-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413194308.36930-1-eajames@linux.ibm.com>
References: <20210413194308.36930-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KBJ6Hm7laosBdJdWvPG36J4xtO-Gt4WH
X-Proofpoint-ORIG-GUID: KBJ6Hm7laosBdJdWvPG36J4xtO-Gt4WH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=892
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130128
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The second presence detection PCA9552 was incorrectly added to bus 9.

Fixes: 8be44de6f209 ("ARM: dts: aspeed: Rainier: Add presence GPIOs")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 109 ++-----------------
 1 file changed, 10 insertions(+), 99 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 4dbb030f3ebb..49419cd7f853 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1399,7 +1399,7 @@ eeprom@51 {
 		reg = <0x51>;
 	};
 
-	pca1: pca9552@61 {
+	pca_pres2: pca9552@61 {
 		compatible = "nxp,pca9552";
 		reg = <0x61>;
 		#address-cells = <1>;
@@ -1407,6 +1407,15 @@ pca1: pca9552@61 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		gpio-line-names =
+			"SLOT6_PRSNT_EN_RSVD", "SLOT7_PRSNT_EN_RSVD",
+			"SLOT8_PRSNT_EN_RSVD", "SLOT9_PRSNT_EN_RSVD",
+			"SLOT10_PRSNT_EN_RSVD", "SLOT11_PRSNT_EN_RSVD",
+			"SLOT6_EXPANDER_PRSNT_N", "SLOT7_EXPANDER_PRSNT_N",
+			"SLOT8_EXPANDER_PRSNT_N", "SLOT9_EXPANDER_PRSNT_N",
+			"SLOT10_EXPANDER_PRSNT_N", "SLOT11_EXPANDER_PRSNT_N",
+			"", "", "", "";
+
 		gpio@0 {
 			reg = <0>;
 			type = <PCA955X_TYPE_GPIO>;
@@ -1507,104 +1516,6 @@ eeprom@50 {
 		compatible = "atmel,24c128";
 		reg = <0x50>;
 	};
-
-	pca_pres3: pca9552@61 {
-		compatible = "nxp,pca9552";
-		reg = <0x61>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-			"SLOT6_PRSNT_EN_RSVD", "SLOT7_PRSNT_EN_RSVD",
-			"SLOT8_PRSNT_EN_RSVD", "SLOT9_PRSNT_EN_RSVD",
-			"SLOT10_PRSNT_EN_RSVD", "SLOT11_PRSNT_EN_RSVD",
-			"SLOT6_EXPANDER_PRSNT_N", "SLOT7_EXPANDER_PRSNT_N",
-			"SLOT8_EXPANDER_PRSNT_N", "SLOT9_EXPANDER_PRSNT_N",
-			"SLOT10_EXPANDER_PRSNT_N", "SLOT11_EXPANDER_PRSNT_N",
-			"", "", "", "";
-
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-	};
 };
 
 &i2c10 {
-- 
2.27.0

