Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155E34D315
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 17:01:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8G4D3VqVz30CC
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Mar 2021 02:01:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dVUJc+7q;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dVUJc+7q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8G3h2Hlnz3035
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Mar 2021 02:00:46 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TEYM8S140371; Mon, 29 Mar 2021 11:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Xa1eyZ15jGg3qh1w3SQfwrGc77rOWfQxfz+Oc6isq7s=;
 b=dVUJc+7qG/Qm3uAqZx9yaIvWShoaAcnI5k5pohvK9WkQxN5xazoEdckn1SDyFLFcWVdx
 vKymS/cwDurDfNYNDM5ti/6Pic5mx7stl8fgiXRZVyeIEAhIP+AFOCx3oN8884OFiImU
 FdvnRc6nBaiBa6RFf8CCUVu/tB9nW+ZfBBiW3Xnb+z6VNqmHnDsMN42d2PSj5y5MYHsO
 bLgjsd+IkO020qCWPXNfVDPIfWSYxqqOjEBLtUE8zAL/poPSOd/oGYUym1HX91f/m82I
 7ulJw5iRJPqvZPDdAInN/AsDQ77DaNi3KxVqBXfY9fyQibS8WNVvZla2HcyEClhZD0GP BQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37jhsbhx1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:00:41 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12TExwY8011721;
 Mon, 29 Mar 2021 15:00:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 37hvb92xmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 15:00:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12TF0c7R18481456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:00:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D98B378064;
 Mon, 29 Mar 2021 15:00:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C28778067;
 Mon, 29 Mar 2021 15:00:38 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.3.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 15:00:38 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH 15/22] ARM: dts: Aspeed: Everest: Add pca9552 fan presence
Date: Mon, 29 Mar 2021 10:00:13 -0500
Message-Id: <20210329150020.13632-16-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210329150020.13632-1-eajames@linux.ibm.com>
References: <20210329150020.13632-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RpYfdUQPRih6Eq3tZi4N6JY2UAVKseJ_
X-Proofpoint-GUID: RpYfdUQPRih6Eq3tZi4N6JY2UAVKseJ_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_09:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=959
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
 Matthew Barth <msbarth@us.ibm.com>, robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Matthew Barth <msbarth@us.ibm.com>

Add the pca9552 at address 0x61 on i2c14 behind mux0 channel 3 with the
4 GPIO fan presence inputs.

Signed-off-by: Matthew Barth <msbarth@us.ibm.com>
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 128 +++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index de2606b416e6..d7f23b74dd4b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -171,6 +171,37 @@ vga_memory: region@bf000000 {
 			reg = <0xbf000000 0x01000000>; /* 16M */
 		};
 	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <1000>;
+
+		fan0-presence {
+			label = "fan0-presence";
+			gpios = <&pca0 15 GPIO_ACTIVE_LOW>;
+			linux,code = <15>;
+		};
+
+		fan1-presence {
+			label = "fan1-presence";
+			gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
+			linux,code = <14>;
+		};
+
+		fan2-presence {
+			label = "fan2-presence";
+			gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
+			linux,code = <13>;
+		};
+
+		fan3-presence {
+			label = "fan3-presence";
+			gpios = <&pca0 12 GPIO_ACTIVE_LOW>;
+			linux,code = <12>;
+		};
+	};
 };
 
 &i2c0 {
@@ -567,6 +598,103 @@ fan@3 {
 					maxim,fan-fault-pin-mon;
 				};
 			};
+
+			pca0: pca9552@61 {
+				compatible = "nxp,pca9552";
+				reg = <0x61>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				gpio-line-names =
+					"","","","",
+					"","","","",
+					"","","","",
+					"presence-fan3",
+					"presence-fan2",
+					"presence-fan1",
+					"presence-fan0";
+
+				gpio@0 {
+					reg = <0>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@1 {
+					reg = <1>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@8 {
+					reg = <8>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@9 {
+					reg = <9>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@10 {
+					reg = <10>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@11 {
+					reg = <11>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@12 {
+					reg = <12>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@13 {
+					reg = <13>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@14 {
+					reg = <14>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@15 {
+					reg = <15>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
 		};
 	};
 
-- 
2.27.0

