Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0E48B8DDF
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 18:16:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UUaKwAFx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VV2JD0LRMz3cW0
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2024 02:16:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UUaKwAFx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VV2J46Dy1z30gp;
	Thu,  2 May 2024 02:16:36 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441G2un5023227;
	Wed, 1 May 2024 16:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NM4/8DaUxtVSAIyf/fOq/KNgwSvzlVsklV7Nr1aa6wU=;
 b=UUaKwAFx4L4QqbKahih6OStMrTy/G1XdHrJdfUAxIOjW7caiVZh1KCUCxB2xmbU8U8f9
 8d7hftIsUG3ua/IdyDG4vib3QQ5xT2J4Xb7JrJazsbj/APPRiI6t64LXmFVWMPHc5pAo
 gl/rYTr4zUF+Kz5HkZnAk7QRYG0x1SKoS54fXgExgrIeKpYFhbyj39W+fD3vd8EKmBw5
 Jkqs7r1lYzUpxupKgxGM+jysCOoeQinCOQEN/ytSPdiD691gdW+tJtQFum/7rfY223cC
 wT4JXzfVYLcBLlLlJTeaFcwUNIhkxVxpChTuIoJsnCNBA3Za9RX9LYsvBA8+othistUN Ng== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xurwf80wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 16:16:27 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 441E8Lif011759;
	Wed, 1 May 2024 16:16:26 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsdwmb11s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 16:16:26 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 441GGNxA32965134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 May 2024 16:16:25 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FD0458061;
	Wed,  1 May 2024 16:16:23 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F0A658058;
	Wed,  1 May 2024 16:16:22 +0000 (GMT)
Received: from [9.61.151.254] (unknown [9.61.151.254])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 May 2024 16:16:22 +0000 (GMT)
Message-ID: <1ebaaa48-9812-467e-9189-c1cd3369b6cb@linux.ibm.com>
Date: Wed, 1 May 2024 11:16:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/17] dt-bindings: i2c: i2c-fsi: Convert to
 json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
References: <20240429210131.373487-1-eajames@linux.ibm.com>
 <20240429210131.373487-11-eajames@linux.ibm.com>
 <bbf12675-e0f5-4150-96d1-097eb7abd81a@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <bbf12675-e0f5-4150-96d1-097eb7abd81a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2Qw7KSI9PqFtb6VMwdVxjBsB-eu-Ox6i
X-Proofpoint-ORIG-GUID: 2Qw7KSI9PqFtb6VMwdVxjBsB-eu-Ox6i
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2405010115
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 4/30/24 02:35, Krzysztof Kozlowski wrote:
> On 29/04/2024 23:01, Eddie James wrote:
>> Convert to json-schema for the FSI-attached I2C controller.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>> Changes since v3:
>>   - Update MAINTAINERS
>>   - Change commit message to match similar commits
>>
>>   .../devicetree/bindings/i2c/i2c-fsi.txt       | 40 -------------
>>   .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  | 58 +++++++++++++++++++
>
> Please split independent patches to separate patchsets, so they can be
> reviewed and picked up by respective maintainers.
>
> I don't see any dependency here. Neither in 1st patch.


OK, I guess that makes it complicated for Andrew to pull together with 
the device tree changes in a way that avoids warnings, but I agree there 
is no direct dependency.


>
>
>>   MAINTAINERS                                   |  2 +-
>>   3 files changed, 59 insertions(+), 41 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
>>   create mode 100644 Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
>>
> ...
>
>> diff --git a/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml b/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
>> new file mode 100644
>> index 000000000000..8ff5585a3aa5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/ibm,i2c-fsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: IBM FSI-attached I2C controller
>> +
>> +maintainers:
>> +  - Eddie James <eajames@linux.ibm.com>
>> +
>> +description:
>> +  This I2C controller is an FSI CFAM engine, providing access to a number of
>> +  I2C busses. Therefore this node will always be a child of an FSI CFAM node.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ibm,i2c-fsi
>> +
>> +  reg:
>> +    items:
>> +      - description: FSI slave address
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c@1800 {
>> +        compatible = "ibm,i2c-fsi";
>> +        reg = <0x1800 0x400>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        i2c-bus@0 {
>> +            reg = <0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
> This does not look right. Why do you have multiple i2c-bus children? I
> do not think i2c-controller.yaml schema allows this.


It does seem to allow it, as this validates here and in the device tree. 
It is this way because the I2C controller provides multiple busses. 
Should I change it so to add "bus" pattern properties that reference 
i2c-controller.yaml?


Thanks,

Eddie


>
> Best regards,
> Krzysztof
>
