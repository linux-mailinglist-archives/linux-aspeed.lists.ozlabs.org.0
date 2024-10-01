Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5FF98C6FE
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 22:49:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ96j18ldz2yQl
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 06:49:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727815786;
	cv=none; b=LMWoLoRDBDCd/68YxdTCpFHxiMOl99FH7NBqJzURu4YZ0SYTp6pRQF3CMjpjq0aW+YgJs1w9XxKlwEk5XkWT3XfIkz/4ov5kMthFDC4iIKJVdkQ6XXsvQv4+fkIISOCeBGha7J9YDXUqFUpAw7f/HcCBENGePmF8SihR3wd4HaQUfD/eBnn3Q3X/IGP+Abx68M1MKQ9EWzpJSdQBP4tnLjmE8H9NKeTntJA7ndGcvXUJymKvNLH6OL83lxVZdttxe5nLLDYBJVhsZMkgdDhT5ML89uB6XvEk96DHbV+3lYj5HIHSE+jVnDsn/8cRxsk+S6eDVnLSS6dzzxOkbevcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727815786; c=relaxed/relaxed;
	bh=RVUctId8N8zdwF8Tjcg+NHQHHDQSbDQZsrQMS6bWH/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNs5z6GqPHMksq+OvZPfMh9Lll2XtTeyYMGI2q31cDlVFC05nGuBMYNObUXxefshkAYLjxYAJ7E3tVGDTxjow4IFaCM/JXu07g3mezq+WV5A7RJN4hmGSQZ9LzlXMRuSFAYXuDKsZep5WXP1wOln+V2ayQv1g1kZcT/rdKtPvnCEA1/xN2PlsCb3kMs+bQDXDatKJ+KVgwlsRoI+V34dNpJ29agZJnclCiKvZrL2W5hUf0eg22DvJmM1ix8CQsSXFsmd6wkOtGp5eKsTT+ArCoTlFHnhmjMFYRU9RPQtH56Q0twWu7Uzrz7NsoFDRbZt/ze37rv8kMhrWIcECHe8sA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IvtO6703; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IvtO6703;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ96f3Bnmz2yGL
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 06:49:45 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491KNUvq018120;
	Tue, 1 Oct 2024 20:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=R
	VUctId8N8zdwF8Tjcg+NHQHHDQSbDQZsrQMS6bWH/Y=; b=IvtO6703ybOZK+jlk
	xkD31VS+iD3eqEMPnb1ENNzZpvQgohOcmJ+yrmUpv1NsqP1xlFYeiP0R5ZUSxaAR
	VBVs4OSd5FQcUYzrW6c1hORyNk7XOuwYEK4RBiZmYbn0S2QVUjcpRSH1DzmbLBzg
	zEth8hv4bM7kUzvaQ6/sMYRrN3uiGGy4t6z2XUchA97WWKiGjIvdJywpBxlfjJ+H
	aCWaWjunXdlwSvWo40nNCZ9LsAwNox/awRuLOtZwylhYq039SC/uiPKTXSyNb/So
	Bmc+yKeq3F8U4DjpbFUBbKx/uwyzKDyuuHc/nF4jOZDNz3nYdAQWqziPx7J6wZ5x
	BMJmA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 420r2rg2jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 20:49:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 491IjFOE014151;
	Tue, 1 Oct 2024 20:49:29 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41xwmk6hpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 20:49:29 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 491KnSNR5440186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2024 20:49:28 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEE3B5805D;
	Tue,  1 Oct 2024 20:49:28 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D0C758059;
	Tue,  1 Oct 2024 20:49:28 +0000 (GMT)
Received: from [9.61.115.177] (unknown [9.61.115.177])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Oct 2024 20:49:28 +0000 (GMT)
Message-ID: <6b1a98c5-6184-48d2-86e5-1ca8f44b5fc0@linux.ibm.com>
Date: Tue, 1 Oct 2024 15:49:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ARM: dts: aspeed: system1: Enable serial gpio0
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
References: <20241001191756.234096-1-ninad@linux.ibm.com>
 <20241001191756.234096-3-ninad@linux.ibm.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20241001191756.234096-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -PAj4LzxBdn-jCnjAmt3t34IM3C6T9RE
X-Proofpoint-ORIG-GUID: -PAj4LzxBdn-jCnjAmt3t34IM3C6T9RE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_16,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=785
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2410010138
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


On 10/1/24 14:17, Ninad Palsule wrote:
> Enable serial GPIO0. Set number of GPIO lines to 128 and bus frequency
> to 1MHz.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index 1cbf257fb0a0b..c0219167a337a 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -398,6 +398,12 @@ &emmc {
>   	clk-phase-mmc-hs200 = <180>, <180>;
>   };
>   
> +&sgpiom0 {
> +	status = "okay";
> +	ngpios = <128>;
> +	bus-frequency = <1000000>;
> +};
> +
>   &ibt {
>   	status = "okay";
>   };
