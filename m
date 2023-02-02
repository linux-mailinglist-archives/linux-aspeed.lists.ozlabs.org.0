Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC0687823
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 10:02:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6t980Yybz3ch4
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 20:02:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lDkLv5di;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lDkLv5di;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6t935nL3z3cdZ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 20:02:47 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so801388wms.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 01:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAzoaco2ejEfJ8IOcFTgCAN7HiD6JKdUffxiXGJRKvQ=;
        b=lDkLv5diE/c9URvqEzqU0QRKqW5UIzto2y7t4n/bhgjkwn9WMjnvUQZx449oqwD5qn
         x96MWCiI8k/DiiCILlGjhpez00P5thhk35xt6FQGh74ib2XY7bYo12+UmjOo1Zyt4Sxb
         5vYwp+JT5V/n6FjeOl7gWS8nx3X+kdIsF6e53O8RjPRX96iR+ftVJcIH80uEXQsk+8+C
         Z90IraukxKaIK4Sg82+hgNLglvoniJZT7VH+FUZxt8SDXDpWkpV6KNJBXyIvYG7VgZ1v
         QissFv0rKZXyAPtSnwy9PWS119huCxMjcF3HXW9JKB7NgxD27WvISTXpafC7XZ6YbRvk
         AYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAzoaco2ejEfJ8IOcFTgCAN7HiD6JKdUffxiXGJRKvQ=;
        b=kpxsC88ydBEsasQJ3AJHJAIhxI+MM1SbRPexJgHBGXOk2yUBygGGvVipl5Z2aBym1D
         Hja+8zFO+bXLKPRn3QI7QdDQlFlh8BRsIdZLqxvcDp86tBbNY4Y5ZiULotkpUEMERLCq
         fWVOkSXOr3nAKccwU3EqVYdtPqCSN6v2Y41XvEDw/9W/hzDcsQ2NRVpwkHQKjz9/ZHyr
         X4RW0tjxL2dMMa1BijjybK9sT07B2ZZ96q4BNxcoc0RaskjOZS70pWnhtiH/0BxRksy2
         CdHuTNTCSAmMQdw3uzO9bXowtE2BVNH2vHotEIwcvoV7FdG0ld8X/QwdQblnTuOXykyH
         ZLDw==
X-Gm-Message-State: AO0yUKWXBG7B3zuXqW6/izousT7/dy3DPTDkj02aaBtE1e3z1u+0V+Eh
	cRYxqSRmlu/wDFK9kFJrf8vMHg==
X-Google-Smtp-Source: AK7set9luXTtHtQPjeR6Y3wxBmh7O3wx7Pt57EqX0r7jI3zq/wa0I4gmucrV08A2mLC2lXXAGmct6Q==
X-Received: by 2002:a05:600c:548d:b0:3db:114:a67f with SMTP id iv13-20020a05600c548d00b003db0114a67fmr5047340wmb.17.1675328564733;
        Thu, 02 Feb 2023 01:02:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i6-20020adff306000000b002425be3c9e2sm19444201wro.60.2023.02.02.01.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:02:44 -0800 (PST)
Message-ID: <dcf16715-203d-6357-661a-47c007ce11e5@linaro.org>
Date: Thu, 2 Feb 2023 10:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 0/3] Add ASPEED AST2600 I2C new controller driver
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <ac9be40d-bbcb-02b1-2708-61f88095111b@linaro.org>
In-Reply-To: <ac9be40d-bbcb-02b1-2708-61f88095111b@linaro.org>
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

On 02/02/2023 10:00, Krzysztof Kozlowski wrote:
> On 01/02/2023 11:33, Ryan Chen wrote:
>> This series add AST2600 i2c new register set driver. The i2c new
>> register set have new clock divider option for more flexiable generation.
>> And also have separate i2c master and slave register set for control.
>>
>> v4:
>> -fix i2c-ast2600.c driver buffer mode use single buffer conflit in
>>  master slave mode both enable.
>> -fix kmemleak issue when use dma mode.
>> -fix typo aspeed,i2c-ast2600.yaml compatible is "aspeed,ast2600-i2c"
>> -fix typo aspeed,i2c-ast2600.ymal to aspeed,i2c-ast2600.yaml
>>
> 
> How this can be a v4? Where are all others?
> 
> https://lore.kernel.org/all/?q=dfn%3Aaspeed%2Ci2c-ast2600-global.yaml
> https://lore.kernel.org/all/?q=dfn%3Aaspeed%2Ci2c-ast2600.yaml
> 
> I see it for the first time.

Ah, so v3 was never sent to DT maintainers:
https://lore.kernel.org/all/20220516064900.30517-3-ryan_chen@aspeedtech.com/

Best regards,
Krzysztof

