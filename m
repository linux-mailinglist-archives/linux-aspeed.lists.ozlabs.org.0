Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7B66A930B
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Mar 2023 09:50:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PShWy59zFz3cfj
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Mar 2023 19:50:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NdK7a6f1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NdK7a6f1;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PShWp2pLbz30Bp
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Mar 2023 19:50:44 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id da10so7466000edb.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Mar 2023 00:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677833440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dndwzDUiTBwin+4em8jIFfSJ0lqsymrrSYaNKkksNjM=;
        b=NdK7a6f1cOFR6TuQdQzPSyK1MHMHdKF7SGtqn69KjcdiaofuVfahqOM4p12CA9ftUf
         RwoSqd+1OOGGLPLxeIJp5bt8x10lQ9y6JTpePugwywM0/otiRIIrOnVKXJS3FpawAoQ7
         c2tZAKP0xB3ZUrQrxaagTNA6uMY3LSTONdcj6hUQCL/eZohmN+w8BJN9Aie9DUr1Jwae
         2SxJ+2U6XE4WQb/Of9OKx0ViudVJ0B6rVVkbhTK6YjwRcimsNmksk5uhThL/dNSE2xin
         Hod6U0Zc9rWrdYG1bDwoxI2JFIEdGdaq+tY3z9jdFbee61UcrET7HS2ON+ft+VhCkAgK
         1leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677833440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dndwzDUiTBwin+4em8jIFfSJ0lqsymrrSYaNKkksNjM=;
        b=ABQg2hTH/N1wjKA9A6JtZ/XknGJ/UKjvafqT7qJakr7h9K9bodfo2LHAfPVsysAmvN
         dGUdnWkXNnvbsmRv8Eq2cGKrvU+KNfjrdiszv0qFpQu09kHfiAGWR4fbcvQulvO/mNnw
         JtBUJthePe/K8j8NgFs4ar5ED3uXSUB8BSAkg5kh1wM+rpTpT4ya+9EYDtNKISl7gSHY
         9r2fD++YWAMjdfbADOOWL9GSRTGXaFWxaPsQaR4dvEhmph+0sUIoRWfM4ogOExmBqs/h
         aqAbmKLpdbGJH7E8wd6CCHQVl0GIQsAqGm7KT6SWMxGPJ45VaLzVqXbyt4XRav++SL+q
         lAGA==
X-Gm-Message-State: AO0yUKXsRm01xuM8nv3T6UnNWnvQZkFDQxuWBCycBx2tAS9GZiR3SEdO
	YrR7tMclsiduj5FAS6DoRPMovQ==
X-Google-Smtp-Source: AK7set+SR49rThj/UUh3GScIzZndNq5/VTAUgy96BLSGsSV7wpmsRQjjCGRZyfu2YPpxDcJqhRr2og==
X-Received: by 2002:aa7:d04e:0:b0:4ad:7c7c:a70d with SMTP id n14-20020aa7d04e000000b004ad7c7ca70dmr1240291edo.19.1677833440681;
        Fri, 03 Mar 2023 00:50:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h30-20020a50cdde000000b004c10b4f9ebesm886669edj.15.2023.03.03.00.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 00:50:40 -0800 (PST)
Message-ID: <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
Date: Fri, 3 Mar 2023 09:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Wolfram Sang <wsa@kernel.org>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
 <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 03/03/2023 09:28, Ryan Chen wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, March 3, 2023 4:20 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Wolfram Sang
