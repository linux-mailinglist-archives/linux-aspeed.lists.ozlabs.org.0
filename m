Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 001488A569B
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 17:39:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BmDRIkVr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJBDc5RcLz3dVv
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Apr 2024 01:39:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BmDRIkVr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJBDV2WQ7z30NP;
	Tue, 16 Apr 2024 01:39:22 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43FFWm3C016131;
	Mon, 15 Apr 2024 15:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=pkvZQvQTM/USW1hdYXo/PMP26qwVSDBiF32DK+7fMAg=;
 b=BmDRIkVrR2a5bv6xkh3T3piWdv7IcElgUoDEGZjD2gA+g54avyViFOodgQ6yNHrAO0+C
 HLZpGAndVF6zeWtBTF4/CT5X6wmUvOlzEsRPmjfUaclaMVOVXtquKht9gF2+EeCeIyIL
 WP9dWePb0rSRYcv9BizzMRkNQIGEBD9UrAsToCRC924z8RIo91ZqWENxOU354qdE2SqT
 CGFR9EXoe+lVYyvn/xh1cd1Ye4/nlihvslrF4jCUcJQqLPLcr/1wZq4aEmulT2E7w5YC
 d/eAyAjLsZKjtu7gH3fZiAMIIPszY1XYJ53PsNPRdj2QGAc6i6hbvugVGcPncnQQa7kJ qQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xh6yd00dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 15:39:12 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43FDiMQu021347;
	Mon, 15 Apr 2024 15:39:11 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xg6kk8a9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 15:39:11 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43FFd80B49742498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Apr 2024 15:39:10 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0D3F58056;
	Mon, 15 Apr 2024 15:39:07 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A52E45806A;
	Mon, 15 Apr 2024 15:39:07 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.157.174])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Apr 2024 15:39:07 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 0/3] fsi: sbefifo: Prevent async FFDC collection for Odyssey SBEFIFOs
Date: Mon, 15 Apr 2024 10:39:04 -0500
Message-Id: <20240415153907.10051-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h2B_90IEK4czk1PO4NCRsL82lyyzFeMT
X-Proofpoint-ORIG-GUID: h2B_90IEK4czk1PO4NCRsL82lyyzFeMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_12,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 mlxlogscore=866 suspectscore=0
 impostorscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404150102
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, alistair@popple.id.au, jk@ozlabs.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

A new type of SBE on the Odyssey chip will return any async FFDC in the
next transaction, so collecting the FFDC is unnecessary and results in
unexpected behavior. Turn off the async collection for Odyssey SBEFIFOs.

Changes since v1:
 - Change "ody" to "odyssey"
 - Fix minor issues in binding document

Eddie James (3):
  dt-bindings: fsi: Document the IBM SBEFIFO engine
  fsi: sbefifo: Prevent async FFDC collection for Odyssey SBEFIFOs
  ARM: dts: aspeed: Update Odyssey SBEFIFO compatible strings

 .../devicetree/bindings/fsi/ibm,sbefifo.yaml  | 39 +++++++++++
 .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 64 +++++++++----------
 .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi | 64 +++++++++----------
 drivers/fsi/fsi-sbefifo.c                     | 37 +++++++++++
 4 files changed, 140 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,sbefifo.yaml

-- 
2.39.3

