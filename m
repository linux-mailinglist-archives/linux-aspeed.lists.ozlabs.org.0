Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74065811F54
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Dec 2023 20:50:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FaBbWCzk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr5gb0yT4z3cNC
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Dec 2023 06:50:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FaBbWCzk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr5gQ3gCgz3c3n
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Dec 2023 06:50:26 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BDJ7B7j012884;
	Wed, 13 Dec 2023 19:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=L1dGX3bAr3L6MVW5M70dQtsQ2pdKDwOrjjPgZmZ9Nss=;
 b=FaBbWCzkxjdeqtrv+Eyh6JPEdTAC1incrbMiODjMZ5LdIgkOMSg0aM8wu118JoB+uF0g
 yVPGPG92U7Y2OZZmQLpfngXLAZ39HYBmh4u4zWOk7h62WpQyYAQ1zMoviixSGClP7BQh
 tkuvQZ6c3VzW+6D3FPnZ0KGdfe14nsTIGurBgbWGI2gmqi3ItvMApMj0pOYFuVzOqEBw
 6U0HOfxk1PLvGnTTBMCKoeIi1MV2rodl2/wpia1G4XKZ+ddhjOW5GKuwkaQkNcFlnGGq
 w6v9P03ZlrS8zfR6FNRTxwsn7K0dgplQ2nNUHYCVHTCpaa/gK41ekqj5l7nyObynANoE KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyjg30xdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 19:49:26 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BDJmEa8010165;
	Wed, 13 Dec 2023 19:49:25 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyjg30xdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 19:49:25 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BDI0FAI004101;
	Wed, 13 Dec 2023 19:49:24 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw4skk2au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 19:49:24 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BDJnNYp27591270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Dec 2023 19:49:23 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8138F58055;
	Wed, 13 Dec 2023 19:49:23 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FAA45803F;
	Wed, 13 Dec 2023 19:49:22 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Dec 2023 19:49:21 +0000 (GMT)
Message-ID: <edcdcea2-febc-4859-9ccf-b8c59b794f01@linux.ibm.com>
Date: Wed, 13 Dec 2023 13:49:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] ARM: dts: aspeed: System1: PS, sensor and more
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, peterhuewe@gmx.de, jarkko@kernel.org,
        jgg@ziepe.ca, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com, johannes.holland@infineon.com, linux@roeck-us.net,
        broonie@kernel.org
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-9-ninad@linux.ibm.com>
 <5b98538a-8ffe-42ec-b020-514dcfcebba3@linaro.org>
 <44abff4a-0a8e-499b-8b98-a4a1680cb431@linux.ibm.com>
 <427fa99c-764c-4d6a-b9f1-cd9089710d5e@linaro.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <427fa99c-764c-4d6a-b9f1-cd9089710d5e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -lbtKMmRARtMlAJmbObK1QI6-3y3Nw92
X-Proofpoint-GUID: HhWJUytBbixy7UlL0_Fe2zPrr42jTffk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-13_13,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312130141
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
Cc: devicetree@vger.kernel.org, festevam@denx.de, linux-aspeed@lists.ozlabs.org, peteryin.openbmc@gmail.com, alexander.stein@ew.tq-group.com, linux-kernel@vger.kernel.org, naresh.solanki@9elements.com, linux-arm-kernel@lists.infradead.org, lakshmiy@us.ibm.com, bhelgaas@google.com, vincent@vtremblay.dev, linux-integrity@vger.kernel.org, geissonator@yahoo.com, patrick.rudolph@9elements.com, linux-hardening@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Krzysztof,

On 12/13/23 13:37, Krzysztof Kozlowski wrote:
> On 13/12/2023 20:02, Ninad Palsule wrote:
>> Hello Krzysztof,
>>
>> On 12/12/23 14:26, Krzysztof Kozlowski wrote:
>>> On 12/12/2023 17:40, Ninad Palsule wrote:
>>>> This drop adds following devices in the device tree.
>>>> - EEPROM/VPD
>>>> - Power supplies
>>>> - Humidity, pressure and temperature sensors.
>>>> - Trusted platform module(TPM) chip
>>>>
>>>> Tested:
>>>>       This board is tested using the simics simulator.
>>>>
>>>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>>> ---
>>> Don't mix DTS with drivers. DTS and drivers go via different subsystems
>>> and cannot have dependencies, so why DTS is patch #6, then driver #7 and
>>> now again DTS #7?
>> There is a dependency on driver code as patch #8 uses the compatibility
>> string added in driver patch #7.  I have now moved driver patch at the
>> start. Is that ok? OR you are suggesting something else?
> First, there is no dependency. Second, except confusing order anyway DTS
> will go via separate trees. Third, again, there is no dependency. If
> there is, your patchset is broken and this needs to be fixed. Although I
> don't understand how new hardware can depend on driver... it's really odd.

Thanks for the quick response.

This board uses the nuvoton TPM device. The tpm devices uses 
"nuvoton,npct75x" driver hence we added it in the device tree. If the 
driver doesn't have this compatibility string then it won't load. So if 
someone tries to use this board then tpm won't work unless the 
compatibility string is added in the driver. That is the dependency I am 
talking about.

Please let me know.

Regards,

Ninad

>
> Best regards,
> Krzysztof
>
