Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6287660D5
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Jul 2023 02:43:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IV0xItgV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBplv2SFfz304l
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Jul 2023 10:43:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IV0xItgV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=lakshmiy@us.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9Jy84Mm2z30YR
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jul 2023 00:17:19 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PE6isf029962;
	Tue, 25 Jul 2023 14:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=d5F1KO0SVqTGkQNnrUVyswalXVag4bmTZdMD2hG6dnw=;
 b=IV0xItgVNLtfQIB31kXD5MheV8vVU1++ojsYNg+0Lf1scTnzXbXazDxL1fM0WsvM2IID
 NG0xIhvtU0RedE6xvfh+VjKRcqbfcYvjay7Lx+hRF3aqboEJ3lNj20DymVc0JgWjgwGz
 jRqW64bmrBpCUMdFCHnaBajNRlh7z8DISGAb6L7IDLdlZpj7b1kWHDehTnZ06fYdd7Sa
 cfWAm3Is3Ll71Obg8z9zvR41QBoySIMZ9JuNDg8iPSplp4XVvJB+5jsX8Qx3d1pSC29l
 Gsa1fAsnj1QkSsqTHARlI6TUPMwm7bWiwUKdIlEijAa9WKx7CRWME4J1mF9tUWxTuSKX xQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s20jtmyn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 14:16:40 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36PDsuK3002381;
	Tue, 25 Jul 2023 14:16:39 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txjve38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 14:16:39 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36PEGcIJ23790264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jul 2023 14:16:38 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44A7C5805A;
	Tue, 25 Jul 2023 14:16:38 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 350EF58056;
	Tue, 25 Jul 2023 14:16:38 +0000 (GMT)
Received: from gfwa600.aus.stglabs.ibm.com (unknown [9.3.84.101])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Jul 2023 14:16:38 +0000 (GMT)
Received: by gfwa600.aus.stglabs.ibm.com (Postfix, from userid 181152)
	id 858C07401EE; Tue, 25 Jul 2023 09:16:37 -0500 (CDT)
From: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        joel@jms.id.au, andrew@aj.id.au, eajames@linux.ibm.com
Subject: [PATCH 0/1] ARM: dts: aspeed: Rainier: Remove TPM device
Date: Tue, 25 Jul 2023 09:16:05 -0500
Message-Id: <20230725141606.1641080-1-lakshmiy@us.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Dp_NfcHyUeSW42wsQzgJHHAi-ysMaANq
X-Proofpoint-GUID: Dp_NfcHyUeSW42wsQzgJHHAi-ysMaANq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_08,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=380 clxscore=1011
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307250124
X-Mailman-Approved-At: Fri, 28 Jul 2023 10:43:32 +1000
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
Cc: devicetree@vger.kernel.org, Lakshmi Yadlapati <lakshmiy@us.ibm.com>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

TPM is not supported in Rainier, remove the TPM device.

Lakshmi Yadlapati (1):
  ARM: dts: aspeed: Rainier: Remove TPM device

 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts | 5 -----
 1 file changed, 5 deletions(-)

-- 
2.37.2

