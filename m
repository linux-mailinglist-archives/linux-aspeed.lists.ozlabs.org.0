Return-Path: <linux-aspeed+bounces-3943-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLEhLkL+52kpEAIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3943-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Apr 2026 00:46:26 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BFD4403B4
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Apr 2026 00:46:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g0csV03RSz30Jc;
	Wed, 22 Apr 2026 08:46:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776811581;
	cv=none; b=O87hfZ1tZ0ttDj1OUCxgT7LvGf1kX76CPkXEgXrr8O12HR6ChD3QXEWPWzBhT2Zv8zGrg5v876mbJj+fGzMxuZOOohAxWFawqiMoF1WeYNiJZ/BepOCHQbiWAqHfgYJGWpfATvHYVvRcUNr6CR5txApSqZWtapxwXK4zgJ2QYcb9tkhf4Dy4vyDxaXoGxHrSozmzlJLVnSQPnvWXSZR4Z98OVGEdooZo6r210KqMKcz9tw0sfa0zgnI08FAGK74t3IFyKD5kOvURpa3TVjssHtLwXAzQ/0T+bvA86H6vqi+IfodgBERYsT6O4nq0tYHqIzCt4Ob3r1r2AS7/IwGN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776811581; c=relaxed/relaxed;
	bh=5/OfLF/vRyE81uJ4oXNhhevO81e0z/5D7qca2PImSDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEsx8f9h9mqnxh7vXpiGVjTN1sx5rnnvsKUPDzEM70+d9457CcLpjmV4piHp7V88rZ7YjHZR7o0CR5+LrCIvdADbWex/bX2Zp/IqXDO794zqhgtbrqY1SphcU+4ef1RIcfWDj1unw6mDjk3PtuMbmlq7K6AZPmFu0anKjavqu5o5daFYAbaxVj88nOsdMXFkJJ0678RrUTnd91B7Vbfw7TbwFmR4wp9N1ogXaTt35mL2D+CBnO5LVMdkqSb9OuxmrKRdScaUikRkDY7fJTLhWLpOZaSe7Mjuiu5pAYCPKubZ4WVnHByka0F2RJIMUQWtEsp6yrK2J317mpVICwqVmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M5om/Lln; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M5om/Lln;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g0csS3sRwz2yxf
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Apr 2026 08:46:19 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIn7xQ680898;
	Tue, 21 Apr 2026 22:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5/OfLF/vRyE81uJ4o
	XNhhevO81e0z/5D7qca2PImSDw=; b=M5om/Lln+lYeSruVPd1WmiACzW2qY6pIP
	gjvCfhxOkbwf48lRq00SY8G9ALAfDrG3YvRw6L2VhimKvC70lc8xHiyMSThghk3U
	pd15LZwWsH3p6+Z5OHVlDApiQfZojjVR7g/7r86LfOSdNPJqRnnPSwyATfbu+jRW
	2nBrN1A/7nvBHcoDaFJkrunxYNME6Xdp+oEX58NZIBG2fEllmutN3gpbFBAW3KZp
	p2uc7XcD5QCTxootirszLbJxzm8dWz7h36vGqS2K9ECFnrJbZ3isxRYi7YyOUQ7L
	GPHR3GuTQvhSoCOhv0CP8r1Fu+WfnREi2i5L2w/hi9/o9Ag1Gn+vA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu7gp68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:01 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63LMZKtG013563;
	Tue, 21 Apr 2026 22:46:00 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmnsh2js4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:00 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63LMjxr92818926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 22:45:59 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B8F958055;
	Tue, 21 Apr 2026 22:45:59 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CBA05805D;
	Tue, 21 Apr 2026 22:45:58 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Apr 2026 22:45:58 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v1 1/7] ARM: dts: aspeed: system1: Disable vuart2
Date: Tue, 21 Apr 2026 17:45:38 -0500
Message-ID: <20260421224551.1611818-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421224551.1611818-1-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: co4fY0lIEMwhIqn1ofsbesUWqyaoFO_y
X-Authority-Analysis: v=2.4 cv=Ksp9H2WN c=1 sm=1 tr=0 ts=69e7fe29 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=bKK4mZ8mWJzw25CKWzoA:9
 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: co4fY0lIEMwhIqn1ofsbesUWqyaoFO_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyMiBTYWx0ZWRfXxOvQ8x3PZZSP
 Judv5q/YUzq8d/N1QzRiZlE2lD7+oqI4xakksk+FTPv/fysipIfHHHgmjykNxj4FbQQD+NaByKE
 X6yTDc0/2exT7CNLPiVbcDWiZ1fZQtPOkP9S3XyXfpCQi1FC7pdlihrcU9A/CfnjP6j+HZ6zfO+
 Wfm7b/rywzjMQuJGbeXI4na1SlFeowr+LmpSIZZNcz4KPuKuUeAXta0B+0xCq16qnCSb9Gl9pkJ
 grG1fMCTIX3GQEZh5X9W50qtoGRjkRie3uiwg1vcxqeCAzNtYyFtn4r/gGOExKDcaoVtUFOTla8
 HVt8pwd8+odGWfdB2t6JCjaf8Hn6gmv7PTTOEPmwgY+H8C7IX274e5dkj5rsKcGx5D1ubfHP02w
 1A611ysCaOOGhdlZzxGpf1JDoomMyliiwWEqaO+/w61ORrGv22MHbb9rfLN3/kULAU43heRVw0W
 G/LVMfUuelq8rf0oiNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604210222
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:eajames@linux.ibm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:ninad@linux.ibm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ninad@linux.ibm.com,linux-aspeed@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3943-lists,linux-aspeed=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 35BFD4403B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

system1 BMC machine does not wire vuart2 to host hence disable it to
avoid any errors in the journal.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index c8267c97a44e..488d0b3916a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -472,10 +472,6 @@ &vuart1 {
 	status = "okay";
 };
 
-&vuart2 {
-	status = "okay";
-};
-
 &lpc_ctrl {
 	status = "okay";
 	memory-region = <&flash_memory>;
-- 
2.51.0


