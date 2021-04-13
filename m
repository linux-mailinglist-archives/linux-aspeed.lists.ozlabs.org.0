Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BF035E736
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Apr 2021 21:43:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKbcm3JCjz30Hr
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Apr 2021 05:43:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BJk0nfIZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BJk0nfIZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKbcj4z7Bz304N
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Apr 2021 05:43:17 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DJXDWo139289; Tue, 13 Apr 2021 15:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=juEAHgYGJFuSiOjs72d4wmb3gb6ayrukAkrcdyubfu0=;
 b=BJk0nfIZhGmNZOeIbOuJqS7KI7y/DsqAOUL3DDlUasUCuAaHXzHwtDTjAGPRKPoxzAEe
 MDeQqeeY+XKmHptV8HrlkfLS9nsTFCPMtn9pz26SXdkWexErI5MQgqy//EDfp1WsIiAH
 L6wRG4+M/abn8Ejf14zTMkZCi4wHgmYLTQlUop8TjVbzUs4DuobYQSfk2+hxSTPLTXrP
 J1DHsCgGVE+pFr2ANpPrdvYSZuxZjvZMcatCghPVFGsTuVoD0a0j7hH1s/AFWVRbynpH
 737zgommoka3E/isjTxKc6AgXIUuFDcZhXNoDUk9u5pzF9rkBVEUy0WdqmzRGDlC0NLz yA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vkpk3qfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 15:43:13 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DJXv4e016351;
 Tue, 13 Apr 2021 19:43:12 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 37uhcmqn1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 19:43:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DJhCr135455282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 19:43:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20316AE05F;
 Tue, 13 Apr 2021 19:43:12 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0086AE060;
 Tue, 13 Apr 2021 19:43:11 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.32])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 19:43:11 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 0/4] ARM: dts: aspeed: Rainier: Various fixes and update
Date: Tue, 13 Apr 2021 14:43:04 -0500
Message-Id: <20210413194308.36930-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ic5hLJaYkuGviP-jayjPsakm8zVnd2YU
X-Proofpoint-ORIG-GUID: ic5hLJaYkuGviP-jayjPsakm8zVnd2YU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=786 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104130128
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

This series fixes a number of issues introduced in the Rainier device tree.
It also brings the device tree up to date with the latest hardware revision.

Eddie James (4):
  ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
  ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
  ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
  ARM: dts: aspeed: Rainier: Update to pass 2 hardware

 .../boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts  |   2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 306 ++++++++++--------
 2 files changed, 166 insertions(+), 142 deletions(-)

-- 
2.27.0

