Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A08B3ABD
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 17:11:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GxKqIl59;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQx5c3J07z3cYX
	for <lists+linux-aspeed@lfdr.de>; Sat, 27 Apr 2024 01:11:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GxKqIl59;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQx5V6Vgtz3cXN;
	Sat, 27 Apr 2024 01:11:42 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QEr3cr031064;
	Fri, 26 Apr 2024 15:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zRBIwAPAL+cFzrLs8kcZnJLFFzHi09/DD3jt4IFcYxk=;
 b=GxKqIl59F8+YXpzyxtkjg4kZPL6QanrCC4RbNGjNm7w3r5+fHmfY7a123qnFQ7ulVfL2
 28RfyJzfGlcwxX5bIOQ9s2fYgoP+Li2hQ15E0AfqZHCgpMlmmpWP0xnd+E9E7WktbPqH
 V/xOcJ0cxzs37/Yc0vQYV1GHBrTY4b7uwkhREDYn87veRl6Lj84sM3RDs6+GMwEZxHzl
 1nvY7Ch7HuCFHiLIxGIY7HOibIMVblcNdrJeQeE8iIBK8wk5vuW3y3mO5xUk5hfrOA4a
 kvL21c4m61p8Y8viwn2Q/ni2juF3XZOKGUD4yDkYX/ZQhWUqS+Y8ZQB3HOEO5TDjHInU 3Q== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xredf81nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:11:33 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QF1dc3020915;
	Fri, 26 Apr 2024 15:11:31 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xmre0ghg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:11:31 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QFBTnY55509488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 15:11:31 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E0C458066;
	Fri, 26 Apr 2024 15:11:29 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCADF58059;
	Fri, 26 Apr 2024 15:11:28 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 15:11:28 +0000 (GMT)
Message-ID: <0a9abf57-1d74-4abc-9ba8-3c78520ef7fa@linux.ibm.com>
Date: Fri, 26 Apr 2024 10:11:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] dt-bindings: fsi: Document the FSI controller
 common properties
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-7-eajames@linux.ibm.com>
 <3f381a54-49ce-4a45-a960-00cf2e91b044@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <3f381a54-49ce-4a45-a960-00cf2e91b044@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Wh6j9THx8PEfcfi5TZLe7XpfTgYP1Kvs
X-Proofpoint-GUID: Wh6j9THx8PEfcfi5TZLe7XpfTgYP1Kvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404260102
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


On 4/26/24 01:23, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> Since there are multiple FSI controllers documented, the common
>> properties should be documented separately and then referenced
>> from the specific controller documentation.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>
>> +
>> +  no-scan-on-init:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description:
>> +      The FSI controller cannot scan the bus during initialization.
>> +
>> +patternProperties:
>> +  "cfam@[0-9a-f],[0-9a-f]":
>> +    type: object
>> +    properties:
>> +      chip-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
> Missing description


Ack'd, and comments below


>
>> +
>> +      reg:
>> +        maxItems: 1
>> +
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 1
>> +
>> +    required:
>> +      - reg
>> +
>> +    additionalProperties: true> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    fsi@3400 {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        compatible = "fsi-controller";
> No, there is no such compatible here.
>
>> +        reg = <0x3400 0x400>;
> Neither reg.
>
> Also, keep order of properties matching DTS coding style.
>
>
> Best regards,
> Krzysztof
>
