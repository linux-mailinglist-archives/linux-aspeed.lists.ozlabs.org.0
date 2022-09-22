Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3B5E5B9D
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 08:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY5SG3vCKz3c2q
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 16:47:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vk1GuB2k;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vk1GuB2k;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY5S80hzyz307C
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Sep 2022 16:47:19 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id a3so13048295lfk.9
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=pxOUMi2UlNuNZNBfBYrU6Nf39rmJtF0e2MNNct3zImo=;
        b=vk1GuB2k4kmJdpMkTG4B7+OVahxU0ZUd6kIXxWgoP9V42D5i1SrhBqxiirtcRKcZqq
         BCbNctyioKxFEQAhmXvM+E5clDZZAoicbDe/x+7/FaVBK6oo9OxDaYiWT4kwClcRE2So
         63ggoSk6jAnUJECMY45z97Kju1xzn8lzGPW0+xRR/Zq7GW1+Xa93ySFNLxSaajG9z3J/
         +meywODDAS6WPee4PcMaG3eaevESx0+1gmFJlv/hBVZC60i1RTvOpMUSlYIGNZEGeCRL
         kFIg9d6WpWgMt6wj7KISVouHHkxaCMC4HvK1W+6qeI2odLKuNczX3fAZsoiDvTdtqEag
         yuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pxOUMi2UlNuNZNBfBYrU6Nf39rmJtF0e2MNNct3zImo=;
        b=4s0vHoLPudC0xYRoK/tb9nVaZ6BK3bW7nB7UxaypBXnNZQUGSoSo6ConTOa7jyDgfN
         giaB1aw7zWwij95Udu4lp1AqDnQ4mNADhUVV6Le5KuJCDyOaNilUDtZzVyaS1V7H5E5q
         3422jJImgux8n/bYGVzop9z94DPCpMqMeoP9dUbLWo2oyx3p9TOPja9uMq6gCht/loB3
         WwJd1iDen04M1jU8LGgV0qVPMzE2YtOY6RJ0mrF81R2h9bPdOgksphk+sG1vxhxucL/h
         Nk1Z4KG7eFn0LGUGabbtr0lXP07WA70raah+hAi/oht8r0YPdyE9TPkmhr3O5nCbAkui
         wJ5g==
X-Gm-Message-State: ACrzQf1Nz/khvUkreHfLpyQI8fFtdZ3Rs7l3+Ds6V02dTVdvIaKhxevt
	ipZ5++saOrrj+dyykPaxlt7P5A==
X-Google-Smtp-Source: AMsMyM4MYGSd6TlYxlHDNat+xh7DY9HHdMhnES4FG2AUReeGbG1VnfcySuyKxUSSFKjCwz1VpzjPRg==
X-Received: by 2002:a19:dc1a:0:b0:494:903a:1fa8 with SMTP id t26-20020a19dc1a000000b00494903a1fa8mr660247lfg.55.1663829235551;
        Wed, 21 Sep 2022 23:47:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a2-20020a056512200200b0048cc076a03dsm778352lfb.237.2022.09.21.23.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:47:14 -0700 (PDT)
Message-ID: <035f5834-6fb7-95ba-1569-6dbf8eface49@linaro.org>
Date: Thu, 22 Sep 2022 08:47:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: document AMD DaytonaX
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
 <20220921210950.10568-2-aladyshev22@gmail.com>
 <20220922063514.f6euqlw35jrkpee4@krzk-bin>
In-Reply-To: <20220922063514.f6euqlw35jrkpee4@krzk-bin>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 22/09/2022 08:35, Krzysztof Kozlowski wrote:
> On Thu, 22 Sep 2022 00:09:46 +0300, Konstantin Aladyshev wrote:
>> Document AMD DaytonaX board compatible.
>>
>> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1680833
> 
> 
> /: compatible: 'oneOf' conditional failed, one must be fixed:
> 	arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dtb

Ignore, this is not related.

Best regards,
Krzysztof

