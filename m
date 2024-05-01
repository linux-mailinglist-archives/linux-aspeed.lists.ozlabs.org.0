Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F048B8D9F
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 18:04:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FVHDf1Mx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VV21X0kR7z3cWX
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2024 02:04:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FVHDf1Mx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VV21N5vr6z3cBK;
	Thu,  2 May 2024 02:03:52 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441G1Cfd031425;
	Wed, 1 May 2024 16:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2QcX4Wal+FwHEdj1HqqU82UN7oqS7WyWkek8eeHf/5s=;
 b=FVHDf1MxBERiVku3sF/BWE47hZIpDQ4l9FGCuhX6c8e7Z2E/hD+d05WmVj6qlzzZJoPf
 wG0vpOj152I1PwRfmfAce15v42GIZSRgMrpepp5HQknl66H2ZviclmsgUPFklPvFz4Lr
 6BKT6zeoq8sZ6FBl1HFDPJtSGk+994MI6nKRGYtkUCVmlGZKAx77bMBmzfFIF7EZtBzK
 Rkk4hsTqj7KX/Oo6tZg6HPxjsCLSa+QBOB/XM8mUWaL8N0qYSwthbDP1FsBZvkiKeJ3T
 TgpXGOi9cIQN5I3+4Tz2eXu3ZjjtCZVPl+Thmy5uNHrr5d70Q6PbW4TeOx3oAW35fmp4 1Q== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xurcwr25c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 16:03:35 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 441EQQ0X015530;
	Wed, 1 May 2024 16:03:34 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsed32twx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 16:03:34 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 441G3WHZ26870398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 May 2024 16:03:34 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 367B958062;
	Wed,  1 May 2024 16:03:32 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A03565805D;
	Wed,  1 May 2024 16:03:31 +0000 (GMT)
Received: from [9.61.151.254] (unknown [9.61.151.254])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 May 2024 16:03:31 +0000 (GMT)
Message-ID: <4fd58344-d9fa-49c5-a89c-a0ebc11f3ac3@linux.ibm.com>
Date: Wed, 1 May 2024 11:03:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/17] dt-bindings: fsi: Document the IBM SBEFIFO
 engine
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
References: <20240429210131.373487-1-eajames@linux.ibm.com>
 <20240429210131.373487-6-eajames@linux.ibm.com>
 <b89bb761-49dc-4e76-9b80-c45e2b7e7638@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <b89bb761-49dc-4e76-9b80-c45e2b7e7638@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v4kroMnRGSL7KiMr3zpNLxq23W_DYXW4
X-Proofpoint-ORIG-GUID: v4kroMnRGSL7KiMr3zpNLxq23W_DYXW4
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010114
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


On 4/30/24 01:54, Krzysztof Kozlowski wrote:
> On 29/04/2024 23:01, Eddie James wrote:
>> The SBEFIFO engine provides an interface to the POWER processor
>> Self Boot Engine (SBE).
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>> ---
>> Changes since v3:
>>   - Drop occ unit address
>>
>>   .../bindings/fsi/ibm,p9-sbefifo.yaml          | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
>> new file mode 100644
>> index 000000000000..24903829fca1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: IBM FSI-attached SBEFIFO engine
>> +
>> +maintainers:
>> +  - Eddie James <eajames@linux.ibm.com>
>> +
>> +description:
>> +  The SBEFIFO is an FSI CFAM engine that provides an interface to the
>> +  POWER processor Self Boot Engine (SBE). This node will always be a child
>> +  of an FSI CFAM node.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ibm,p9-sbefifo
>> +      - ibm,odyssey-sbefifo
>> +
>> +  reg:
>> +    items:
>> +      - description: FSI slave address
>> +
>> +patternProperties:
>> +  "^occ":
> Same questions as patch #4.
>
>> +    type: object
>> +    $ref: ibm,p9-occ.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    fsi-slave-engine@2400 {
>> +        compatible = "ibm,p9-sbefifo";
>> +        reg = <0x2400 0x400>;
>> +
>> +        occ {
>> +            compatible = "ibm,p9-occ";
>> +
>> +            hwmon {
>> +                compatible = "ibm,p9-occ-hwmon";
> Three nodes which should be just one node.


The other two are already documented... The SBEFIFO should have 
documented a long time ago, and designed accordingly. However keep in 
mind, the OCC nodes are optional on SBEFIFOs, since the Odyssey chip 
SBEFIFOs are not connected to OCCs.


Thanks for your detailed review.

Eddie


>
> Best regards,
> Krzysztof
>
