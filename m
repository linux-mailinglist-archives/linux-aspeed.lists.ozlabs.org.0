Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE23FBE7E
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Aug 2021 23:47:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gz3nP51xxz2yLZ
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 Aug 2021 07:47:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BpJT+P6K;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BpJT+P6K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gz3nD5NqNz2xlB
 for <linux-aspeed@lists.ozlabs.org>; Tue, 31 Aug 2021 07:46:56 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17ULY2YP129828; Mon, 30 Aug 2021 17:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=y/W4GcGxMPyk4hJXOog2BHEFLigc8bW5HzZaREnXd2E=;
 b=BpJT+P6KdwsJTu0vVUqpknk4V1bp1y2MaIXkTHxn4AK8E6LMt4TXS2WW4+58Sm5WChCg
 syXixFIqUtZGe/0I5d9yiuO2KPN6gcVvHy8PWzNc9/m6cQO+kmnHThIqnRWStuniyyon
 la5KTgReAc1KMZgWkSqm2k+ih4vQy6V2cwXtqc3kiCsmYwsLiSkoGjhz0YWRxjitoteG
 wxBtvhCknNTEeKVHCew5g3L+24ap4h3mNZcM4vDng6Ou67xZb2320vAM6x2Y9jos6FWA
 Dl3FQ/RlbKYjoBHFaQYZ43ENuKulWoKdEkZHB4K6jQtNaL13iTcXaZt3PICOfwlrGwF5 7w== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3as79x8acu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 17:46:51 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17ULgYPZ024868;
 Mon, 30 Aug 2021 21:46:50 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 3aqcsbupxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 21:46:50 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17ULknUg18350528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 21:46:49 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 773A2B2065;
 Mon, 30 Aug 2021 21:46:49 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9074B2067;
 Mon, 30 Aug 2021 21:46:48 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.63.17])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 30 Aug 2021 21:46:48 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 1/2] ARM: dts: aspeed: rainier: Add system LEDs
Date: Mon, 30 Aug 2021 16:46:43 -0500
Message-Id: <20210830214644.58539-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OUDY7JAH_VJZoDNHAoLYPi22Uot1w6Bo
X-Proofpoint-ORIG-GUID: OUDY7JAH_VJZoDNHAoLYPi22Uot1w6Bo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-30_06:2021-08-30,
 2021-08-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108300135
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

Add all the missing system LEDs. These are all connected by GPIO
expanders.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 1541 +++++++++++++++---
 1 file changed, 1325 insertions(+), 216 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index d1467d5163f2..f222aea91b2e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1126,6 +1126,62 @@ tmp275@4a {
 		reg = <0x4a>;
 	};
 
+	pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "cablecard0-cxp-top";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "cablecard0-cxp-bot";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
 	pca9546@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
@@ -1182,6 +1238,118 @@ tmp275@49 {
 		reg = <0x49>;
 	};
 
