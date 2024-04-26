Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8358B3AB1
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 17:09:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sCM1FXj8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQx3R5GhPz3cYQ
	for <lists+linux-aspeed@lfdr.de>; Sat, 27 Apr 2024 01:09:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sCM1FXj8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQx3L0qbFz3cXM;
	Sat, 27 Apr 2024 01:09:49 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QDp3wQ000596;
	Fri, 26 Apr 2024 15:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XQj/Ylfb4d6YBPhBaIsZnSkNdqe2sNrsfE8wIOzq64w=;
 b=sCM1FXj8xNtQFbAO2YQ9CvtF/vZPcH3UNASfAScc9zjWuvKSW2zksWdA9oZ8yWOPj5SX
 omt4Aj6CZ/oqfcR4YYVapOC8LdiUajKe7e/cP1w+GCyE0qTxCblyGViJyTFzDYT6RJDv
 BNilwSEjqrYa0x5mdfSSSmDzYRm1HvMH/L4eWcIrZvk5rkS2Y9Djuh2EkSaerN/4FXjw
 WY1MQxykhi9vz5xwENLjjZX0L4CtRnF/EPjERVN1blJkNoBUNXCxPURhdjpvasJcw712
 M2CjQGNqUj1Gm6oyLjexbiMMQGMZh6t4h2skF1VUB9+UGd93JeG0slBRWmUonLjGN9CG Eg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xrdad07q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:09:39 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QCrdga023042;
	Fri, 26 Apr 2024 15:09:37 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xms1pgcph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 15:09:37 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QF9Zmv1835548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 15:09:37 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F48D58061;
	Fri, 26 Apr 2024 15:09:35 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD9E95805F;
	Fri, 26 Apr 2024 15:09:34 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 15:09:34 +0000 (GMT)
Message-ID: <47c8fd94-6137-4d84-99a9-e8ff86c6dc31@linux.ibm.com>
Date: Fri, 26 Apr 2024 10:09:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] dt-bindings: fsi: Document the IBM SBEFIFO
 engine
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-6-eajames@linux.ibm.com>
 <5fb62fcf-36a8-4efa-9387-d0af8fcafb18@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <5fb62fcf-36a8-4efa-9387-d0af8fcafb18@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BJC-K6KR8dZCpa4l5BU-e4YHq2kWKUgP
X-Proofpoint-ORIG-GUID: BJC-K6KR8dZCpa4l5BU-e4YHq2kWKUgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260102
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


On 4/26/24 01:20, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> The SBEFIFO engine provides an interface to the POWER processor
>> Self Boot Engine (SBE).
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>> ---
>
>> +description:
>> +  The SBEFIFO is an FSI CFAM engine that provides an interface to the
>> +  POWER processor Self Boot Engine (SBE). This node will always be a child
>> +  of an FSI CFAM node; see fsi.txt for details on FSI slave and CFAM
>> +  nodes.
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
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^occ(@.*)?":
> Why unit address is optional?


In this case, it's because we use the reg property (reflecting the unit 
address) to indicate the processor index of the occ node. However I 
think I should drop the unit address here, it's meaningless, there is no 
addressing for the OCC from the SBEFIFO.


>
>
>
> Best regards,
> Krzysztof
>
