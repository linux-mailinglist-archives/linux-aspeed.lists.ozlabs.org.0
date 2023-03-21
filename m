Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C216C3567
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Mar 2023 16:17:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgwFk5J40z3cMS
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Mar 2023 02:17:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iIaJFDFl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iIaJFDFl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgwFP6j1cz3c8x
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Mar 2023 02:17:13 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32LEh78R024839;
	Tue, 21 Mar 2023 15:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CHCxWc3rbFcp6UZWpf/pCxYlaalqi6G6tNsTY1PMYM4=;
 b=iIaJFDFlcNCRPRB3mGP+5Q6NWvTt/7b4dV4LX4IfMH+yjWT8ykhluGWXXzCzuLiyKTjX
 HyBLuPib/tI5rNk2oqvgVzp7oM5K00TWeF5N+lTMqlAf2uMRoUfMPsWNEZ1sYZi+Y2/n
 W1A6YYn485TsjxPSe67iZp8qmOrNQ5RAXhRF0MOAa3K4JjZJfeo/VpzH2kMcJW3h1Q4C
 rDSGehGyagX+4f6JQ8XIYCt10qWUn/adOsPisTLIcoBj4brIKmi3yfWra/jNiQ8vsNgI
 UhUxCFkbWDe8TSMDD6lyzJ7bZo2BbBlFWodwvCexsHE1p1oTwg2GtunBYlGL3p2V+LPN rA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pf7qnv3pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 15:16:56 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32LEE4lx030320;
	Tue, 21 Mar 2023 15:16:55 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x6u7gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 15:16:55 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32LFGrFJ61800786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Mar 2023 15:16:54 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDFF55805B;
	Tue, 21 Mar 2023 15:16:53 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 521F958063;
	Tue, 21 Mar 2023 15:16:52 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.111.39])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Mar 2023 15:16:52 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] doc: Add Atmel AT30TSE serial eeprom
Date: Tue, 21 Mar 2023 10:16:40 -0500
Message-Id: <20230321151642.461618-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230321151642.461618-1-eajames@linux.ibm.com>
References: <20230321151642.461618-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BDGxzua8XQlU3P1guiQT_48bq79xeThX
X-Proofpoint-ORIG-GUID: BDGxzua8XQlU3P1guiQT_48bq79xeThX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210118
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AT30TSE is compatible with the JEDEC EE1004 standard. Document it
as a trivial I2C device.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 6f482a254a1d..43e26c73a95f 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -47,6 +47,8 @@ properties:
           - ams,iaq-core
             # i2c serial eeprom (24cxx)
           - at,24c08
+            # i2c serial eeprom (EE1004 standard)
+          - atmel,at30tse
             # i2c trusted platform module (TPM)
           - atmel,at97sc3204t
             # ATSHA204 - i2c h/w symmetric crypto module
-- 
2.31.1

