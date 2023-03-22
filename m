Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB96C4CDE
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Mar 2023 15:04:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhVbB4H24z3cfH
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 01:04:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OgEMCVX0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OgEMCVX0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhVZh4mqpz3cM6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Mar 2023 01:04:12 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32MDHB1I019224;
	Wed, 22 Mar 2023 14:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=e5kXO0NJGkvXS5bgTXxLjg7+d878iJXOxykGqAZwKRQ=;
 b=OgEMCVX02lVt/uqJez+0REqJk8ImhUmH64sMkOiIdKM9FD79skDWzsD4sSBKrKFK1bUH
 AGix19nZ32MR9ChMTkvoXIqBRXw2F8Kc2vE5P1pL8CQPur4lZ4URkIqZvQhtb38BsHYb
 LcoTaw3pwJFhCEgzwWV363jlIOXI6eAcdkJY7QOBsuiGV5lQTaGgS3E1XXJru1n8UW7T
 ygvAzTH8dag+8WLQvGD+rH9jz9b1nqGKzUzH9cJHPwgMnhVFsXQmMN2V2NYqPHBqn9Rs
 8qTo3xZk2DLvE4LcB1JmuHaM4QCNBBmcg1EjIAmLr1EzcP0s5P0AB3eBhKrS8td5j5lF cA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg2dy9cgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 14:04:00 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MAiWYM030001;
	Wed, 22 Mar 2023 14:04:00 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x78mcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 14:04:00 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32ME3xQR27394762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Mar 2023 14:03:59 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0719C5805D;
	Wed, 22 Mar 2023 14:03:59 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8346E58064;
	Wed, 22 Mar 2023 14:03:57 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.77.129.242])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Mar 2023 14:03:57 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] ARM: dts: aspeed: bonnell: Add DIMM SPD
Date: Wed, 22 Mar 2023 09:03:48 -0500
Message-Id: <20230322140348.569397-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230322140348.569397-1-eajames@linux.ibm.com>
References: <20230322140348.569397-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W_DPpyvQCuqjlus0IPW6KlVFz3MnU4nx
X-Proofpoint-ORIG-GUID: W_DPpyvQCuqjlus0IPW6KlVFz3MnU4nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_11,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=648
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220103
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add the DIMM SPD to the processor I2C busses.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index 79516dc21c01..ab99d915b50e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -232,18 +232,38 @@ cfam0_i2c1: i2c-bus@1 {
 
 			cfam0_i2c10: i2c-bus@a {
 				reg = <10>;	/* OP3A */
+
+				eeprom@50 {
+					compatible = "atmel,at30tse004a";
+					reg = <0x50>;
+				};
 			};
 
 			cfam0_i2c11: i2c-bus@b {
 				reg = <11>;	/* OP3B */
+
+				eeprom@50 {
+					compatible = "atmel,at30tse004a";
+					reg = <0x50>;
+				};
 			};
 
 			cfam0_i2c12: i2c-bus@c {
 				reg = <12>;	/* OP4A */
+
+				eeprom@50 {
+					compatible = "atmel,at30tse004a";
+					reg = <0x50>;
+				};
 			};
 
 			cfam0_i2c13: i2c-bus@d {
 				reg = <13>;	/* OP4B */
+
+				eeprom@50 {
+					compatible = "atmel,at30tse004a";
+					reg = <0x50>;
+				};
 			};
 
 			cfam0_i2c14: i2c-bus@e {
-- 
2.31.1

