Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7206F8B5BA5
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2024 16:43:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=STnWuWUU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSmK15k9Bz3cX6
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2024 00:43:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=STnWuWUU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSmJs1GNXz3cWd;
	Tue, 30 Apr 2024 00:42:52 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TEYbr9017709;
	Mon, 29 Apr 2024 14:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KsgaaWZjUoPvRT7MHUei3sSgzKUYUw0c2nrME3+cT3U=;
 b=STnWuWUUPf0WzfcsznuMgr5RlsfijUfQGZtsBA7DDNg/l8HfQwJDrmN8Q1nFgl0xCELx
 +aluLamydwQc7H6W6hXr/WNJVuzsG3GReWJ3w1uY2kf6LL+pQC7onfHbKD142j3p2M1v
 xLjBDz1sfIKcqLoYwvciqApFgfMFJHeqovUsxTenVRjud6TZmCNGw6PbYlPo7y2xZ8xh
 2U+xxfenNwoLRyjuy+P8GZ1rGBgHOp6wyO7u5h+UoTSP2AZEqidW4tWfqrIyHYGsPb50
 nn1CLkE65M6PRw9nNXmMsKlF3Y4bHop84JP91gGLd1UkAQI46V4Kf9mqvtOSIm0GW2RX MA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtd9s82eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 14:42:35 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TBxD7W003000;
	Mon, 29 Apr 2024 14:42:35 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xscpp7tb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 14:42:35 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TEgWNU21168868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 14:42:34 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2ACB5806A;
	Mon, 29 Apr 2024 14:42:32 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ACF35805F;
	Mon, 29 Apr 2024 14:42:32 +0000 (GMT)
Received: from [9.61.151.254] (unknown [9.61.151.254])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 14:42:32 +0000 (GMT)
Message-ID: <f1fcb3d6-fa7e-46fa-b606-dbbcda713202@linux.ibm.com>
Date: Mon, 29 Apr 2024 09:42:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] dt-bindings: fsi: Document the FSI2PIB engine
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-4-eajames@linux.ibm.com>
 <3f822b56-8e6a-43e4-afb0-15c964f9474e@kernel.org>
 <b89d39d2-ec54-4a88-aee5-7b5c95b3fca7@linux.ibm.com>
 <5ef318a3-7fc9-47e8-9944-07365c9e377f@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <5ef318a3-7fc9-47e8-9944-07365c9e377f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KGTh5c-dVKitJrYzjKOHBaxWJR5cNBf4
X-Proofpoint-ORIG-GUID: KGTh5c-dVKitJrYzjKOHBaxWJR5cNBf4
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_12,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290092
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 4/28/24 11:41, Krzysztof Kozlowski wrote:
> On 26/04/2024 17:00, Eddie James wrote:
>> On 4/26/24 01:18, Krzysztof Kozlowski wrote:
>>> On 25/04/2024 23:36, Eddie James wrote:
>>>> The FSI2PIB or SCOM engine provides an interface to the POWER processor
>>>> PIB (Pervasive Interconnect Bus).
>>>>
>>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>>> ---
>>>>    .../devicetree/bindings/fsi/ibm,fsi2pib.yaml  | 38 +++++++++++++++++++
>>>>    1 file changed, 38 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml b/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>>>> new file mode 100644
>>>> index 000000000000..4d557150c2e3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>>>> @@ -0,0 +1,38 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/fsi/ibm,fsi2pib.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: IBM FSI-attached SCOM engine
>>>> +
>>>> +maintainers:
>>>> +  - Eddie James <eajames@linux.ibm.com>
>>>> +
>>>> +description:
>>>> +  The SCOM engine is an interface to the POWER processor PIB (Pervasive
>>>> +  Interconnect Bus). This node will always be a child of an FSI CFAM node;
>>>> +  see fsi.txt for details on FSI slave and CFAM nodes.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - ibm,fsi2pib
>>>> +      - ibm,i2cr-scom
>>> Sometimes you call these p9, sometimes p10... what is the system or SoC
>>> here? Aren't you adding some generic compatibles? writing-bindings and
>>> numerous guides are clear on that.
>>
>> Open source FSI support started with P9 chips so we initially added
>> p9-sbefifo, p9-occ, etc. P10 has all of the same engines as P9 plus the
>> SPI controller, so that's why SPI is p10-spi. P11 has the same engines
>> as P10. For scom/fsi2pib we could call it p9-scom I suppose... This
>> series isn't just documentation for a new system, I'm adding
>> documentation that should have been added for P9. Anyway I'm not sure
>> what you mean about generic compatibles? You mean just add a "scom" or
>> "fsi2pib" compatible? writing-bindings says "DO make 'compatible'
>> properties specific"
> Usually it means that parts of SoC must have the name of the SoC, as
> first component of the name. Your boards are a bit different here,
> because I suppose no one will ever make a product except you, but still
> code could follow same set of rules.


OK, this wasn't mentioned when fsi2spi binding was merged, and I thought 
to make fsi2pib the same. I can switch to p9-scom or something.


Thanks,

Eddie



>
> Best regards,
> Krzysztof
>
