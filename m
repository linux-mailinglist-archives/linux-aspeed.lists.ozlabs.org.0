Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AFB34D30A
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 17:01:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8G3x31LTz301K
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Mar 2021 02:01:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ANlLzN3e;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ANlLzN3e; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8G3d0d5yz2ydG
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Mar 2021 02:00:43 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TEXPUe089874; Mon, 29 Mar 2021 11:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3xxD9/N2FcO9Z/puwlHtSQB88mNxDJoloMPMmks9wnw=;
 b=ANlLzN3ehKDNYPzELa4wQp5/GDnzmSxXKfsF/Gay5ID5Wp1rqt7KZ9+14cRD3nlXfge9
 5HhHgC0p2GAbvrGlpyjNLNhJNYboCGifQqKKHPDmmLV+/+NDh3Lv8y2Vc901xs6pS1MW
 BKy4/1IAfelrxhdtyeWeYLqAH051TQDfoqU/xi1RUL3C5WL1QKaU7uC415AJiuOHeHKk
 uWV5p23ljqwrGdS6fNJDbSozEiaXiZwxbbvZIP1/auD7BPp81SWPcpOx64JLXtHksFmU
 iQfRAw7EN9bDV0mrz7YluBKnZKoz0dErJ1vgKL5/dvtrz3dUfk8k31zZCWqsNAP+spDt 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhsau14m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:00:37 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12TEXvvs092209;
 Mon, 29 Mar 2021 11:00:36 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhsau137-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:00:36 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12TEr0qR007198;
 Mon, 29 Mar 2021 15:00:35 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 37hvb92w8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 15:00:35 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12TF0XeR8389356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:00:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4452A7805F;
 Mon, 29 Mar 2021 15:00:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC9D278060;
 Mon, 29 Mar 2021 15:00:32 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.3.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 15:00:32 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH 03/22] ARM: dts: aspeed: rainier: Add gpio-keys-polled for fans
Date: Mon, 29 Mar 2021 10:00:01 -0500
Message-Id: <20210329150020.13632-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210329150020.13632-1-eajames@linux.ibm.com>
References: <20210329150020.13632-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HQyVZ4Y_LTvdHfd1vkrFZQBHY7LfTEym
X-Proofpoint-GUID: bjowdMqIssOmK1q9m6GrhvdXbgpCJHPT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_09:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290112
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
 Matthew Barth <msbarth@linux.ibm.com>, robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Brandon Wyman <bjwyman@gmail.com>

Add a gpio-keys-polled section to the Rainier device tree for the fan
presence signals on the PCA9552 I2C device on bus 7.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 43 ++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 1515f81a6c9f..757b45e2eddc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -183,6 +183,49 @@ front-sys-pwron0 {
 			gpios = <&pca_oppanel 3 GPIO_ACTIVE_LOW>;
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
+			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
+			linux,code = <6>;
+		};
+
+		fan1-presence {
+			label = "fan1-presence";
+			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
+			linux,code = <7>;
+		};
+
+		fan2-presence {
+			label = "fan2-presence";
+			gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
+			linux,code = <8>;
+		};
+
+		fan3-presence {
+			label = "fan3-presence";
+			gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
+			linux,code = <9>;
+		};
+
+		fan4-presence {
+			label = "fan4-presence";
+			gpios = <&pca0 10 GPIO_ACTIVE_LOW>;
+			linux,code = <10>;
+		};
+
+		fan5-presence {
+			label = "fan5-presence";
+			gpios = <&pca0 11 GPIO_ACTIVE_LOW>;
+			linux,code = <11>;
+		};
+	};
 };
 
 &ehci1 {
-- 
2.27.0

