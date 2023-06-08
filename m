Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C3472793E
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 09:54:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGgz1J1wz3dx6
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 17:54:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZRSQm2Sb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZRSQm2Sb;
	dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGgp3T4Rz30Qq
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 17:54:12 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977c89c47bdso62293666b.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jun 2023 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686210847; x=1688802847;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2Twlaiedobdlie44+yvfCt28qgI5GSJ8RzJigOLjck=;
        b=ZRSQm2SbKPvteuLLgPLe7nCK0DjGUrekqwVBx0rP+syuDvylnzfmb9qt24XNGZ6ulz
         na0MmTT2NJye+PzluJ6LcW3DhyGErcL2K9VGlFTfTw4FUZYh5x82Dg4HdlD8f8c9eAdK
         20FmAs+cjr+D0BAnTZeCULB9MfbUQI0aWqS9fK/2XrJ6CdTDXppj4kl8ief1NvuE9kvM
         YTX6BLXI/s9weYeS30cj8tfGn8Ib6uTXNqvKs7eSNgBq87jQ9lhpPelGD/cXeUU9G5kS
         mPtnmnk2vwG7uuLODA3vMWi+tzqEhTzBevkTldS6+gIxMEci+LsUfozVz4OAG1C1Hcee
         7peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686210847; x=1688802847;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2Twlaiedobdlie44+yvfCt28qgI5GSJ8RzJigOLjck=;
        b=VA8/oTHbhpvubEMLpqYaXmGUiy7G9ql485MudIqogVnkMDR4vrmx7thEjne4V0vRBh
         Ojx8WJY7uLx2p4MK/v+QtTmsomei343tKRpEWqxbXLsrmZ6lr58PlqMbMxPPwC0V/YRA
         sm52feVxsqIaH1pvIKI2u6A4Mx0e5QM6klVhsedDSrbXfvQJm7Nwzx388Ysn3NUJQzBC
         iY5oVczYqdCckPBhoyF5djD+X4DGcXga4XC27g/2vUiCX7LWQ74nLUH+0yqnhOunvMrq
         IgNnCi9j459L7qXfcvClpC1BOJULu1YapdpHGQt7RQlSTYrOPJs4D/RwqZ7EwPpGEzXp
         FNaw==
X-Gm-Message-State: AC+VfDwnNDYbCS98MAqX/azZ1Jk5KZpy+JU76uFn4v1vWQ2coTLi/ekf
	lhF4kF5zKuN+E+6bJxx7WwUd9A==
X-Google-Smtp-Source: ACHHUZ4fomm2ljY9Wjm1oqS8KoBZmj6ojHu+GGsGRunrLXkGdjHgEpVBmbct0AHYw4BdzlGEQgP2SQ==
X-Received: by 2002:a17:907:86ac:b0:977:d48f:97ad with SMTP id qa44-20020a17090786ac00b00977d48f97admr7723485ejc.75.1686210846735;
        Thu, 08 Jun 2023 00:54:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n27-20020a056402515b00b00502689a06b2sm235647edd.91.2023.06.08.00.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 00:54:06 -0700 (PDT)
Message-ID: <61278e12-ba39-4503-ca74-a7118b0f6e99@linaro.org>
Date: Thu, 8 Jun 2023 09:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
 <4dffd320-8e30-fb30-6ded-79519afddc21@linaro.org>
 <SG2PR06MB3365DD80EA2FD026D400C4A78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR06MB3365DD80EA2FD026D400C4A78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
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

On 08/06/2023 09:47, Billy Tsai wrote:
> 
>   >> +
>   >> +allOf:
>   >> +  - $ref: pwm.yaml#
>   >> +
>   >> +properties:
>   >> +  compatible:
>   >> +    enum:
>   >> +      - aspeed,ast2600-pwm
>   >> +
>   >> +  "#pwm-cells":
>   >> +    const: 3
> 
>   > 3 cells? For one PWM? What are they?
> 
> channel, period and polarity.

Don't cut my responses. You wrote you have one PWM output, so only one
channel. What do you put then in the channel?

I will start NAKing such patches without DTS user. It's like reviewing
fake code for some unknown solution and trying to get from you piece of
answers one by one, because you do not want to share entire part.

Best regards,
Krzysztof

