Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D17570490E
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 May 2023 11:22:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL9kc23C4z3f62
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 May 2023 19:22:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ryHwipEU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ryHwipEU;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QL9kT0yPvz3bmP
	for <linux-aspeed@lists.ozlabs.org>; Tue, 16 May 2023 19:22:38 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51090206721so98140a12.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 16 May 2023 02:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684228955; x=1686820955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tmbe4ardltZO5J/zFBdgY/LnMe5yW9e5u5O6/jnVcFA=;
        b=ryHwipEUBbAf6sqEkxpZVnrX55o8fp/MzOa3Pt/zEydT4KIrIggBsUCmFUskSDYgxk
         WW9khsj9q1Zn1eAoovpUJgUOhf6P+KSzJ47p9W2DLbYFu5QUjhXZF850tj5MCobIlSJF
         jzFP+4eQQmX0NRgwElIPVz+prcH9SIdoxjBO+YmmOaSGuSgaisnXKriJkRm2Piex97d3
         GIzWMxpgbeFGzbrpZt2O9AYNhiJO3P6Hemls23mZwmMi2HDL8wLXy/HYtvSYeSrhFSVs
         UiOqmgo5wXqBvLyHJXD0MeQjqy0oyrW2JD8ImEkF1V0JzsntNJW3wZeZxqUatldFL0cw
         9MvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684228955; x=1686820955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tmbe4ardltZO5J/zFBdgY/LnMe5yW9e5u5O6/jnVcFA=;
        b=TWJT5JbIzzm/jS9593yHCCz3QaTA21/3Wc3V0xrixr9/AYhcZdDfRnYhWy0coH7T2F
         cm8QBJbbqU4gdnB6A3LHg5/S8/XWACqfsysbz09NZD5RZUu4k+MCnVC/3T49dhpWqBZJ
         PTAlwpX5Yj5htxUeIClh7R5i1/2mK8K+/LGtNHm3woeEi38dsYzbyXMlsMj3iFfIIgi0
         IIBw65GeOif9D4rbgdxRxjim8c/II48N7xrz/G3GjSK1fMfj2DPyZJKrl0UKNaIG+U0p
         VJL89nWCL8TPyxcseQd3GHgjhSzYsJdeF8712J9cF/x8gXqXfBOtgkObY2gCkDLo27PV
         aYxQ==
X-Gm-Message-State: AC+VfDygopIZFZZfEa8LOcKqxPvdDDz8zuVjbgaCLdrX4mCn4gK4m4SV
	T5dSKmlLVTl6uHB6wjUkq5ZQhQ==
X-Google-Smtp-Source: ACHHUZ4tuI9fGqIXB1tjrf4HSQs70Nzwg/KXG3Ygm9m/fj9Q6ly1yYElwDLUzzMr3Ka1UabKWd04CA==
X-Received: by 2002:aa7:d48b:0:b0:506:7304:15d3 with SMTP id b11-20020aa7d48b000000b00506730415d3mr26587956edr.14.1684228955508;
        Tue, 16 May 2023 02:22:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id m17-20020aa7c491000000b005068fe6f3d8sm7960982edq.87.2023.05.16.02.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 02:22:35 -0700 (PDT)
Message-ID: <2e06e7db-64f9-51f8-adf1-b240f30a2608@linaro.org>
Date: Tue, 16 May 2023 11:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: arm: aspeed: add Inventec starscream-bmc
Content-Language: en-US
To: =?UTF-8?B?Q2hlbi5QSiDpmbPmn4/ku7sgVEFP?= <Chen.PJ@inventec.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <28f0ce0a82464083ae24f9ef2f598425@inventec.com>
 <c5dd9b64b4754da8b11efefd97527a4f@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c5dd9b64b4754da8b11efefd97527a4f@inventec.com>
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>, =?UTF-8?B?SHVhbmcuQWxhbmcg6buD6Iux6YOOIFRBTw==?= <Huang.Alang@inventec.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 16/05/2023 11:15, Chen.PJ 陳柏任 TAO wrote:
> Document the new compatibles used on Inventec starscream-bmc
> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>
> ---

Please always sent such patches together with DTS which introduces the user.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for acks received on the version
they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof

