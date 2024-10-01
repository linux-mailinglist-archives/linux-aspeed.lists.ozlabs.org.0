Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5373898C701
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 22:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ97K3B8mz2yTs
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 06:50:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727815818;
	cv=none; b=VJUGcri3p6XTa1OfNTQA6KHSgpcDz1FKy7eZfh5uvLvUZYhSLAgsJ3qYFdc9F1fg+JhdWjQmw4ilYyFF7VrtUIDH7LlrM8Yffs4FBbJCg8nRso4hM6HfIQY3XpCzPgP9vwSIe0p8vStsfLoDdqXs7ngK8wMcqHOQ14ymkTZvBmQlsm36EwP03RWqXrIs4v+xotGJQyFxy3sFqrzTj6PLi4qZzFMc3h0kO8eIpwthDbVDZ1KZA7mL770xQOR9RSoJtcBTkAeJmbLwyyBq4CumIwK8yec/1duj6LK7zP7IhRkna2tQOOoYOoYV42JxhCpcvrNb87YXmoU89ytJVkH/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727815818; c=relaxed/relaxed;
	bh=bRwqXiq2yAVxQNmhDQgywX5S9JPae9Fscf8XH1JEhtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZvernon+fJK4khaNu8nviIaBPNjZlrsH3SAK6Oi+eiQUEEK6SSGX9suZApeB4jM6zDhXYjWvJjlaCW9mZxt1Jlja99xoClGXNMU+0gQN2tSp2FWFgeQ/oi3CYmhfg1/xDPvpFCkcnuQDjEu6GmP15gGC9HJArXEQbs8vnWTydr27s2DO1Jxq0FJObJ4kMFDUMQDRXpTzFkUlyFTUTXGbeBYSnpWCnqkyvPOZGVWofQVscACxlxnnjfvHnSxRky1PW7NTEyGW8b3v7le5h8tIhpDzZrbvmKQ0fWQJOtKLW7OvDCk9AZMQge0+50FHWiWJVQzJtVWfFObPskuaweh9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eUTW8Yxf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eUTW8Yxf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ97G2dpmz2xs7
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 06:50:18 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491KHBGx001811;
	Tue, 1 Oct 2024 20:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=b
	RwqXiq2yAVxQNmhDQgywX5S9JPae9Fscf8XH1JEhtg=; b=eUTW8YxfUf8dr9Scm
	uz/6dwGwqV9fLkAdwJbNxyMNbc1/jtZl3GcqVJbk1Z5hxmmOMJT9p5kUuIPL6oUj
	dcMDTR/y2icGirJiqka5zMB+9UFrUPtzsrg9bQXx0xffBvkw1CpvNVb9R2JeoW7h
	5mbZay50bweDjm6uvI+X72cZjOX9Nz99/OUpgEPbOJtvc+xPVv9aUuEDY9y8Mpbc
	ASq/Dhf3qSPKVBkNXEeUgeiSdDADAYTNBye2xU0GwlA8ZXvBQSC4Gbj+WoBTaQq2
	zplDx8uG2QadnO7dLQcS3dbMYnMi/s8m88zKCwCY+9Qcc7/thWI9C/1woMIoWr8e
	SKg9w==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 420qyqr3yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 20:50:04 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 491I1G4h020409;
	Tue, 1 Oct 2024 20:50:03 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41xv4s6usn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 20:50:03 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 491Ko2LF38404376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2024 20:50:02 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFF3B5805D;
	Tue,  1 Oct 2024 20:50:02 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1424C58061;
	Tue,  1 Oct 2024 20:50:02 +0000 (GMT)
Received: from [9.61.115.177] (unknown [9.61.115.177])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Oct 2024 20:50:01 +0000 (GMT)
Message-ID: <a795fef5-b2c4-4201-b481-86d97d60c81e@linux.ibm.com>
Date: Tue, 1 Oct 2024 15:50:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ARM: dts: aspeed: system1: Add GPIO line names
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
References: <20241001191756.234096-1-ninad@linux.ibm.com>
 <20241001191756.234096-4-ninad@linux.ibm.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20241001191756.234096-4-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OP4DZrIT-NdLO7PTBCKNoXg0wvrNkz9l
X-Proofpoint-ORIG-GUID: OP4DZrIT-NdLO7PTBCKNoXg0wvrNkz9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_15,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=742 mlxscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010133
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.0
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


On 10/1/24 14:17, Ninad Palsule wrote:
> Add following GPIO line names so that userspace can control them
> - PCH related GPIOs
> - FPGA related GPIOs


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index c0219167a337a..35cb9fea308e8 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -370,17 +370,17 @@ &gpio0 {
>   	/*K0-K7*/	"","","","","","","","",
>   	/*L0-L7*/	"","","","","","","","bmc-ready",
>   	/*M0-M7*/	"","","","","","","","",
> -	/*N0-N7*/	"","","","","","","","",
> +	/*N0-N7*/	"fpga-debug-enable","","","","","","","",
>   	/*O0-O7*/	"","","","","","","","",
>   	/*P0-P7*/	"","","","","","","","bmc-hb",
> -	/*Q0-Q7*/	"","","","","","","","",
> +	/*Q0-Q7*/	"","","","","","","pch-ready","",
>   	/*R0-R7*/	"","","","","","","","",
>   	/*S0-S7*/	"","","","","","","rear-enc-fault0","rear-enc-id0",
>   	/*T0-T7*/	"","","","","","","","",
>   	/*U0-U7*/	"","","","","","","","",
>   	/*V0-V7*/	"","rtc-battery-voltage-read-enable","","power-chassis-control","","","","",
>   	/*W0-W7*/	"","","","","","","","",
> -	/*X0-X7*/	"","power-chassis-good","","","","","","",
> +	/*X0-X7*/	"fpga-pgood","power-chassis-good","pch-pgood","","","","","",
>   	/*Y0-Y7*/	"","","","","","","","",
>   	/*Z0-Z7*/	"","","","","","","","";
>   };
