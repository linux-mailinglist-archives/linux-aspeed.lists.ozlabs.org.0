Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9B6F97AA
	for <lists+linux-aspeed@lfdr.de>; Sun,  7 May 2023 10:23:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QDcrj4xXNz3bnV
	for <lists+linux-aspeed@lfdr.de>; Sun,  7 May 2023 18:23:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XyjgadbK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XyjgadbK;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QDcrY5xgdz308w
	for <linux-aspeed@lists.ozlabs.org>; Sun,  7 May 2023 18:23:40 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc37e1525so6637091a12.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 07 May 2023 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683447815; x=1686039815;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9TBivjxMkZZaR8M0CcBynnDvBHZKSjxBTUTWFsCdRlM=;
        b=XyjgadbKtIwHwOw/A6ZwDbKeHZysx6XAHRcUg9acQakMxlo2PRg9GtU4cAEcLe++FV
         awVzmADwVrtifT6/5bM3qRlnBN4FK/xquHxRqAbP/xsmAFLhB7l2CMeApTr9K7u7XWTJ
         gqR6Rkl9YnVR776zQvbIIuB/EmhjUjNJt8GZY1crHAUfCwVPjSHebuqYvv27PnHUEvyH
         OviCv1XyH/USJBNHzra6mf3Ou8CLBqbo2FSyweMLSMixYeCow/7cKgVnxA93CxIYaIX6
         j6uj0huiZnXC1Rmh9ynFJa4RoyPTatAx7MK2e9VAsnRvLUC03+wOc/dyiOUZ31pqt2YO
         v5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683447815; x=1686039815;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9TBivjxMkZZaR8M0CcBynnDvBHZKSjxBTUTWFsCdRlM=;
        b=OBioSBPEPkwVuXdUsfzLP5PARC9PmTlvw11mK/xUbV2weMpvr78bbCYWDAKtpYWv/6
         oA1c/R4UsK7q2Z9C26HCu6CUr2Mn8r9xa8mQNfW4GimdZMnryS/71T4JG7KoD/5rGpja
         BlMXas9P1t+UGedb/r2UUiXsRqyRpGZIjvYhYcDSEdXiB4iCCUY9tHG9C01usF64JDu3
         iIdyW1/gn/nriKLxb130LOdQqNK9nmylWCvbyHQQGgWg71UUH/TKpoluYAh/08agf8Z7
         3Ad+FMmNTaiZbhxAr7IwngrOYGwDJ/GWh6OpxSZd0t/x6EgzA0NxQXXM+UMpi0SOiPzq
         rAAw==
X-Gm-Message-State: AC+VfDwoe6Si43OcMzllWc8lFWAajT2iUlfl/vvfUB33QB7av/FNpfmU
	c9Fvh1gyGbah+P5zcVltT1qVDA==
X-Google-Smtp-Source: ACHHUZ4I6EGyGfb57ezEXvXgBnIay/IdBuS6SgbV6cHYFXgYE6lQLJbxZ0oQXVviWu/hohCn0IT0/Q==
X-Received: by 2002:a17:907:7f25:b0:961:272d:bdcc with SMTP id qf37-20020a1709077f2500b00961272dbdccmr6798156ejc.61.1683447815605;
        Sun, 07 May 2023 01:23:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:183b:950f:b4d5:135a? ([2a02:810d:15c0:828:183b:950f:b4d5:135a])
        by smtp.gmail.com with ESMTPSA id gz4-20020a170907a04400b0094f49f58019sm3360219ejc.27.2023.05.07.01.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 01:23:35 -0700 (PDT)
Message-ID: <969bfca0-9fff-0b22-6db1-113a7e998bc8@linaro.org>
Date: Sun, 7 May 2023 10:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] ARM: dts: aspeed: mtmitchell: Add I2C Fan
Content-Language: en-US
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230425065715.21871-1-chanh@os.amperecomputing.com>
 <20230425065715.21871-3-chanh@os.amperecomputing.com>
 <7ee3eec8-b5b4-2591-adcd-1831bf7de02b@linaro.org>
 <5d1cc7d5-2d73-c1a2-f95d-5810757640d2@amperemail.onmicrosoft.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5d1cc7d5-2d73-c1a2-f95d-5810757640d2@amperemail.onmicrosoft.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 07/05/2023 10:20, Chanh Nguyen wrote:
> 
> On 25/04/2023 20:15, Krzysztof Kozlowski wrote:
>> On 25/04/2023 08:57, Chanh Nguyen wrote:
>>> Add the MAX31790 node as a Fan I2C controller. It controls the
>>> TACH and PWM for Fan Mt.Mitchell system.
>>>
>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>> ---
>>>   arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>> index e79f56208b89..6455cf80da0e 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>> @@ -477,6 +477,18 @@
>>>   			line-name = "bmc-ocp0-en-n";
>>>   		};
>>>   	};
>>> +
>>> +	max31790@20 {
>>
>> Node names should be generic.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> Thank Krzysztof,
> 
> I think these node names should be "fan-i2c-0" and "fan-i2c-1". Do you 
> have any other idea ?

i2c-0 is not generic. This should be either fan or fan-controller,
depending what this is.
> 
>>
>>> +		compatible = "maxim,max31790";
>>
>> Unfortunately the compatible is undocumented.
>>
>> Please run scripts/checkpatch.pl and fix reported warnings.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Yes Krzysztof,
> 
> This compatible has not yes documented.
> 
> Should I push a document for max31790 to 
> ./Documentation/devicetree/bindings/ or ask to maintainer (Guenter Roeck 
> <linux@roeck-us.net> or Jean Delvare <jdelvare@suse.com>) ?

Check on lore.kernel.org if there is ongoing work. If there is no, then
please submit new the bindings (in DT schema). Maintainers are not for
writing your code, so it's you or some other developer who should do it.

Best regards,
Krzysztof

