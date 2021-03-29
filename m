Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D685D34D310
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 17:01:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8G3z4D0Vz3007
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Mar 2021 02:01:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a9cAERd6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a9cAERd6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8G3d2dplz301K
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Mar 2021 02:00:43 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TEXMu3106750; Mon, 29 Mar 2021 11:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qQRQOdu89/MHnd0R+9rOOycXL+gOEUSev6bfgzgFkXQ=;
 b=a9cAERd6cQalsw3kMyaI16H/NrYbK5uyaYRVyJCWOSCPwwAKSFlJzTl/MAM8Cci5xomA
 q4nqUbW5bm8XHbDRgX3bH1xs04dx4J5ek6lANRGACrt/Bbwwg9ABas7YEPkZQouYqwmK
 GMxS8MTNYzqvZSjq8DWI84ZdrBpACiGDxJsxmZMHcO/mW/4NDwy8d/9by1Cp6C5b5V6x
 r7GyBAlPw6AZS4WzieivzJP/7XpLvATeQKXQ/6uEmGcWFr228xrU0YSQtOXRFswazka2
 n6HEPhpZk3QzX1AiZDYOGELiFvVFmLS/ZEaNwCbHkauTb28pr4d7O7u2yVsySYtXTcAa sw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhsru0rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:00:36 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12TEqkOK014064;
 Mon, 29 Mar 2021 15:00:35 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 37jtuayya7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 15:00:35 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12TF0YO530802420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:00:34 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9331A78069;
 Mon, 29 Mar 2021 15:00:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40DE77806A;
 Mon, 29 Mar 2021 15:00:34 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.3.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 15:00:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH 06/22] ARM: dts: aspeed: rainier: Add leds that are off
 pic16f882
Date: Mon, 29 Mar 2021 10:00:04 -0500
Message-Id: <20210329150020.13632-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210329150020.13632-1-eajames@linux.ibm.com>
References: <20210329150020.13632-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -pgOh3zmoD8q2oLylN5u1mPwi6q4Nt6Y
X-Proofpoint-ORIG-GUID: -pgOh3zmoD8q2oLylN5u1mPwi6q4Nt6Y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_09:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=655 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103290112
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>, robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

There are many LEDs that are connected to PIC16F882.
PIC has the software implementation of pca9552

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 690 +++++++++++++++++++
 1 file changed, 690 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 016b0ead5404..b47b7b995170 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -302,6 +302,336 @@ fan5 {
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
@@ -1314,6 +1644,366 @@ gpio@7 {
 		};
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
2.27.0

