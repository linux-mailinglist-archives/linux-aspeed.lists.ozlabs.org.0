Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 353BE3700E4
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Apr 2021 21:00:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX1sG0BDCz2yyl
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 May 2021 05:00:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L2Ie/OVd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=L2Ie/OVd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX1sB4Xs7z2xgJ
 for <linux-aspeed@lists.ozlabs.org>; Sat,  1 May 2021 05:00:13 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UIYBmN046802; Fri, 30 Apr 2021 15:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=1DozMejH+dpivefNhTcG3p9AJ7pvhkMyE1SLGHnxLyw=;
 b=L2Ie/OVdMotzkOt1bOQW1HzSL+hWJ+v5+0jCcZBw7jhggYG4e+Q71zT3igwS0XP41Vh8
 3QRh96tThhJM9gOJg2AOE4EleD0SqXY/ejjWM8hTLBwn+WPBM5fWyHqYImEpk0ROCnR/
 U5xD35zaSzSdouD0OB9WtOkl28UAgoCoiy8PJXZNmwgzhfRjGrD3NY1ZQQzvArGnhXpb
 M0JpVFeJCkdPLDNlyCe7vTN1+hx5eVUuIUitW3m6tePYkxfIyVAtqrFJ7eNZQzQVmOkI
 dVMU0VI8+V3vCrBC6sv4Qmf/KQzxHc0stgPgaxZRQBCML+NTd/JLXIG2kQcAn7UGBXLY jQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388q5rgqp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 15:00:07 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UIvBiN014718;
 Fri, 30 Apr 2021 19:00:06 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3882p7q8vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 19:00:06 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UJ05Tp29295020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 19:00:05 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78C336E065;
 Fri, 30 Apr 2021 19:00:05 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AB4C6E058;
 Fri, 30 Apr 2021 19:00:05 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.52.42])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Apr 2021 19:00:04 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 0/4] ARM: dts: aspeed: Rainier and Everest updates
Date: Fri, 30 Apr 2021 13:59:56 -0500
Message-Id: <20210430190000.31646-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5ZKOfsUgFsNBw81Ij4TB5FnxSugg_dgF
X-Proofpoint-GUID: 5ZKOfsUgFsNBw81Ij4TB5FnxSugg_dgF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_11:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=489 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This series fixes a few new issues found in the Rainier and Everest
machine device trees. It also adds the LEDs that are directly
connected to the AST2600 and controlled by GPIO.

Andrew Geissler (1):
  ARM: dts: aspeed: Rainier 1S4U: Fix fan channels

Eddie James (1):
  ARM: dts: aspeed: Rainier 4U: Remove fan updates

Santosh Puranik (1):
  ARM: dts: aspeed: Everest: Fix cable card PCA chips

Vishwanatha Subbanna (1):
  ARM: dts: aspeed: Everest: Add directly controlled LEDs

 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  | 201 ++++++++++--------
 .../boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts  |   2 +-
 .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    |  30 ---
 3 files changed, 115 insertions(+), 118 deletions(-)

-- 
2.27.0

