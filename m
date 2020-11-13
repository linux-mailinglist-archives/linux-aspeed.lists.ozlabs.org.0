Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC42B2973
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Nov 2020 01:01:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXwVp6lKTzDr83
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Nov 2020 11:01:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PT0vhR62; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXSV40LflzDr3R
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Nov 2020 16:59:39 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AD5WsYI073867; Fri, 13 Nov 2020 00:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=7PQpd1FQhP6m2q9eloSq7lGBHZVbK4MR1vtxU8YFtvw=;
 b=PT0vhR62uZegryfeqUixrpeMInC/a5IKgqnP/vToOwc+F6fQuLcgWbLfzC78FKulJej2
 pClVmfI/nBxe5MEcsFL45BkDzrEI7Ge6IjBSbMSewFn1z4V82aaVRj9g3IySk82sWUxW
 yzbpOk0i6YYkK7xm28OW4tG/jBj+fJsf0QHxYbVClMthHUv5S2Qk/64VKsSZoSC84nqC
 2tAB75JrUl8NHsqzHGdJ27D1aYfns+sq6B7pYdJCLZpQqz4us0tFNBm5FYO38VdRoQ2Q
 sH4q7JFnl4xhJPv3hwlsAjiJwcdiiX4g6F9KZxEMDfQk1BQlSQD9jCee8WvTB5+6MLN8 Rw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34sf3gyn9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 00:59:36 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AD5vf4r016340;
 Fri, 13 Nov 2020 05:59:35 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 34nk7a8fk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 05:59:35 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AD5xYAE9306826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 05:59:34 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98B41112062;
 Fri, 13 Nov 2020 05:59:34 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7305F112061;
 Fri, 13 Nov 2020 05:59:34 +0000 (GMT)
Received: from gfw170.aus.stglabs.ibm.com (unknown [9.3.62.224])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 Nov 2020 05:59:34 +0000 (GMT)
Received: by gfw170.aus.stglabs.ibm.com (Postfix, from userid 298080)
 id 2B795152; Thu, 12 Nov 2020 23:59:34 -0600 (CST)
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
To: joel@jms.id.au, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, 
 robh+dt@kernel.org
Subject: [PATCH 4/6] ARM: dts: aspeed: rainier: Add leds that are off PIC16F882
Date: Thu, 12 Nov 2020 23:59:26 -0600
Message-Id: <1605247168-1028-4-git-send-email-vishwa@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
References: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-13_03:2020-11-12,
 2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxlogscore=703 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130032
X-Mailman-Approved-At: Sat, 14 Nov 2020 11:01:50 +1100
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
Cc: vishwa@linux.vnet.ibm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

There are many LEDs that are connected to PIC16F882.
PIC has the software implementation of PCA9552

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 690 +++++++++++++++++++++++++++
 1 file changed, 690 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index b7d7246..88fefc0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -209,6 +209,336 @@
 			default-state = "keep";
 			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
 		};
+
+		ddimm0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 0 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 1 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 2 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm3 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 3 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm4 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 4 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm5 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 5 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm6 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 6 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm7 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 7 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm8 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 8 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm9 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 9 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm10 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 10 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm11 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 11 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm12 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 12 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm13 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 13 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm14 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 14 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm15 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 15 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm16 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 0 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm17 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 1 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm18 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 2 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm19 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 3 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm20 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 4 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm21 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 5 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm22 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 6 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm23 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 7 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm24 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 8 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm25 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 9 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm26 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 10 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm27 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 11 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm28 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 12 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm29 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 13 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm30 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 14 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm31 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 15 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 0 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 1 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 2 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot3 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 3 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot4 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 4 GPIO_ACTIVE_LOW>;
+		};
+
+		cpu1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 5 GPIO_ACTIVE_LOW>;
+		};
+
+		cpu1-vrm0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 6 GPIO_ACTIVE_LOW>;
+		};
+
+		lcd-russel {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 8 GPIO_ACTIVE_LOW>;
+		};
+
+		planar {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 0 GPIO_ACTIVE_LOW>;
+		};
+
+		cpu0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 1 GPIO_ACTIVE_LOW>;
+		};
+
+		dasd-pyramid0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 3 GPIO_ACTIVE_LOW>;
+		};
+
+		dasd-pyramid1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 4 GPIO_ACTIVE_LOW>;
+		};
+
+		dasd-pyramid2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 5 GPIO_ACTIVE_LOW>;
+		};
+
+		cpu0-vrm0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 6 GPIO_ACTIVE_LOW>;
+		};
+
+		rtc-battery {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 7 GPIO_ACTIVE_LOW>;
+		};
+
+		base-blyth {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 8 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot6 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 9 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot7 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 10 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot8 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 11 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot9 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 12 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot10 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 13 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot11 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 14 GPIO_ACTIVE_LOW>;
+		};
+
+		tpm-wilson {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 15 GPIO_ACTIVE_LOW>;
+		};
 	};
 };
 
@@ -981,6 +1311,366 @@
 		reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	pic1: pca9952@32 {
+		compatible = "ibm,pca9552";
+		reg = <0x32>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
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
+	pic2: pca9552@31 {
+		compatible = "ibm,pca9552";
+		reg = <0x31>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
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
+	pic3: pca9552@30 {
+		compatible = "ibm,pca9552";
+		reg = <0x30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
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
+	pic4: pca9552@33 {
+		compatible = "ibm,pca9552";
+		reg = <0x33>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
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
 	dps: dps310@76 {
 		compatible = "infineon,dps310";
 		reg = <0x76>;
-- 
1.8.3.1

