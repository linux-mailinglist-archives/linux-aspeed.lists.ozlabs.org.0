Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46384534EE0
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 May 2022 14:12:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L86Hg3SRqz3bkP
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 May 2022 22:11:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FGwLjy7o;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FGwLjy7o;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L86HX6Mw8z306l
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 May 2022 22:11:50 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id d22so1573964edj.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 26 May 2022 05:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sXHp14NNalgqPaKL7fFgyP/4BdJ+vF73UOPZDrXfEbU=;
        b=FGwLjy7oS+OIxxTDnvLctd0ph6xYVfo9FHwpZa0nZL9tKTfGKLDaBLD2pgvAlHvsSO
         6+YLNbhFsfrMUNXNQxqtzm3DgEK4LOOTzzATAJrKJsO8czXDovltiJKZddYVbl5z5sVu
         Cgr7SW5TSLSVGrIpy7bAoLTAn0aaQXJRTfJbJ6D0xGbzEhYxN0vAXpP0PduCOthjh7Qx
         1Lp5YIborDM4hz1c22ERtTfDyt8uAJgCEfX7qBL5icCGLa4M7HZxCshuadE5teTSPbzv
         fuRYIQg7n/5kW8y1p8Vct+9Z2GLEaQDIIdJa1zZSDJyK9jhwtjFdxn369U1N2ewN68hc
         zZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sXHp14NNalgqPaKL7fFgyP/4BdJ+vF73UOPZDrXfEbU=;
        b=FjvQPpjxc+Hi6wC3shh1rCe7QV3DkNvOwXrCJjo3aKzIxLwBuUwrft8djc+VJlW5Lj
         4FgRIz00/4OFxS9ENLtgHGwXbdssghq52+VIMJUeEGpxpzzJejGy4i8NQ3W2J1k7jRwN
         4Cb7o8LlWsHrmmRE1kFDX3tWV1zK67CzYbTnoJ/7zsDPM1SZbt5qyaond2uryYzGPAY5
         qEtJd1Wkp6LN01R+/kAOSjHtaPisVCz9j0KwOhjQt/o2sC71XysR/vxGNLabXrSSvKOl
         yUlZil6WY4kvDnz73UEcJYJAQA635ZvHBwzyoHVW+Z9LJycmxKG/dAVQ74FMGcaWWHWj
         hILg==
X-Gm-Message-State: AOAM530gim5fK2fnzynZ3fs+Pj63tqYzVNFTl4F3q/A5JeSrPNulkSjw
	QHdW4KHv7ykzxoakU+sLSc8I8w==
X-Google-Smtp-Source: ABdhPJxKtLDaqitsHZgj8YIb7tPwvHNZlr+rERVc0m5szUCbZxJUM9dMruOloFZQvWNGezIeQY6/EA==
X-Received: by 2002:aa7:c79a:0:b0:42a:762e:769c with SMTP id n26-20020aa7c79a000000b0042a762e769cmr39520806eds.155.1653567102762;
        Thu, 26 May 2022 05:11:42 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id cw13-20020a170906c78d00b006fee11af404sm458355ejb.147.2022.05.26.05.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 05:11:42 -0700 (PDT)
Message-ID: <32077a17-6a95-d583-9d7f-2276cf586b38@linaro.org>
Date: Thu, 26 May 2022 14:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH -next] ARM: dts: aspeed: nuvia: rename vendor nuvia to
 qcom
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220523175640.60155-1-quic_jaehyoo@quicinc.com>
 <dd67a453-b75b-d092-f999-3faf05ef8160@linaro.org>
 <71613fa5-c468-e3ab-935a-7aa675e822fc@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <71613fa5-c468-e3ab-935a-7aa675e822fc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 24/05/2022 13:57, Jae Hyun Yoo wrote:
> Hi Krzysztof,
> 
> On 5/24/2022 2:53 AM, Krzysztof Kozlowski wrote:
>> On 23/05/2022 19:56, Jae Hyun Yoo wrote:
>>> Nuvia has been acquired by Qualcomm and the vendor name 'nuvia' will
>>> not be used anymore so rename aspeed-bmc-nuvia-dc-scm.dts to
>>> aspeed-bmc-qcom-dc-scm-v1.dts and change 'nuvia' to 'qcom' as its vendor
>>> name in the file.
>>
>> And all users of this DTB now have to update their bootloaders, scripts,
>> installation methods. We did not rename FSL or Marvell boards, so
>> neither should be renamed this one.
> 
> Yeah, I know that we don't rename dts but the previous version of this
> change was picked recently in the middle of code review
> https://lore.kernel.org/all/979a5c87-a7ea-a1f0-e42e-29043df6b348@quicinc.com/
> and the v3 was pulled recently so it's still in the -next queue so
> I believe it has a chance to be renamed since no one is using the DTB
> yet.

Ah, so it is still in next (or was before this merge window). OK, thanks
for explanation.

> 
>>>
>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>> ---
>>>   arch/arm/boot/dts/Makefile                                    | 2 +-
>>>   ...eed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} | 4 ++--
>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>   rename arch/arm/boot/dts/{aspeed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} (97%)
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 03f5b3a15415..2a3c95387613 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1584,7 +1584,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>   	aspeed-bmc-lenovo-hr630.dtb \
>>>   	aspeed-bmc-lenovo-hr855xg2.dtb \
>>>   	aspeed-bmc-microsoft-olympus.dtb \
>>> -	aspeed-bmc-nuvia-dc-scm.dtb \
>>>   	aspeed-bmc-opp-lanyang.dtb \
>>>   	aspeed-bmc-opp-mihawk.dtb \
>>>   	aspeed-bmc-opp-mowgli.dtb \
>>> @@ -1597,6 +1596,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>   	aspeed-bmc-opp-witherspoon.dtb \
>>>   	aspeed-bmc-opp-zaius.dtb \
>>>   	aspeed-bmc-portwell-neptune.dtb \
>>> +	aspeed-bmc-qcom-dc-scm-v1.dtb \
>>>   	aspeed-bmc-quanta-q71l.dtb \
>>>   	aspeed-bmc-quanta-s6q.dtb \
>>>   	aspeed-bmc-supermicro-x11spi.dtb \
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
>>> similarity index 97%
>>> rename from arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
>>> rename to arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
>>> index f4a97cfb0f23..259ef3f54c5c 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
>>> @@ -6,8 +6,8 @@
>>>   #include "aspeed-g6.dtsi"
>>>   
>>>   / {
>>> -	model = "Nuvia DC-SCM BMC";
>>> -	compatible = "nuvia,dc-scm-bmc", "aspeed,ast2600";
>>> +	model = "Qualcomm DC-SCM V1 BMC";
>>> +	compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
>>
>>
>> You need also change bindings.
> 
> I didn't see any case of changing bindings for adding a new Aspped BMC
> dts.

Hmmm... Where do you document these bindings? Or does it mean Aspeed
does not document it at all, every time the checkpatch complains but no
one thought about it why? :)

Best regards,
Krzysztof
