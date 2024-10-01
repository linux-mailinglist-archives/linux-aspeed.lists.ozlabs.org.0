Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC6F98C5EA
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 21:18:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ75Q3Lgfz2yxN
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 05:18:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727810309;
	cv=none; b=K314Dz7Fvh7/fAv4sdzxCP6H1+o0bqyXaW2Vsro5y7sU8LXcvMeWhcW5r+6Zc9qdwPvGVRqvLfYBVSi+Pc8lIdECAGBO2DeQDLC95L76zyKapjO1m2s0UjHS2GWDXHbcDmIpU4IZq+KnLPnNCXCQ/FZW1sbrG+zCEVd6xDU2nqypEzCCnZMR3DCvPaI3v1NCLx31mpHhfn0Zlwh1X9tC0QrEcAIWPCYhpKd3fbKjuZBYBzO36cLyTjX08EEX3S3fyPw3aWb6QJytmWUVRcGnctQnd4vg10Uh7OTXpBtEmUtLGFlCgnow7UMDTfDvCQNn8uQs6x+58CHW/W6kPUmoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727810309; c=relaxed/relaxed;
	bh=CwI7VXdOmE1Lg6/yE5Tmvz/tvgVzZqHjnzo9r3V9I9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UesZ+bQPfhpviwh1EScyEtvyO1iUOg8tk47IWpOPYGUBeGkYURx45Ve5fQmE0V9QNiXGvBhFiRY5aOS4sz2TCfwyT0ig2ZoPZPigglOVYE3JFZ3wl92JLY405DIAsv7qhlCeEOzvoxU5hB52gysNY/hbvDs/CS10dsJJGEcwnSdhs4QEiZ8c+BepqTrZIQV1pMg3MHHNpY5GeHW1RAcjBr9gQ6qB4XBfUHmr9yLoKSJxpuFfUbuQ6JuFFMM7ShXGlqzWCbWdWEsOjk0wbwsasg7eypl5yWWLJCslhaxbTKTJ6yof3MkFuOd+/4hXSAYCoB8Z1KoltgTSnAAyOFDA9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ggF7fH9a; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ggF7fH9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ75K3bV6z2xKg
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 05:18:29 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491IoIfF022482;
	Tue, 1 Oct 2024 19:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=CwI7VXdOmE1Lg
	6/yE5Tmvz/tvgVzZqHjnzo9r3V9I9g=; b=ggF7fH9a64UGjonIuuw8GcEIeU92D
	ji3Rtyhr5UaexVDkGi2CAC3FLh+RL5L7pYgkdsbtnfx4G4tM0F3RjIqAlJxIO8eh
	/AFq1SLQ74NQfrWmAqOyCITtgCugN7eUXZ3ilcvjK3v6UQLN8ULN1LSmhLT4ciTr
	XvmktuGoNIRtlJYdlzYJjT4cJYQK2rtr6v2TumGB2nNWahs0HFvwmtl9lHAgXRA1
	DOcIFqoJuNvHAaXiScRypRV2nqPmOWBCOnbCfkssmqZMmUUosx5lNW06sM4LLcBz
	Qc/etAb9qQM7qaEp4KcNEzQaiKA4bxHpaVlYpN8alOkzkI9ggsQn6ArDg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 420pq60446-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 19:18:12 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 491IhxdS014145;
	Tue, 1 Oct 2024 19:18:11 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41xwmk66bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 19:18:11 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 491JIAUI11207252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2024 19:18:10 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFCFE5804E;
	Tue,  1 Oct 2024 19:18:10 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 306C55803F;
	Tue,  1 Oct 2024 19:18:10 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Oct 2024 19:18:10 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, eajames@linux.ibm.com
Subject: [PATCH v1 3/3] ARM: dts: aspeed: system1: Add GPIO line names
Date: Tue,  1 Oct 2024 14:17:50 -0500
Message-ID: <20241001191756.234096-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001191756.234096-1-ninad@linux.ibm.com>
References: <20241001191756.234096-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 73Lxh8lIY8zFqRA9N6hkPZmlyfMszGT6
X-Proofpoint-GUID: 73Lxh8lIY8zFqRA9N6hkPZmlyfMszGT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_14,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=622
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010123
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add following GPIO line names so that userspace can control them
- PCH related GPIOs
- FPGA related GPIOs

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index c0219167a337a..35cb9fea308e8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -370,17 +370,17 @@ &gpio0 {
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","bmc-ready",
 	/*M0-M7*/	"","","","","","","","",
-	/*N0-N7*/	"","","","","","","","",
+	/*N0-N7*/	"fpga-debug-enable","","","","","","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","bmc-hb",
-	/*Q0-Q7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","pch-ready","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","","","","rear-enc-fault0","rear-enc-id0",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"","rtc-battery-voltage-read-enable","","power-chassis-control","","","","",
 	/*W0-W7*/	"","","","","","","","",
-	/*X0-X7*/	"","power-chassis-good","","","","","","",
+	/*X0-X7*/	"fpga-pgood","power-chassis-good","pch-pgood","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
 	/*Z0-Z7*/	"","","","","","","","";
 };
-- 
2.43.0

