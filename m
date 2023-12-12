Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A46480F354
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 17:41:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cmrr7qJC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqPWl5471z3c7S
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Dec 2023 03:41:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cmrr7qJC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqPWG1XnWz3bsZ
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 03:40:57 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BCGMPCe019334;
	Tue, 12 Dec 2023 16:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tmJe/JZ296DURUaVy7GUaVqjm02svk/RNk/Yqlo417I=;
 b=Cmrr7qJCOfZFF9L9hbIHdMEMzNePBTCHCHsQnjZ4XyuZshuc8VSpLX8QDOVxeZx/wILA
 Zm//K1y0Y+J/btEW5PiDndm9CV5CY8vIcXPGkQSGKzDCJKak8oq90Bm35JAZ5ezwkHj8
 n3P/ayCsiag53LvT9dz2TeUkc0AE1SVs2y5SwDnx9MhINycxKIJCit7Mtped5Cyjydsa
 57hB2BSOUXoJPnqvVvY8MSXsHEGqWJjDUt16I5U6XButQ2izI6M1CnxWm6PKfwpVi9mm
 reX1nIDNYnzW+nsJUPTFmgSbHUUhtOV5GEpJdW6g6eV666R5nQL9ap2M//0MoIwCtg6L Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uxtyprqf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:40:32 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BCGYl27003186;
	Tue, 12 Dec 2023 16:40:31 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uxtyprqe8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:40:31 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BCGCKrj013937;
	Tue, 12 Dec 2023 16:40:30 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw5921t5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:40:30 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BCGeSJs22020620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Dec 2023 16:40:28 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA7ED5805D;
	Tue, 12 Dec 2023 16:40:28 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E8F758043;
	Tue, 12 Dec 2023 16:40:27 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Dec 2023 16:40:26 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        joel@jms.id.au, andrew@codeconstruct.com.au, peterhuewe@gmx.de,
        jarkko@kernel.org, jgg@ziepe.ca, keescook@chromium.org,
        tony.luck@intel.com, gpiccoli@igalia.com, ninad@linux.ibm.com,
        johannes.holland@infineon.com, linux@roeck-us.net, broonie@kernel.org
Subject: [PATCH v1 8/8] ARM: dts: aspeed: System1: PS, sensor and more
Date: Tue, 12 Dec 2023 10:40:04 -0600
Message-Id: <20231212164004.1683589-9-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212164004.1683589-1-ninad@linux.ibm.com>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -6uK4Z8Wwo4M6g5aeTkJcL1lBG78X423
X-Proofpoint-ORIG-GUID: Ig5f-nSJ8J74hckYsgm9q2vjWlJQ1rTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-12_10,2023-12-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312120128
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
Cc: devicetree@vger.kernel.org, festevam@denx.de, linux-aspeed@lists.ozlabs.org, peteryin.openbmc@gmail.com, alexander.stein@ew.tq-group.com, linux-kernel@vger.kernel.org, naresh.solanki@9elements.com, linux-arm-kernel@lists.infradead.org, lakshmiy@us.ibm.com, bhelgaas@google.com, vincent@vtremblay.dev, linux-integrity@vger.kernel.org, geissonator@yahoo.com, patrick.rudolph@9elements.com, linux-hardening@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This drop adds following devices in the device tree.
- EEPROM/VPD
- Power supplies
- Humidity, pressure and temperature sensors.
- Trusted platform module(TPM) chip

Tested:
    This board is tested using the simics simulator.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 75562aa63701..d960b938fe8d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -461,6 +461,11 @@ &kcs3 {
 &i2c0 {
 	status = "okay";
 
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
 	regulator@60 {
 		compatible = "maxim,max8952";
 		reg = <0x60>;
@@ -655,6 +660,25 @@ pca0: pca9539@74 {
 
 &i2c2 {
 	status = "okay";
+
+	power-supply@58 {
+		compatible = "ibm,cffps";
+		reg = <0x58>;
+	};
+
+	power-supply@59 {
+		compatible = "ibm,cffps";
+		reg = <0x59>;
+	};
+
+	power-supply@5a {
+		compatible = "ibm,cffps";
+		reg = <0x5a>;
+	};
+	power-supply@5b {
+		compatible = "ibm,cffps";
+		reg = <0x5b>;
+	};
 };
 
 &i2c3 {
@@ -758,6 +782,11 @@ fan-controller@54 {
 		#size-cells = <0>;
 	};
 
+	eeprom@55 {
+		compatible = "atmel,24c64";
+		reg = <0x55>;
+	};
+
 	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		reg = <0x70>;
@@ -795,6 +824,21 @@ i2c6mux0chn4: i2c@4 {
 			#size-cells = <0>;
 			reg = <4>;
 
+			humidity-sensor@40 {
+				compatible = "ti,hdc1080";
+				reg = <0x40>;
+			};
+
+			temperature-sensor@48 {
+				compatible = "ti,tmp275";
+				reg = <0x48>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
+
 			led-controller@60 {
 				compatible = "nxp,pca9551";
 				reg = <0x60>;
@@ -836,6 +880,12 @@ led@3 {
 					type = <PCA955X_TYPE_LED>;
 				};
 			};
+
+			temperature-sensor@76 {
+				compatible = "infineon,dps310";
+				reg = <0x76>;
+				#io-channel-cells = <0>;
+			};
 		};
 
 		i2c6mux0chn5: i2c@5 {
@@ -1100,6 +1150,11 @@ i2c8mux0chn6: i2c@6 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <6>;
+
+			temperature-sensor@4c {
+				compatible = "ti,tmp423";
+				reg = <0x4c>;
+			};
 		};
 
 		i2c8mux0chn7: i2c@7 {
@@ -1128,6 +1183,11 @@ regulator@41 {
 		reg = <0x41>;
 	};
 
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
 	regulator@60 {
 		compatible = "maxim,max8952";
 		reg = <0x60>;
@@ -1148,6 +1208,12 @@ regulator@60 {
 
 &i2c11 {
 	status = "okay";
+
+	tpm@2e {
+		compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		memory-region = <&event_log>;
+	};
 };
 
 &i2c12 {
@@ -1552,6 +1618,11 @@ i2c15mux0chn6: i2c@6 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <6>;
+
+			temperature-sensor@4c {
+				compatible = "ti,tmp423";
+				reg = <0x4c>;
+			};
 		};
 
 		i2c15mux0chn7: i2c@7 {
@@ -1563,6 +1634,11 @@ regulator@40 {
 				compatible = "infineon,ir38060";
 				reg = <0x40>;
 			};
+
+			temperature-sensor@4c {
+				compatible = "ti,tmp423";
+				reg = <0x4c>;
+			};
 		};
 	};
 };
-- 
2.39.2

