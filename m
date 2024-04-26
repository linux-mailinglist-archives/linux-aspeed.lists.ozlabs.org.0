Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA568B3B0A
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 17:20:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sAX5Rpaa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQxHP3znjz3cY7
	for <lists+linux-aspeed@lfdr.de>; Sat, 27 Apr 2024 01:20:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sAX5Rpaa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQxHF3394z3cXN;
	Sat, 27 Apr 2024 01:20:08 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QEgQLJ009060;
	Fri, 26 Apr 2024 15:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=utQii5TuFLrp0kELhAiJGIrBnqewjCxQxZOgbabUCLI=;
 b=sAX5RpaaqtSj8wgzes85BYXLOnsRtLd9DtPQ54UpNlYU6p3tSiMCJjn/ncwlHBqD0mUw
 41t6x6sSiId5TurENEt8kxEhmAeoenBQnEBPEsKrWGzdpj2nPdMMeDJdJQfxdTq5NW6w
 kz9yLSFQNjMSVvcJ0pOGSxtF4WDQ1yWsbPjMb/unN3PDqBseSRNn8yo3Q/+v+QGnsWTe
 DVPzjgujVPdM+C8TgnDL307gIJUj3HyZmpQa+rMSBf0WlqUXxdG3zqySt7dZk71zUuW2
 pvZhER9XhglBTDFDxvmdB2VLkX5esuIz5r3143XinIeESuXY1uGpE0tZxvNqughD1vKA aw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xre90g2nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:19:58 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QDXZvk015302;
	Fri, 26 Apr 2024 15:19:57 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xmshmr9q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:19:57 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QFJsL746727488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 15:19:56 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC17358061;
	Fri, 26 Apr 2024 15:19:54 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61C3E58055;
	Fri, 26 Apr 2024 15:19:54 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 15:19:54 +0000 (GMT)
Message-ID: <8d5cca29-2b4d-40a7-a7dd-c3eff625af95@linux.ibm.com>
Date: Fri, 26 Apr 2024 10:19:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] dt-bindings: fsi: Document the FSI Hub
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-10-eajames@linux.ibm.com>
 <91d5683b-17a2-466c-ab3d-baf216c97fa3@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <91d5683b-17a2-466c-ab3d-baf216c97fa3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j3tQV2O3SV-XuNVzH1E2PY3aKEc1M6if
X-Proofpoint-ORIG-GUID: j3tQV2O3SV-XuNVzH1E2PY3aKEc1M6if
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260103
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


On 4/26/24 01:26, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> Document the FSI Hub Controller CFAM engine.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../bindings/fsi/ibm,hub-fsi-controller.yaml  | 44 +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml b/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
>> new file mode 100644
>> index 000000000000..d96d777d4d9f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/fsi/ibm,hub-fsi-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: IBM FSI-attached FSI Hub Controller
>> +
>> +maintainers:
>> +  - Eddie James <eajames@linux.ibm.com>
>> +
>> +description: |
> Do not need '|' unless you need to preserve formatting.


Ack.


>
>> +  The FSI Hub Controller is an FSI controller, providing a number of FSI links,
>> +  located on a CFAM. Therefore this node will always be a child of an FSI CFAM
>> +  node.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ibm,hub-fsi-controller
> Again, is it for specific chip? SoC? Aren't you using generic
> compatibles (not allowed)?


This one is fairly universally supported on FSI (any POWER chip will 
have it) so I didn't add a specific chip... Should i? Do you mean 
generic compatibles are not allowed? How generic do you mean?


>
>
>
> Best regards,
> Krzysztof
>
