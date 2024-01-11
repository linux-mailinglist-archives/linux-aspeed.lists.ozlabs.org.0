Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3E82B574
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jan 2024 20:51:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F2NOUJ1I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9wJf6Xryz3cQD
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jan 2024 06:50:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F2NOUJ1I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9wJY6k7cz3bp1
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jan 2024 06:50:53 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40BJf4qh020558;
	Thu, 11 Jan 2024 19:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=m/WaWO4axy/JtRTQr7uYXMu/rUmUqtk8HnB0BQW4Frs=;
 b=F2NOUJ1IKJ1mN0+QQlt6IuYNqWMxpMi4miGI+IkcsxMJyUCO2ULkRNLcFg1Kz5LJEN3j
 uHKDDPEZkkgE2IRBHvFzVNB+Jvc25hWY8AXfim/mV5mxQJvfKpzlt36xHEB5ya+D3s6L
 Pt+LZvRcHmwgIrgy5Lu19xytZVQO50VeId0Sk1Ib2pnX7e9EakbykL0BL+h8BWG2Dhwe
 lrqvyCQYsnl7Q+0YS+FJv3uavDz0lllI6/UN3Rdj1TO/giQm2QsbRuo8lRCBZrsdeCJR
 6v635k3hGFCgZOkfin4RYCAhhvgqxuGcm35gpuuix+BzfzpCeyGgPPJl7ft+yc61/ebA Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vjgmxjyam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 19:50:16 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40BJkNOO003717;
	Thu, 11 Jan 2024 19:50:15 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vjgmxjy8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 19:50:15 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40BIw03p026992;
	Thu, 11 Jan 2024 19:50:13 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vfkw2d843-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 19:50:13 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40BJoCR510289860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jan 2024 19:50:12 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E78B5805E;
	Thu, 11 Jan 2024 19:50:12 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98FCA5805D;
	Thu, 11 Jan 2024 19:50:10 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Jan 2024 19:50:10 +0000 (GMT)
Message-ID: <f21d5e90-7da1-4f65-819d-a02bede53597@linux.ibm.com>
Date: Thu, 11 Jan 2024 13:50:10 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: Add DPS310 as trivial device
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, peterhuewe@gmx.de, jarkko@kernel.org,
        jgg@ziepe.ca, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com, johannes.holland@infineon.com, linux@roeck-us.net,
        broonie@kernel.org, andre.werner@systec-electronic.com
References: <20240111181251.1817582-1-ninad@linux.ibm.com>
 <20240111181251.1817582-3-ninad@linux.ibm.com>
 <1cf1f0dd-c453-4733-a5f4-0d2cc22498e2@linaro.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <1cf1f0dd-c453-4733-a5f4-0d2cc22498e2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gUJOibKBjrq0VnV4zYK43mC0gXX2H04W
X-Proofpoint-ORIG-GUID: LMps6aI9GatP4j4NlnHlsUSl3zJggUgE
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-11_11,2024-01-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401110154
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
Cc: devicetree@vger.kernel.org, festevam@denx.de, geert+renesas@glider.be, linux-aspeed@lists.ozlabs.org, peteryin.openbmc@gmail.com, alexander.stein@ew.tq-group.com, luca.ceresoli@bootlin.com, linux-kernel@vger.kernel.org, naresh.solanki@9elements.com, linux-arm-kernel@lists.infradead.org, lakshmiy@us.ibm.com, bhelgaas@google.com, vincent@vtremblay.dev, linux-integrity@vger.kernel.org, geissonator@yahoo.com, patrick.rudolph@9elements.com, linux-hardening@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Krzysztof,

On 1/11/24 13:40, Krzysztof Kozlowski wrote:
> On 11/01/2024 19:12, Ninad Palsule wrote:
>> Infineon DPS310 is a barometric pressure and temperature sensor.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
>
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.

This is a mistake from my side. Sorry about that. I will remember it 
next time.

Thanks & Regards,

Ninad

