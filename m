Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D151769C8A8
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 11:35:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKzMw48j8z3c6V
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 21:35:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Zs+dadc7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Zs+dadc7;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKzMq3PDrz3bNn
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 21:35:35 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id f13so2225367edz.6
        for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 02:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4HZjaEfXhxPqqJJhqyI7tvXB4DOG6uqP5FwvH6q4eU=;
        b=Zs+dadc7Co8wjuK9wb8wBh+RJxOdxm2VM1QAdx8dk2R4i5UwJPfksduHDhHv5ItFZ1
         aLptINgWArsWRUNJcmTGTY6ithb8Lzh9k+gEqoKz5MnHQ1YokbWVgxffQJNFW2qZeUiz
         8RAbkrEgpXdRwSfCDXbn2wDCQ/7QARclpSGTRWV523vDeqr5iPyHVVcKRHuoRJrGnL8W
         wb/cSzvLYHY7+RNa2S83DpaiZrAhR4GBM41+CY9urz+VwQXifXCz49exQfV9B1UADNeH
         RKbc76FbmRsGOQI3LsRyRSTAdIime1dOUIu8n6f1Z6HGMU/ww+fbHFrNY81Xly64MYAJ
         0r+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4HZjaEfXhxPqqJJhqyI7tvXB4DOG6uqP5FwvH6q4eU=;
        b=OAA1hv/PhkQaVyqHZ/9MFhdQVxO8t0KDwxU6e5sIcRxFMjkh/Lo0Dq4kwW6BKNbARH
         nDXp6yOOAtx9UnnBc9Vgn9tA2WWqAvA9wIff4z2GCLhw1iMpEQSdyOKUtC2qRfxhfYhM
         9xAtT5nvyMX84cB/ZxiSSaksApmx7wWqXPpMTmF3v0zko88vKFvzz/f5TsKuCNXjCcyV
         9mUp+oIIPYH6G5yQk+SY+RkT6GuqEIED/0KhvgblGXkoHE3nzjRy8I8p4uOEg+zxO8/c
         iCCW3kfgk2gu8p1n/xigvelbB1VHuwUBFU6QeNZc5czr2woq11voAfBPUxDJXp2attmU
         goeA==
X-Gm-Message-State: AO0yUKWTyLac22ZvW3zeKGoOSNdTkHF4Kr2u9u6v0E2M9zvC0KsL5APV
	NV4MMK8zzJpgcVyQdWqIhqs7jw==
X-Google-Smtp-Source: AK7set9SOK81yO3nimO9NuGkdvcul+tD3RZ2vpuiPwLroUindDRTeJPJ+nruZibhYU2AZJydG+C29w==
X-Received: by 2002:a17:906:c407:b0:8af:5154:ff8e with SMTP id u7-20020a170906c40700b008af5154ff8emr8474579ejz.15.1676889332553;
        Mon, 20 Feb 2023 02:35:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y21-20020a056402359500b004ab33d52d03sm1446406edc.22.2023.02.20.02.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 02:35:32 -0800 (PST)
Message-ID: <abec828b-9b34-fc5a-cd36-8be6f20dfd25@linaro.org>
Date: Mon, 20 Feb 2023 11:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 0/2] Add ASPEED AST2600 I2Cv2 controller driver
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
 <54ef0dee-30dc-3ba9-d2f7-8270204b5505@linaro.org>
 <TYZPR06MB5274195CB92C4604280A776EF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYZPR06MB5274195CB92C4604280A776EF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
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

On 20/02/2023 10:56, Ryan Chen wrote:
>>
>>> And also have separate i2c master and slave register set for control.
>>
>> Since several of my questions remained unanswered and quite frankly it's
>> fruitless... so let me read the commit msg directly - it's the same device, just
>> with different register layout. Having new compatible makes sense, but this
>> should be part of old binding.
>>
> Sorry, I am confused, Do you mean I should base on original Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> Add new compatible? Not add another aspeed,i2cv2.yaml.

Yes. New compatible and new syscon phandle (constrained to specific
compatibles in allOf:if:then:) to the old binding.

Best regards,
Krzysztof

