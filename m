Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 188EC3700E8
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Apr 2021 21:00:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX1sV0bjRz2xgJ
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 May 2021 05:00:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rLvsi9uo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rLvsi9uo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX1sQ25rQz300P
 for <linux-aspeed@lists.ozlabs.org>; Sat,  1 May 2021 05:00:26 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UIX7h7075928; Fri, 30 Apr 2021 15:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dV9jL465PHmRZm469v3HudsRyPBj2XXPTHeMe6jdMrg=;
 b=rLvsi9uoqpToWa5CZ1uTCmLt6iMejytXVy18R57yS5sxV6zQ+52p1JaocMF5SMzIwQFD
 8l3ylWIGDsbucUbDSKHTp4j3zYYJJMmFgApm4TceDO+tJnT2VQ2zflVyTfcjmO2B6t8R
 ym/hTDf/O7HIQ78qTHAtMrdymnOw8gARpsv5ktesPZikkw4rHsycCoHdCLUpSEGe9HPa
 EkpYmSiDa/ZwsJCB5g04/Gz5vF5Qk6IP6PbnjCLT40jNi2FKh/9/aNKZxX9wlo1vMFKW
 nABtUHBYqoKhSx5dTFpi1SqwDr99JRe/zyC7leQXuhJPDMer/7saQ1x7yWngWxxj+3f3 7w== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388pmf1s8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 15:00:21 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UIwu6R022406;
 Fri, 30 Apr 2021 19:00:21 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 384ayah1s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 19:00:20 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UJ0J1b30605632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 19:00:19 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EC386E052;
 Fri, 30 Apr 2021 19:00:19 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 536856E056;
 Fri, 30 Apr 2021 19:00:19 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.52.42])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Apr 2021 19:00:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 4/4] ARM: dts: aspeed: Everest: Add directly controlled LEDs
Date: Fri, 30 Apr 2021 14:00:00 -0500
Message-Id: <20210430190000.31646-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210430190000.31646-1-eajames@linux.ibm.com>
References: <20210430190000.31646-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VklS3pgm8M9szdeShGjLPJW0vKlhiJxd
X-Proofpoint-GUID: VklS3pgm8M9szdeShGjLPJW0vKlhiJxd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_11:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0 mlxlogscore=868
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300125
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
Cc: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

These LEDs are directly connected to the BMC's GPIO bank

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 33 ++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 27af28c8847d..2ddd10e93a80 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -202,6 +202,35 @@ fan3-presence {
 			linux,code = <12>;
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		/* RTC battery fault LED at the back */
+		led-rtc-battery {
+			gpios = <&gpio0 ASPEED_GPIO(H, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		/* BMC Card fault LED at the back */
+		led-bmc {
+			gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure Identify LED at the back */
+		led-rear-enc-id0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure fault LED at the back */
+		led-rear-enc-fault0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
+		};
+
+		/* PCIE slot power LED */
+		led-pcieslot-power {
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &gpio0 {
@@ -214,7 +243,7 @@ &gpio0 {
 	/*F0-F7*/	"PIN_HOLE_RESET_IN_N","","",
 				"PIN_HOLE_RESET_OUT_N","","","","",
 	/*G0-G7*/	"","","","","","","","",
-	/*H0-H7*/	"","","","","","","","",
+	/*H0-H7*/	"led-rtc-battery","led-bmc","led-rear-enc-id0","led-rear-enc-fault0","","","","",
 	/*I0-I7*/	"","","","","","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
@@ -222,7 +251,7 @@ &gpio0 {
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","","","","","",
-	/*P0-P7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","led-pcieslot-power","","","",
 	/*Q0-Q7*/	"","","","","","","","",
 	/*R0-R7*/	"","","","","","I2C_FLASH_MICRO_N","","",
 	/*S0-S7*/	"","","","","","","","",
-- 
2.27.0

