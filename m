Return-Path: <linux-aspeed+bounces-503-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240CBA13D31
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Jan 2025 16:05:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYmPX5vPkz3bhD;
	Fri, 17 Jan 2025 02:05:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737039904;
	cv=none; b=XmBaUmx9ZnschKeiAGwuHxoyHbkP5ysPPVZwqJo1i8jW+ZHaQUoPZYQe4eW88pqAwG5snzBAbEnq6TjrR3WKNmrerEv46Ws6aaUOUzsTNenbAlN4v9C0ttKjAAqQm2y0Kz3VbK7Vv96gnfc+jyX7lIaeCB1o099yCNfdqMBJ0G0K36QpRyqw3UcWOGT/x1BpRyf35cGQvXyaMl+xa85HbtZY0ClVUMwOfhTntNuxQtorrZMfVUV7nqBup9XptiuGWy7i/QKEpZ6htlsYdGRnxqeAlnHrvhAN4OyuRv0pahd4lo7d1unduVGlenaRGwmxBv1jFsRJL6B2pEPBlRC/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737039904; c=relaxed/relaxed;
	bh=YqyfQxOJ5oYKECoyFJ2sTY8rhlGKLhZCB19orskKgkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kgn+fIWhnOj7z3kZPiQjPAn92Z9ewEzwnvc/deHLvVsn3gRTiXZvCbraUnel4Y0eWeXySPe9HIEB82QwYFAEH3AOzJFKDA2QQMFCHZnqqh2aBhvs/rirzeRsv8k97/DsSw9qtDE5gXGqDb77/AMBIvtgvr8o1RyDdnXLOS9fLzZgsgEqwywlRXZMZLopkcuqjRHAvBr2xWaxHG3s+RzGqDd8o/qe/3zg2UofwooeAsPbBsqNkTk/oGpYG3oQ3K50x7Ruz3yZ//J+f/45sRl9bhp4xsOqT8OiQXs3HiNzgjc1v8H0GB0tZd/5dLXf2Ia581o7BXleH7Ux006N1Qw6Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UxP66y8y; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UxP66y8y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYmPW42Ljz30Mn
	for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Jan 2025 02:05:02 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GE6dxf024817;
	Thu, 16 Jan 2025 15:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YqyfQx
	OJ5oYKECoyFJ2sTY8rhlGKLhZCB19orskKgkE=; b=UxP66y8y9OT9RWoBkaJAU3
	GfkhR0rxzN94Sk3KjZdvONvMmx4MlGUauBsmpyNtxtfo9KsmiQ/vlL4sTwTu0PUp
	vSgHgFEUTdaYxWr5udXMn5OuCFAKUgZmhgqqdZXmhSbRgbyIL/niU4TL3c2jdvNf
	JKm9g5qc1RNZhAlhCgqZZfTUt1wUqEkOtTjEW+RtI7hw42FNfOhojmhcvNdT9Ghf
	NRClsrSRmKedtjTt3g/a7plBN2KUb96ivAzsTUh9yeLcs/N7aqaQhcLDZSgCdMpN
	OCTYiaxdVGb8OFOq3q1Ybs0ULTgnYv9RIYl1MuLXe/id0QVac65LfSSLwk/XfFgg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4473k58ar8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:04:31 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50GERMrc012914;
	Thu, 16 Jan 2025 15:04:31 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4473k58ar1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:04:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50GE6SP6017400;
	Thu, 16 Jan 2025 15:04:30 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4444fke98p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:04:30 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50GF4URL28246688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 15:04:30 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA8CC5803F;
	Thu, 16 Jan 2025 15:04:29 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5565C58056;
	Thu, 16 Jan 2025 15:04:23 +0000 (GMT)
Received: from [9.61.59.21] (unknown [9.61.59.21])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jan 2025 15:04:22 +0000 (GMT)
Message-ID: <35572405-2dd6-48c9-9113-991196c3f507@linux.ibm.com>
Date: Thu, 16 Jan 2025 09:04:21 -0600
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, pabeni@redhat.com,
        linux-arm-kernel@lists.infradead.org, edumazet@google.com,
        joel@jms.id.au, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        davem@davemloft.net, kuba@kernel.org,
        openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, conor+dt@kernel.org,
        eajames@linux.ibm.com, minyard@acm.org
References: <20250114220147.757075-1-ninad@linux.ibm.com>
 <20250114220147.757075-4-ninad@linux.ibm.com>
 <173689907575.1972841.5521973699547085746.robh@kernel.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <173689907575.1972841.5521973699547085746.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: owqPtG7sXawqZszVtmUCKpylao6OtTOR
X-Proofpoint-ORIG-GUID: y3OZyjeOsP0uNqLC9wmfkr7B2_zgRWNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxlogscore=666 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160114
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Rob,

On 1/14/25 17:57, Rob Herring (Arm) wrote:
> On Tue, 14 Jan 2025 16:01:37 -0600, Ninad Palsule wrote:
>> Allow parsing GPIO controller children nodes with GPIO hogs.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>>   .../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml       | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
>
>
> doc reference errors (make refcheckdocs):

I am not seeing any error even after upgrading dtschema. Also this mail 
also doesn't show any warning. Is this false negative?

   HOSTLD  scripts/dtc/fdtoverlay
   CHKDT   ./Documentation/devicetree/bindings
   LINT    ./Documentation/devicetree/bindings
   DTEX 
Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.example.dts
   DTC [C] 
Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.example.dtb

Regards,

Ninad

>

