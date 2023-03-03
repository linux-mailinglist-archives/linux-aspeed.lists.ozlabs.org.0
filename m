Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE47C6A9575
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Mar 2023 11:41:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSkzV4HF5z3cct
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Mar 2023 21:41:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RneMdVVx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RneMdVVx;
	dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSkzL1sJnz3cBF
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Mar 2023 21:41:15 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id da10so8526789edb.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Mar 2023 02:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677840072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31h/TwxZjU/eMNkRy/rigOc9LyijsM9RaRbj/TNatWw=;
        b=RneMdVVxbNNSPFOHB77lOxGVrt/PUKwP6dvfi+tbBSBSfTte9prWv75nUpwupLK7Rf
         0Vao/jruRP+Xo9s0I2nuTlDGMWdOEx5fWxmgOnULxsJbAlhm4MeNgf+kfqV3FuI3n5zK
         zh7VJVwLXI5GynBeI8u37shHs25x/3OmO7XYGVbp31/CsMVJQmDt0nDSZ0k/GJJ8dF4+
         Rxd9Shpb11nXqU3ybmK7ms3vkCx4xIM7zWuqAbIIQYAFlhpmpre0IVXokvhkWNnGG1CC
         wkc7ylHyf5bOyVDVGbCNSL5V1oCrK7nRkCL8VA0UIHxJ4GijtdqMfRkUjg3PRQnoImYW
         euLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677840072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31h/TwxZjU/eMNkRy/rigOc9LyijsM9RaRbj/TNatWw=;
        b=H6D7yL1RcWQMdXieT+whd6eAAm3vphLeuYOZvCkdXgJN5K9fJWYQScu26GwA3xCo/b
         s+gI6zfMGSK8Bu9AWEsmUn25N3JqstpiguVY8jYKo0Px3mNeKP7TiAKpu/ms6lM9te0z
         Pu6Z69H9kNwSdj0CgWI4v8Jy5M2ocoeBXXdaschyoIhJyYuyyVWN3pZuJsfumQbUC4/s
         FsXl1VNXefTB1Q7XieaQ7sGOZxqPtuTDmRE+s4knA7ZmWwbxVec4FSOS1K/Lky2IQR5Z
         laME5uETLIpkd+KSHEuSumdtOTxuWlzKDgg92avPFAAzJjnyojjQMP/GBBj2kL8Rn9YC
         zSyQ==
X-Gm-Message-State: AO0yUKXluZ8CNJ5l45POjRoWjouGo7mhAj5Lmvc/2Nvfiu3t/kcXdwcS
	fpIv/sXd1Cpr3aeNbM8vIOHgMQ==
X-Google-Smtp-Source: AK7set+zg5l3kKUqXGX5P2+Qlj6Wbf352Qt7wJxSDI79UVtGhmmuEmG+SQ9Y+M41PXMeJgs90bP6/g==
X-Received: by 2002:a17:907:7e82:b0:8f4:6efd:833f with SMTP id qb2-20020a1709077e8200b008f46efd833fmr1422247ejc.3.1677840072585;
        Fri, 03 Mar 2023 02:41:12 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u25-20020a50a419000000b004bd6e3ed196sm980103edb.86.2023.03.03.02.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 02:41:12 -0800 (PST)
Message-ID: <c5cf6e0a-05dc-dff7-6218-df0984d1ba47@linaro.org>
Date: Fri, 3 Mar 2023 11:41:10 +0100
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
 <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
 <SEZPR06MB5269E7B8785B3CB56A63A916F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <a3615fe7-aa2a-53e9-2732-ba4512b9369d@linaro.org>
 <SEZPR06MB5269E7B070B239F8E349C427F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269E7B070B239F8E349C427F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 03/03/2023 11:16, Ryan Chen wrote:
>>>>>>> aspeed,timout properites:
>>>>>>> For example I2C controller as slave mode, and suddenly
>> disconnected.
>>>>>>> Slave state machine will keep waiting for master clock in for
>>>>>>> rx/tx
>>>> transmit.
>>>>>>> So it need timeout setting to enable timeout unlock controller state.
>>>>>>> And in another side. In Master side also need avoid suddenly slave
>>>>>> miss(un-plug), Master will timeout and release the SDA/SCL.
>>>>>>>
>>>>>>> Do you mean add those description into ore aspeed,timout
>>>>>>> properites
>>>>>> description?
>>>>>>
>>>>>> You are describing here one particular feature you want to enable
>>>>>> in the driver which looks non-scalable and more difficult to
>> configure/use.
>>>>>> What I was looking for is to describe the actual configuration you have
>> (e.g.
>>>>>> multi-master) which leads to enable or disable such feature in your
>>>> hardware.
>>>>>> Especially that bool value does not scale later to actual timeout
>>>>>> values in time (ms)...
>>>>>>
>>>>>> I don't know I2C that much, but I wonder - why this should be
>>>>>> specific to Aspeed I2C and no other I2C controllers implement it?
>>>>>> IOW, this looks quite generic and every I2C controller should have
>>>>>> it. Adding it specific to Aspeed suggests that either we miss a
>>>>>> generic property or this should not be in DT at all (because no one
>>>>>> else has
>>>> it...).
>>>>>>
>>>>>> Also I wonder, why you wouldn't enable timeout always...
>>>>>>
>>>>>> +Cc Wolfram,
>>>>>> Maybe you know whether bool "timeout" property for one controller
>>>>>> makes sense? Why we do not have it for all controllers?
>>>>>>
>>>>> Because, i2c bus didn’t specific timeout.
>>>>> But SMBus defines a clock low time-out, TIMEOUT of 35 ms.
>>>>>
>>>>> It have definition in SMBus specification.
>>>>> http://smbus.org/specs/SMBus_3_1_20180319.pdf
>>>>> You can check Page 18, Note3 that have timeout description.
>>>>
>>>> Then you have already property for this - "smbus"?
>>> To be a property "smbus", that would be a big topic, I saw fsl i2c
>>> also have this.
>>> https://github.com/torvalds/linux/blob/master/Documentation/devicetree
>>> /bindings/i2c/i2c-mpc.yaml#L43-L47
>>> So, I just think the "timeout" property.
>>
>> Yeah and this is the only place. It also differs because it allows actual
>> timeout values.
> Thanks, So can I still keep the property "aspeed,timeout" here?
> It is the only place. 

No, because none of my concerns above are addressed.

Best regards,
Krzysztof

