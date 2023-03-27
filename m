Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F476CAE0F
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Mar 2023 21:02:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlhyH6K3sz3fFD
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Mar 2023 06:02:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ebe+wLCb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ebe+wLCb;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Plhy64sgpz3cdn
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Mar 2023 06:02:06 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RHuJNr030758;
	Mon, 27 Mar 2023 19:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=fcRMmpHYtxnemVock2fj1N7kRtm6iRUFjEOHQeXSKqg=;
 b=ebe+wLCbAUs5BpvRWX7R2XLnpe8c4ddFFWA6N6p0TziWVZknuE5fP21LCJF0R6V6IZuX
 CNUIM1vg27guQyp8XeBJkEKIDV7Ron92qm+VuTxW2QJNsaSt0k/zz9n6BhJfeCCsRMFl
 788C/tCA5MDlAzGx1YsWWPwrQbDaxXJbHQ4fr47deCa4r9MAYpmUhYPgy0Nkq24iolDi
 Q29WlKy2FruQrvyWnWKyHCVjhFzV1DiNgK2M6wBUjysU17d+nz+Ctif2ZLZQ2e8wVD90
 xo7INkCmB9SkB9N0yDsT80bm9tpGI1wpvKFH554vr/BWCt5hq4vcWZpfCGjmZ8rg4A3c CQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkfyvhevs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 19:01:56 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RHXeZ1032115;
	Mon, 27 Mar 2023 19:01:55 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3phrk74pjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 19:01:55 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32RJ1sKc15139408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Mar 2023 19:01:54 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C7BF58055;
	Mon, 27 Mar 2023 19:01:54 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BACC058043;
	Mon, 27 Mar 2023 19:01:53 +0000 (GMT)
Received: from [9.65.211.237] (unknown [9.65.211.237])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Mar 2023 19:01:53 +0000 (GMT)
Message-ID: <f99a2e40-abd0-699e-d764-0351bd0b2ff5@linux.ibm.com>
Date: Mon, 27 Mar 2023 14:01:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/4] doc: Add Atmel AT30TSE serial eeprom
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230321151642.461618-1-eajames@linux.ibm.com>
 <20230321151642.461618-3-eajames@linux.ibm.com>
 <6d4cf513-0787-6b39-8d38-30484be7ddff@linaro.org>
 <baf7ad36-0410-3063-7960-8dd7040fb8fd@linux.ibm.com>
 <5993d93e-f57b-51aa-85a3-f58ca0cf846d@linux.ibm.com>
 <20230327151802.GA3485600-robh@kernel.org>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20230327151802.GA3485600-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e5URi3DU3HIyHNCfg0CU-597uFbpicow
X-Proofpoint-ORIG-GUID: e5URi3DU3HIyHNCfg0CU-597uFbpicow
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 clxscore=1011 spamscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270152
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 3/27/23 10:18, Rob Herring wrote:
> On Tue, Mar 21, 2023 at 10:55:43AM -0500, Eddie James wrote:
>> On 3/21/23 10:46, Eddie James wrote:
>>> On 3/21/23 10:19, Krzysztof Kozlowski wrote:
>>>> On 21/03/2023 16:16, Eddie James wrote:
>>>>> The AT30TSE is compatible with the JEDEC EE1004 standard. Document it
>>>>> as a trivial I2C device.
>>>>>
>>>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>>> Use subject prefixes matching the subsystem (which you can get for
>>>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>>>> your patch is touching).
>>>
>>> Oops, sorry, will fix.
>>>
>>>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/trivial-devices.yaml
>>>>> b/Documentation/devicetree/bindings/trivial-devices.yaml
>>>>> index 6f482a254a1d..43e26c73a95f 100644
>>>>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>>>>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>>>>> @@ -47,6 +47,8 @@ properties:
>>>>>              - ams,iaq-core
>>>>>                # i2c serial eeprom (24cxx)
>>>>>              - at,24c08
>>>>> +            # i2c serial eeprom (EE1004 standard)
>>>> AT30TSE?
>>>>
>>>>> +          - atmel,at30tse
>>>> Microchip does not find anything on AT30TSE. Are you sure this is the
>>>> model name?
>>>
>>> Yes: https://www.microchip.com/content/dam/mchp/documents/OTH/ProductDocuments/DataSheets/Atmel-8868-DTS-AT30TSE004A-Datasheet.pdf
>>>
>>>
>>> Maybe it's actually an 8868? Or should I include the 004A as well?
>>
>> I found some other AT30TSE (AT30TSE752A for example) devices that do not
>> appear compatible with the EE1004 standard, so I will include the full model
>> number.
> If this standard is sufficiently complete, then you might want a EE1004
> fallback compatible. Complete would mean power supply(ies) and any extra
> i/o are defined and the exact device model is discoverable.


I don't think this standard would meet those requirements unfortunately. 
Thanks for the suggestion!

Eddie


>
> Rob
