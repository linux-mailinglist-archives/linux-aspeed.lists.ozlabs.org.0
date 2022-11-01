Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD1615394
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Nov 2022 21:54:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N22Ls3tnSz3cJQ
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 07:54:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sV0yQ1Dc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sV0yQ1Dc;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N22LY3m0dz3cHZ
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Nov 2022 07:53:57 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A1J4SSk011938;
	Tue, 1 Nov 2022 20:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vrGR742i6UT4wMCamVewaOgnS4kjvz6dyoifD8CJsYo=;
 b=sV0yQ1DcYQesFkpjtNBivRlk87HIb6KwXUVPUhyJId4/g1TJ0Sicd7l4ErmovmNmpVZK
 ce7EbCsifnwgsKv875TauYpf6mnctGH9ZLU8WX0/E1BifA2eVagtuFbXTMn1reuxSbA4
 EY60m6MoqRCVLxARsLOGDN6g8TnnLAFP8G61Z/MYj6UcYF9KJIB1hlD2OMBRxdp6EAoE
 xBRbYonalZ33fTwsD7OUkAFqbg/+BdH+NOtBTKH5MewEsgknOpk7TjuDyZ8j4rxYO4p8
 D1PQ26skf9nW1oaxztAAiY63MBuqRNFY2w9ou9wAmS9La7Zp+nRw7M72VkDHOTnMpD0K EQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjtg5r6np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Nov 2022 20:53:49 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A1Kokom004361;
	Tue, 1 Nov 2022 20:53:48 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02dal.us.ibm.com with ESMTP id 3kgutabxqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Nov 2022 20:53:48 +0000
Received: from smtpav02.dal12v.mail.ibm.com ([9.208.128.128])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A1KrmuL36110752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Nov 2022 20:53:48 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD1955805A;
	Tue,  1 Nov 2022 20:53:46 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA4765805F;
	Tue,  1 Nov 2022 20:53:45 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.92.229])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Nov 2022 20:53:45 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Setup watchdog pre-timeout interrupt
Date: Tue,  1 Nov 2022 15:53:38 -0500
Message-Id: <20221101205338.577427-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221101205338.577427-1-eajames@linux.ibm.com>
References: <20221101205338.577427-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Urz1o1Ls_Q7DovowQi2QNTaCyLyNcOpL
X-Proofpoint-GUID: Urz1o1Ls_Q7DovowQi2QNTaCyLyNcOpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_09,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=810 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010145
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Specify the interrupt lines for the base SOCs that support it.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 3 +++
 arch/arm/boot/dts/aspeed-g6.dtsi | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 04f98d1dbb97..b4b98bf38e48 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -410,18 +410,21 @@ wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785000 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				interrupts = <27>;
 			};
 
 			wdt2: watchdog@1e785020 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785020 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				interrupts = <27>;
 			};
 
 			wdt3: watchdog@1e785040 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785040 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				interrupts = <27>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index ebbcfe445d9c..d9379fd7b1c2 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -539,23 +539,27 @@ uart5: serial@1e784000 {
 
 			wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2600-wdt";
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x1e785000 0x40>;
 			};
 
 			wdt2: watchdog@1e785040 {
 				compatible = "aspeed,ast2600-wdt";
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x1e785040 0x40>;
 				status = "disabled";
 			};
 
 			wdt3: watchdog@1e785080 {
 				compatible = "aspeed,ast2600-wdt";
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x1e785080 0x40>;
 				status = "disabled";
 			};
 
 			wdt4: watchdog@1e7850c0 {
 				compatible = "aspeed,ast2600-wdt";
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x1e7850C0 0x40>;
 				status = "disabled";
 			};
-- 
2.31.1

