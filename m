Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F3945077
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:25:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m64DJuSJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZZ7W2XZtz3dTm
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:25:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m64DJuSJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZZ7P5Jx0z30YZ
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:25:05 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471FJaMe020856;
	Thu, 1 Aug 2024 16:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=v
	4CcbqHLngoW1/Jmw+QAuAQqicEbMgOfe5K/pVdvfXU=; b=m64DJuSJvPtDkz65H
	9tbpCeA2W3muOJaendKzGTLTGUPrsH7ZNm0OtB+YYO2AS+uIkCR4wGOj5Jzp4pTW
	dsG9FckjMGar9BX86jgpNsA4YkRmhi7wDKycMwGnhivcSaNdiuZ+S8iq8p6G3RLq
	pYVFaK3thrO8socPxLoCE9EJHPjqeEGDSvNiEKdipXg0sf11FZyL88qipxc9QVuT
	CGPs84/esRIdrIC+6oQdmIqp8YIRE66BR5gy1R515ChgH0kgqp0TrKbIQXwH/qNn
	H/WQ86iKFmn5kmZH6enVRo9F87vRTAzTEpopKWCiHWWu0o3nE9Oex1Nw9Jc/SqRL
	xaT+A==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40rc5dg9te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 16:24:52 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 471Fpnqt009176;
	Thu, 1 Aug 2024 16:24:51 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 40ndx3aev2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 16:24:51 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 471GOmWg44171948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Aug 2024 16:24:51 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B775358059;
	Thu,  1 Aug 2024 16:24:48 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4D955805B;
	Thu,  1 Aug 2024 16:24:47 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Aug 2024 16:24:47 +0000 (GMT)
Message-ID: <4d5b8958-2d33-42df-ac97-82bb63fdff38@linux.ibm.com>
Date: Thu, 1 Aug 2024 11:24:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] ARM: dts: aspeed: system1: IBM System1 BMC update
To: "Rob Herring (Arm)" <robh@kernel.org>
References: <20240731214737.986010-1-ninad@linux.ibm.com>
 <172252600790.120672.12772438670145461296.robh@kernel.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <172252600790.120672.12772438670145461296.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q0X4F6LpRLN63_GgOY9djDZjxvrzNu0Z
X-Proofpoint-ORIG-GUID: q0X4F6LpRLN63_GgOY9djDZjxvrzNu0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_14,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010104
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, robh+dt@kernel.org, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Rob,

On 8/1/24 10:29, Rob Herring (Arm) wrote:
> On Wed, 31 Jul 2024 16:47:28 -0500, Ninad Palsule wrote:
>> Hello,
>>
>> This patch only applies to openbmc/linux. The max31785 pmbus driver
>> changes are not available in the upstream yet. I will try to send those
>> changes upstream.
>>
>> Ninad Palsule (1):
>>    ARM: dts: aspeed: system1: IBM System1 BMC update
>>
>>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 96 +++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>
>> --
>> 2.43.0
>>
>>
>>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>    pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-system1.dtb' for 20240731214737.986010-1-ninad@linux.ibm.com:
>
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@52/fan@4: failed to match any schema with compatible: ['pmbus-fan']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@54/fan@0: failed to match any schema with compatible: ['pmbus-fan']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a000/i2c@380/fan-controller@54/fan@1: failed to match any schema with compatible: ['pmbus-fan']
>
I have seen these warning. I am not sure how to fix them as it is 
already documented in the following file.

Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt

May be because its not converted to YAML yet?

Thanks & Rehads,

Ninad Palsule

