Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 690DA6DC859
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Apr 2023 17:21:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwCP53q2zz3chS
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Apr 2023 01:21:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NYo/3/co;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NYo/3/co;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwCNw1gbxz3cJF
	for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Apr 2023 01:21:17 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id sg7so24662884ejc.9
        for <linux-aspeed@lists.ozlabs.org>; Mon, 10 Apr 2023 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681140070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZRw2wqvE/1MC1yZ0G5iCqLIwh8QF13oSGU/qO0zu+o=;
        b=NYo/3/coo0c/yMIO7bncY2O4PQowzUY4HreJOHBoBdj/x/RT9LPYs4ujUtFPQI+WqW
         Bxc9fR08xu5vm9VS6WFaCprSpdIAtUR6LsjR9LnFAETjS+VrCEtoYq3PzHzsqy/M4Uls
         d6+XvtbngL3LscT0riA721aHMiTkyQjxPYRDQfqlV8BTrWJH6AzeZ2LeRg9rsVNtoZmJ
         hVp9RTmhyPI8hSl0Qp0w8iv9r2bbaeu1jgXTcqpn2kb/x9clBGSQLRfPu7BZxokZZGwq
         Z9zuTz6iZZvKScRfWUaqJOebbbRn/wyv2jQ7p1YharDKr3joVIx9E9uAp1SRaR0ByNXp
         INxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681140070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZRw2wqvE/1MC1yZ0G5iCqLIwh8QF13oSGU/qO0zu+o=;
        b=DjHvIyg18995MHwW6f/FYNQjxw6ofiVhoYzewgfVFI09WmmSl5LLEj/Xq134UQCn6D
         GcThwb21oSYmwF8GqY9BQAemeMtalmrRkGQjx6nmyKyktklvLX7+c7j6mYwX9Y9m9vC/
         Wd3PPykz6ZWWKkHHLw08B/fHlIkifGNKSh5n1sxyGRwlkBDOGvspcQQC2nB/W69eec0a
         +IR9UDYKFJuKCMfRueTxQQmU0KQCdtzo+FgUj2AAV3OBBac5DhtaFlukCx3e0oHYs8cK
         789yDpP+vls7dwbmnhlwVD/Ch1580A9CgIHV2wCFA9abUw0q9VrD8u7zswaBXEg/sfZX
         WBVg==
X-Gm-Message-State: AAQBX9fP0nr4PEkxiYpBN5QVIlX8Y3BWMYfAnO3o6CfMMzziW2LouMBB
	547B95O8UZgwsGWo1JAnXZWteg==
X-Google-Smtp-Source: AKy350brrjadn1puHhcMr9fNNUWP0/tw4thCV3WBC6mO5mKGKNcG/rCgLhMkPEKFkStbM15G1M4YBw==
X-Received: by 2002:a17:907:c60f:b0:94a:6fe4:c309 with SMTP id ud15-20020a170907c60f00b0094a6fe4c309mr3938620ejc.16.1681140069909;
        Mon, 10 Apr 2023 08:21:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:eacd:ffa4:1df7:3870? ([2a02:810d:15c0:828:eacd:ffa4:1df7:3870])
        by smtp.gmail.com with ESMTPSA id h22-20020a1709063b5600b0094cafa4fb8bsm344729ejf.124.2023.04.10.08.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 08:21:09 -0700 (PDT)
Message-ID: <44a7ee80-e770-4918-9caa-f606713fe584@linaro.org>
Date: Mon, 10 Apr 2023 17:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/2] ARM: dts: aspeed: greatlakes: Add gpio names
Content-Language: en-US
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20230329083235.24123-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230329083235.24123-2-Delphine_CC_Chiu@Wiwynn.com>
 <b66f708c-5369-c1c9-5506-c609a245bf4c@linaro.org>
 <PS2PR04MB3592E90B033CA23F47CD02F2B7959@PS2PR04MB3592.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PS2PR04MB3592E90B033CA23F47CD02F2B7959@PS2PR04MB3592.apcprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/04/2023 09:11, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
