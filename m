Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3B969F029
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Feb 2023 09:28:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM8SZ2sGvz3c9K
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Feb 2023 19:28:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jHB+t+H4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jHB+t+H4;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM8SQ3wfCz3bNj
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Feb 2023 19:28:37 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id l1so6605026wry.10
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Feb 2023 00:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLFMV5iAE6vR4P2SIlhoSPSGtCrLcwNMxI3aYuG3Z2Y=;
        b=jHB+t+H4R7ui2sqZfxcO/KdAQ7pJ82WQR8pB9ODA4zULtHVq0+ITHtkxoS7GU+f1km
         jFe3neGlT1ObrD+Jrffq1iW4olA3ag0Vda03HemP0F2VZe2rvLtW7hlnFE11iOghrvLU
         73cH1v5Tio1/FY5T81MOHsLwhZ75Aaqzzn3aAn8m05P4tIxKsRGUsr+MEnfTo+O20O3S
         nKpNL6JuFaGdVIGJNcF+8ncfqeLKV+Frtle+g4tjgpMKcdW/T9Nqm2BbQSj+P3HVDC8n
         mjkkLdvgagZft7fWxpVWQoczB6yUsuEzYGydL7aAXn9Gava76R8Sa1ySoFLjmwC9ihJy
         /DEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLFMV5iAE6vR4P2SIlhoSPSGtCrLcwNMxI3aYuG3Z2Y=;
        b=bpQlp0CQee54B4Ps72R3lSRbNoLlBLmkVkesfQWGnp28EBuOo60+RlasJv9f5BABmf
         cRHUv4wOAH2s6v7uJw0EiA2YT3r/EMB/utepiD973G66912RTIxD5LueZqTniLD8AJTJ
         JiGVtoQ5M/fr/0grzE8u18xajoz8eFKCJ4mHhIKrl256NT5L0jCvw4wRJwOlIXuGSyIj
         3PAvSu32YqAqKtcBycGbM2cz/h0v7709JvM8dn3LfC7AzXqyggTSTVUseYpwTQHl+X2h
         ECub9uCyxzgsgeuq8A4b1jT1q/vcfp6l16LCudw8H72+SsdD282zgSheBpbFSQT8MrQA
         G4OA==
X-Gm-Message-State: AO0yUKW9TOuhKvxMhixifjiQWT93YCrTw8koP2uxLpk31R6e4p4Fekn4
	06bgHeRsP3ryKVLwBqu/uVvjPw==
X-Google-Smtp-Source: AK7set+jDApicTjSI5qypPYbTiOAoFcQmVCJyWdI/f/zCeNCFE0XoE6sPmq0GGUIRSinRQMbWsxscQ==
X-Received: by 2002:a5d:45cb:0:b0:2c5:4f04:c50d with SMTP id b11-20020a5d45cb000000b002c54f04c50dmr6530784wrs.48.1677054509270;
        Wed, 22 Feb 2023 00:28:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a8-20020adfed08000000b002c55cdb1de5sm6382130wro.116.2023.02.22.00.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 00:28:28 -0800 (PST)
Message-ID: <77480142-a2c0-f6da-af0e-d3f01f72ac53@linaro.org>
Date: Wed, 22 Feb 2023 09:28:26 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269B032022D3D7286E59D36F2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 22/02/2023 04:36, Ryan Chen wrote:

>>> +
>>> +	return 0;
>>> +
>>> +free_irq:
>>> +	devm_free_irq(&pdev->dev, i2c_bus->irq, i2c_bus);
>>
>> Why?
>>
>>> +unmap:
>>> +	devm_iounmap(&pdev->dev, i2c_bus->reg_base);
>>
>> Why?
>>
>>> +free_mem:
>>> +	devm_kfree(&pdev->dev, i2c_bus);
>>
>> Why?
>>
> 
> Sorry, those are probe following, if any error, will goto this label.
> To release mem/unmap/free_irq. Is this unnecessary? 

Releasing managed resources is usualyl unnecessary. Therefore I am
asking why do you think it is necessary here?

> I saw many driver submit is remove all probe fail goto label, is just return ERR.
> Do you mean I direct go for this way?

Why would you do it differently?

> 
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int ast2600_i2c_remove(struct platform_device *pdev) {
>>> +	struct ast2600_i2c_bus *i2c_bus = platform_get_drvdata(pdev);
>>> +
>>> +	/* Disable everything. */
>>> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
>>> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
>>> +
>>> +	devm_free_irq(&pdev->dev, i2c_bus->irq, i2c_bus);
>>> +
>>> +	i2c_del_adapter(&i2c_bus->adap);
>>
>> Wrong order of cleanup. It should be reversed to the probe, unless you have
>> some reason, but then please explain.
> 
> Sorry, this in remove function, it should do i2c_del_adapter(&i2c_bus->adap) in the end.
> Why this should revered to probe?

Because it's logical, you do the same with error paths of probe, it it
usually the only way to make sure some of the resources are not used by
some other piece (e.g. interrupt handler is called while i2c adapter is
unregistered).


Best regards,
Krzysztof

