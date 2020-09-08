Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 725FB261F62
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 22:02:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmGKM20TzzDqRb
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Sep 2020 06:02:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Yo78C4zu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmGHg2xWNzDqRY
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Sep 2020 06:01:17 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 088JX43j163467; Tue, 8 Sep 2020 16:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d9Z1A13gqnSeYufwW0KlPFsz/dAJdIaf05kQSmmHkvM=;
 b=Yo78C4zudiuhvxoUXGy9UdPzzfIm6j0hOwPb9PzahM/kFLBuEur4BdepaObbe0snT5jS
 lky05g/flN4kpfIBqTDfYkuwUs7pLohXUP6GPda6sqKRQBtInfmbRELPZediGu47A9LB
 i9oDC31h/G5DwzPks52LwEem+8xkWC2Cc8IVS18eUheYEu/5GueIVJgYLvqqK+YLv+h7
 SyM6Bl26L6xXNLUS1UGC4WyZU0Kuj4KpdRrNHG3QUXeJ+qgQ0VIl9NJ/yoBCBjKlJ8Wq
 dZdGDpMgm4ClNSgs9gpfGGsX0J4q/X5/UfdMM+hiiCk068a+CIqB6AnbxJ0l+xe4FuvE ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33efqwsjr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 16:01:09 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 088JXlHc168428;
 Tue, 8 Sep 2020 16:01:09 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33efqwsjqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 16:01:09 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088JwWYF009338;
 Tue, 8 Sep 2020 20:01:08 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 33c2a989qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 20:01:08 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 088K17su63242502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Sep 2020 20:01:07 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 020496A04F;
 Tue,  8 Sep 2020 20:01:07 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47ACE6A047;
 Tue,  8 Sep 2020 20:01:06 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.24.203])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  8 Sep 2020 20:01:06 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-input@vger.kernel.org
Subject: [PATCH v2 5/5] ARM: dts: Aspeed: Rainier: Add IBM Operation Panel I2C
 device
Date: Tue,  8 Sep 2020 15:01:01 -0500
Message-Id: <20200908200101.64974-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908200101.64974-1-eajames@linux.ibm.com>
References: <20200908200101.64974-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-08_09:2020-09-08,
 2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009080179
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
 dmitry.torokhov@gmail.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, wsa@kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Set I2C bus 7 to multi-master mode and add the panel device that will
register as a slave.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index b94421f6cbd5..50d528444f5d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -4,6 +4,7 @@
 
 #include "aspeed-g6.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
 #include <dt-bindings/leds/leds-pca955x.h>
 
 / {
@@ -698,6 +699,7 @@ eeprom@53 {
 };
 
 &i2c7 {
+	multi-master;
 	status = "okay";
 
 	si7021-a20@20 {
@@ -831,6 +833,11 @@ gpio@15 {
 		};
 	};
 
+	ibm-panel@62 {
+		compatible = "ibm,op-panel";
+		reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
 	dps: dps310@76 {
 		compatible = "infineon,dps310";
 		reg = <0x76>;
-- 
2.26.2

