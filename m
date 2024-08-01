Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B58F944E18
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 16:32:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SBjKG9mw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZWdV3Zgdz3dWv
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 00:32:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SBjKG9mw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZWdK0hZjz3dRB
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 00:32:20 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471ESZBc032072;
	Thu, 1 Aug 2024 14:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:references:cc:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=p
	gYQ+qpZzf6i0f+qRPPCt7RFBjuEZ/Fslvazzs8UPPU=; b=SBjKG9mwC7xvaeAN6
	D/1cvFNG5yE5NrnVNIWGp6q5eGs/yho/5UTAWI7dQNbFsxGmZpX47BviQ4qwo4sC
	FCJu5Y4CG+HRNthyYX5x/kw9Y2AySDzwlpv3MeAc5PvFs5q5/9ZzuQsjkNRepFHZ
	7VAZqFCklzfI73UJY5saBCHwcXD63cbX4ufQIzyJVpTmQ67JzuR8aK2j2AQD5l4Y
	jIVf2D4/BBswVxMArfHfTPiNlBs9r2lLqNzcAqQ0tMYSOh+3U2eWi2nMCLShC9uH
	1VHzmXTb4LRYN3yXbuqE+LiF0Zd/5zdGQ5uAz9kFhRzSlHIcZNEx/zFKiJQDrtbU
	IgwBA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40rc5c80cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 14:32:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 471CfFHs009176;
	Thu, 1 Aug 2024 14:32:11 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 40ndx39xjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 14:32:11 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 471EW8aN19006128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Aug 2024 14:32:10 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF04058061;
	Thu,  1 Aug 2024 14:32:08 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E9555805F;
	Thu,  1 Aug 2024 14:32:08 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Aug 2024 14:32:08 +0000 (GMT)
Message-ID: <b7eeefed-8d84-4f14-9d72-ea16d4e1458f@linux.ibm.com>
Date: Thu, 1 Aug 2024 09:32:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: system1: IBM System1 BMC update
To: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org
References: <20240731214737.986010-1-ninad@linux.ibm.com>
 <20240731214737.986010-2-ninad@linux.ibm.com>
 <5d86ab31-7b29-4f5e-9c9f-be904c128497@linux.ibm.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <5d86ab31-7b29-4f5e-9c9f-be904c128497@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d32dnhcNs2xVcOoi2GRxRGsQWptgn2q2
X-Proofpoint-ORIG-GUID: d32dnhcNs2xVcOoi2GRxRGsQWptgn2q2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_12,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=893
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408010093
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
Cc: Ninad Palsule <ninad@linux.vnet.ibm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Eddie,

On 7/31/24 16:57, Eddie James wrote:
>
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts 
>> b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
>> index f3efecc7eb8d0..f96b299d743ba 100644
>> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
>> @@ -764,17 +764,113 @@ regulator@43 {
>>       };
>>   };
>>   +
>
>
> Don't really need the white space here, but no worries.
I have fixed the whitespace in version 2.
>
>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
>
>
Thank you for the review!

Regards,

Ninad Palsule

