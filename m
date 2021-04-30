Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 218EC3700E7
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Apr 2021 21:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX1sS10Y2z2yyb
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 May 2021 05:00:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ghm1J6dD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ghm1J6dD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX1sN0dYtz2yhs
 for <linux-aspeed@lists.ozlabs.org>; Sat,  1 May 2021 05:00:23 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UIXxoT175143; Fri, 30 Apr 2021 15:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P/0DfE2uCxBbxzJiqNI3w/upXghTV63nIl5e/B/2dww=;
 b=ghm1J6dDEyNc1oGKi/Xx0zos0NlTFWlPIh59azOyQGx1kfcZfns7EidRa9Y/WjNBndDI
 hkgh+Fla37RZIm6MFZvDOmfGHjOY8cbtTZXTvzEGOeeIPJBoUOnkYlPRh9yVIME4BSdQ
 59BtkzofZNoln02jxyuomzQI+g51HH0DY1XyZLbXyBaYZh0mptXHB7pPBK6Vgx/0+/tU
 MSuVk3d0HhtRb7qGhtAZLk3yJzWpSffAziWwwZP0F95W9PEVXAkZJrHv80QPOj5+keYn
 hp3FFBFdwq/8e5s6/rrG5KB7gVdLeT6+G72/taQ/YFLnsIgvA9mMBFb+nfpF7gdrflMr wg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388np8bhek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 15:00:19 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UIvd7u027212;
 Fri, 30 Apr 2021 19:00:18 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 384aya14ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 19:00:18 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UJ0HM413697308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 19:00:17 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A55F6E058;
 Fri, 30 Apr 2021 19:00:17 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E25326E050;
 Fri, 30 Apr 2021 19:00:16 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.52.42])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Apr 2021 19:00:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 3/4] ARM: dts: aspeed: Rainier 4U: Remove fan updates
Date: Fri, 30 Apr 2021 13:59:59 -0500
Message-Id: <20210430190000.31646-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210430190000.31646-1-eajames@linux.ibm.com>
References: <20210430190000.31646-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jpm7Px1ERLPgvjFEllyHdSuqUxCjL60P
X-Proofpoint-GUID: jpm7Px1ERLPgvjFEllyHdSuqUxCjL60P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_11:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=880 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300125
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

The 4U fans do not need a different "tach-pulses" property than the 2U
machine. In addition, the "maxim,fan-dual-tach" property does not exist
upstream yet, so it should also be removed.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    | 30 -------------------
 1 file changed, 30 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
index f7fd3b3c90d0..342546a3c0f5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
@@ -19,33 +19,3 @@ power-supply@6b {
 		reg = <0x6b>;
 	};
 };
-
-&fan0 {
-	tach-pulses = <4>;
-	/delete-property/ maxim,fan-dual-tach;
-};
-
-&fan1 {
-	tach-pulses = <4>;
-	/delete-property/ maxim,fan-dual-tach;
-};
-
-&fan2 {
-	tach-pulses = <4>;
-	/delete-property/ maxim,fan-dual-tach;
-};
-
-&fan3 {
-	tach-pulses = <4>;
-	/delete-property/ maxim,fan-dual-tach;
-};
-
-&fan4 {
-	tach-pulses = <4>;
-	/delete-property/ maxim,fan-dual-tach;
-};
-
-&fan5 {
-	tach-pulses = <4>;
-	/delete-property/ maxim,fan-dual-tach;
-};
-- 
2.27.0