> Thank you for reviewing.
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, March 29, 2023 4:37 PM
>> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
>> patrick@stwcx.xyz; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andrew
>> Jeffery <andrew@aj.id.au>
>> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v1 1/2] ARM: dts: aspeed: greatlakes: Add gpio names
>>
>>   Security Reminder: Please be aware that this email is sent by an external
>> sender.
>>
>> On 29/03/2023 10:32, Delphine CC Chiu wrote:
>>> From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
>>>
>>> Add GPIO names for SOC lines.
>>>
>>> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
>>> ---
>>>  .../dts/aspeed-bmc-facebook-greatlakes.dts    | 49
>> +++++++++++++++++++
>>>  1 file changed, 49 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>> b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>> index 8c05bd56ce1e..59819115c39d 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>> @@ -238,4 +238,53 @@
>>>  &gpio0 {
>>>       pinctrl-names = "default";
>>>       pinctrl-0 = <&pinctrl_gpiu1_default &pinctrl_gpiu7_default>;
>>> +     status = "okay";
>>
>> Was it disabled before?
>>
> Yes, 

Really? Can you provide any proof for this?

> we have to enable gpio status for meeting aspeed-g6 device tree setting, and set net names for pulling gpio pin from application layer.

What is "enable gpio status"? What does it mean to "meet aspeeg-g6
devicetree setting"?
What names have anything to do with my question?

Sorry, I cannot parse it at all.

>>> +     gpio-line-names =
>>> +     /*A0-A7*/ "","","","","","","","",
>>> +     /*B0-B7*/ "power-bmc-nic","presence-ocp-debug",
>>> +               "power-bmc-slot1","power-bmc-slot2",
>>> +               "power-bmc-slot3","power-bmc-slot4","","",
>>> +     /*C0-C7*/ "presence-ocp-nic","","","reset-cause-nic-primary",
>>> +               "reset-cause-nic-secondary","","","",
>>> +     /*D0-D7*/ "","","","","","","","",
>>> +     /*E0-E7*/ "","","","","","","","",
>>> +     /*F0-F7*/ "slot1-bmc-reset-button","slot2-bmc-reset-button",
>>> +               "slot3-bmc-reset-button","slot4-bmc-reset-button",
>>> +               "","","","presence-emmc",
>>> +     /*G0-G7*/ "","","","","","","","",
>>> +     /*H0-H7*/ "","","","",
>>> +               "presence-mb-slot1","presence-mb-slot2",
>>> +               "presence-mb-slot3","presence-mb-slot4",
>>> +     /*I0-I7*/ "","","","","","","bb-bmc-button","",
>>> +     /*J0-J7*/ "","","","","","","","",
>>> +     /*K0-K7*/ "","","","","","","","",
>>> +     /*L0-L7*/ "","","","","","","","",
>>> +     /*M0-M7*/
>> "","power-nic-bmc-enable","","usb-bmc-enable","","reset-cause-usb-hub","","",
>>> +     /*N0-N7*/ "","","","","bmc-ready","","","",
>>> +     /*O0-O7*/
>> "","","","","","","fan0-bmc-cpld-enable","fan1-bmc-cpld-enable",
>>> +     /*P0-P7*/ "fan2-bmc-cpld-enable","fan3-bmc-cpld-enable",
>>> +               "reset-cause-pcie-slot1","reset-cause-pcie-slot2",
>>> +               "reset-cause-pcie-slot3","reset-cause-pcie-slot4","","",
>>> +     /*Q0-Q7*/ "","","","","","","","",
>>> +     /*R0-R7*/ "","","","","","","","",
>>> +     /*S0-S7*/ "","","power-p5v-usb","presence-bmc-tpm","","","","",
>>> +     /*T0-T7*/ "","","","","","","","",
>>> +     /*U0-U7*/ "","","","","","","","GND",
>>> +     /*V0-V7*/ "bmc-slot1-ac-button","bmc-slot2-ac-button",
>>> +               "bmc-slot3-ac-button","bmc-slot4-ac-button",
>>> +               "","","","",
>>> +     /*W0-W7*/ "","","","","","","","",
>>> +     /*X0-X7*/ "","","","","","","","",
>>> +     /*Y0-Y7*/ "","","","reset-cause-emmc","","","","",
>>> +     /*Z0-Z7*/ "","","","","","","",""; };
>>> +
>>> +&gpio1 {
>>> +     status = "okay";
>>
>> Same question...
> Yes, the answer is same as above.

So the same incorrect?


Best regards,
Krzysztof

