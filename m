Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A45579DBA8
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 00:10:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lH3EXGR9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rld6r24Vkz3cPm
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 08:09:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lH3EXGR9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rld6b0Slbz30GC
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 08:09:42 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CM8v2S004422;
	Tue, 12 Sep 2023 22:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tRf8sEkIHVDViAcN8P1CvlCnpPKOlzjSBMM8qLXXO9U=;
 b=lH3EXGR9jFrca6ENqFvKPYCrxEVpVOyzD4kjuk0WeQnaeZOq4BDifIusKweu7aO3J7gT
 DJbchLPs9WSr4Nzva+WZsnIrwPNjt8ksTcG3JLbIwDTwD1isPLWPveIR3QL8WESVzdQV
 awEXyXpv0jr0T8FMiCAhiZqFrf4bYVRYE1+qRFg9dCjf4tBP4XUsyJxnFd+MsIjurzaG
 +OFysN5ly6J0yto1bs3KXAUURAz+SwDpQf/WTn6fp0/HrwHOvjieS2onOGDa04gxZCRH
 ijaqftIF3G3pjP7Ah4cNVsuIoLpcpEtHeaw+66coeRyVFdk+4wSHPEcRNedAqGfU+DH6 ZQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2ymgh3gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 22:09:30 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38CJqTTH012083;
	Tue, 12 Sep 2023 22:09:29 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t13dyppcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 22:09:29 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38CM9SEZ1442314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 22:09:28 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F4E45805E;
	Tue, 12 Sep 2023 22:09:28 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 167E958063;
	Tue, 12 Sep 2023 22:09:28 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Sep 2023 22:09:28 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au, eajames@linux.ibm.com
Subject: [PATCH v3 2/2] MAINTAINERS: Added maintainer for host bmc DD
Date: Tue, 12 Sep 2023 17:09:23 -0500
Message-Id: <20230912220923.3701688-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912220923.3701688-1-ninad@linux.ibm.com>
References: <20230912220923.3701688-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oFqwElZRA5MgIJc5h1Fp3yrmBeK6ehV7
X-Proofpoint-ORIG-GUID: oFqwElZRA5MgIJc5h1Fp3yrmBeK6ehV7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_21,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 phishscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
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

Added maintainer for new driver file.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3be1bdfe8ecc..471382a2fff5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3100,6 +3100,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/aspeed-video.txt
 F:	drivers/media/platform/aspeed/
 
+ASPEED HOST BMC DEVICE DRIVER
+M:	Ninad Palsule <ninad@linux.ibm.com>
+L:	linux-media@vger.kernel.org
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	drivers/soc/aspeed/aspeed-host-bmc-dev.c
+
 ASUS EC HARDWARE MONITOR DRIVER
 M:	Eugene Shalygin <eugene.shalygin@gmail.com>
 L:	linux-hwmon@vger.kernel.org
-- 
2.39.2

