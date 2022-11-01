Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70A61538F
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Nov 2022 21:54:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N22Lh2nBXz3cMH
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 07:54:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iyEQB6n+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iyEQB6n+;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N22LY1PFqz3bjX
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Nov 2022 07:53:56 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A1KouXi002166;
	Tue, 1 Nov 2022 20:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=n2s34LQyv0LHx7fXgxlmeU16+bMoGpAgw9+p/6CncvM=;
 b=iyEQB6n+NCuqXe9ec0M75io+TJ/4MkRe42H6U/QObo3C+/aNMOt4ri1WktXK/Ky+AIaj
 55pzrwZTjkXsbYCJIGnVUiULRkPS8hhaWHsnbqP9I40JSOk625Fa3P1Z+wgkqioRfK75
 qLkoy5QLdqWIBnABCWz5SyTwDQ3ytRNeO2tZzpDvMjO49eAGUsPPyNX5X0rEESXa/CjZ
 iv2tZ8Xfz0L738rRuZQ6dhjzrRZbr/39GcRC2O+GiEz9Yc2WcCPMhNReSBHN7zT/e/vB
 Wv6knytnB9Qjt12iRzW/iH2QkvorCxfFyGXhjL0xV1rdryXFojls6M/wNlKj3x7oMG/6 iA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjwjjm0vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Nov 2022 20:53:44 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A1KolAu004373;
	Tue, 1 Nov 2022 20:53:43 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma02dal.us.ibm.com with ESMTP id 3kgutabxq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Nov 2022 20:53:43 +0000
Received: from smtpav02.dal12v.mail.ibm.com ([9.208.128.128])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A1KrfYR41222430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Nov 2022 20:53:41 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43D1B58051;
	Tue,  1 Nov 2022 20:53:42 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CE5D5805A;
	Tue,  1 Nov 2022 20:53:41 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.92.229])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Nov 2022 20:53:41 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH v2 0/2] watchdog: aspeed: Add pre-timeout interrupt support
Date: Tue,  1 Nov 2022 15:53:36 -0500
Message-Id: <20221101205338.577427-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: anovv7hUhdukI8PdpmiJ5Zc1erPNhdyi
X-Proofpoint-GUID: anovv7hUhdukI8PdpmiJ5Zc1erPNhdyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_10,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=748
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Enable the core pre-timeout interrupt on AST2500 and AST2600.

Changes since v1:
 - Use watchdog core support for pre-timeout interrupt, rather than new
   dts property

Eddie James (2):
  watchdog: aspeed: Enable pre-timeout interrupt
  ARM: dts: aspeed: Setup watchdog pre-timeout interrupt

 arch/arm/boot/dts/aspeed-g5.dtsi |   3 +
 arch/arm/boot/dts/aspeed-g6.dtsi |   4 ++
 drivers/watchdog/aspeed_wdt.c    | 104 ++++++++++++++++++++++++++-----
 3 files changed, 95 insertions(+), 16 deletions(-)

-- 
2.31.1

