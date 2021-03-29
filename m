Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1834D303
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 17:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8G3h4hzjz303J
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Mar 2021 02:00:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qKmVTZW/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qKmVTZW/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8G3d2GZfz3007
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Mar 2021 02:00:43 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TEXW1Z138953; Mon, 29 Mar 2021 11:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dM+UINiMudp2pcoC/xDQEBjN7i4xTolx90uYnHImHBE=;
 b=qKmVTZW/XsQJwWml/+F3hJ4XymDOVpLlkcA0gXvlHvv35D9UNPJYmyMQn26YkhkNA8do
 ztoQ0YBCg1tdVJgxT+K7LynnRepkbElCqCBsvJzwsk91eX7nzxS/Y0ihwBykq3lcwKqe
 T5d/jOIYnmiu6aZMEHBGZUSvCylqNjqGLvZl/HE9T4upCtBPDlhks+qee8cUn2VbYS9L
 f/cfwblZu0hJ96oYVnfDyOgZ5pQs/0QszYxGHRjzi77AOopNuSrSA1l57vdE2G0mmRqA
 2asxUjH/u6l6GgLLyCJPnPPh3oGh47AR3Dl110GBSwCjxQQuv5enEi7gjB31zHZ6mdRw Pg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37kgm0s5v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:00:38 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12TEr4SN007248;
 Mon, 29 Mar 2021 15:00:36 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 37hvb92w98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 15:00:36 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12TF0Zjb28442974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:00:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C9207807E;
 Mon, 29 Mar 2021 15:00:35 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B058178070;
 Mon, 29 Mar 2021 15:00:34 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.3.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 15:00:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH 07/22] ARM: dts: aspeed: rainier: Add leds on optional DASD
 cards
Date: Mon, 29 Mar 2021 10:00:05 -0500
Message-Id: <20210329150020.13632-8-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210329150020.13632-1-eajames@linux.ibm.com>
References: <20210329150020.13632-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3a9q81uAeCkfnOu_gd7hQbt70qoOn9tv
X-Proofpoint-ORIG-GUID: 3a9q81uAeCkfnOu_gd7hQbt70qoOn9tv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_09:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=870 clxscore=1015 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

These cards are not hot pluggable and must be installed
prior to boot. LEDs on these are controlled by PCA9552
i2c expander

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 425 +++++++++++++++++++
 1 file changed, 425 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index b47b7b995170..0a420170b3b4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -634,6 +634,161 @@ tpm-wilson {
 		};
 	};
 
+	leds-optional-dasd-pyramid0 {
+		compatible = "gpio-leds";
+
+		nvme0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 0 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 1 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 2 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme3 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 3 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme4 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 4 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme5 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 5 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme6 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 6 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme7 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds-optional-dasd-pyramid1 {
+		compatible = "gpio-leds";
+
+		nvme8 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 0 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme9 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 1 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme10 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 2 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme11 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 3 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme12 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 4 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme13 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 5 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme14 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 6 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme15 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds-optional-dasd-pyramid2 {
+		compatible = "gpio-leds";
+
+		nvme16 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 0 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme17 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 1 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme18 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 2 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme19 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 3 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme20 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 4 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme21 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 5 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme22 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 6 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme23 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 7 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &ehci1 {
@@ -2218,6 +2373,96 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	pca2: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
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
 };
 
 &i2c14 {
@@ -2227,6 +2472,96 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	pca3: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
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
 };
 
 &i2c15 {
@@ -2236,6 +2571,96 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	pca4: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
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
 };
 
 &vuart1 {
-- 
2.27.0

