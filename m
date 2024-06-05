Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF818FD8D5
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:27:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XEEDeGR+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgXC6dwRz3bTP
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:27:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XEEDeGR+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgSD1R1yz3cVk;
	Thu,  6 Jun 2024 07:23:39 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455K7DIq006862;
	Wed, 5 Jun 2024 21:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=MU/yVusaZAzYIm5jhrcns6ij25EwWFQhZWpvdpTtNWw=;
 b=XEEDeGR+ZYYmnLGurKIeipX8pgtDkOyhp1yIlpjqvAMMLwj8C6XEAEowiR3tuJVFXlX0
 EVTty9dknzNlwEnRkODi7LhjV/CDuOy3HfOTQXW9Wgub0MmLJSFDWwoxD3arsGMXE4Ct
 dQ/TcFYmV0zHk+BmryL89HIy7b/jLJuU1lIsm9isxHpd7/TLdGrupPCtlt+Vkyyy4Btx
 d9U1BnjfqEmJX2HfjoFmCBaCsiBTGJw97CMXczh1c2VSEgdN0DD69U2ePQM6CYkm2BG/
 XjcGrraP7d5RRjPItAe+EYO973NTporg2clKxT0rmA41dXGyoKcqzW1qw/WUOsN8YqlH PQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjxjmr903-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:29 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455KwRtG026549;
	Wed, 5 Jun 2024 21:23:29 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yggp366g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:29 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNP2X24642218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:27 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C5255805D;
	Wed,  5 Jun 2024 21:23:25 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1ED6058065;
	Wed,  5 Jun 2024 21:23:25 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:25 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 40/40] ARM: dts: aspeed: P10: Bump SPI max frequencies
Date: Wed,  5 Jun 2024 16:23:12 -0500
Message-Id: <20240605212312.349188-41-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qb4eb5mdv3-HGoqZyiKOPrRsovDjbZAy
X-Proofpoint-ORIG-GUID: Qb4eb5mdv3-HGoqZyiKOPrRsovDjbZAy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=891 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050160
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
Cc: andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, andrew@codeconstruct.com.au
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

