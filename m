Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 969F234D31A
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 17:01:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8G4P4QMNz30DP
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Mar 2021 02:01:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eu7tN4U1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eu7tN4U1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8G3j27pVz3046
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Mar 2021 02:00:49 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TEWlcs101306; Mon, 29 Mar 2021 11:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=o07fK/PX+s864FToqCu+tZMzQAp87DwjcfV0p7Ydg10=;
 b=eu7tN4U1iFQ3XFYrgl2OxpoZM2p/4mR2IrwsTZ8QiMGZl5eQDejuDAFmFjD3ptHOaWFm
 U9r8xvDEUWjhZo+LnlPFHOtPZrAXLPSMa8slxtVHVI5c1y97l6TGmxGm9mVYvThD9ghg
 usNIg9HteYQocctjFVAh2EOtIeC1V7PPgJZ4a3jwv0doflbKQcCjEiA8WT7nLIw4FeS/
 6BFokSzCePXwHl1kdvASHQvTLoxNcoPrxb2shNj1oT0jue09mWaqLCuYN0MwAPsTPiQg
 oNwHV1aVToaqOzG3PKlZoSQ/tbgVurVgocuiYOm1gNlRsVdyK0AIrYTpmeLGmobSbfr1 Tg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhruas62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:00:44 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12TExvEb011717;
 Mon, 29 Mar 2021 15:00:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 37hvb92xnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 15:00:43 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12TF0gMB29294924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:00:42 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26C6478068;
 Mon, 29 Mar 2021 15:00:42 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C844978067;
 Mon, 29 Mar 2021 15:00:41 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.3.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 15:00:41 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH 22/22] ARM: dts: aspeed: Add Rainier 1S4U machine
Date: Mon, 29 Mar 2021 10:00:20 -0500
Message-Id: <20210329150020.13632-23-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210329150020.13632-1-eajames@linux.ibm.com>
References: <20210329150020.13632-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: quRWxsSA4TXt5O_tVGfe0IuxHfeIJ319
X-Proofpoint-ORIG-GUID: quRWxsSA4TXt5O_tVGfe0IuxHfeIJ319
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_09:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=989 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The 1S4U version of the Rainier system has only 4 fans. Create a new
tree, include the 4U version, and delete the 2 extra fans.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/Makefile                        |  1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts | 14 ++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts      |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index c2c8ec8c1cd5..8e1819fb4497 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1424,6 +1424,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ibm-everest.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
 	aspeed-bmc-ibm-rainier-v2.dtb \
+	aspeed-bmc-ibm-rainier-1s4u.dtb \
 	aspeed-bmc-ibm-rainier-4u.dtb \
 	aspeed-bmc-ibm-rainier-4u-v2.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts
new file mode 100644
index 000000000000..78b2dab63624
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2021 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-rainier-4u-v2.dts"
+
+/ {
+	model = "Rainier 1S4U";
+};
+
+&max {
+	/delete-node/ fan4;
+	/delete-node/ fan5;
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index a8c0ed4d37c3..089358704e64 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1979,7 +1979,7 @@ tmp275@48 {
 		reg = <0x48>;
 	};
 
-	max31785@52 {
+	max: max31785@52 {
 		compatible = "maxim,max31785a";
 		reg = <0x52>;
 		#address-cells = <1>;
-- 
2.27.0

