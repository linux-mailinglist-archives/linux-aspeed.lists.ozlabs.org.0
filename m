Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B442640078E
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Sep 2021 23:49:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1Wdq3D8Gz2yS9
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 Sep 2021 07:49:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iG90m4cx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iG90m4cx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1Wdm0ZfZz2yNK
 for <linux-aspeed@lists.ozlabs.org>; Sat,  4 Sep 2021 07:48:59 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 183LXh56180746; Fri, 3 Sep 2021 17:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=t9lxq9EiRdjMoLq8OXYdlfYIIv6U9yFslKoUjWXB9Ao=;
 b=iG90m4cxj03rqUmRa3zRoKFIfUprPX6MmVT/wJ6viMyaT3fHGIMgPxtH7gYwQTjoXlMS
 Nb6P2CUsSEeK6BixhxGpWB6Hf0wVkaQ+pQNc7ZY8ejaG+MuL0eGHpk8JmS0ViLKebihF
 jp/5FM1iYO3tyOFeGDdDQV4eWMwb3AR2DY06mqB1Nivn1y7Ll/a3cXAw59KEEekL7jXj
 cAigow3XJgf6AInGQECLGZwEx8E2juNnqvw9+WVOwuy9ImUCRlnueT7QpURDVSk4KKQT
 +jq3t0pmR9LCWsuw4TEEMaJhQ5ODXCacCti6pA1UcWaIGTRz/KtmNOjGOs04nhWfxcz1 Vg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3auu86rsa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 17:48:44 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 183Lh8UD025641;
 Fri, 3 Sep 2021 21:48:44 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3au6pnmkdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 21:48:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 183Lmget52560194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Sep 2021 21:48:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B2C2AE063;
 Fri,  3 Sep 2021 21:48:42 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 080F2AE05C;
 Fri,  3 Sep 2021 21:48:40 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.75.30])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  3 Sep 2021 21:48:40 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 0/2] ARM: dts: aspeed: p10 i2c and leds additions
Date: Fri,  3 Sep 2021 16:48:34 -0500
Message-Id: <20210903214836.48286-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NnDXAAH9BlFZThP2_DiIJqatTkafmpqU
X-Proofpoint-GUID: NnDXAAH9BlFZThP2_DiIJqatTkafmpqU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-03_07:2021-09-03,
 2021-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=470
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109030125
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
Cc: lkammath@in.ibm.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add I2C mux devices to the Everest system, and add all the PCA-chip
attached LEDs to the Rainier system.

Eddie James (2):
  ARM: dts: aspeed: rainier: Add system LEDs
  ARM: dts: aspeed: everest: Add I2C bus 15 muxes

 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts |  158 +++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 1133 +++++++++++++++++-
 2 files changed, 1279 insertions(+), 12 deletions(-)

-- 
2.27.0

