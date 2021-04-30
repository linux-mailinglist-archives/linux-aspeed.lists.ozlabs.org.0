Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9CC3700E6
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Apr 2021 21:00:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX1sP6vNnz3004
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 May 2021 05:00:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X94UuvVM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X94UuvVM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX1sM535Rz2yxY
 for <linux-aspeed@lists.ozlabs.org>; Sat,  1 May 2021 05:00:23 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UIY0d7127582; Fri, 30 Apr 2021 15:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1ZuVnrBxjak3WUuTyYJta5ioocYYreUyMs4E6oJgkjE=;
 b=X94UuvVMAXqBcgn14SVu/Gv1Ea7U1CsqQVPh/lc6PwV7+I6WCWsedEIbI++klIEyyxcf
 Rcbune6FmvuMzkSmD7CaNrFOmTbDylSUCVg62YMdmy5oK+RcH0bFebgn/69h3yw3IFQf
 C9Uwen2MEKx7xPhPc3g/0VL/ibToz25JQjQT45iVV4AvpYf2efuLCaNNKULRASmtGbqd
 LdzeP3/CB+xKd8+LNM8FSthL186RIk2OdefYig6ccElvNx+x/sWhw6EPaPOULeUSLGS1
 3IRVFqsYR3OknGp7BYmsWJvyBd2Y+HjJ3tCm/4zW5aXpYyhYT86WBFLAZlah5BTD1cXG 0w== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388pcq24gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 15:00:19 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UIrM49006247;
 Fri, 30 Apr 2021 19:00:18 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 384aya5spp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 19:00:18 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UJ0DUk64094526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 19:00:13 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A13906E04E;
 Fri, 30 Apr 2021 19:00:13 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 585FA6E04C;
 Fri, 30 Apr 2021 19:00:13 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.52.42])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Apr 2021 19:00:13 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 2/4] ARM: dts: aspeed: Everest: Fix cable card PCA chips
Date: Fri, 30 Apr 2021 13:59:58 -0500
Message-Id: <20210430190000.31646-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210430190000.31646-1-eajames@linux.ibm.com>
References: <20210430190000.31646-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WAVEvkTdgZR5618XcbdIvIjxkh1GDGJA
X-Proofpoint-GUID: WAVEvkTdgZR5618XcbdIvIjxkh1GDGJA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_11:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 mlxlogscore=944 mlxscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Santosh Puranik <santosh.puranik@in.ibm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Santosh Puranik <santosh.puranik@in.ibm.com>

Correct two PCA chips which were placed on the wrong I2C bus and
address.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Santosh Puranik <santosh.puranik@in.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 168 +++++++++----------
 1 file changed, 83 insertions(+), 85 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 3295c8c7c05c..27af28c8847d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -353,10 +353,47 @@ gpio@15 {
 
 &i2c1 {
 	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
 
-	pca2: pca9552@61 {
+&i2c3 {
+	status = "okay";
+
+	eeprom@54 {
+		compatible = "atmel,24c128";
+		reg = <0x54>;
+	};
+
+	power-supply@68 {
+		compatible = "ibm,cffps";
+		reg = <0x68>;
+	};
+
+	power-supply@69 {
+		compatible = "ibm,cffps";
+		reg = <0x69>;
+	};
+
+	power-supply@6a {
+		compatible = "ibm,cffps";
+		reg = <0x6a>;
+	};
+
+	power-supply@6b {
+		compatible = "ibm,cffps";
+		reg = <0x6b>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	pca2: pca9552@65 {
 		compatible = "nxp,pca9552";
-		reg = <0x61>;
+		reg = <0x65>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -424,12 +461,54 @@ gpio@9 {
 			reg = <9>;
 			type = <PCA955X_TYPE_GPIO>;
 		};
+	};
 
+	i2c-switch@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c4mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+		};
+
+		i2c4mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c4mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
 	};
+};
 
-	pca3: pca9552@62 {
+&i2c5 {
+	status = "okay";
+
+	pca3: pca9552@66 {
 		compatible = "nxp,pca9552";
-		reg = <0x62>;
+		reg = <0x66>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -512,87 +591,6 @@ gpio@11 {
 
 	};
 
-};
-
-&i2c2 {
-	status = "okay";
-};
-
-&i2c3 {
-	status = "okay";
-
-	eeprom@54 {
-		compatible = "atmel,24c128";
-		reg = <0x54>;
-	};
-
-	power-supply@68 {
-		compatible = "ibm,cffps";
-		reg = <0x68>;
-	};
-
-	power-supply@69 {
-		compatible = "ibm,cffps";
-		reg = <0x69>;
-	};
-
-	power-supply@6a {
-		compatible = "ibm,cffps";
-		reg = <0x6a>;
-	};
-
-	power-supply@6b {
-		compatible = "ibm,cffps";
-		reg = <0x6b>;
-	};
-};
-
-&i2c4 {
-	status = "okay";
-
-	i2c-switch@70 {
-		compatible = "nxp,pca9546";
-		reg = <0x70>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "okay";
-		i2c-mux-idle-disconnect;
-
-		i2c4mux0chn0: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-			eeprom@52 {
-				compatible = "atmel,24c64";
-				reg = <0x52>;
-			};
-		};
-
-		i2c4mux0chn1: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-			eeprom@50 {
-				compatible = "atmel,24c64";
-				reg = <0x50>;
-			};
-		};
-
-		i2c4mux0chn2: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-			eeprom@51 {
-				compatible = "atmel,24c64";
-				reg = <0x51>;
-			};
-		};
-	};
-};
-
-&i2c5 {
-	status = "okay";
-
 	i2c-switch@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
-- 
2.27.0

