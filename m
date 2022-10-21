Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D86D607A45
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Oct 2022 17:16:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mv7NB2QLGz3dsk
	for <lists+linux-aspeed@lfdr.de>; Sat, 22 Oct 2022 02:16:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mB/sPyw7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mB/sPyw7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mv7N42gN9z2yy7
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Oct 2022 02:16:19 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LEreeZ018146;
	Fri, 21 Oct 2022 15:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Ef6LKQX/JIvvfxAKPolHgGyhRjCChbGHT3p+eMM2Vqs=;
 b=mB/sPyw7sxINk3xkRTUQ8znNu6sXoOvk3eq9PUsuRtgpqOaV6IQ+qBtVKRdjlEmLEqAX
 ULpR0Im28oHkck8bvIABhWYciSBTaFPFfb/bxVL8pYLMBb6gTPCYN9fKqg6Tx/o2pTdL
 49O6MZ+kpw00KSnffys1VjDtCxvo9n3iZ2h88PHdcrh9MNMBPMRGgmkxsy0B33Mxh2bA
 XSvj+Bry4itJwr7dU/8uByW+JZP1OpIBWKbZPP5ToO3vqPV2FPuKFQnVNAjWsF5Gfxui
 b9d3QYX+cNDqdKzcV1tGjcKv8dQ7g9kHXkFQlxT8Dy0USJDvdFXJdQI+tCr9DDNREi60 qQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbwkch2ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 15:16:07 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29LF5X16005260;
	Fri, 21 Oct 2022 15:16:06 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma03dal.us.ibm.com with ESMTP id 3kapd5k1yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 15:16:06 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29LFG4Ul53608930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Oct 2022 15:16:05 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B282058061;
	Fri, 21 Oct 2022 15:16:04 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4B0D58060;
	Fri, 21 Oct 2022 15:16:02 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.163.86])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Oct 2022 15:16:02 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH 0/2] watchdog: aspeed: Add pre-timeout interrupt support
Date: Fri, 21 Oct 2022 10:15:57 -0500
Message-Id: <20221021151559.781983-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MU2WAMRpGcP35ziyzqYqOl3ikXu_gv7o
X-Proofpoint-ORIG-GUID: MU2WAMRpGcP35ziyzqYqOl3ikXu_gv7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=915 bulkscore=0
 mlxscore=0 clxscore=1011 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210090
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable the pre-timeout interrupt if requested by device property, and
document that property.

Eddie James (2):
  watchdog: aspeed: Add pre-timeout interrupt support
  dt-bindings: watchdog: aspeed: Document aspeed,pre-timeout-irq-us

 .../bindings/watchdog/aspeed-wdt.txt          |  7 ++-
 drivers/watchdog/aspeed_wdt.c                 | 53 ++++++++++++++++++-
 2 files changed, 57 insertions(+), 3 deletions(-)

-- 
2.31.1

