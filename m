Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40C134D314
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 17:01:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8G4B50Hgz30CP
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Mar 2021 02:01:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iF19Z1j+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iF19Z1j+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8G3g6rDLz302c
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Mar 2021 02:00:46 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TEZ4au118362; Mon, 29 Mar 2021 11:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kPxsFhvgP2eW4NYQ4VHt6Lmqbso8ZiU3vJDzl3Z91rU=;
 b=iF19Z1j+HUU7J0ZnBAA0RDBKMT+lHDkErYWuGpYSsjPp5iKAKLwEtaL7OLmI4NNPBXvE
 shB0DOMWXbr7OT2Jq5KlCPMQcOCt6gveAQi0+30xo4GGl2C+lyThtCctnUtyTJg3+Nbi
 d1y0cCnS8iDmzUEfCdr/8alX08+oWpOeyQtd+KeGUK2dt2faBEF5WzXK4BP6Jm1jjYK8
 bnCWHCQW0ACWovpq+4wVSaKT6aXOUT40fOaHODSdkCHBSp3JMCL82lFWuZ26i294839L
 Xx8yMwjyUGF0FpCURA5y/h7UulYoXOnSq+UZGFtDX8yFCM12x2lnuWCBbM/EOF2V3zrt 6w== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jj7v2nyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:00:41 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12TEqpnd007247;
 Mon, 29 Mar 2021 15:00:39 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 37hvb8q4ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 15:00:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12TF0c6T25690604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:00:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6994478063;
 Mon, 29 Mar 2021 15:00:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0440178067;
 Mon, 29 Mar 2021 15:00:38 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.3.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 15:00:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH 14/22] ARM: dts: Aspeed: Everest: Add FSI CFAMs and re-number
 engines
