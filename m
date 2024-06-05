Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 921968FD276
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 18:06:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lyht5d96;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvXQL2l5Lz30Tr
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 02:06:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lyht5d96;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvXQB2wrfz30Tr
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Jun 2024 02:06:25 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455FLLtb001160;
	Wed, 5 Jun 2024 16:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : message-id : mime-version :
 subject : to; s=pp1; bh=v+Cqnls3yUZrDxsNB2rWFncZXsXnB7uHdf9VD8hEsY0=;
 b=lyht5d96JASQPfISXc+mnGdxkM0CUCo3xOeooBfLIk9yEw2hAQUxesQ+hGZ2JQl8/Qm0
 K1RhBosoHbYLtNIPRimhunmlC0KFaa2tyArmuXebAlIy/fswZjSh/Tdi5uyIRoz6qBKy
 w6wijkffTFur2A5kTUgYvebCaoLkxXdEVrKcEQ0GA04vLpYE0ZGSFJTBOPkOsJKpvd9x
 jUaFXGtjWjBzZZKCD7eugv8g7D5aYOsK1IKnG8RudaTy8Bys2KmY7d+2cIjuqQerbAmB
 gdR0LRz0RPWZ7fg8JTPBcPZIYm4mYuGXkT2YkR1x5T6ahTczbFMmQFBve+kx3BpvJ5RE ng== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjrdw8m5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 16:06:11 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455Ew2SN026588;
	Wed, 5 Jun 2024 16:06:10 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yggp34mg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 16:06:10 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455G669q26673716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 16:06:08 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFDDA5805D;
	Wed,  5 Jun 2024 16:06:06 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F262A58053;
	Wed,  5 Jun 2024 16:06:05 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 16:06:05 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
Subject: [PATCH v2] ARM: dts: aspeed: System1: Updates to BMC board
Date: Wed,  5 Jun 2024 11:06:03 -0500
Message-Id: <20240605160604.2135840-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hM30ZomYcFZDZdrHlvxUQsvKPqP2flZC
X-Proofpoint-ORIG-GUID: hM30ZomYcFZDZdrHlvxUQsvKPqP2flZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxlogscore=682 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050121
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

- Changed temperature sensor monitor chip from tmp423 to tmp432

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index dcbc16308ab50..f3efecc7eb8d0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -1138,7 +1138,7 @@ i2c8mux0chn6: i2c@6 {
 			reg = <6>;
 
 			temperature-sensor@4c {
-				compatible = "ti,tmp423";
+				compatible = "ti,tmp432";
 				reg = <0x4c>;
 			};
 		};
@@ -1599,7 +1599,7 @@ i2c15mux0chn6: i2c@6 {
 			reg = <6>;
 
 			temperature-sensor@4c {
-				compatible = "ti,tmp423";
+				compatible = "ti,tmp432";
 				reg = <0x4c>;
 			};
 		};
@@ -1615,7 +1615,7 @@ regulator@40 {
 			};
 
 			temperature-sensor@4c {
-				compatible = "ti,tmp423";
+				compatible = "ti,tmp432";
 				reg = <0x4c>;
 			};
 		};
-- 
2.40.1

