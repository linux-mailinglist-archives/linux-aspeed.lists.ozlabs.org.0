Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFFD4E748A
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 14:55:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ3WY3cMKz308b
	for <lists+linux-aspeed@lfdr.de>; Sat, 26 Mar 2022 00:55:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=WuYNVRSI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=WuYNVRSI; dkim-atps=neutral
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ3WQ3KQsz2xsW
 for <linux-aspeed@lists.ozlabs.org>; Sat, 26 Mar 2022 00:55:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648216514; x=1679752514;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=VSRddfIDJSZ4M31ioRYtDUoXN9LB7IUgTCVpG0uaOKM=;
 b=WuYNVRSINbAwUCACrIvEefbqVSJD60C4hEClgf+krR8zOlwTUzhANONH
 xQY1/eW97hcazH0Li4DZvYfqtn46QV8TaxK5PmNm+wsDat4/BV8RjI/dx
 BXVZh9Lt/l5+XjOBmmpC10SYhwyVvjCiKCidoH8UnPtXAvqINEnLXm+3z w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Mar 2022 06:55:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 06:55:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 25 Mar 2022 06:55:09 -0700
Received: from [10.110.37.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 25 Mar
 2022 06:55:08 -0700
Message-ID: <685b5cd3-38a2-f1d7-2277-62d824ea2a3e@quicinc.com>
Date: Fri, 25 Mar 2022 06:55:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: add Nuvia DC-SCM BMC
Content-Language: en-US
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn
 <andrew@lunn.ch>
References: <20220325010316.451471-1-quic_jaehyoo@quicinc.com>
 <37768dc5-16ac-23ea-61a0-27f44e2fbd84@kernel.org>
 <fe55ba03-3989-4566-1831-ad43329e4628@quicinc.com>
In-Reply-To: <fe55ba03-3989-4566-1831-ad43329e4628@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 3/25/2022 6:46 AM, Jae Hyun Yoo wrote:
> On 3/25/2022 5:10 AM, Krzysztof Kozlowski wrote:
>> On 25/03/2022 02:03, Jae Hyun Yoo wrote:
>>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>>
>>> Add initial version of device tree for Nuvia DC-SCM BMC which is
>>> equipped with Aspeed AST2600 BMC SoC.
>>>
>>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>> ---
>>> Changes in v2:
>>> * Added a comment to explain 'rgmii' phy mode setting. (Andrew)
>>>
>>>   arch/arm/boot/dts/Makefile                    |   1 +
>>>   arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts | 189 ++++++++++++++++++
>>>   2 files changed, 190 insertions(+)
>>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 7c16f8a2b738..e63cd6ed0faa 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1546,6 +1546,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>       aspeed-bmc-lenovo-hr630.dtb \
>>>       aspeed-bmc-lenovo-hr855xg2.dtb \
>>>       aspeed-bmc-microsoft-olympus.dtb \
>>> +    aspeed-bmc-nuvia-dc-scm.dtb \
>>>       aspeed-bmc-opp-lanyang.dtb \
>>>       aspeed-bmc-opp-mihawk.dtb \
>>>       aspeed-bmc-opp-mowgli.dtb \
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts 
>>> b/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
>>> new file mode 100644
>>> index 000000000000..1984d545b66e
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
>>> @@ -0,0 +1,189 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +// Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All 
>>> rights reserved.
>>
>> This does not look like DTS comment style (Only SPDX should be in //).
>>
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "aspeed-g6.dtsi"
>>> +
>>> +/ {
>>> +    model = "Nuvia DC-SCM BMC";
>>> +    compatible = "nuvia,dc-scm-bmc", "aspeed,ast2600";
>>> +
>>> +    aliases {
>>> +        serial4 = &uart5;
>>> +    };
>>> +
>>> +    chosen {
>>> +        bootargs = "console=ttyS4,115200n8";
>>
>> You should use stdout path instead.

Oh, I missed this comment. I'll add 'stdout-path'.
Thanks for your pointing it out.

-Jae

> 
> "The format of the .dts "source" file is "C" like, supports C and C++
> style comments."
> 
> According to the
> https://www.kernel.org/doc/Documentation/devicetree/booting-without-of.txt
> 
> Thanks,
> Jae
