Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F74297B2EC
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Sep 2024 18:21:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7RqX5kH0z2yMD
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 02:21:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726590084;
	cv=none; b=LztHcuOOvcBr9DddIgy5RjPUCOm6YfoIcgK3nvj34kwuEv6TAqFzItlxutXhBNmuTwxJO5f8XABjYYNyymBMcOmIx+zBxH5SF+WHlN5Js3yTaq5SjhnYzf6xf7Fk5Af1zE+mDtazb5sIII4PEgWV98uAWmB3Qq3pJ8XZoegIqfP8XfxbgfR4qUebBLWAucjhWYQTF2FqRBgM1ZOeA+t7i2PmFoyBZIsHAKxf1hpQNOzXDyWauF5pFpOyN+7g1o91mPF3aV2a++Rvrref4jb5vopftpl09EUSFtJ8Sy0yH12PmlEITjP1TgGurT1fulB8tz0HVv4kIpcVF6Nl3bo9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726590084; c=relaxed/relaxed;
	bh=r2pSsQ57V7ZZBxHEa9DDe3pPPZ/65TXqWjSRoUFmmfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eV1HbsqD/nrKKLUn5n7CPqdoVqrMD6ousrVj1TGOrpK02ZXDNHRV+ETNRiVAMHHNRklZ1+BG0olkP1jy7c7kuyHO+deV4An/0Ru5NRuJ5efAWExFlAi8nCrEWPf/9fgWbDiNk2v4WfooOLnWYZnEjsvpdxuILJkTh5fP4RHecuGliQezsCH/fwtGT/7orEW+C2FRbePXkHxKDhqWlEdKxbmYcyOlLvIAF7uDZrROzHNJUUGX0q98KoxeJKZzDn2cUiNtJ1UzFGyaKq3k7SE9TqJOADfK4TlsP7yF//n/HxKfw7bDVY2uWX/hHwZH8t7YbgNeqwpfkjsC2PGyelRszA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q0QSwvUU; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q0QSwvUU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7RqR3LFLz2xpv
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 02:21:23 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HAGXOa006205;
	Tue, 17 Sep 2024 16:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=r2pSsQ57V7ZZBxHEa9DDe3pPPZ
	/65TXqWjSRoUFmmfk=; b=q0QSwvUUfAb+GiLz4UMgtYNFmqlsinS47WvKXo4Djj
	v8DgHvM+P35Nj/hDnVRvqls5jzcNKSgKHyFkx0lLuAGANIeVeZFNwu+6lWFx8QeT
	Jzc3IR0Ugm8/DeS9hWnHbfflMH1ct52YAmv7KulKVM0qSjlOFYY9ZLumn3+v4ASo
	4zGBnT0NaNA4t2q+2S/AelKtx30ONuTfUTRVkdXKq24OqJCAP3kRyGrn7aRe+4dE
	wesF5WLTjbAdFBxqirsJFfSzFvj/QMoCnrzHo2Trc+Rrz6/Yig5qhmTgXAkXH0y9
	gyAS/dgxGaLt0l8ZRqMFnnH2LFKA+FtnK1zu/8+HM4Gw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n41agmgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 16:21:08 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48HFuZiW001187;
	Tue, 17 Sep 2024 16:21:07 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41nntq669m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 16:21:07 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48HGL79M18875128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Sep 2024 16:21:07 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BA085805D;
	Tue, 17 Sep 2024 16:21:07 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D72075805A;
	Tue, 17 Sep 2024 16:21:06 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.93.228])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Sep 2024 16:21:06 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Fix Rainier and Blueridge GPIO LED names
Date: Tue, 17 Sep 2024 11:21:00 -0500
Message-ID: <20240917162100.1386130-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 33ZsqN1xw8zCrbN0fcQFLBTWX9EqL2EN
X-Proofpoint-ORIG-GUID: 33ZsqN1xw8zCrbN0fcQFLBTWX9EqL2EN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_08,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 mlxlogscore=406 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170118
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Blueridge LED names to include the "led-" prefix as is proper.
Rainier should match for ease of application design. In addition,
the gpio line name ought to match.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts |  5 +++--
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts  | 12 ++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
index dfe5cc3edb52..9e6bfaef3840 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
@@ -207,7 +207,8 @@ &gpio0 {
 	/*F0-F7*/	"","","rtc-battery-voltage-read-enable","reset-cause-pinhole","","",
 			"factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
-	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
+	/*H0-H7*/	"","led-bmc-ingraham0","led-rear-enc-id0","led-rear-enc-fault0","","","",
+			"",
 	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
@@ -215,7 +216,7 @@ &gpio0 {
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","usb-power","","","","",
-	/*P0-P7*/	"","","","","pcieslot-power","","","",
+	/*P0-P7*/	"","","","","led-pcieslot-power","","","",
 	/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
 	/*R0-R7*/	"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","",
 			"",
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
index 0776b72c2199..a4aec3010456 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
@@ -109,22 +109,22 @@ leds {
 		compatible = "gpio-leds";
 
 		/* BMC Card fault LED at the back */
-		bmc-ingraham0 {
+		led-bmc-ingraham0 {
 			gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
 		};
 
 		/* Enclosure ID LED at the back */
-		rear-enc-id0 {
+		led-rear-enc-id0 {
 			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
 		};
 
 		/* Enclosure fault LED at the back */
-		rear-enc-fault0 {
+		led-rear-enc-fault0 {
 			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
 		};
 
 		/* PCIE slot power LED */
-		pcieslot-power {
+		led-pcieslot-power {
 			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
 		};
 	};
@@ -203,7 +203,7 @@ &gpio0 {
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","rtc-battery-voltage-read-enable","reset-cause-pinhole","","","factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
-	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
+	/*H0-H7*/	"","led-bmc-ingraham0","led-rear-enc-id0","led-rear-enc-fault0","","","","",
 	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
@@ -211,7 +211,7 @@ &gpio0 {
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","usb-power","","","","",
-	/*P0-P7*/	"","","","","pcieslot-power","","","",
+	/*P0-P7*/	"","","","","led-pcieslot-power","","","",
 	/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
 	/*R0-R7*/	"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","","",
 	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
-- 
2.43.0