Date: Mon, 29 Mar 2021 10:00:12 -0500
Message-Id: <20210329150020.13632-15-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210329150020.13632-1-eajames@linux.ibm.com>
References: <20210329150020.13632-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: crcO2NLKAMMBfTxIrnvyco8wzd02AaJa
X-Proofpoint-ORIG-GUID: crcO2NLKAMMBfTxIrnvyco8wzd02AaJa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_09:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2103250000 definitions=main-2103290112
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add additional CFAMs and re-number the existing engines for the
extra processors present on the Everest system.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 648 ++++++++++++++++++-
 1 file changed, 644 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index cc45608b0cbc..de2606b416e6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -44,6 +44,38 @@ aliases {
 		i2c415 = &cfam3_i2c15;
 		i2c416 = &cfam3_i2c16;
 		i2c417 = &cfam3_i2c17;
+		i2c500 = &cfam4_i2c0;
+		i2c501 = &cfam4_i2c1;
+		i2c510 = &cfam4_i2c10;
+		i2c511 = &cfam4_i2c11;
+		i2c512 = &cfam4_i2c12;
+		i2c513 = &cfam4_i2c13;
+		i2c514 = &cfam4_i2c14;
+		i2c515 = &cfam4_i2c15;
+		i2c602 = &cfam5_i2c2;
+		i2c603 = &cfam5_i2c3;
+		i2c610 = &cfam5_i2c10;
+		i2c611 = &cfam5_i2c11;
+		i2c614 = &cfam5_i2c14;
+		i2c615 = &cfam5_i2c15;
+		i2c616 = &cfam5_i2c16;
+		i2c617 = &cfam5_i2c17;
+		i2c700 = &cfam6_i2c0;
+		i2c701 = &cfam6_i2c1;
+		i2c710 = &cfam6_i2c10;
+		i2c711 = &cfam6_i2c11;
+		i2c712 = &cfam6_i2c12;
+		i2c713 = &cfam6_i2c13;
+		i2c714 = &cfam6_i2c14;
+		i2c715 = &cfam6_i2c15;
+		i2c802 = &cfam7_i2c2;
+		i2c803 = &cfam7_i2c3;
+		i2c810 = &cfam7_i2c10;
+		i2c811 = &cfam7_i2c11;
+		i2c814 = &cfam7_i2c14;
+		i2c815 = &cfam7_i2c15;
+		i2c816 = &cfam7_i2c16;
+		i2c817 = &cfam7_i2c17;
 
 		i2c16 = &i2c4mux0chn0;
 		i2c17 = &i2c4mux0chn1;
@@ -83,6 +115,22 @@ aliases {
 		spi41 = &cfam3_spi1;
 		spi42 = &cfam3_spi2;
 		spi43 = &cfam3_spi3;
+		spi50 = &cfam4_spi0;
+		spi51 = &cfam4_spi1;
+		spi52 = &cfam4_spi2;
+		spi53 = &cfam4_spi3;
+		spi60 = &cfam5_spi0;
+		spi61 = &cfam5_spi1;
+		spi62 = &cfam5_spi2;
+		spi63 = &cfam5_spi3;
+		spi70 = &cfam6_spi0;
+		spi71 = &cfam6_spi1;
+		spi72 = &cfam6_spi2;
+		spi73 = &cfam6_spi3;
+		spi80 = &cfam7_spi0;
+		spi81 = &cfam7_spi1;
+		spi82 = &cfam7_spi2;
+		spi83 = &cfam7_spi3;
 	};
 
 	chosen {
@@ -604,7 +652,7 @@ &fsim0 {
 	 */
 	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
 
-	cfam@0,0 {
+	cfam@0,0 {	/* DCM0_C0 */
 		reg = <0 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -748,7 +796,7 @@ fsi_hub0: hub@3400 {
 };
 
 &fsi_hub0 {
-	cfam@1,0 {
+	cfam@1,0 { /* DCM0_C1 */
 		reg = <1 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -892,7 +940,7 @@ fsi_hub1: hub@3400 {
 		};
 	};
 
-	cfam@2,0 {
+	cfam@2,0 { /* DCM1_C0 */
 		reg = <2 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1036,7 +1084,7 @@ fsi_hub2: hub@3400 {
 		};
 	};
 
-	cfam@3,0 {
+	cfam@3,0 { /* DCM1_C1 */
 		reg = <3 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1179,6 +1227,582 @@ fsi_hub3: hub@3400 {
 			no-scan-on-init;
 		};
 	};
+
+	cfam@4,0 { /* DCM2_C0 */
+		reg = <4 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <4>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam4_i2c0: i2c-bus@0 {
+				reg = <0>;	/* OM01 */
+			};
+
+			cfam4_i2c1: i2c-bus@1 {
+				reg = <1>;	/* OM23 */
+			};
+
+			cfam4_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam4_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam4_i2c12: i2c-bus@c {
+				reg = <12>;	/* OP4A */
+			};
+
+			cfam4_i2c13: i2c-bus@d {
+				reg = <13>;	/* OP4B */
+			};
+
+			cfam4_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam4_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam4_spi0: spi@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam4_spi1: spi@20 {
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam4_spi2: spi@40 {
+				reg = <0x40>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam4_spi3: spi@60 {
+				reg = <0x60>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ4: occ {
+				compatible = "ibm,p10-occ";
+			};
+		};
+
+		fsi_hub4: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+
+	cfam@5,0 { /* DCM2_C1 */
+		reg = <5 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <5>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam5_i2c2: i2c-bus@2 {
+				reg = <2>;	/* OM45 */
+			};
+
+			cfam5_i2c3: i2c-bus@3 {
+				reg = <3>;	/* OM67 */
+			};
+
+			cfam5_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam5_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam5_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam5_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+			};
+
+			cfam5_i2c16: i2c-bus@10 {
+				reg = <16>;	/* OP6A */
+			};
+
+			cfam5_i2c17: i2c-bus@11 {
+				reg = <17>;	/* OP6B */
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam5_spi0: spi@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam5_spi1: spi@20 {
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam5_spi2: spi@40 {
+				reg = <0x40>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam5_spi3: spi@60 {
+				reg = <0x60>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ5: occ {
+				compatible = "ibm,p10-occ";
+			};
+		};
+
+		fsi_hub5: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+
+	cfam@6,0 { /* DCM3_C0 */
+		reg = <6 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <6>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam6_i2c0: i2c-bus@0 {
+				reg = <0>;	/* OM01 */
+			};
+
+			cfam6_i2c1: i2c-bus@1 {
+				reg = <1>;	/* OM23 */
+			};
+
+			cfam6_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam6_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam6_i2c12: i2c-bus@c {
+				reg = <12>;	/* OP4A */
+			};
+
+			cfam6_i2c13: i2c-bus@d {
+				reg = <13>;	/* OP4B */
+			};
+
+			cfam6_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam6_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam6_spi0: spi@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam6_spi1: spi@20 {
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam6_spi2: spi@40 {
+				reg = <0x40>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam6_spi3: spi@60 {
+				reg = <0x60>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ6: occ {
+				compatible = "ibm,p10-occ";
+			};
+		};
+
+		fsi_hub6: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+
+	cfam@7,0 { /* DCM3_C1 */
+		reg = <7 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <7>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam7_i2c2: i2c-bus@2 {
+				reg = <2>;	/* OM45 */
+			};
+
+			cfam7_i2c3: i2c-bus@3 {
+				reg = <3>;	/* OM67 */
+			};
+
+			cfam7_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam7_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam7_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam7_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+			};
+
+			cfam7_i2c16: i2c-bus@10 {
+				reg = <16>;	/* OP6A */
+			};
+
+			cfam7_i2c17: i2c-bus@11 {
+				reg = <17>;	/* OP6B */
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam7_spi0: spi@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam7_spi1: spi@20 {
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam7_spi2: spi@40 {
+				reg = <0x40>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam7_spi3: spi@60 {
+				reg = <0x60>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ7: occ {
+				compatible = "ibm,p10-occ";
+			};
+		};
+
+		fsi_hub7: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
 };
 
 /* Legacy OCC numbering (to get rid of when userspace is fixed) */
@@ -1198,6 +1822,22 @@ &fsi_occ3 {
 	reg = <4>;
 };
 
+&fsi_occ4 {
+	reg = <5>;
+};
+
+&fsi_occ5 {
+	reg = <6>;
+};
+
+&fsi_occ6 {
+	reg = <7>;
+};
+
+&fsi_occ7 {
+	reg = <8>;
+};
+
 &ibt {
 	status = "okay";
 };
-- 
2.27.0

