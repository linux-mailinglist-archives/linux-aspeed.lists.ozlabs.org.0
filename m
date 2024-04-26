Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1170B8B3A8F
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 17:06:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nmqhAV/P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQwzG55Gkz3cYY
	for <lists+linux-aspeed@lfdr.de>; Sat, 27 Apr 2024 01:06:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nmqhAV/P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQwz73wcwz3cXM;
	Sat, 27 Apr 2024 01:06:11 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QEXWnw016777;
	Fri, 26 Apr 2024 15:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WnUX2Z5Q2AQL2X6jPId7AFgMZYeR6hgmEY/9JkQ7CVg=;
 b=nmqhAV/PHcXwEy+h5lMiVaj1kItNRcDFJmmsGrUoUbw1sqR0LUKyKzHIZGYHYuH+qAIf
 z08LHU5ZlohqnVZPfmuQ5B/j/9M4rhl2qb0POAK8bxGyO+prWoCCNgtXc9A07qc6GIEP
 FtGKDuJQ6HByp0TKjhdiW2edr6uR0rYqvMfM1uMTNIk1TlhcDvy+KcnXom8eqk0cC+Oo
 htDIfIz5+44QoaQc35MO3Xz1DBvM2s8PtNlanF1OdTTL/HsYofNvwJs5ovRmJz6+6cki
 3F4ewwPuR90pxOSlWvn+XcgcLf48f5POBn5xjY0nCzfznD5MTqQiELmd3KfIMquSzT+g lg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xre4n02jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:05:53 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QDXZrQ015302;
	Fri, 26 Apr 2024 15:05:53 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xmshmr7sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:05:53 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QF5ouO24576714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 15:05:52 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81EFD58063;
	Fri, 26 Apr 2024 15:05:50 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CD6558059;
	Fri, 26 Apr 2024 15:05:50 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 15:05:50 +0000 (GMT)
Message-ID: <9a480ab1-242f-4577-bb86-4fe5f4434c26@linux.ibm.com>
Date: Fri, 26 Apr 2024 10:05:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] dt-bindings: fsi: p9-occ: Switch to yaml format
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-5-eajames@linux.ibm.com>
 <d5e79c40-d961-43a9-ad4c-ebed17dfe814@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <d5e79c40-d961-43a9-ad4c-ebed17dfe814@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VcgvxGfqkhkUcQqZ1JVD4bk_DpaK8QVQ
X-Proofpoint-ORIG-GUID: VcgvxGfqkhkUcQqZ1JVD4bk_DpaK8QVQ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260101
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


On 4/26/24 01:19, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> Switch to yaml for the OCC documentation. Also document the fact
>> that the OCC "bridge" device will often have the hwmon node as a
>> child.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../devicetree/bindings/fsi/ibm,p9-occ.txt    | 16 --------
>>   .../devicetree/bindings/fsi/ibm,p9-occ.yaml   | 41 +++++++++++++++++++
>>   2 files changed, 41 insertions(+), 16 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>> deleted file mode 100644
>> index e73358075a90..000000000000
>> --- a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -Device-tree bindings for FSI-attached POWER9/POWER10 On-Chip Controller (OCC)
>> ------------------------------------------------------------------------------
>> -
>> -This is the binding for the P9 or P10 On-Chip Controller accessed over FSI from
>> -a service processor. See fsi.txt for details on bindings for FSI slave and CFAM
>> -nodes. The OCC is not an FSI slave device itself, rather it is accessed
>> -through the SBE FIFO.
>> -
>> -Required properties:
>> - - compatible = "ibm,p9-occ" or "ibm,p10-occ"
>> -
>> -Examples:
>> -
>> -    occ {
>> -        compatible = "ibm,p9-occ";
>> -    };
>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
>> new file mode 100644
>> index 000000000000..1fa87d452489
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: IBM FSI-attached On-Chip Controller (OCC)
>> +
>> +maintainers:
>> +  - Eddie James <eajames@linux.ibm.com>
>> +
>> +description:
>> +  The POWER processor On-Chip Controller (OCC) helps manage power and
>> +  thermals for the system, accessed through the FSI-attached SBEFIFO
>> +  from a service processor.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ibm,p9-occ
>> +      - ibm,p10-occ
>> +
>> +  reg:
>> +    items:
>> +      - description: Processor index
>> +
>> +required:
>> +  - compatible
> required goes after all properties, so below.


Ack.


>
>> +
>> +patternProperties:
>> +  "^occ-hwmon(@.*)?":
>> +    type: object
>> +    $ref: /schemas/hwmon/ibm,occ-hwmon.yaml
> Drop occ, not relevant. Why unit address is optional? This is supposed
> to be specific. Use proper regex as well for hex numbers.


Well, there isn't really any concept of address here, it's a 1-to-1 
relationship. I should just drop the unit address.


>
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    occ {
>> +        compatible = "ibm,p9-occ";
> Not complete.


Ack.


>
>
> Best regards,
> Krzysztof
>
