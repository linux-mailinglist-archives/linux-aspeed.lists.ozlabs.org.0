Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3C7698568
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Feb 2023 21:18:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH8XP52Gtz3cgm
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 07:18:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CMTgnuiG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CMTgnuiG;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH8XF6GByz3cLc
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 07:18:03 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id m14so20366322wrg.13
        for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Feb 2023 12:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWNTWWkTsrwbHiQ47mdX5pMgCivT3DFoqhaaJ7ihy2A=;
        b=CMTgnuiGwiQsea1Sd6odLVgvg1S5toQiP/KqfHF/kU8U1BTmaxTmcUgEBDrA935SDO
         Gcs11rVgm9HQugH5nzsUDZ79NUA31L0DyszfiRHxmSiOWOAPFbLz0u6nwX3MzvhC3y8I
         MArr8om3fCcsiDqpjR212tBg+Rrykid834KBSPQF+9hrybHxHe+ylKeTAGdsuMPalPs1
         MhtmUTQb0LOAiVF5KiZf5Y+YtA+tu/MSIQYhRGZhpzSw3ao0aDlO47Uc0QDoCWcFJZsI
         My7H1D9xXjz5ByD4/CZnUP3LLLXc8zQRci9we7+rXZbLhfNNQVqFSLnofy0yiXqB5mxs
         bPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWNTWWkTsrwbHiQ47mdX5pMgCivT3DFoqhaaJ7ihy2A=;
        b=bsneLuw1FU3agHelk9wyoegvR7obv7A1c64f5z2wNn2pbbC7746qAwS8ZLooZAF98b
         CZIB0vTN2WkQLS9KMDggalTyOAToR7oHkBA65XPt1DKvRX2NfoueKyU9qTca87rA780s
         nq0+rrDZIAMPK3x2JDjxrkWHdN8jOKntkWGwQoa+Ze8bLeztwhVAG9dDzm1GMggMfb39
         o8yRkibWWNd3jvOfEbVzeCL2ueIVFrEBdzTog7GcWX0l0zeIBiEVxIHrTR1WRuv9kTkX
         yKoHsYGR6hDPZJBVbNtzrLpWRRuvuZbIPX3TpMt6blxtV4RYNmeCftiLXm1uaYZLr03V
         5hNw==
X-Gm-Message-State: AO0yUKVzS8P/VJJ5cCM+zyvVO3SbE353DYrurCOodfluBqMXtFtEyaF7
	VjYrA3IXyZ2NX0MGOV8GJNLpSg==
X-Google-Smtp-Source: AK7set8VH1qhZGFMpjgR8/ShMCOufa8CJRWa7LAZIqOnVqbqOnGICuSJcLOwC28dLybZKi72vOFs4w==
X-Received: by 2002:adf:f40f:0:b0:2c5:512b:afc1 with SMTP id g15-20020adff40f000000b002c5512bafc1mr2641381wro.47.1676492279913;
        Wed, 15 Feb 2023 12:17:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d58e6000000b002c54c7153f0sm13479318wrd.1.2023.02.15.12.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:17:59 -0800 (PST)
Message-ID: <b58fad13-12d5-346b-9452-d345c7bf5327@linaro.org>
Date: Wed, 15 Feb 2023 21:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
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
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-3-ryan_chen@aspeedtech.com>
 <b0f55494-3a17-4d87-7b8f-5b078503cb53@linaro.org>
 <SEZPR06MB52690A1D06F3CFEAAF1FDBDEF2A39@SEZPR06MB5269.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB52690A1D06F3CFEAAF1FDBDEF2A39@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 15/02/2023 06:43, Ryan Chen wrote:
>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - aspeed,ast2600-i2c
>>
>> NAK. It's already there. Please do not waste our time in submitting duplicated
>> drivers.
> 
> It is not duplicated, as my description in cover " This series add AST2600 i2c new register set driver"
> So, this will be different driver compatible. 
> The original compatible is 
>       - aspeed,ast2400-i2c-bus
>       - aspeed,ast2500-i2c-bus
>       - aspeed,ast2600-i2c-bus
> So the new register set compatible is "- aspeed,ast2600-i2c", remove "bus".

Bindings are documenting hardware, so I claim - we already have this
hardware described and this is duplicated. Otherwise - what are these
two I2C controllers and what are the differences? Why they do not have
really different name? Bus looks more like a mistake than a
differentiating name.

Best regards,
Krzysztof

