Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233838A55CA
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 16:59:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KCh//Y+M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJ9Lx03lQz3dVX
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Apr 2024 00:59:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KCh//Y+M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJ9Lk6l15z3cGM;
	Tue, 16 Apr 2024 00:59:42 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43FETkQu011449;
	Mon, 15 Apr 2024 14:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ANpJKg4fSvv7T8IJ3z3Xv+8MFN7yFYbJ/uNg2e5H7YI=;
 b=KCh//Y+MVcCEuPCfzf0qwOuWIGSaK8siSAEG8QWvvTozFhUt/5NpADUOQZzFGzkam2oQ
 1j99C1egg22xw+oj799ApaoYZw1ITXZDMi3k5IauWPhFjWc+JqgXc/IrJQxhQlshKOHq
 WSgqNw21LChm7PAZ89x8H9psxsaOshdmtPGiTwHQvJKXlNVfbAEtA88Sb+aQoak/eJN0
 fcP9vtJsyoeAkS+jQgMv6QT4sylg3/mlidajn9Ff3Vy8b4FpXlx/nrQEw32IwAz3y+jE
 Hc7i/77g9cGekmHNKHL3lUAsc5sdtn2HxJHWBuoFVcuwpwHNZjSjq+jdUTSk2LMrb/BB xg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xfj6gv322-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 14:59:31 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43FEF9ht021350;
	Mon, 15 Apr 2024 14:59:30 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xg6kk847a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 14:59:30 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43FExRmV17498822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Apr 2024 14:59:29 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 911BE58065;
	Mon, 15 Apr 2024 14:59:27 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 528DF5805E;
	Mon, 15 Apr 2024 14:59:27 +0000 (GMT)
Received: from [9.61.157.174] (unknown [9.61.157.174])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Apr 2024 14:59:27 +0000 (GMT)
Message-ID: <0363badd-f5b0-42bd-bdd5-de6e7b5ee8c6@linux.ibm.com>
Date: Mon, 15 Apr 2024 09:59:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: Update Odyssey SBEFIFO compatible
 strings
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org
References: <20240412144358.204129-1-eajames@linux.ibm.com>
 <20240412144358.204129-4-eajames@linux.ibm.com>
 <5c6f58cc13492988d307504d55cc5d31a512ab8c.camel@codeconstruct.com.au>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <5c6f58cc13492988d307504d55cc5d31a512ab8c.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Mmzb_TfijQ4ZpDE3zFyVGlCbblj5bn5R
X-Proofpoint-ORIG-GUID: Mmzb_TfijQ4ZpDE3zFyVGlCbblj5bn5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_12,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404150097
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, alistair@popple.id.au, jk@ozlabs.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 4/14/24 19:54, Andrew Jeffery wrote:
> On Fri, 2024-04-12 at 09:43 -0500, Eddie James wrote:
>> Set the new compatible string for Odyssey SBEFIFOs so that they
>> don't collect async FFDC.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 64 +++++++++----------
>>   .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi | 64 +++++++++----------
>>   2 files changed, 64 insertions(+), 64 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
>> index 214b2e6a4c6d..3a2bfdf035cb 100644
>> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
>> @@ -2545,7 +2545,7 @@ scom500: scom@1000 {
>>   						};
>>   
>>   						sbefifo500: sbefifo@2400 {
>> -							compatible = "ibm,p9-sbefifo";
>> +							compatible = "ibm,ody-sbefifo";
>>   							reg = <0x2400 0x400>;
>>   							#address-cells = <1>;
>>   							#size-cells = <0>;
>
> Bit of a drive-by comment as I'm not really holding any stakes here,
> but did the hardware actually change?


Yes, the hardware did change in the Odyssey version.

>
> Would it be better to request the behaviour by a property rather than
> changing the compatible?


I'm not sure! In the past devicetree maintainers have objected to 
behavioral type properties, like the FSI scan behavior one...


Thanks for the review!

Eddie


>
> Andrew
