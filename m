Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFA38AB662
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Apr 2024 23:19:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pm3j0ltP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLnZW0PMdz3cmr
	for <lists+linux-aspeed@lfdr.de>; Sat, 20 Apr 2024 07:18:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pm3j0ltP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLnZ54hKsz2ydQ;
	Sat, 20 Apr 2024 07:18:37 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43JKv83n007335;
	Fri, 19 Apr 2024 21:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Kgiart2H1LhIs4HrMoEZfYxfSqLDr2qGv3V4+oa/2+8=;
 b=pm3j0ltPLFTiP+Ya/Hb/w7A8p4/hw5Fff78UIc0ZwSFEoi9bqp2txzWt+Rbj3D34sKa/
 BFGH1Mc70PHWgg6mwn49JH5vlSI7ofiXla2J/mstLE3XAevH5lr9wWykXLsD86AMxV+8
 X4imOAJ0IS0qZ8yLTrKJxnK0fQQ6C+OCLGySGaJWvSubmYoOaoZ+z1qXq7qCPqOPz2Ya
 qrM3Ec6ITTF3mWGSU40LVpd1MYwXEmDLO23FBsvEGq18ghucjU7/v5jBr8ko2YtoHOSS
 9XfVmWDcIN+7IJpM6J+MdH357LEWHYjkMf0l1wVh3Pb0nT2iFVroYIzbz1EQAs20WLoz hg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xm03n81vf-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 21:18:27 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43JIOo0u030356;
	Fri, 19 Apr 2024 21:11:48 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xkbmcp2hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 21:11:48 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43JLBkZ447907348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Apr 2024 21:11:48 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91D5C5806D;
	Fri, 19 Apr 2024 21:11:44 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FC535806B;
	Fri, 19 Apr 2024 21:11:44 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.157.174])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 Apr 2024 21:11:44 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v3 3/3] ARM: dts: aspeed: Update Odyssey SBEFIFO compatible strings
Date: Fri, 19 Apr 2024 16:11:43 -0500
Message-Id: <20240419211143.1039868-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240419211143.1039868-1-eajames@linux.ibm.com>
References: <20240419211143.1039868-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dw3UtMaK3iYpEFelRn-DLJO1Wxp02k1E
X-Proofpoint-GUID: dw3UtMaK3iYpEFelRn-DLJO1Wxp02k1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_15,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404190165
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, alistair@popple.id.au, jk@ozlabs.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

A new type of SBE, found on the Odyssey chip, will return any async FFDC in
the next transaction, so collecting the FFDC is unnecessary and results in
unexpected behavior. This difference in behavior between the Odyssey SBE
and the POWER9/10 SBEs wasn't apparent when support for the Odyssey was
added. To fix the unexpected behavior, set the new compatible string for
Odyssey SBEFIFOs so that they don't collect async FFDC.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v2:
 - Update commit message

Changes since v1:
 - Change "ody" to "odyssey"

 .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 64 +++++++++----------
 .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi | 64 +++++++++----------
 2 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
index 214b2e6a4c6d..27dfe315d633 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
@@ -2545,7 +2545,7 @@ scom500: scom@1000 {
 						};
 
 						sbefifo500: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -2577,7 +2577,7 @@ scom501: scom@1000 {
 						};
 
 						sbefifo501: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -2609,7 +2609,7 @@ scom510: scom@1000 {
 						};
 
 						sbefifo510: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -2641,7 +2641,7 @@ scom511: scom@1000 {
 						};
 
 						sbefifo511: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -2673,7 +2673,7 @@ scom512: scom@1000 {
 						};
 
 						sbefifo512: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -2705,7 +2705,7 @@ scom513: scom@1000 {
 						};
 
 						sbefifo513: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -2737,7 +2737,7 @@ scom514: scom@1000 {
 						};
 
 						sbefifo514: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -2769,7 +2769,7 @@ scom515: scom@1000 {
 						};
 
 						sbefifo515: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -2918,7 +2918,7 @@ scom602: scom@1000 {
 						};
 
 						sbefifo602: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -2950,7 +2950,7 @@ scom603: scom@1000 {
 						};
 
 						sbefifo603: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -2982,7 +2982,7 @@ scom610: scom@1000 {
 						};
 
 						sbefifo610: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3014,7 +3014,7 @@ scom611: scom@1000 {
 						};
 
 						sbefifo611: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3046,7 +3046,7 @@ scom614: scom@1000 {
 						};
 
 						sbefifo614: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3078,7 +3078,7 @@ scom615: scom@1000 {
 						};
 
 						sbefifo615: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3110,7 +3110,7 @@ scom616: scom@1000 {
 						};
 
 						sbefifo616: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3142,7 +3142,7 @@ scom617: scom@1000 {
 						};
 
 						sbefifo617: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3291,7 +3291,7 @@ scom700: scom@1000 {
 						};
 
 						sbefifo700: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3323,7 +3323,7 @@ scom701: scom@1000 {
 						};
 
 						sbefifo701: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3355,7 +3355,7 @@ scom710: scom@1000 {
 						};
 
 						sbefifo710: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3387,7 +3387,7 @@ scom711: scom@1000 {
 						};
 
 						sbefifo711: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3419,7 +3419,7 @@ scom712: scom@1000 {
 						};
 
 						sbefifo712: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3451,7 +3451,7 @@ scom713: scom@1000 {
 						};
 
 						sbefifo713: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3483,7 +3483,7 @@ scom714: scom@1000 {
 						};
 
 						sbefifo714: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3515,7 +3515,7 @@ scom715: scom@1000 {
 						};
 
 						sbefifo715: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3664,7 +3664,7 @@ scom802: scom@1000 {
 						};
 
 						sbefifo802: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3696,7 +3696,7 @@ scom803: scom@1000 {
 						};
 
 						sbefifo803: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3728,7 +3728,7 @@ scom810: scom@1000 {
 						};
 
 						sbefifo810: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3760,7 +3760,7 @@ scom811: scom@1000 {
 						};
 
 						sbefifo811: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3792,7 +3792,7 @@ scom814: scom@1000 {
 						};
 
 						sbefifo814: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3824,7 +3824,7 @@ scom815: scom@1000 {
 						};
 
 						sbefifo815: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3856,7 +3856,7 @@ scom816: scom@1000 {
 						};
 
 						sbefifo816: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -3888,7 +3888,7 @@ scom817: scom@1000 {
 						};
 
 						sbefifo817: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
