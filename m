Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0372778A
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 08:44:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcF6p3TPjz3dwp
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 16:44:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JJOaHAJB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JJOaHAJB;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcF6h39y0z3cNY
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 16:43:54 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-97458c97333so48792366b.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Jun 2023 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686206630; x=1688798630;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKifchXYMlN5+2AWBL2iJu9wgd/o/GbojOV3x5kNS0c=;
        b=JJOaHAJBSsmNiXdcSeQRVYguDgcMAPhD/0NvwEH+rwM7oadea/3imyyUH7GrPuTVua
         GWSi9tgu58jqb30nw4MqAlo7O5SWGMJ11FRooQrXh3yOTIYbgaQEPuLqC/Lj80S4sMCR
         1OLmmdxqQGHIPGYlODMhf9sfAkzhi432GaN6FH+6a/D2O6abiJC5FwWROcARIIFB1WwW
         Zfk2lDW7MlAyOtthOz0DAKJuvJUgp3Xhka1pZonjWO/rAHZAMdVhZl/aNbhZvNrG9uBz
         kBIisZDL7MwN6ZGMIOPrR/+Odg7x691Ct67h/alSjDtLPrvpNdp/5LEiK4kDM/7Jlkv8
         FG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206630; x=1688798630;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKifchXYMlN5+2AWBL2iJu9wgd/o/GbojOV3x5kNS0c=;
        b=DqretnWIA0DAxCowrn33Gga2VCgtpJ7egfIJwHURI0dgE+hvqDm0kiLLz8bQ9Oi7qI
         zuXfxiYlG4S6DkeiWBtaVPwlE/OPVd/c27CWWh+sQohIToY5FaY0hAIswqyNaIZHp6uz
         qnSQJKt8MfYWwZwh0/owOWjaXQnsiwiY96NzwjvqOfDFNkRBzNk/DX7KP09tmp27+x/X
         9gysj4y6hL0R8RyXk/b1gblwAQoyK+Y42vhwX8EOULnuxzHa1AzGGsD5yJ9cNPF0KfrE
         sLQB3+Clt0ctA5Od0aU9dZcxA2LMNnZfQQFMsWMIVi2dQnSl47dKYjpE433+boOtce+p
         M1EQ==
X-Gm-Message-State: AC+VfDw+luyaxmzwuqn5wwBfs39t1Sz3fecU3TR5gqbPXi8YpwD2VEVF
	DwWEaBVIDKKnt+0n9NPutxNCiA==
X-Google-Smtp-Source: ACHHUZ615GandBmkZOQAM6x5MNaoNmT/us1RhpkDbmH/Hf32IQotU4lzJJnZ910ZD8BTz+8svgYJMg==
X-Received: by 2002:a17:907:72c9:b0:977:abac:9635 with SMTP id du9-20020a17090772c900b00977abac9635mr7665424ejc.20.1686206630126;
        Wed, 07 Jun 2023 23:43:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bq15-20020a170906d0cf00b0094edfbd475csm273385ejb.127.2023.06.07.23.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:43:49 -0700 (PDT)
Message-ID: <ce99a709-ba4a-eb53-39ac-88a194879000@linaro.org>
Date: Thu, 8 Jun 2023 08:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v4 1/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, lee@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-2-billy_tsai@aspeedtech.com>
 <c4b188b1-06a4-3cb0-a758-e12942e1f67b@linaro.org>
In-Reply-To: <c4b188b1-06a4-3cb0-a758-e12942e1f67b@linaro.org>
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

On 23/11/2022 09:24, Krzysztof Kozlowski wrote:
> On 23/11/2022 07:16, Billy Tsai wrote:
>> Add device binding for aspeed pwm-tach device which is a multi-function
>> device include pwm and tach function.
> 
> Subject: drop second, redundant "bindings".

Where did you implement this comment in your v6?

> Also use proper PATCH prefix.

Where did you implement this comment in your v6?

> 


Best regards,
Krzysztof

