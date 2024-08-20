Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FBE9579B2
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKP57slz7Bxy
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B6XjT51P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2648 seconds by postgrey-1.37 at boromir; Thu, 06 Jun 2024 09:24:01 AEST
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvk754Pnsz30TR;
	Thu,  6 Jun 2024 09:24:00 +1000 (AEST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455L7NTJ016716;
	Wed, 5 Jun 2024 22:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IBSEFFyozq9AP7T7zCoic6
	K0+Ab6heDxsdmmvN5PFPw=; b=B6XjT51P9u+kbYTJzFe+Mrs5LsvjlAFD9ZLhvW
	Qt7+WPZK+GWEcnNR4iQGIqcXnCJllSIyKapSQfEWhf/Uiyzk+zFPvMrTtECDs/xi
	8Vexs+0TAlGP4GkcXjvUTCCkCPCLGKI6lIeYBEKJyR4ZpV39uoOmMtAsKLKoHfiR
	TmlKz3pRtVrKMs2KQvxRuNrKwv3HOzXH9zoGo6zwQuhjQAdJca9N7PgzIdNtEIm3
	T1TrE6BUX3tvMTIfCSy1srodvwF5J3hIcSO/baCULFCMzXpUjlamhQ3ulcUdUw1H
	c7oAli9MOt8EY+lLi8U1SbESvxtKRYKwPUeWQV/H8R4knUIA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjan2k1en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 22:39:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455MdZjb031482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 22:39:35 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 15:39:35 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 5 Jun 2024 15:39:34 -0700
Subject: [PATCH] fsi: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240605-md-drivers-fsi-v1-1-fefc82d81b12@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACXpYGYC/x3MQQqDQAxA0atI1g2MoxbpVaSLaGIN1FGSVgTx7
 k67fIv/D3AxFYdHcYDJpq5LyihvBQwTpZegcjbEEOtwDw3OjGy6iTmOrhioqrmN1DZMkKPVZNT
 9P+ye2T25YG+Uhum3eWv67jiTf8TgPC/Xjxl4fwAAAA==
To: Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
        Alistar Popple
	<alistair@popple.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Andrew Jeffery
	<andrew@codeconstruct.com.au>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4YyMX5gMIkxoGAUWDq0Ghiv32UuU6_8N
X-Proofpoint-ORIG-GUID: 4YyMX5gMIkxoGAUWDq0Ghiv32UuU6_8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=856 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050170
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>, linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o

Add the missing invocations of the MODULE_DESCRIPTION() macro, and fix the
copy/paste of the module description comment in fsi-master-ast-cf.c.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/fsi/fsi-core.c          | 1 +
 drivers/fsi/fsi-master-aspeed.c | 1 +
 drivers/fsi/fsi-master-ast-cf.c | 3 ++-
 drivers/fsi/fsi-master-gpio.c   | 1 +
 drivers/fsi/fsi-master-hub.c    | 1 +
 drivers/fsi/fsi-scom.c          | 1 +
 6 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 097d5a780264..716a924269ee 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1444,5 +1444,6 @@ static void fsi_exit(void)
 }
 module_exit(fsi_exit);
 module_param(discard_errors, int, 0664);
+MODULE_DESCRIPTION("FSI core driver");
 MODULE_LICENSE("GPL");
 MODULE_PARM_DESC(discard_errors, "Don't invoke error handling on bus accesses");
diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f0a19cd451a0..b454587790a2 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -672,4 +672,5 @@ static struct platform_driver fsi_master_aspeed_driver = {
 };
 
 module_platform_driver(fsi_master_aspeed_driver);
+MODULE_DESCRIPTION("FSI master driver for AST2600");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/fsi-master-ast-cf.c b/drivers/fsi/fsi-master-ast-cf.c
index 812dfa9a9140..85096559dda3 100644
--- a/drivers/fsi/fsi-master-ast-cf.c
+++ b/drivers/fsi/fsi-master-ast-cf.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright 2018 IBM Corp
 /*
- * A FSI master controller, using a simple GPIO bit-banging interface
+ * A FSI master based on Aspeed ColdFire coprocessor
  */
 
 #include <linux/crc4.h>
@@ -1440,5 +1440,6 @@ static struct platform_driver fsi_master_acf = {
 };
 
 module_platform_driver(fsi_master_acf);
+MODULE_DESCRIPTION("A FSI master based on Aspeed ColdFire coprocessor");
 MODULE_LICENSE("GPL");
 MODULE_FIRMWARE(FW_FILE_NAME);
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index ed03da4f2447..d32dcc98e85b 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -894,4 +894,5 @@ static struct platform_driver fsi_master_gpio_driver = {
 };
 
 module_platform_driver(fsi_master_gpio_driver);
+MODULE_DESCRIPTION("A FSI master controller, using a simple GPIO bit-banging interface");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 6d8b6e8854e5..6568fed7db3c 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -295,4 +295,5 @@ static struct fsi_driver hub_master_driver = {
 };
 
 module_fsi_driver(hub_master_driver);
+MODULE_DESCRIPTION("FSI hub master driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 61dbda9dbe2b..411ddc018cd8 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -625,4 +625,5 @@ static void scom_exit(void)
 
 module_init(scom_init);
 module_exit(scom_exit);
+MODULE_DESCRIPTION("SCOM FSI Client device driver");
 MODULE_LICENSE("GPL");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240605-md-drivers-fsi-0a34d82a85da