+	pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "cablecard3-cxp-top";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "cablecard3-cxp-bot";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	pca9551@61 {
+		compatible = "nxp,pca9551";
+		reg = <0x61>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "cablecard4-cxp-top";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "cablecard4-cxp-bot";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
 	pca9546@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
@@ -1290,101 +1458,69 @@ &i2c7 {
 	multi-master;
 	status = "okay";
 
-	si7021-a20@40 {
-		compatible = "silabs,si7020";
-		reg = <0x40>;
-	};
-
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
-
-	max: max31785@52 {
-		compatible = "maxim,max31785a";
-		reg = <0x52>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		fan0: fan@0 {
-			compatible = "pmbus-fan";
-			reg = <0>;
-			tach-pulses = <2>;
-		};
-
-		fan1: fan@1 {
-			compatible = "pmbus-fan";
-			reg = <1>;
-			tach-pulses = <2>;
-		};
-
-		fan2: fan@2 {
-			compatible = "pmbus-fan";
-			reg = <2>;
-			tach-pulses = <2>;
-		};
-
-		fan3: fan@3 {
-			compatible = "pmbus-fan";
-			reg = <3>;
-			tach-pulses = <2>;
-		};
-
-		fan4: fan@4 {
-			compatible = "pmbus-fan";
-			reg = <4>;
-			tach-pulses = <2>;
-		};
-
-		fan5: fan@5 {
-			compatible = "pmbus-fan";
-			reg = <5>;
-			tach-pulses = <2>;
-		};
-	};
-
-	pca0: pca9552@61 {
-		compatible = "nxp,pca9552";
-		reg = <0x61>;
+	pca9552@30 {
+		compatible = "ibm,pca9552";
+		reg = <0x30>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		gpio@0 {
+		led@0 {
+			label = "pcieslot0";
 			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@1 {
+		led@1 {
+			label = "pcieslot1";
 			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@2 {
+		led@2 {
+			label = "pcieslot2";
 			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@3 {
+		led@3 {
+			label = "pcieslot3";
 			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@4 {
+		led@4 {
+			label = "pcieslot4";
 			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@5 {
+		led@5 {
+			label = "cpu1";
 			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@6 {
+		led@6 {
+			label = "cpu-vrm1";
 			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
 		gpio@7 {
@@ -1392,9 +1528,12 @@ gpio@7 {
 			type = <PCA955X_TYPE_GPIO>;
 		};
 
-		gpio@8 {
+		led@8 {
+			label = "lcd-russel";
 			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
 		gpio@9 {
@@ -1433,116 +1572,955 @@ gpio@15 {
 		};
 	};
 
-	ibm-panel@62 {
-		compatible = "ibm,op-panel";
-		reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
-	};
+	pca9552@31 {
+		compatible = "ibm,pca9552";
+		reg = <0x31>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-	dps: dps310@76 {
-		compatible = "infineon,dps310";
-		reg = <0x76>;
-		#io-channel-cells = <0>;
-	};
+		gpio-controller;
+		#gpio-cells = <2>;
 
-	eeprom@50 {
-		compatible = "atmel,24c64";
-		reg = <0x50>;
-	};
+		led@0 {
+			label = "ddimm0";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-	eeprom@51 {
-		compatible = "atmel,24c64";
-		reg = <0x51>;
-	};
-};
+		led@1 {
+			label = "ddimm1";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-&i2c8 {
-	status = "okay";
+		led@2 {
+			label = "ddimm2";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-	ucd90320@11 {
-		compatible = "ti,ucd90320";
-		reg = <0x11>;
-	};
+		led@3 {
+			label = "ddimm3";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-	rtc@32 {
-		compatible = "epson,rx8900";
-		reg = <0x32>;
-	};
+		led@4 {
+			label = "ddimm4";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
+		led@5 {
+			label = "ddimm5";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-	tmp275@4a {
-		compatible = "ti,tmp275";
-		reg = <0x4a>;
-	};
+		led@6 {
+			label = "ddimm6";
+			reg = <6>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			label = "ddimm7";
+			reg = <7>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@8 {
+			label = "ddimm8";
+			reg = <8>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@9 {
+			label = "ddimm9";
+			reg = <9>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@10 {
+			label = "ddimm10";
+			reg = <10>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@11 {
+			label = "ddimm11";
+			reg = <11>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@12 {
+			label = "ddimm12";
+			reg = <12>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@13 {
+			label = "ddimm13";
+			reg = <13>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@14 {
+			label = "ddimm14";
+			reg = <14>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@15 {
+			label = "ddimm15";
+			reg = <15>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	pca9552@32 {
+		compatible = "ibm,pca9552";
+		reg = <0x32>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "ddimm16";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "ddimm17";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			label = "ddimm18";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			label = "ddimm19";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			label = "ddimm20";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			label = "ddimm21";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			label = "ddimm22";
+			reg = <6>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			label = "ddimm23";
+			reg = <7>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@8 {
+			label = "ddimm24";
+			reg = <8>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@9 {
+			label = "ddimm25";
+			reg = <9>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@10 {
+			label = "ddimm26";
+			reg = <10>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@11 {
+			label = "ddimm27";
+			reg = <11>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@12 {
+			label = "ddimm28";
+			reg = <12>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@13 {
+			label = "ddimm29";
+			reg = <13>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@14 {
+			label = "ddimm30";
+			reg = <14>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@15 {
+			label = "ddimm31";
+			reg = <15>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	pca9552@33 {
+		compatible = "ibm,pca9552";
+		reg = <0x33>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "planar";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "cpu0";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		led@3 {
+			label = "dasd-pyramid0";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			label = "dasd-pyramid1";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			label = "dasd-pyramid2";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			label = "cpu0-vrm0";
+			reg = <6>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			label = "rtc-battery";
+			reg = <7>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@8 {
+			label = "base-blyth";
+			reg = <8>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@9 {
+			label = "pcieslot6";
+			reg = <9>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@10 {
+			label = "pcieslot7";
+			reg = <10>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@11 {
+			label = "pcieslot8";
+			reg = <11>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@12 {
+			label = "pcieslot9";
+			reg = <12>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@13 {
+			label = "pcieslot10";
+			reg = <13>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@14 {
+			label = "pcieslot11";
+			reg = <14>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@15 {
+			label = "tpm-wilson";
+			reg = <15>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	si7021-a20@40 {
+		compatible = "silabs,si7020";
+		reg = <0x40>;
+	};
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	max: max31785@52 {
+		compatible = "maxim,max31785a";
+		reg = <0x52>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fan0: fan@0 {
+			compatible = "pmbus-fan";
+			reg = <0>;
+			tach-pulses = <2>;
+		};
+
+		fan1: fan@1 {
+			compatible = "pmbus-fan";
+			reg = <1>;
+			tach-pulses = <2>;
+		};
+
+		fan2: fan@2 {
+			compatible = "pmbus-fan";
+			reg = <2>;
+			tach-pulses = <2>;
+		};
+
+		fan3: fan@3 {
+			compatible = "pmbus-fan";
+			reg = <3>;
+			tach-pulses = <2>;
+		};
+
+		fan4: fan@4 {
+			compatible = "pmbus-fan";
+			reg = <4>;
+			tach-pulses = <2>;
+		};
+
+		fan5: fan@5 {
+			compatible = "pmbus-fan";
+			reg = <5>;
+			tach-pulses = <2>;
+		};
+	};
+
+	pca0: pca9552@61 {
+		compatible = "nxp,pca9552";
+		reg = <0x61>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "fan0";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "fan1";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			label = "fan2";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			label = "fan3";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			label = "fan4";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			label = "fan5";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	ibm-panel@62 {
+		compatible = "ibm,op-panel";
+		reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	dps: dps310@76 {
+		compatible = "infineon,dps310";
+		reg = <0x76>;
+		#io-channel-cells = <0>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	ucd90320@11 {
+		compatible = "ti,ucd90320";
+		reg = <0x11>;
+	};
+
+	rtc@32 {
+		compatible = "epson,rx8900";
+		reg = <0x32>;
+	};
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	tmp275@4a {
+		compatible = "ti,tmp275";
+		reg = <0x4a>;
+	};
 
 	eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
 
-	eeprom@51 {
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	pca_pres2: pca9552@61 {
+		compatible = "nxp,pca9552";
+		reg = <0x61>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"SLOT6_PRSNT_EN_RSVD", "SLOT7_PRSNT_EN_RSVD",
+			"SLOT8_PRSNT_EN_RSVD", "SLOT9_PRSNT_EN_RSVD",
+			"SLOT10_PRSNT_EN_RSVD", "SLOT11_PRSNT_EN_RSVD",
+			"SLOT6_EXPANDER_PRSNT_N", "SLOT7_EXPANDER_PRSNT_N",
+			"SLOT8_EXPANDER_PRSNT_N", "SLOT9_EXPANDER_PRSNT_N",
+			"SLOT10_EXPANDER_PRSNT_N", "SLOT11_EXPANDER_PRSNT_N",
+			"", "", "", "";
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+};
+
+&i2c9 {
+	status = "okay";
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
+
+	tmp423b@4d {
+		compatible = "ti,tmp423";
+		reg = <0x4d>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
+
+	tmp423b@4d {
+		compatible = "ti,tmp423";
+		reg = <0x4d>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	tmp275@49 {
+		compatible = "ti,tmp275";
+		reg = <0x49>;
+	};
+
+	pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "cablecard10-cxp-top";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "cablecard10-cxp-bot";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c11mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c11mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+
+	eeprom@50 {
 		compatible = "atmel,24c64";
-		reg = <0x51>;
+		reg = <0x50>;
 	};
 
-	pca_pres2: pca9552@61 {
+	pca9552@60 {
 		compatible = "nxp,pca9552";
-		reg = <0x61>;
+		reg = <0x60>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
 		gpio-controller;
 		#gpio-cells = <2>;
 
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
+		led@0 {
+			label = "nvme0";
 			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@1 {
+		led@1 {
+			label = "nvme1";
 			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@2 {
+		led@2 {
+			label = "nvme2";
 			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@3 {
+		led@3 {
+			label = "nvme3";
 			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@4 {
+		led@4 {
+			label = "nvme4";
 			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@5 {
+		led@5 {
+			label = "nvme5";
 			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@6 {
+		led@6 {
+			label = "nvme6";
 			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		gpio@7 {
+		led@7 {
+			label = "nvme7";
 			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
 		gpio@8 {
@@ -1585,111 +2563,128 @@ gpio@15 {
 			type = <PCA955X_TYPE_GPIO>;
 		};
 	};
-
 };
 
-&i2c9 {
+&i2c14 {
 	status = "okay";
 
-	tmp423a@4c {
-		compatible = "ti,tmp423";
-		reg = <0x4c>;
-	};
-
-	tmp423b@4d {
-		compatible = "ti,tmp423";
-		reg = <0x4d>;
-	};
-
 	eeprom@50 {
-		compatible = "atmel,24c128";
+		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
-};
 
-&i2c10 {
-	status = "okay";
+	pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-	tmp423a@4c {
-		compatible = "ti,tmp423";
-		reg = <0x4c>;
-	};
+		gpio-controller;
+		#gpio-cells = <2>;
 
-	tmp423b@4d {
-		compatible = "ti,tmp423";
-		reg = <0x4d>;
-	};
+		led@0 {
+			label = "nvme8";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-	eeprom@50 {
-		compatible = "atmel,24c128";
-		reg = <0x50>;
-	};
-};
+		led@1 {
+			label = "nvme9";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-&i2c11 {
-	status = "okay";
+		led@2 {
+			label = "nvme10";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
+		led@3 {
+			label = "nvme11";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-	tmp275@49 {
-		compatible = "ti,tmp275";
-		reg = <0x49>;
-	};
+		led@4 {
+			label = "nvme12";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-	pca9546@70 {
-		compatible = "nxp,pca9546";
-		reg = <0x70>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "okay";
-		i2c-mux-idle-disconnect;
+		led@5 {
+			label = "nvme13";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-		i2c11mux0chn0: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
+		led@6 {
+			label = "nvme14";
+			reg = <6>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
 
-			eeprom@50 {
-				compatible = "atmel,24c64";
-				reg = <0x50>;
-			};
+		led@7 {
+			label = "nvme15";
+			reg = <7>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
 		};
 
-		i2c11mux0chn1: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
 
-			eeprom@51 {
-				compatible = "atmel,24c64";
-				reg = <0x51>;
-			};
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
 		};
-	};
-};
 
-&i2c12 {
-	status = "okay";
-};
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
 
-&i2c13 {
-	status = "okay";
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
 
-	eeprom@50 {
-		compatible = "atmel,24c64";
-		reg = <0x50>;
-	};
-};
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
 
-&i2c14 {
-	status = "okay";
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
 
-	eeprom@50 {
-		compatible = "atmel,24c64";
-		reg = <0x50>;
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
 	};
 };
 
@@ -1700,6 +2695,120 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "nvme16";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "nvme17";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			label = "nvme18";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			label = "nvme19";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			label = "nvme20";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			label = "nvme21";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			label = "nvme22";
+			reg = <6>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			label = "nvme23";
+			reg = <7>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
 };
 
 &vuart1 {
-- 
2.27.0

