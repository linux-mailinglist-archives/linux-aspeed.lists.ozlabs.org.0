Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 415828C7C2B
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:22:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kq2SZSe1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJNX5CWJz3fpl
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:22:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kq2SZSe1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJKH6WJCz3fmy;
	Fri, 17 May 2024 04:19:47 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHc0i9010903;
	Thu, 16 May 2024 18:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MU/yVusaZAzYIm5jhrcns6ij25EwWFQhZWpvdpTtNWw=;
 b=kq2SZSe1fmpTXPeJmkekUoZ2+rvZKdMUwdk+u1/kxhexzp3YPQwopRIhhhC/J2XNUMZY
 MOHa4AMfI2K+UYQKSXskxJyen9lkB9oilLP0ALehl0lZN3wANIMKZ4t3V0x3HrngGTN6
 TlGAsJ8vdjqqePp65s81H9u6NCBrvbvbjYSHl0eaqYaiJ0cXqcwgHaQXE+OylPuGsfP5
 u0z5pC7C2gqOQnFmOZMTr+pOdyo6L1Up34sxsAVzvG7AUYkaC+JAj9zBap2rkwTDGvEG
 woezbfUT1xsnd9z7+AA4NvPNMjYL9xOaXArnI1hlG/o+5rOxkl9Uqei64VcsWrMYbU/n dQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5pq5r36c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:22 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHJCHp018780;
	Thu, 16 May 2024 18:19:22 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:22 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJJAa7930520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8739A5806A;
	Thu, 16 May 2024 18:19:19 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48E0258070;
	Thu, 16 May 2024 18:19:19 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v3 40/40] ARM: dts: aspeed: P10: Bump SPI max frequencies
Date: Thu, 16 May 2024 13:19:07 -0500
Message-Id: <20240516181907.3468796-41-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fphCgzX11WaTYDUihhaLg9Q_L_Mk4LGS
X-Proofpoint-ORIG-GUID: fphCgzX11WaTYDUihhaLg9Q_L_Mk4LGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 mlxlogscore=894 priorityscore=1501 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132
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
Cc: andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, andrew@codeconstruct.com.au, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

These parts support 10MHZ.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 32 +++++++++----------
 .../arm/boot/dts/aspeed/ibm-power10-dual.dtsi | 16 +++++-----
 .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi | 16 +++++-----
 3 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
index 214b2e6a4c6df..1365dc95f1352 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
@@ -2797,7 +2797,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -2813,7 +2813,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -2830,7 +2830,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -2847,7 +2847,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
@@ -3170,7 +3170,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3186,7 +3186,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3203,7 +3203,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3220,7 +3220,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
@@ -3543,7 +3543,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3559,7 +3559,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3576,7 +3576,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3593,7 +3593,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
@@ -3916,7 +3916,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3932,7 +3932,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3949,7 +3949,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3966,7 +3966,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
index 44e48e39e6e96..e11354bb384c2 100644
--- a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
+++ b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
@@ -94,7 +94,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -110,7 +110,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -127,7 +127,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -144,7 +144,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
@@ -261,7 +261,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -277,7 +277,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -294,7 +294,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -311,7 +311,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
index 57494c744b5d0..0ffb4ae6423fc 100644
--- a/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
+++ b/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
@@ -744,7 +744,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -760,7 +760,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -777,7 +777,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -794,7 +794,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
@@ -1117,7 +1117,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -1133,7 +1133,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -1150,7 +1150,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -1167,7 +1167,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
-- 
2.39.3