index 57494c744b5d..58848e77143c 100644
--- a/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
+++ b/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
@@ -22,7 +22,7 @@ scom100: scom@1000 {
 			};
 
 			sbefifo100: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -50,7 +50,7 @@ scom101: scom@1000 {
 			};
 
 			sbefifo101: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -78,7 +78,7 @@ scom110: scom@1000 {
 			};
 
 			sbefifo110: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -106,7 +106,7 @@ scom111: scom@1000 {
 			};
 
 			sbefifo111: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -134,7 +134,7 @@ scom112: scom@1000 {
 			};
 
 			sbefifo112: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -162,7 +162,7 @@ scom113: scom@1000 {
 			};
 
 			sbefifo113: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -190,7 +190,7 @@ scom114: scom@1000 {
 			};
 
 			sbefifo114: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -218,7 +218,7 @@ scom115: scom@1000 {
 			};
 
 			sbefifo115: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -246,7 +246,7 @@ scom202: scom@1000 {
 			};
 
 			sbefifo202: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -274,7 +274,7 @@ scom203: scom@1000 {
 			};
 
 			sbefifo203: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -302,7 +302,7 @@ scom210: scom@1000 {
 			};
 
 			sbefifo210: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -330,7 +330,7 @@ scom211: scom@1000 {
 			};
 
 			sbefifo211: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -358,7 +358,7 @@ scom214: scom@1000 {
 			};
 
 			sbefifo214: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -386,7 +386,7 @@ scom215: scom@1000 {
 			};
 
 			sbefifo215: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -414,7 +414,7 @@ scom216: scom@1000 {
 			};
 
 			sbefifo216: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -442,7 +442,7 @@ scom217: scom@1000 {
 			};
 
 			sbefifo217: sbefifo@2400 {
-				compatible = "ibm,p9-sbefifo";
+				compatible = "ibm,odyssey-sbefifo";
 				reg = <0x2400 0x400>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -492,7 +492,7 @@ scom300: scom@1000 {
 						};
 
 						sbefifo300: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -524,7 +524,7 @@ scom301: scom@1000 {
 						};
 
 						sbefifo301: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -556,7 +556,7 @@ scom310: scom@1000 {
 						};
 
 						sbefifo310: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -588,7 +588,7 @@ scom311: scom@1000 {
 						};
 
 						sbefifo311: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -620,7 +620,7 @@ scom312: scom@1000 {
 						};
 
 						sbefifo312: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -652,7 +652,7 @@ scom313: scom@1000 {
 						};
 
 						sbefifo313: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -684,7 +684,7 @@ scom314: scom@1000 {
 						};
 
 						sbefifo314: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -716,7 +716,7 @@ scom315: scom@1000 {
 						};
 
 						sbefifo315: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -865,7 +865,7 @@ scom402: scom@1000 {
 						};
 
 						sbefifo402: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -897,7 +897,7 @@ scom403: scom@1000 {
 						};
 
 						sbefifo403: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -929,7 +929,7 @@ scom410: scom@1000 {
 						};
 
 						sbefifo410: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -961,7 +961,7 @@ scom411: scom@1000 {
 						};
 
 						sbefifo411: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -993,7 +993,7 @@ scom414: scom@1000 {
 						};
 
 						sbefifo414: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -1025,7 +1025,7 @@ scom415: scom@1000 {
 						};
 
 						sbefifo415: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -1057,7 +1057,7 @@ scom416: scom@1000 {
 						};
 
 						sbefifo416: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
@@ -1089,7 +1089,7 @@ scom417: scom@1000 {
 						};
 
 						sbefifo417: sbefifo@2400 {
-							compatible = "ibm,p9-sbefifo";
+							compatible = "ibm,odyssey-sbefifo";
 							reg = <0x2400 0x400>;
 							#address-cells = <1>;
 							#size-cells = <0>;
-- 
2.39.3

