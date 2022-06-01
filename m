Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8653753A02D
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 11:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCk9k2K7xz3bl1
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 19:19:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VixWWPTJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VixWWPTJ;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCk9b0gdZz2xt3
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Jun 2022 19:19:12 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id n10so2450829ejk.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Jun 2022 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=w0q7w7agqeVzeJoFI0aW/0pLwg+C1kvsWYmBalugg8Q=;
        b=VixWWPTJ2XezaiMDn6QH/mc8juwDFuC9uioDoU9V+mrWz6fabTxHi48gVF79fLkNZI
         CAEjE4jKF00zgp2R4UuRtTGQ/V2DI9Wa6gfA8F0TkWEPQA58c1oHeIwhZFYibE4CuRTN
         50joB2Zrq8ilMbr0GLmGfkchBBwuKjG/57DOTnBEr0zMiRcYrofNk933/tjhE6RX1A7x
         bLhyouUfCQCxLBhzjHo7kDDau9QgFwxecgC1mSCpMa12H5P+EdtH9vNDg2PcVGvxwDeu
         y3dptNbRzcQ1FMT4qajLIVJTLchACkZhMaHHabSNjF/6TCbkzeoi4pCduF/NGL07I2nF
         x/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w0q7w7agqeVzeJoFI0aW/0pLwg+C1kvsWYmBalugg8Q=;
        b=JeR1wVbTTzE54A7zy6QljZHh3KJRUoyvRHOkZGWc6B11EmczprgSsj2fqcsDffv9TG
         0Z/jPzM3ol2RhHtsnw8dL6kyuMjucYy5HnxsXU1KGOzYyO6AbmxGjwwk2jKk+vujjt/R
         14uj2R5XqI/Eb75tB2C6V4bjpSV5U5Ze04DUc3LPZtyYQxwAzXD3Y48b1JpVIfnjXy3h
         mTlp7nvbOQMsUpurnkFqCRnCfEGTpD7ZyuhlcpVQIcUJ6b+dMGu/+JzuHcy/z6uuUrk/
         tROkEr+21jBbhsi8Y8AHInftUhf5wqDfFG00J76e/FhTFZpyH1eMSSVfKfOylVqF6nCJ
         XGeQ==
X-Gm-Message-State: AOAM530Jp3uMU5liZDWJ9myxIr+ie5jq2viC39+jmHDHgATZ1ysoMc1W
	TfyczQnUqQ01/Yph6n5+/6MI7w==
X-Google-Smtp-Source: ABdhPJxIz5yKljtZ01n/8e8Iqvz6i01vdsc3Tj+8YIjD1XxI182o5dWwgzHRLoMv1YfZoH7CLyT2yA==
X-Received: by 2002:a17:907:7f20:b0:6fe:f0c8:8e6f with SMTP id qf32-20020a1709077f2000b006fef0c88e6fmr40303647ejc.453.1654075149570;
        Wed, 01 Jun 2022 02:19:09 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u9-20020aa7d889000000b0042b5cf75d6esm630769edq.97.2022.06.01.02.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 02:19:09 -0700 (PDT)
Message-ID: <d1ffbc04-0c80-369e-a1dc-e47e50f52340@linaro.org>
Date: Wed, 1 Jun 2022 11:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/5] dt-bindings: crypto: add documentation for aspeed
 hace
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220601054204.1522976-1-neal_liu@aspeedtech.com>
 <20220601054204.1522976-5-neal_liu@aspeedtech.com>
 <dca283db-0b2e-1fc1-bc76-811c4c918fb5@linaro.org>
 <HK0PR06MB3202D6A6C66480BF60ED829080DF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR06MB3202D6A6C66480BF60ED829080DF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
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
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 01/06/2022 10:01, Neal Liu wrote:
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    maxItems: 1
>>
>> You need to list clock names, however usually it does not make sense to have
>> names for just one main device clock.
>>
> I think list clock-names is optional, I'll remove it from required list.

I actually suggest to remove the clock-names property entirely, if is
has one generic entry called "clk" (or "vclk" - the same). Do you
already expect adding here more clocks?


Best regards,
Krzysztof
