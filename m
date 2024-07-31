Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C9A94383B
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2024 23:48:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YpUDFfX4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ5Lw12Kzz3d2m
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 07:48:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YpUDFfX4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZ5Lm185nz3c7K
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2024 07:48:15 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VKR9dg026323;
	Wed, 31 Jul 2024 21:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=B+3PjGiYKpJ0UVYq+Ea0wzBeuF
	NwN7n2LlEpIGeUN7M=; b=YpUDFfX4ySUaGIP3rzxx+VDpibCWTzQvDPn8rpeBgw
	JJZ0Qyyi/Jj+OhKvA3MI1Q7p/qLKuqeteac46NJsKYimSCS3O1A9lYM9x6/y1tdK
	JDl1KmKog8JeTe13eWWKDGS85khba5b7ulZ6hMjIG/LXkotC3tTfJwPwIxVgRnGr
	XQhR13LdlAsHFodM9rfbG9plVQjWNLDRWc5jBduEf//CAvHbSQhi1OV0IiUd3Znw
	IjdREcyj/q7/qpilK9xh5pARdrd2yr8YNOkmaOKhp8SwyA+CTVZ07rLsY7aLf+C8
	8O7jiCnSkJ6gpsTPIeYA7iVnrNGzDYnt4zC9Z6ovKOYQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40qnbx9mrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 21:47:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46VLMSPI011295;
	Wed, 31 Jul 2024 21:47:46 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40ncqmx53d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 21:47:46 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46VLlgLj39059926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jul 2024 21:47:45 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9612158060;
	Wed, 31 Jul 2024 21:47:42 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFCCA58064;
	Wed, 31 Jul 2024 21:47:41 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 Jul 2024 21:47:41 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        eajames@linux.ibm.com
Subject: [PATCH v1 0/1] ARM: dts: aspeed: system1: IBM System1 BMC update
Date: Wed, 31 Jul 2024 16:47:28 -0500
Message-ID: <20240731214737.986010-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2hln8jMhynt7M8DSt3gWFVX9NfqkLq6a
X-Proofpoint-ORIG-GUID: 2hln8jMhynt7M8DSt3gWFVX9NfqkLq6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 mlxlogscore=720
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407310150
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This patch only applies to openbmc/linux. The max31785 pmbus driver
changes are not available in the upstream yet. I will try to send those
changes upstream.

Ninad Palsule (1):
  ARM: dts: aspeed: system1: IBM System1 BMC update

 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

-- 
2.43.0