>> <wsa@kernel.org>
>> Cc: Joel Stanley <joel@jms.id.au>; Brendan Higgins
>> <brendan.higgins@linux.dev>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Andrew Jeffery <andrew@aj.id.au>;
>> devicetree@vger.kernel.org; Philipp Zabel <p.zabel@pengutronix.de>; Rob
>> Herring <robh+dt@kernel.org>; Benjamin Herrenschmidt
>> <benh@kernel.crashing.org>; linux-aspeed@lists.ozlabs.org;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> openbmc@lists.ozlabs.org; linux-i2c@vger.kernel.org
>> Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
>>
>> On 01/03/2023 06:57, Ryan Chen wrote:
>>> Hello Krzysztof,
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Monday, February 27, 2023 4:25 PM
>>>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Andrew Jeffery
>>>> <andrew@aj.id.au>; Brendan Higgins <brendan.higgins@linux.dev>;
>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org>; Joel Stanley
>>>> <joel@jms.id.au>; Rob Herring <robh+dt@kernel.org>; Krzysztof
>>>> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Philipp Zabel
>>>> <p.zabel@pengutronix.de>; linux-i2c@vger.kernel.org;
>>>> openbmc@lists.ozlabs.org; devicetree@vger.kernel.org;
>>>> linux-arm-kernel@lists.infradead.org;
>>>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>>>> Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
>>>> AST2600-i2cv2
>>>>
>>>> On 26/02/2023 04:13, Ryan Chen wrote:
>>>>> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,timeout
>>>>> aspeed,xfer-mode description for ast2600-i2cv2.
>>>>>
>>>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>>>> ---
>>>>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44
>> +++++++++++++++++++
>>>>>  1 file changed, 44 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>>>> b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>>>> index f597f73ccd87..75de3ce41cf5 100644
>>>>> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>>>> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>>>> @@ -49,6 +49,25 @@ properties:
>>>>>      description:
>>>>>        states that there is another master active on this bus
>>>>>
>>>>> +  aspeed,timeout:
>>>>> +    type: boolean
>>>>> +    description: I2C bus timeout enable for master/slave mode
>>>>
>>>> Nothing improved here in regards to my last comment.
>>>
>>> Yes, as I know your require is about " DT binding to represent hardware
>> setup"
>>> So I add more description about aspeed,timeout as blow.
>>>
>>> ASPEED SOC chip is server product, i2c bus may have fingerprint connect to
>> another board. And also support hotplug.
>>> The following is board-specific design example.
>>> Board A                                         Board B
>>> -------------------------                       ------------------------
>>> |i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
>>> |i2c bus#2(master)-> tmp i2c device |          |
>> |
>>> |i2c bus#3(master)-> adc i2c device |          |
>> |
>>> -------------------------                       ------------------------
>>>
>>> aspeed,timout properites:
>>> For example I2C controller as slave mode, and suddenly disconnected.
>>> Slave state machine will keep waiting for master clock in for rx/tx transmit.
>>> So it need timeout setting to enable timeout unlock controller state.
>>> And in another side. In Master side also need avoid suddenly slave
>> miss(un-plug), Master will timeout and release the SDA/SCL.
>>>
>>> Do you mean add those description into ore aspeed,timout properites
>> description?
>>
>> You are describing here one particular feature you want to enable in the driver
>> which looks non-scalable and more difficult to configure/use.
>> What I was looking for is to describe the actual configuration you have (e.g.
>> multi-master) which leads to enable or disable such feature in your hardware.
>> Especially that bool value does not scale later to actual timeout values in time
>> (ms)...
>>
>> I don't know I2C that much, but I wonder - why this should be specific to
>> Aspeed I2C and no other I2C controllers implement it? IOW, this looks quite
>> generic and every I2C controller should have it. Adding it specific to Aspeed
>> suggests that either we miss a generic property or this should not be in DT at
>> all (because no one else has it...).
>>
>> Also I wonder, why you wouldn't enable timeout always...
>>
>> +Cc Wolfram,
>> Maybe you know whether bool "timeout" property for one controller makes
>> sense? Why we do not have it for all controllers?
>>
> Because, i2c bus didn’t specific timeout.
> But SMBus defines a clock low time-out, TIMEOUT of 35 ms. 
> 
> It have definition in SMBus specification. 
> http://smbus.org/specs/SMBus_3_1_20180319.pdf
> You can check Page 18, Note3 that have timeout description.

Then you have already property for this - "smbus"?

Best regards,
Krzysztof

