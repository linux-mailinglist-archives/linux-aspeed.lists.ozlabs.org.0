Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 67BF78D1F9D
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 May 2024 17:06:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z/J4OL5B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpbHY5ZWsz79XM
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 00:58:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z/J4OL5B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpbHS4WRVz3w9v;
	Wed, 29 May 2024 00:58:28 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44SEvZ1D016803;
	Tue, 28 May 2024 14:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc : content-type : date
 : from : in-reply-to : message-id : mime-version : references : subject :
 to; s=pp1; bh=DZa9m4TzXvPaoKCrZGYgr4IIhWIR4xMd0CO8XHPIZ0Y=;
 b=Z/J4OL5BmRGCi//eVFvj1DRGmABMReB/UH/CvB8wgqmapNHoRLdI623HjjOmFCm4t5wV
 c6WCAMsOEY+4gbWeJVRY9e/CMepM8RE1xB5KWVvGwegYriCE6HPdtjn4wfGOxA4X4pCX
 E1D8me2eXOmgs8No0+8V5pSr9sXmtPexEFfmlB+GTeUMScKR7rUi7o0R8B9NUMIeMo5i
 wpMXChcnP/lFz4PlzqbjlD56YQKKbeGGvliW5RqXdVLRN2Naz54kkgKMk4V42GF4aSnV
 6GLcQBsV7Ouxw/PcZ6TyutHq/hs6tGmRG8tSfIi/6JCfG8KGDU8nP3/DBK7hIEIPFgC6 IA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ydhg0r02f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:58:16 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44SC4XeR011107;
	Tue, 28 May 2024 14:58:15 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ybtq07ktr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:58:15 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44SEwCar18285216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2024 14:58:14 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05A2E58063;
	Tue, 28 May 2024 14:58:12 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABA3758052;
	Tue, 28 May 2024 14:58:11 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 May 2024 14:58:11 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------eTX35vjxkYI1Y4RDzyt6RYZ0"
Message-ID: <b7270092-c1f8-4343-a564-84116b1046c7@linux.ibm.com>
Date: Tue, 28 May 2024 09:58:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/20] dt-bindings: fsi: Document the FSI Hub
 Controller
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
 <20240522192524.3286237-11-eajames@linux.ibm.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20240522192524.3286237-11-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LkuIf9CjiphnOU9H4k0PJkVIPXOIEgiA
X-Proofpoint-ORIG-GUID: LkuIf9CjiphnOU9H4k0PJkVIPXOIEgiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=922 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405280112
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------eTX35vjxkYI1Y4RDzyt6RYZ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Eddie,

Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>

Thanks & Regards,
Ninad


--------------eTX35vjxkYI1Y4RDzyt6RYZ0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Eddie,</p>
    <p>Reviewed-by: Ninad Palsule <a class="moz-txt-link-rfc2396E" href="mailto:ninad@linux.ibm.com">&lt;ninad@linux.ibm.com&gt;</a><br>
      <br>
      Thanks &amp; Regards,<br>
      Ninad<br>
      <br>
    </p>
    <span style="white-space: pre-wrap">
</span><br>
  </body>
</html>

--------------eTX35vjxkYI1Y4RDzyt6RYZ0--

