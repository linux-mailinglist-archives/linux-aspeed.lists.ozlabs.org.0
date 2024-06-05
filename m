Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED28FD2ED
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 18:30:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pbbDkeVD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvXxY1DFZz3c2t
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 02:30:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pbbDkeVD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvXxR1NwSz2yhZ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Jun 2024 02:30:02 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455GPYHc026406;
	Wed, 5 Jun 2024 16:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=jZInZY8/J56xPzD+Z72XOMl6Q8n4CzYCLULVHfxks0w=;
 b=pbbDkeVDYnQOEC4YIE+adlpvOqtfdXDg/TMoGt/vWCfFN/KuJ/8WIF2qb5frsliAnzsJ
 CGmq4h+zrcgmUvoKKUmP0Siajdl/UGIiCRHvnjN2ko54e+lw51XjWJKtDBguqLIttMBf
 REDhEsdLU8OJ8QQqZAW5kp0Rx2nQJzBr3Y4KAXipBI3qV5HQ9WeO5MRd+jvlrIXfx0g3
 CqjQpBMpzEX0D1UpswkZBPoGpb8nCDq0j3DDw3CbLCZnroZZC+RMG7943qJniUpZf0JS
 rNR7Wh1i0cLN0InMzpmjDlTDvg6IVBVtTk13bjd1GimxjjBuWjvc3LHT662teFyqRvkp Qw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yju1j84c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 16:29:47 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455GMbRF026899;
	Wed, 5 Jun 2024 16:29:46 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygffn53su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 16:29:46 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455GThAo59441408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 16:29:45 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AB5858045;
	Wed,  5 Jun 2024 16:29:43 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E18CD58054;
	Wed,  5 Jun 2024 16:29:42 +0000 (GMT)
Received: from [9.61.121.242] (unknown [9.61.121.242])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 16:29:42 +0000 (GMT)
Message-ID: <4c0eddbf-5397-490c-8c70-a581c7949b49@linux.ibm.com>
Date: Wed, 5 Jun 2024 11:29:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: aspeed: System1: Updates to BMC board
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
References: <20240605160604.2135840-1-ninad@linux.ibm.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20240605160604.2135840-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DWBAAnD3eDYp6YEr3NCd0y8b3QDf_7B-
X-Proofpoint-ORIG-GUID: DWBAAnD3eDYp6YEr3NCd0y8b3QDf_7B-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 mlxlogscore=809
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050124
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


On 6/5/24 11:06, Ninad Palsule wrote:
> - Changed temperature sensor monitor chip from tmp423 to tmp432


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index dcbc16308ab50..f3efecc7eb8d0 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -1138,7 +1138,7 @@ i2c8mux0chn6: i2c@6 {
>   			reg = <6>;
>   
>   			temperature-sensor@4c {
> -				compatible = "ti,tmp423";
> +				compatible = "ti,tmp432";
>   				reg = <0x4c>;
>   			};
>   		};
> @@ -1599,7 +1599,7 @@ i2c15mux0chn6: i2c@6 {
>   			reg = <6>;
>   
>   			temperature-sensor@4c {
> -				compatible = "ti,tmp423";
> +				compatible = "ti,tmp432";
>   				reg = <0x4c>;
>   			};
>   		};
> @@ -1615,7 +1615,7 @@ regulator@40 {
>   			};
>   
>   			temperature-sensor@4c {
> -				compatible = "ti,tmp423";
> +				compatible = "ti,tmp432";
>   				reg = <0x4c>;
>   			};
>   		};
