Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 452DD124ADE
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Dec 2019 16:12:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dJQ55bGhzDqjT
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 02:11:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dJNw3NDxzDqgx
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Dec 2019 02:10:08 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIEsj3E110433; Wed, 18 Dec 2019 10:09:46 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wyp9kgjgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 10:09:46 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBIF5Rk9028206;
 Wed, 18 Dec 2019 15:09:45 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 2wvqc6e8s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 15:09:45 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBIF9iEi57147740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 15:09:44 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B127A13604F;
 Wed, 18 Dec 2019 15:09:44 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C98D4136053;
 Wed, 18 Dec 2019 15:09:43 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.103.158])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Dec 2019 15:09:43 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v3 04/12] ARM: dts: aspeed: ast2600: Add SCU interrupt
 controllers
Date: Wed, 18 Dec 2019 09:09:30 -0600
Message-Id: <1576681778-18737-5-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576681778-18737-1-git-send-email-eajames@linux.ibm.com>
References: <1576681778-18737-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_04:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 suspectscore=1 adultscore=0 mlxlogscore=666
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912180124
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net,
 maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add nodes for the interrupt controllers provided by the SCU.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 5f6142d99eeb..ead336e93a12 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -288,6 +288,20 @@ smp-memram@180 {
 					compatible = "aspeed,ast2600-smpmem";
 					reg = <0x180 0x40>;
 				};
+
+				scu_ic0: interrupt-controller@0 {
+					#interrupt-cells = <1>;
+					compatible = "aspeed,ast2600-scu-ic0";
+					interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-controller;
+				};
+
+				scu_ic1: interrupt-controller@1 {
+					#interrupt-cells = <1>;
+					compatible = "aspeed,ast2600-scu-ic1";
+					interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-controller;
+				};
 			};
 
 			rng: hwrng@1e6e2524 {
-- 
2.24.0

