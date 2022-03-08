Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD32B4D0D31
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 02:05:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCHDT3WLRz3bM7
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 12:04:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=UlHFlrzm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=UlHFlrzm; dkim-atps=neutral
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCHDP3skkz2xDD
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Mar 2022 12:04:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646701494; x=1678237494;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Jo4Puq3dirXjk+QWemEQMFfxj9JzhyoaneicmY/Nuu0=;
 b=UlHFlrzmelV6JB8KohBf/L7Z5djtNnJ8jj9p5GsvnmDA3sQ1hpPEL41O
 42M4XXawwnBAvOLALO/zokA+r6La7yOzx0R01C8Igdew9J+l4NbBzPXBQ
 NyB+T32oN5fQmTeurPT7o4TXE0fAPrq+275SJWEjiqP57sG5aLTcYoa0A 0=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Mar 2022 17:04:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 17:04:51 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 7 Mar 2022 17:04:51 -0800
Received: from [10.110.30.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 7 Mar 2022
 17:04:50 -0800
Message-ID: <b7aea3d4-6384-23e9-3b6a-71ba18ae161f@quicinc.com>
Date: Mon, 7 Mar 2022 17:04:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] pinctrl: aspeed: Add FWQSPI pinmux
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "Rob
 Herring" <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
References: <20220308003136.3930466-1-quic_jaehyoo@quicinc.com>
 <d2f125d8-07d1-4bff-8718-7dfba4d8fdb3@www.fastmail.com>
 <73a487ed-312b-72b3-4e64-dc580ba80704@quicinc.com>
 <e541828f-f0bc-419a-a5fc-d8aefe97832d@www.fastmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <e541828f-f0bc-419a-a5fc-d8aefe97832d@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Jamie Iles <quic_jiles@quicinc.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 3/7/2022 5:02 PM, Andrew Jeffery wrote:
> 
> 
> On Tue, 8 Mar 2022, at 11:16, Jae Hyun Yoo wrote:
>> Hi Andrew,
>>
>> On 3/7/2022 4:41 PM, Andrew Jeffery wrote:
>>>
>>>
>>> On Tue, 8 Mar 2022, at 11:01, Jae Hyun Yoo wrote:
>>>> From: Johnny Huang <johnny_huang@aspeedtech.com>
>>>>
>>>> AST2600 FW SPI quad mode only need to set AE12 and AF12, no need
>>>> to set Y1~Y4. FW SPI cs, clk, mosi and miso pins are dedicated.
>>>
>>> They're not dedicated according to the datasheet?
>>>
>>> Can you please look at this patch?
>>>
>>> https://lore.kernel.org/all/20220304011010.974863-1-joel@jms.id.au/
>>
>> Sorry. Please ignore this patch.
>> I mistakenly sent this patch while making a patch series.
>>
>> Please check this patch series instead.
>> https://lore.kernel.org/linux-arm-kernel/20220308003745.3930607-1-quic_jaehyoo@quicinc.com/T/#t
> 
> No worries, I'll take a look though it might be a couple of days due to chasing some other issues.

Thanks a lot, Andrew!

-Jae
