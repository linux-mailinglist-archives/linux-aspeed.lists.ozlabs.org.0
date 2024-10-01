Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A97D98C5E7
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 21:18:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ75L3ppSz2yR5
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 05:18:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727810307;
	cv=none; b=Dm0TXMqtXg1pd9riZg5lJoo8SosMOdyJJ+3klvoHC/07/ZRepd7Cqh9Z2FWzBOGEdaXBpmkkzPHT0uUT5A3MJVTGcPIvdYTO4YlEhbF/y16Qk7rsuhzYvXcg/oBImrHEB3DxEXTUiLJT+8WB4mKz/rxAV9C1NPW6/qXPb7j8eD85dwjz0V0/zchtmGdk30ASrTLU1tU1us2+SOnwU3ngiO6OX/JrGAFc6CZnvpqigA2kY18DygsiMKRXDhtYJFnfJK5qMvE6c8iXRk1llijOjYA8YFXpAoJ/PPq5b6PT3LsipdzG5QjhsH73tXsPLZ84NGTmJzPwlp5zhHMMZ8QGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727810307; c=relaxed/relaxed;
	bh=IDSkA+pHDjhKZYqv6kAJMgRE2rn2M7Iu0eSnkvjhH68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XXtde8VrPataavjZO1yiWkVdHdI6PpShX+6e+cIicQvcWWChZ9ImlzluKa0AX05nJKr0VhlKpoPTHNkV/8A7unADDxBLY5uNeTwFT19lnZJs6Vm0WsLu6thJK1Ep6bVop06Umx7UiKmDQTu5N3CUNIVMwgl0XQx7dPblwJ/OcIigyvlPbE43NZVe1fiiXl8GLgtsExktI/1jLo1y2EGOIGts+u1YLMGB3NbFbcWlyvhCt2hZM4xM6BVryBbgpvYzlKZ9LqW3emkOmOuhAeV+xrjS5V9PcGFcDoGRX2V8QIzUNJG3kgvN3CdXEda6aaZVCu/3JdVf7r0a1DgpBftlBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P6XpS73E; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P6XpS73E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ75H2gZjz2xKg
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 05:18:26 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491JH63M011616;
	Tue, 1 Oct 2024 19:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=IDSkA+pHDjhKZYqv6kAJMgRE2r
	n2M7Iu0eSnkvjhH68=; b=P6XpS73EmgKW/7etdhE5Dxmc6rmFLx+pxT6rbZMVpn
	Ck8hRF8z4pKOqRO1sXZkWgZBMftXV2JR4oe8LlRu1my6EpwzST+H49rIFZ5SV8Zn
	Be7S4O0tNcbTNAG2cc5OC9qB+J1N/Jvg8Zm8DEx0qEu2N5xHjjcnEd2nJE9VPbg5
	KbpkCpqsy2rPBF8Ke17fO+rXfb8tKqFjIW7OqWZBM/JRTC6d9Z9dPYa3MoGyzXLK
	WhEoPMtiGFjRRIA0GOwfjqeR6xmbjix7kxzwGnVRP9U/nlG2fRils6kOumsjxasn
	wsc408m3qsxhrHvavqSWdUjPKD9i25LrlGFuT8jSv7wQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 420q3p0046-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 19:18:10 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 491I8dGO017866;
	Tue, 1 Oct 2024 19:18:09 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41xw4mx9xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 19:18:09 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 491JI8RY40829550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2024 19:18:08 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 859725804E;
	Tue,  1 Oct 2024 19:18:08 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEA2B5803F;
	Tue,  1 Oct 2024 19:18:07 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Oct 2024 19:18:07 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, eajames@linux.ibm.com
Subject: [PATCH v1 0/3] Device tree changes for system1 BMC
Date: Tue,  1 Oct 2024 14:17:47 -0500
Message-ID: <20241001191756.234096-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: thyCX61fjYp6ldqtjQhvbnSdr5eFTeX-
X-Proofpoint-ORIG-GUID: thyCX61fjYp6ldqtjQhvbnSdr5eFTeX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_15,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=661 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010125
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

Please review the device tree changes for BMC for system1 machine.

Ninad Palsule (3):
  ARM: dts: aspeed: system1: Bump up i2c busses freq
  ARM: dts: aspeed: system1: Enable serial gpio0
  ARM: dts: aspeed: system1: Add GPIO line names

 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.43.0

