Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 657A28FBE74
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 00:02:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i4q3cb+Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv4MH6mczz3dBr
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 08:02:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i4q3cb+Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv4M84x39z30Sx
	for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jun 2024 08:02:12 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454LqCMp009352;
	Tue, 4 Jun 2024 21:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : message-id : mime-version :
 subject : to; s=pp1; bh=OHYuuKn8tJ7rSUbYgVXZpxWOnvGgk1aa1oTjRBRVGS4=;
 b=i4q3cb+YDGF8VqB19V6IAhQpX61Nn7ZfC6yTCdM8yp2tgfOA6SYWRyoOPuxR1+inR5/1
 wva8yBRXckEq7gm/WajmB8Vv4tji1gdXQp24O1Fx4wPzP6ebuT7O9TS3kyw+KuVKHttg
 vN+VTMAkOIaeVQku5CtTpPYM8qSXCD5eSV4x+j29DbzEs9gIQJbQUJLfP4oNTdAUi9Hv
 THTvcimKZH/sDzgwAVO52sSnEE36WdVeYrBKabFyBl1lyaxQT9EKK0SCZdbAyQJrk81w
 1xnnCJGoW0/D/A5OFa+VNiQhoDEz9u3QbXBDyQx7pwBY3VsgfcWMnzIJBS+43ror4sX9 Iw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjax7g1ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 21:59:48 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 454LjC1x008501;
	Tue, 4 Jun 2024 21:59:47 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0rq47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 21:59:47 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 454Lxife15270642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Jun 2024 21:59:46 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B2BF58064;
	Tue,  4 Jun 2024 21:59:44 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2F7858062;
	Tue,  4 Jun 2024 21:59:43 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Jun 2024 21:59:43 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
Subject: [PATCH v1] ARM: dts: aspeed: System1: Updates to BMC board
Date: Tue,  4 Jun 2024 16:59:39 -0500
Message-Id: <20240604215939.1967329-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -Vetq6Mejqa7zfwIUkmji2p2f6zF51Xz
X-Proofpoint-ORIG-GUID: -Vetq6Mejqa7zfwIUkmji2p2f6zF51Xz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=779 mlxscore=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406040177
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

- Added new power monitor device max5970
- Changed temperature sensor monitor chip from tmp423 to tmp432

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index dcbc16308ab50..e09a6b383ba49 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -753,6 +753,11 @@ &i2c4 {
 &i2c5 {
 	status = "okay";
 
+	power-monitor@3a {
+		compatible = "maxim,max5970";
+		reg = <0x3a>;
+	};
+
 	regulator@42 {
 		compatible = "infineon,ir38263";
 		reg = <0x42>;
@@ -1138,7 +1143,7 @@ i2c8mux0chn6: i2c@6 {
 			reg = <6>;
 
 			temperature-sensor@4c {
-				compatible = "ti,tmp423";
+				compatible = "ti,tmp432";
 				reg = <0x4c>;
 			};
 		};
@@ -1599,7 +1604,7 @@ i2c15mux0chn6: i2c@6 {
 			reg = <6>;
 
 			temperature-sensor@4c {
-				compatible = "ti,tmp423";
+				compatible = "ti,tmp432";
 				reg = <0x4c>;
 			};
 		};
@@ -1615,7 +1620,7 @@ regulator@40 {
 			};
 
 			temperature-sensor@4c {
-				compatible = "ti,tmp423";
+				compatible = "ti,tmp432";
 				reg = <0x4c>;
 			};
 		};
-- 
2.40.1

