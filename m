Return-Path: <linux-aspeed+bounces-3942-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uSSGBUL+52kpEAIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3942-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Apr 2026 00:46:26 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27A4403AC
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Apr 2026 00:46:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g0csR6ymLz30FR;
	Wed, 22 Apr 2026 08:46:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776811579;
	cv=none; b=SiiA38Hs6PjE9uFR1wHHUmUa75bZp5mdNozecEhZckMnpS3dTDUeDnnkWksJFJTsXStrAM5kk9isHIV/J0wSIy7oardT4IO1zgAS/OlPBgQ5np4WhcynWJhteiqDFAbmkakd9ol1WAJyZN4PdoGLRv7gF0B+qyIfkJ5kvir94yP8xofuwNdW4BymA1h/RBuyonVUxgttTj3ztC0Js8Hrt7tnAAf5T/0p2sXgnTgtF+4u+HDwxkK5aubFdXg0m2QItHQirdOe7bE9tzTbgnHjqNGoTXdC6cDbkQp5pqDRQQctt6cBydlsN5/3AfsoLVM3v3DaxMfPdplrZXqcMvRsDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776811579; c=relaxed/relaxed;
	bh=uVv8xeMGu4mFMCnNaO/jcbkxpR4qemBlce3MlgH4uQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FFqyLsZ1YHkKnxfyGCjDPUV7gg0Iu5hkylERdaX4Z4eTavqWcc5mQlFKJLnbbKU60arI8PlgIC5wy6LGt68jtJW/36AaRRc+k/PslFfXOaLebBC0ZUpraoWksQWzUK/RTFc/f4pKpSYsybrH8th80qcBTgexFCQ/fFE2JVh8UStKT1SG1iHhbzRzbw/oi0cW8K6eZ+WIwmfFk80ZmkSsc1j8Y9A6Bf0R8wXPrC+5//G1IJgCh0RgquD53F3BwKmebFahshZasGFSGxsuwdrCxzzR2geT0RLDOoMGbFqS1CmXqFKPdYombWUvnbv0LwWkL9yKP6NLPLUg9zatzgZgoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d2hOcqqy; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d2hOcqqy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g0csQ5409z2yxf
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Apr 2026 08:46:17 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIljX3589903;
	Tue, 21 Apr 2026 22:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=uVv8xeMGu4mFMCnNaO/jcbkxpR4qemBlce3MlgH4u
	Q0=; b=d2hOcqqy7GAvRWp66J8yPMlzonsrBUv4j0JoVSIvwuJczD+QiP872k9QM
	ks6T+3Dairvyrvky/IaArXWINggXv/sf2WPLJaC5FSzlfHHH7oZUG+cSJOXuxf+C
	kWwgNPSWrJT7g/GQJMb6+USExPGAu0DQYyeQY7iWt7/lPvxTxERxCJYX4mMxdSWe
	pVThpd5rLh799STMElcaiIu7CsFuCCgKU7m+WBIJOJPh/zhbhKuJmrHrxZImM5TS
	YaARbKffx8N/LOd+eYqTiZDah/XzfQ/hlTJJpRUv5vQKqYzVGQ9NL15MEzsYuFxm
	JdqkUnCPCTpJ58Je4mUBe/B8+0sUg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu20qgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:00 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63LMZPd9013594;
	Tue, 21 Apr 2026 22:45:59 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmnsh2js2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:45:59 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63LMjwJV30737046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 22:45:58 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7774058055;
	Tue, 21 Apr 2026 22:45:58 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D756F5805D;
	Tue, 21 Apr 2026 22:45:57 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Apr 2026 22:45:57 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v1 0/7] DTS updates for system1 BMC
Date: Tue, 21 Apr 2026 17:45:37 -0500
Message-ID: <20260421224551.1611818-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ht2NluW5i7Abk4E84EJHIDn9ejs7EeCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyMiBTYWx0ZWRfX0i4AGE/NHfJ6
 SX4uzvG/6oCRq+XSEsAf+7WCq9ERcSfvDptaK2QyCsp+9OT9iyfproUDEWlUqTgjaSguqUG0lrb
 XY9zJijItRy0ZBOv5q44qrZ2sW+FHibM77GdxzmGJ0unACPLCk7txhyLpoRvFj2D16QUxQ+2LEo
 jx+kmIal0zPjIH/XnwHttV/Oo7N7l8vFbC7t+sWhEqbcuX2vZqrSu4e909XV1IIdnPM+1t47sex
 C6vSC5KmbnEmWdclT7dLL29BlGtIebtDVUcZozL2fpv/REeExqqvOUOLxQiWaSSjSMvAiKqJnHH
 /4UwjVoe/NqcEn9Qg+6sXhqb3V1VJ8GsUwIXsdNWGpMu8aSc1h3ZeIHB5wPBJ2wvA3nNnlugZyA
 b0j0qBtaElRyIPnonxsub8RzCtBT8l9AFS7LLQZ8QIpABA07Im+PDN2A/o/kewp808Hu1eb9gIq
 Zg+pZaHyZzGT6Ajpnpg==
X-Authority-Analysis: v=2.4 cv=C8LZDwP+ c=1 sm=1 tr=0 ts=69e7fe28 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=phvD46glpbon8P5KJSkA:9
X-Proofpoint-ORIG-GUID: ht2NluW5i7Abk4E84EJHIDn9ejs7EeCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604210222
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:eajames@linux.ibm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:ninad@linux.ibm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ninad@linux.ibm.com,linux-aspeed@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3942-lists,linux-aspeed=lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FROM_NEQ_ENVFROM(0.00)[ninad@linux.ibm.com,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6F27A4403AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

Please review the patch set.

Andrew Geissler (1):
  ARM: dts: aspeed: system1: disable NCSI net port

Manojkiran Eda (2):
  ARM: dts: aspeed: system1: Enable video engine
  ARM: dts: aspeed: system1: Add usb virtual hub dev

Ninad Palsule (4):
  ARM: dts: aspeed: system1: Disable vuart2
  ARM: dts: aspeed: system1: Enable temp sensors
  ARM: dts: aspeed: system1: Added status LEDs
  ARM: dts: aspeed: system1: DTS updates

 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 1445 ++++++++++++++++-
 1 file changed, 1423 insertions(+), 22 deletions(-)

-- 
2.51.0


