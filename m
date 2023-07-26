Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FED762B75
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jul 2023 08:32:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hxiRIiHX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9kb44prlz3byv
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jul 2023 16:32:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hxiRIiHX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9kZr03FNz2yGB
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jul 2023 16:32:01 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52256241c66so1365826a12.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jul 2023 23:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690353117; x=1690957917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ldLrML6vgBXKyXyh78YQC1WMOnySmR4KEmHw8/G7es=;
        b=hxiRIiHX3IPTp13VhJ2zUgmjhfOx3uM0ozvIxbPN5lzVOv49jVGvsPwcUkrTJ/a5yY
         lbRGf0FW1B7lUE1snLH2ywYWHkTXDjhPTYRJtsN675jKZVSfiAknvWEwoyFjk1otJmaf
         R3n3zyQ+RXuO1QzTVK7ypFkJFT+/V5p9QXQbLexZRaI7/bMrrgAdNSlXiyUrBuCsx8rB
         bLbk9PGvILSrk3XCqj7WiYaBfp8Hvrw53GNYI5dGEhmX1UVG9KXRscRXXshObv/gD/y/
         pzS/DhpBE1UXP35XD6rNPxR8DlY9BEr85Re5gzPG1KYyKMSiU7ZhqwaPLjht/hi7VMZI
         mXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690353117; x=1690957917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ldLrML6vgBXKyXyh78YQC1WMOnySmR4KEmHw8/G7es=;
        b=eEF2Y0KMMMojNc867a9QLOuHW2yBND31JkrcVhLfgohlbRc3HDcuX8FRzFuM7w1JSI
         IVSNfb1miQAi2VglOaKYmKDvYMOsyj2ZIBpVsimJepynngRcpSAe6jPZ0WR0k4iwLGZY
         zJO1E2LQfL/qJLidfg28zD5wzwQT0qnaPsA27bTVgW7yi4be1i+QGyReqhRO9nZlPjU8
         fqh77+Do8xA9M/KdFLBc+jsN63qtRe+/hq/hB7q1PPZByxZo6ES5Pcp38OvnM6vnmRn8
         dXgwrmd/ADm4PuaYAY8RlxiEuTowCCYq8tg/57rhd0Ef38BYxFXRzSMSexBqTx+o5/Sd
         u0WA==
X-Gm-Message-State: ABy/qLa/ksef81HEDOP4DRjn8OQ5cVb9zCBJvqFqQ3vG0zUv5qU/9BpS
	jRfGwT85G5IlLUV8H0XupkedPQ==
X-Google-Smtp-Source: APBJJlGP/jM5jLrGO0nptAexry6b5IdBGsnZaQ4NDlO6cRjUP70wp9glHqersDbmUu0TGoBiiLj8yA==
X-Received: by 2002:a05:6402:524f:b0:51d:cf7b:c9f0 with SMTP id t15-20020a056402524f00b0051dcf7bc9f0mr4911199edd.12.1690353117194;
        Tue, 25 Jul 2023 23:31:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y19-20020aa7ccd3000000b0051df54c6a27sm8363707edt.56.2023.07.25.23.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 23:31:56 -0700 (PDT)
Message-ID: <e7fbf15f-dec3-ecf1-849e-faf0b3f2bc94@linaro.org>
Date: Wed, 26 Jul 2023 08:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Jean Delvare <jdelvare@suse.de>,
 William Zhang <william.zhang@broadcom.com>, Tyrone Ting
 <kfting@nuvoton.com>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "=linux-kernel@vger.kernel.org" <=linux-kernel@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <eda7789d-a603-d565-c9da-edfe9493a05d@linaro.org>
 <SEZPR06MB5269EB586319B3333CD96010F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <674fed6f-36d6-bacb-d075-97bc355177a3@linaro.org>
 <SEZPR06MB5269568451406598F0D824F6F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <SEZPR06MB5269B31B3ADC4EDEA113BA99F200A@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269B31B3ADC4EDEA113BA99F200A@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 26/07/2023 05:38, Ryan Chen wrote:
>>> +
>>> +static int ast2600_i2c_remove(struct platform_device *pdev) {
>>> +	struct ast2600_i2c_bus *i2c_bus = platform_get_drvdata(pdev);
>>> +
>>> +	/* Disable everything. */
>>> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
>>> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
>>> +
>>> +	i2c_del_adapter(&i2c_bus->adap);
>>
>>> I have doubts that you tested this. I think you have here double free/del of the adapter.
>> Sorry, i can't catch your point for double free the adapter.
>> It should use i2c_del_adapter in driver remove function.
>> All the driver doing this
>> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-n
>> pcm7xx.c#L2373
>> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-a
>> ltera.c#L473
>>
>> Do you mean it is not necessary? 
> 
>> Instead of giving you the fish, I think much more learning experience is to teach you how to fish. Please unbind your driver (echo the device name to proper unbind file in sysfs). The best if you build your kernel with KASAN.
> 
>> Thanks, will do this test with unbind to understand your point. 
> I do my the test with enable kernel config KASAN.
> I don't see any error dump. You can see the following. It use i2c-0 bind/unbind.
> Did I miss some test ??
> 
> root@ast2600-default:/sys/bus/platform/drivers/i2c_ast2600# i2cdetect -l
> i2c-0   i2c             1e78a080.i2c-bus                        I2C adapter
> i2c-1   i2c             1e78a100.i2c-bus                        I2C adapter
> i2c-2   i2c             1e78a180.i2c-bus                        I2C adapter
> i2c-3   i2c             1e78a200.i2c-bus                        I2C adapter
> i2c-4   i2c             1e78a280.i2c-bus                        I2C adapter
> i2c-5   i2c             1e78a300.i2c-bus                        I2C adapter
> i2c-6   i2c             1e78a380.i2c-bus                        I2C adapter
> i2c-7   i2c             1e78a400.i2c-bus                        I2C adapter
> i2c-8   i2c             1e78a480.i2c-bus                        I2C adapter
> i2c-9   i2c             1e78a500.i2c-bus                        I2C adapter
> i2c-12  i2c             1e78a680.i2c-bus                        I2C adapter
> i2c-13  i2c             1e78a700.i2c-bus                        I2C adapter
> i2c-14  i2c             1e78a780.i2c-bus                        I2C adapter
> i2c-15  i2c             1e78a800.i2c-bus                        I2C adapter
> root@ast2600-default:/sys/bus/platform/drivers/i2c_ast2600# echo 1e78a080.i2c-bus > unbind

It should fail... if it doesn't, maybe you can tell why?

Best regards,
Krzysztof

