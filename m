Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05335E739
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Apr 2021 21:43:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKbct2x9kz30Jb
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Apr 2021 05:43:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BzUCYM3m;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BzUCYM3m; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKbcl45M2z304X
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Apr 2021 05:43:19 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DJXHbY062632; Tue, 13 Apr 2021 15:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=egO8IoWwECTX4QtPhUpWQVE8Sjn58hFjKIh/gZ8vIi0=;
 b=BzUCYM3mxTLor5qO4Te/sWKBRH9tUWPqhRivzvF/ncZziZkEVW6fjyEOWlha0IDbLaTG
 tMo8qBstf1qU34CumechlIyiOEgdL+OxiDapxGZJz1rkvXS+gAloLp1pTbuyIhdhFhS2
 Bu82x+T/QmvlUUQbgXeVZG8kANf6V9YwFP9bOuVDOBRkbbKPN03sMXXXIQKwXhqS6CWB
 CuhfG8Un1z30JloXnyWQUEde1TFitZytGZ7SXP97GpPc+COcfKgKQvWKWJZ/ZFr9urOu
 KzoCg7H/NjLcxjZyZIjUCDPvy7FY9sFrQ3YSS4CaZzCRm2cDSK7kErOx8RgDQGtCpswX 5A== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vjtumkmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 15:43:16 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DJg0He002356;
 Tue, 13 Apr 2021 19:43:16 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 37u3na3cg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 19:43:16 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DJhFe39634720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 19:43:15 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79552AE060;
 Tue, 13 Apr 2021 19:43:15 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0570CAE05F;
 Tue, 13 Apr 2021 19:43:15 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.32])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 19:43:14 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 3/4] ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
Date: Tue, 13 Apr 2021 14:43:07 -0500
Message-Id: <20210413194308.36930-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413194308.36930-1-eajames@linux.ibm.com>
References: <20210413194308.36930-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: etmXGAGb9uAB2nMpbKDu2jGGD3PN6b9G
X-Proofpoint-ORIG-GUID: etmXGAGb9uAB2nMpbKDu2jGGD3PN6b9G
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=782 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104130128
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The 1S4U system populates fans 0, 1, 2, and 4. Update the dts to
reflect this.

Fixes: 7f03894a6555 ("ARM: dts: aspeed: Add Rainier 1S4U machine")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts
index d1d31a59e502..f5f5b18c113a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts
@@ -9,6 +9,6 @@ / {
 };
 
 &max {
-	/delete-node/ fan4;
+	/delete-node/ fan3;
 	/delete-node/ fan5;
 };
-- 
2.27.0

