Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FBB6C361E
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Mar 2023 16:47:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgwvr5vh2z3ccg
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Mar 2023 02:47:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cZTn17Ej;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cZTn17Ej;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgwvk7151z3bjj
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Mar 2023 02:46:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32LEgnAr000634;
	Tue, 21 Mar 2023 15:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mDGXDVU2C3HSFzQ1Pxmq4HXPZhrMWbS2e7aCSFHT8bc=;
 b=cZTn17EjUFI3hfyCfH33B8Af+9MzkjqYW3CE6EA8uhq3GW5gceF4yKFHCQ4Y3K6l/dfe
 W/NKa48kkILB40jorhWVNlkLfgdtqnki2XzUtw7sPDIl6x8yB7X/dxthDn553Okc9txX
 uDoGifHe7QjJIX5mp5cb9u/rH5i5qoMizET4YLm38fKyN4fVJ/oVW9OzrhZDPxNPdczM
 evL3C6f0oXhTDIwl6jPsVQ/q0z6a50lELx8JAHNgpQSQl2aefE7r9wDDTaB5HgASOrlg
 iZB61fgrHrLZ9eosVBZKeUo3jdFHD1f8XzFR5aDYzfejyu9kXNfTOGxUBL+6CCzlpj3r cQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pf3ruhfje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 15:46:46 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32LFUJQa020574;
	Tue, 21 Mar 2023 15:46:45 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x73bfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 15:46:45 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32LFkiHN37093672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Mar 2023 15:46:44 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE9B15805D;
	Tue, 21 Mar 2023 15:46:43 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0AFD58062;
	Tue, 21 Mar 2023 15:46:42 +0000 (GMT)
Received: from [9.160.111.39] (unknown [9.160.111.39])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Mar 2023 15:46:42 +0000 (GMT)
Message-ID: <baf7ad36-0410-3063-7960-8dd7040fb8fd@linux.ibm.com>
Date: Tue, 21 Mar 2023 10:46:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/4] doc: Add Atmel AT30TSE serial eeprom
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20230321151642.461618-1-eajames@linux.ibm.com>
 <20230321151642.461618-3-eajames@linux.ibm.com>
 <6d4cf513-0787-6b39-8d38-30484be7ddff@linaro.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <6d4cf513-0787-6b39-8d38-30484be7ddff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LepCtECvJPy7TmQStdzOD8-FrTSvSg3v
X-Proofpoint-ORIG-GUID: LepCtECvJPy7TmQStdzOD8-FrTSvSg3v
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303210121
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 3/21/23 10:19, Krzysztof Kozlowski wrote:
> On 21/03/2023 16:16, Eddie James wrote:
>> The AT30TSE is compatible with the JEDEC EE1004 standard. Document it
>> as a trivial I2C device.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).


Oops, sorry, will fix.


>
>> ---
>>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>> index 6f482a254a1d..43e26c73a95f 100644
>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>> @@ -47,6 +47,8 @@ properties:
>>             - ams,iaq-core
>>               # i2c serial eeprom (24cxx)
>>             - at,24c08
>> +            # i2c serial eeprom (EE1004 standard)
> AT30TSE?
>
>> +          - atmel,at30tse
> Microchip does not find anything on AT30TSE. Are you sure this is the
> model name?


Yes: 
https://www.microchip.com/content/dam/mchp/documents/OTH/ProductDocuments/DataSheets/Atmel-8868-DTS-AT30TSE004A-Datasheet.pdf


Maybe it's actually an 8868? Or should I include the 004A as well?

Thanks,

Eddie


>
>
> Best regards,
> Krzysztof
>
