Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F236C3558
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Mar 2023 16:17:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgwFT2rRkz3cfB
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Mar 2023 02:17:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tgAhISlZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tgAhISlZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgwFK0nJSz3cM1
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Mar 2023 02:17:08 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32LEgR3l030268;
	Tue, 21 Mar 2023 15:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QTxotmzrlXNRr8X9T7oj76bVx52qD66MadcVuPYWFSk=;
 b=tgAhISlZUuQl7jb6ePP5Ao1QCLF+FIpTo8MCQm4Yj5YA8ycncVK7Bz4t/nCsEi/Q/ipN
 Y1PgdpjKVOp4MOk5anstUVpLndCW92xOq0rG5U49XXA8zMdqmg26PX7KavlHSRpmVEEs
 E9P/6Cq9uk/4bV03TW/IMZNz1OvbsbMn2cg6h/Iz1osSVE3fUq7U2daofSSaPKpwfVdo
 /RU6Ttz/6SF6NKPnaG8I8tko25p+rNhCjer2b8Tl4OKMEwvzfUuOwARLzZRxxItzgIH2
 X05I/RmQj9ZjJt4PgvYVvm+rwhiTEvZgqiPHs4TahlRv1XFhOwBQahs9CnYX8yCq3S0+ mg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pf85y394n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 15:16:50 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32LE1a17000573;
	Tue, 21 Mar 2023 15:16:49 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7fync-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 15:16:49 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32LFGlaf25559754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Mar 2023 15:16:47 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 989DE5804B;
	Tue, 21 Mar 2023 15:16:47 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B26558068;
	Tue, 21 Mar 2023 15:16:46 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.111.39])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Mar 2023 15:16:45 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] eeprom: ee1004: Enable devices on multiple busses
Date: Tue, 21 Mar 2023 10:16:38 -0500
Message-Id: <20230321151642.461618-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mnS2_M6JxjQXPDdoywMzQCEA4PKjviAa
X-Proofpoint-GUID: mnS2_M6JxjQXPDdoywMzQCEA4PKjviAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=737 adultscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The driver previously prevented probing devices on more than one
bus due to locking constraints with the special page addresses. This
constraint can be removed by allocating a reference-counted bus
structure containing the lock, rather than using global variables.
In addition, add devicetree bindings for the EE1004 driver for the
AT30TSE device and add the devices to the Bonnell BMC system.

Changes since v1:
 - Add the devicetree changes

Eddie James (4):
  eeprom: ee1004: Enable devices on multiple busses
  doc: Add Atmel AT30TSE serial eeprom
  eeprom: ee1004: Add devicetree binding
  ARM: dts: aspeed: bonnell: Add DIMM SPD

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts  |  20 ++
 drivers/misc/eeprom/ee1004.c                  | 182 +++++++++++-------
 3 files changed, 135 insertions(+), 69 deletions(-)

-- 
2.31.1

