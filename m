Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 531BC5329D2
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 May 2022 13:58:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6t4d1Vfrz3bk9
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 May 2022 21:58:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=SeK80ELC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.38;
 helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=SeK80ELC; dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6t4W11YNz2xTZ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 May 2022 21:58:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653393483; x=1684929483;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ewuLGbHpk8fgS+KzjyjDeksIuY2nJYimb3XiN3oMsfE=;
 b=SeK80ELCiA0IBXUd99/N8m8AZarhzyIF9DqCqBYcZlzgslatT5EVzdh9
 0OeSIDWZuoWQ/zHcX3SEJZ2or3kM8isDPJXPbBkNqeHU/01++D9KRDwE4
 dJDD0TJm2oHqJdNnKWlGzOopOCGEll/QZUVN0K52Imt53lxAJCtAoot6v c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 May 2022 04:57:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 04:57:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 24 May 2022 04:57:59 -0700
Received: from [10.110.76.156] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 24 May
 2022 04:57:57 -0700
Message-ID: <71613fa5-c468-e3ab-935a-7aa675e822fc@quicinc.com>
Date: Tue, 24 May 2022 04:57:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH -next] ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>
References: <20220523175640.60155-1-quic_jaehyoo@quicinc.com>
 <dd67a453-b75b-d092-f999-3faf05ef8160@linaro.org>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <dd67a453-b75b-d092-f999-3faf05ef8160@linaro.org>
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On 5/24/2022 2:53 AM, Krzysztof Kozlowski wrote:
> On 23/05/2022 19:56, Jae Hyun Yoo wrote:
>> Nuvia has been acquired by Qualcomm and the vendor name 'nuvia' will
>> not be used anymore so rename aspeed-bmc-nuvia-dc-scm.dts to
>> aspeed-bmc-qcom-dc-scm-v1.dts and change 'nuvia' to 'qcom' as its vendor
>> name in the file.
> 
> And all users of this DTB now have to update their bootloaders, scripts,
> installation methods. We did not rename FSL or Marvell boards, so
> neither should be renamed this one.

Yeah, I know that we don't rename dts but the previous version of this
change was picked recently in the middle of code review
https://lore.kernel.org/all/979a5c87-a7ea-a1f0-e42e-29043df6b348@quicinc.com/
and the v3 was pulled recently so it's still in the -next queue so
I believe it has a chance to be renamed since no one is using the DTB
yet.

>>
>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>> ---
>>   arch/arm/boot/dts/Makefile                                    | 2 +-
>>   ...eed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>   rename arch/arm/boot/dts/{aspeed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} (97%)
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 03f5b3a15415..2a3c95387613 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1584,7 +1584,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-bmc-lenovo-hr630.dtb \
>>   	aspeed-bmc-lenovo-hr855xg2.dtb \
>>   	aspeed-bmc-microsoft-olympus.dtb \
>> -	aspeed-bmc-nuvia-dc-scm.dtb \
>>   	aspeed-bmc-opp-lanyang.dtb \
>>   	aspeed-bmc-opp-mihawk.dtb \
>>   	aspeed-bmc-opp-mowgli.dtb \
>> @@ -1597,6 +1596,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-bmc-opp-witherspoon.dtb \
>>   	aspeed-bmc-opp-zaius.dtb \
>>   	aspeed-bmc-portwell-neptune.dtb \
>> +	aspeed-bmc-qcom-dc-scm-v1.dtb \
>>   	aspeed-bmc-quanta-q71l.dtb \
>>   	aspeed-bmc-quanta-s6q.dtb \
>>   	aspeed-bmc-supermicro-x11spi.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
>> similarity index 97%
>> rename from arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
>> rename to arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
>> index f4a97cfb0f23..259ef3f54c5c 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
>> @@ -6,8 +6,8 @@
>>   #include "aspeed-g6.dtsi"
>>   
>>   / {
>> -	model = "Nuvia DC-SCM BMC";
>> -	compatible = "nuvia,dc-scm-bmc", "aspeed,ast2600";
>> +	model = "Qualcomm DC-SCM V1 BMC";
>> +	compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
> 
> 
> You need also change bindings.

I didn't see any case of changing bindings for adding a new Aspped BMC
dts.

Thanks,
Jae

> 
> Best regards,
> Krzysztof
