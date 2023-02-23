Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C3C6A04CC
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Feb 2023 10:30:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMnnN324Tz3bh3
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Feb 2023 20:30:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lMHPibg4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lMHPibg4;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMnnD6JrJz3cJq
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Feb 2023 20:30:23 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id l25so9712845wrb.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Feb 2023 01:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0kLlLse1yCPirtczOxDDSZCB4FvjR8XNywaHVA1Pwc=;
        b=lMHPibg4j6ViwZO7s1if82oMsBgiB7vqazlQIS1tfdR9RQrBT1m0seEs/RCbIyfZZZ
         PWYtlrYfMA6KchT3hWoJ6cmquNh5+QhbMJsceooqMtNg5jlUpJ/luHMMuaaVNLgh39IH
         GQkS1/0TKzwqSRiIhhOxjaJ4XzzAtyw8aphaf9deuRneTXx8CltoXykkv3GWzLkBm6yC
         LD7C26+jLXut1NYs/dsLkPEXduSYBcaa9GbuT++7gnsNg5v/d5JmKs+v0iRsNgBGIPqv
         +yzHgSW4ViARcueEfbdcHL+7PCR1/d24kSSaBt0PSKQoKpfDQefWavUeNcocAHwQfHWv
         eyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0kLlLse1yCPirtczOxDDSZCB4FvjR8XNywaHVA1Pwc=;
        b=sKVTw0Wlm6Fk3h1cYiNEKJhIlZFpDLHKYqGIjPE5u2tpK/eHpyivEaWI7VG1LdD0b5
         jaLHiFiRqHIlPiDgg1ualVSFz+G6mAv4nq4lb9qM5N50r3kzjo0trffOr+pswRe/2JQa
         kRXwalqLTOizVK2UpBMVBRlzup8H3GDeJrYnhrV2z3FqSy1WewyTbbbjovMVEZuiRiTS
         FhFBqgrAEqElOoKLLz9M8SKAJo89S4ClWHf7rLGvJ/4tUqofHyUfwqMtFYNG2Pu+UgIW
         frLKMJFiX0GCh9u/w6h+frFwrVB4Zva6Xp063fzO0Swmsvv9l3LbC2v9WQ0TOeBbuZrV
         8tpQ==
X-Gm-Message-State: AO0yUKWSvuLFVNRCN5AqfqimoA+nc3dXsHZ7jQ6o65Aq0zTZPL53mloX
	e1vPAchU45JIx+xi60FGwz3Vjg==
X-Google-Smtp-Source: AK7set9B+Xcb2LYUhA48rJUnYS1VfW+x62mSdAdcBqpeb45rwwLhIrShsfPRFXkhx9V3FdnlgPQ8Fg==
X-Received: by 2002:a05:6000:1182:b0:2c5:52fe:4622 with SMTP id g2-20020a056000118200b002c552fe4622mr11053258wrx.55.1677144619357;
        Thu, 23 Feb 2023 01:30:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002c55efa9cbesm9749951wru.39.2023.02.23.01.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:30:16 -0800 (PST)
Message-ID: <b99ed483-ab56-f5a3-d2f2-c0451de271cc@linaro.org>
Date: Thu, 23 Feb 2023 10:30:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/2] i2c: aspeed: support ast2600 i2cv2 new register
 mode driver
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-3-ryan_chen@aspeedtech.com>
 <63986fb1-f8d4-f348-bae9-72e08369213b@linaro.org>
 <SEZPR06MB5269B032022D3D7286E59D36F2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <77480142-a2c0-f6da-af0e-d3f01f72ac53@linaro.org>
 <SEZPR06MB526909B8D4313CA5F33074C5F2AB9@SEZPR06MB5269.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB526909B8D4313CA5F33074C5F2AB9@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 23/02/2023 01:58, Ryan Chen wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, February 22, 2023 4:28 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring
>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andrew
>> Jeffery <andrew@aj.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
>> openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v5 2/2] i2c: aspeed: support ast2600 i2cv2 new register
>> mode driver
>>
>> On 22/02/2023 04:36, Ryan Chen wrote:
>>
>>>>> +
>>>>> +	return 0;
>>>>> +
>>>>> +free_irq:
>>>>> +	devm_free_irq(&pdev->dev, i2c_bus->irq, i2c_bus);
>>>>
>>>> Why?
>>>>
>>>>> +unmap:
>>>>> +	devm_iounmap(&pdev->dev, i2c_bus->reg_base);
>>>>
>>>> Why?
>>>>
>>>>> +free_mem:
>>>>> +	devm_kfree(&pdev->dev, i2c_bus);
>>>>
>>>> Why?
>>>>
>>>
>>> Sorry, those are probe following, if any error, will goto this label.
>>> To release mem/unmap/free_irq. Is this unnecessary?
>>
>> Releasing managed resources is usualyl unnecessary. Therefore I am asking
>> why do you think it is necessary here?
>>
>>> I saw many driver submit is remove all probe fail goto label, is just return
>> ERR.
>>> Do you mean I direct go for this way?
>>
>> Why would you do it differently?
> 
> Thanks, I will remove those labels, and modify to dev_err_probe in previous probe return.
> 
>>>
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>> +static int ast2600_i2c_remove(struct platform_device *pdev) {
>>>>> +	struct ast2600_i2c_bus *i2c_bus = platform_get_drvdata(pdev);
>>>>> +
>>>>> +	/* Disable everything. */
>>>>> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
>>>>> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
>>>>> +
>>>>> +	devm_free_irq(&pdev->dev, i2c_bus->irq, i2c_bus);
>>>>> +
>>>>> +	i2c_del_adapter(&i2c_bus->adap);
>>>>
>>>> Wrong order of cleanup. It should be reversed to the probe, unless
>>>> you have some reason, but then please explain.
>>>
>>> Sorry, this in remove function, it should do i2c_del_adapter(&i2c_bus->adap)
>> in the end.
>>> Why this should revered to probe?
>>
>> Because it's logical, you do the same with error paths of probe, it it usually the
>> only way to make sure some of the resources are not used by some other piece
>> (e.g. interrupt handler is called while i2c adapter is unregistered).
> 
> Sorry, I can't catch your point.
> Do you mean remove devm_free_irq(&pdev->dev, i2c_bus->irq, i2c_bus);
> Keep i2c_del_adapter(&i2c_bus->adap) here, because interrupt is called while i2c adapter is unregistered ?

Again, maybe clearer, actions should be in reversed order comparing to
the probe actions. Why would you remove pieces of code from here if I
asked to do them in different order?

Best regards,
Krzysztof

