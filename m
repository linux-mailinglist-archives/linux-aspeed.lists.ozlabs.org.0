Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC8E79DBA3
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 00:09:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f03n89EP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rld6l695gz3cNS
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 08:09:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f03n89EP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rld6b0Qq6z309t
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 08:09:42 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CM8n4U004028;
	Tue, 12 Sep 2023 22:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Fmtr17vxfvAxr7b2eFqtCMkznpCwBpMbLf427hX+pdA=;
 b=f03n89EPnp3SJ4kTeBj2ojmhKP5EFEMahYYTmhmqEBfCTu0asgipjFoMSujac1W2fqvf
 mDV8V3rtS7K9Xo9Lj0gfri9uS2n7q/rA15ULe0UIkX6PL+vu4iC63Ybw+EZ4i78eTqLu
 cD6nmp7fIhcLGg+cgvlq8wp9kualjLjpD2xdcM74XqD7op/OzwakF8+rW27ONljrAHQX
 D9KM1ynBx5Y3Nr4SmKUlQLy+D/YSGeFh9SBYwSh85aHNV3DlBe5nzZMSU6HuObROYiSK
 vjD6A7yg2HqlR+bxh095DNFKB55I3Drj+aD54gX6Ag7vRvK91MbdOFYxVwDGWLlVChQR Yg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2ymgh3gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 22:09:30 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38CJN5tO011942;
	Tue, 12 Sep 2023 22:09:29 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t15r1wxbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 22:09:29 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38CM9RZA34210232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 22:09:28 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A90BA58052;
	Tue, 12 Sep 2023 22:09:27 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 623145805A;
	Tue, 12 Sep 2023 22:09:27 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Sep 2023 22:09:27 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au, eajames@linux.ibm.com
Subject: [PATCH v3 0/2] soc/aspeed: Add host side BMC device driver
Date: Tue, 12 Sep 2023 17:09:21 -0500
Message-Id: <20230912220923.3701688-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d0fml4SP8ZwWFH_R5rCO1M3gg0WtpQLy
X-Proofpoint-ORIG-GUID: d0fml4SP8ZwWFH_R5rCO1M3gg0WtpQLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_21,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxlogscore=533 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120187
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,
Please review a version 3 of patchset.
    - Fixed warning reported by kernel test robot.
    - Added MAINTAINER for new file.
    - Fixed check patch warning.

Ninad Palsule (2):
  soc/aspeed: Add host side BMC device driver
  MAINTAINERS: Added maintainer for host bmc DD

 MAINTAINERS                              |   7 +
 drivers/soc/aspeed/Kconfig               |  11 +
 drivers/soc/aspeed/Makefile              |   1 +
 drivers/soc/aspeed/aspeed-host-bmc-dev.c | 250 +++++++++++++++++++++++
 4 files changed, 269 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-host-bmc-dev.c

-- 
2.39.2

