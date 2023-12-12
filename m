Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812080F33A
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 17:40:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DaoTitMh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqPVx6G03z3c3l
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Dec 2023 03:40:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DaoTitMh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqPVn3fYWz2xQD
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 03:40:32 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BCFqrOE010678;
	Tue, 12 Dec 2023 16:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=R2ZvyGmXnPPNYRQg2UvIIy4NXqkVhsr36/b1Jlex5oo=;
 b=DaoTitMhVYTtHkdvv62+RyGbqjVjtegKtGvqRywcRDF0sw590wG8Ro+D+NTNDx49H0Hm
 mTx4nkVDjIosrecOR49tGaV+LAzqlfrLtsV4ypNzgKo1BDK7tuEE858/R2Lv43LWr0tI
 twrosXBff2rQcKlshLiWJlL/1018+yOszoqmAdWtggBftEmH3Y0VP0Llodkj+tYHz1gv
 SK2WZE91OSB4sWQX0fMmoWAjttSF7uYFYjwnxzbhmBMbuJJDJiNjx46VYvkYqrYj+jzD
 EBIQT/DnTfuR9ipeTw652AFFFERitNeoPtHOJanOFDwrxgksN8UBlN3mo1PWhySOQGVu hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uxtj11kgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:40:29 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BCGFhSt015432;
	Tue, 12 Dec 2023 16:40:28 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uxtj11kg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:40:28 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BCGN4gF013869;
	Tue, 12 Dec 2023 16:40:27 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw5921t5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:40:27 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BCGeRgp42860960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Dec 2023 16:40:27 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3FE658059;
	Tue, 12 Dec 2023 16:40:26 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D10858053;
	Tue, 12 Dec 2023 16:40:25 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Dec 2023 16:40:25 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        joel@jms.id.au, andrew@codeconstruct.com.au, peterhuewe@gmx.de,
        jarkko@kernel.org, jgg@ziepe.ca, keescook@chromium.org,
        tony.luck@intel.com, gpiccoli@igalia.com, ninad@linux.ibm.com,
        johannes.holland@infineon.com, linux@roeck-us.net, broonie@kernel.org
Subject: [PATCH v1 7/8] tpm: tis-i2c: Add more compatible strings
Date: Tue, 12 Dec 2023 10:40:03 -0600
Message-Id: <20231212164004.1683589-8-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212164004.1683589-1-ninad@linux.ibm.com>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q_0o2gxhRbmM75pPMGzEmo-uLp8nnzdS
X-Proofpoint-ORIG-GUID: 1TicZk_omyb0OwjuP4oIfXPW82ih_7Mf
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-12_10,2023-12-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312120128
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
Cc: devicetree@vger.kernel.org, festevam@denx.de, linux-aspeed@lists.ozlabs.org, peteryin.openbmc@gmail.com, alexander.stein@ew.tq-group.com, linux-kernel@vger.kernel.org, naresh.solanki@9elements.com, linux-arm-kernel@lists.infradead.org, lakshmiy@us.ibm.com, bhelgaas@google.com, vincent@vtremblay.dev, linux-integrity@vger.kernel.org, geissonator@yahoo.com, patrick.rudolph@9elements.com, linux-hardening@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Joel Stanley <joel@jms.id.au>

The NPCT75x TPM is TIS compatible. It has an I2C and SPI interface.

https://www.nuvoton.com/products/cloud-computing/security/trusted-platform-module-tpm/

Add a compatible string for it, and the generic compatible.

OpenBMC-Staging-Count: 3
Signed-off-by: Joel Stanley <joel@jms.id.au>
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/r/20220928043957.2636877-4-joel@jms.id.au
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 drivers/char/tpm/tpm_tis_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
index a897402cc36a..9511c0d50185 100644
--- a/drivers/char/tpm/tpm_tis_i2c.c
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -383,6 +383,8 @@ MODULE_DEVICE_TABLE(i2c, tpm_tis_i2c_id);
 #ifdef CONFIG_OF
 static const struct of_device_id of_tis_i2c_match[] = {
 	{ .compatible = "infineon,slb9673", },
+	{ .compatible = "nuvoton,npct75x", },
+	{ .compatible = "tcg,tpm-tis-i2c", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_tis_i2c_match);
-- 
2.39.2

