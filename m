Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C94727B3F
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 11:28:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcJly3byDz3dxl
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 19:27:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Iv/XXxWB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Iv/XXxWB;
	dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcJls2770z3cLT
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 19:27:53 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso681512a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jun 2023 02:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686216469; x=1688808469;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4M4AXwuus3QNcxn5wLRmX6dWFPy9Bx8ysuH50InMwSo=;
        b=Iv/XXxWBX0f2XCCR6QA12a+irtrS/oHxhfmmy7hqMHSK7RAzwb9HV+XNm5fKtRB0QF
         k6beldcZQW2GRHQE+1UonNwxq60CY/l6n4IJeMZpujS1xMr50FRH9qLdxDCIgRCsuTDu
         Z2vqQqsbZ/BvujbnKRRIIbZ0mc4/U5+4GEzJw9aI4wOEMpeidmed3Dc21wgupOgRVec1
         7mMA04e5O3EeoB9JJ7pSX2P2ftncDThKdmmxKh7fVi5MXEf7vSwk78e+JVIqwLaXYnTn
         rFTUV59anSVgY9cSY/QoPl6O4eGFQOOwkRaTAyJAZpNqAFZq6sl+KqPvyaB0W9RozFm/
         t5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686216469; x=1688808469;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4M4AXwuus3QNcxn5wLRmX6dWFPy9Bx8ysuH50InMwSo=;
        b=TWlO2qlwaE+jiWYYEOOXSPgDRyNw2HHnw0yYwLwbFQVbTo0W54u5J4Etajtr12EkYf
         2VOoPRpk1cG7VXRAakLRBbi10l3KoOb6/hrSgFVM9XnHYl24YhCgt2NKHkCtEy0k25AY
         6yY7KUwD4lwH809H/c+enrWjuaENP7WT4X/dWfZ9oifE3mZ6C5EAgX0SPc+4Jc9vhYSS
         WictwSv6Z4T3QwB2ByI5/ATiZ6/44BpWwid2kfY6NzBt+dGfvHXlrpPbpztZvY+ER6ka
         9fj34MMEEwWF8poTAyEhOGd/6bQqRHwitWzdbT0jWNQUnr453+78R1V+mVEi/DbS/X6i
         hlnA==
X-Gm-Message-State: AC+VfDwmeP1pnYjpyjM0+D3RHqNB1pPi72rNAaYA9ijkM5BIEjZO3hSe
	9WGkiFFOEZTul+02Mcf7qnGhXQ==
X-Google-Smtp-Source: ACHHUZ61lgRdfNH+4iXxEctmcKpZlKsW/Cb7gNYirHVgh00nzDxu+CtNqzKNbg5xj0GFO96YbeoOVQ==
X-Received: by 2002:a05:6402:613:b0:516:7928:ed70 with SMTP id n19-20020a056402061300b005167928ed70mr6344488edv.3.1686216469187;
        Thu, 08 Jun 2023 02:27:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n17-20020aa7c691000000b005105f002fd1sm316888edq.66.2023.06.08.02.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:27:48 -0700 (PDT)
Message-ID: <5b5ccfb9-d6ea-9f22-bc8f-c048da726cc9@linaro.org>
Date: Thu, 8 Jun 2023 11:27:46 +0200
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
 <61278e12-ba39-4503-ca74-a7118b0f6e99@linaro.org>
 <SG2PR06MB336528007D2685F8D95DF4078B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <fb3cb26b-61d7-5f57-41de-f419aa50ac0b@linaro.org>
 <SG2PR06MB3365558F9A3127744CEF1C068B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR06MB3365558F9A3127744CEF1C068B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
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

On 08/06/2023 11:15, Billy Tsai wrote:
> On 08/06/2023 10:21, Billy Tsai wrote:
>         >>         On 08/06/2023 09:47, Billy Tsai wrote:
>         >>         >>
>         >>         >>   >> +
>         >>         >>   >> +allOf:
>         >>         >>   >> +  - $ref: pwm.yaml#
>         >>         >>   >> +
>         >>         >>   >> +properties:
>         >>         >>   >> +  compatible:
>         >>         >>   >> +    enum:
>         >>         >>   >> +      - aspeed,ast2600-pwm
>         >>         >>   >> +
>         >>         >>   >> +  "#pwm-cells":
>         >>         >>   >> +    const: 3
>         >>         >>
>         >>         >>   > 3 cells? For one PWM? What are they?
>         >>         >>
>         >>         >> channel, period and polarity.
>         >>
>         >>         > Don't cut my responses. You wrote you have one PWM output, so only one
>         >>         > channel. What do you put then in the channel?
>         >>
>         >> You need to put 0 in the cell of the channel, the example of the dts usage will like following:
>         >>
>         >> pwm0: pwm0@1e610000 {
>         >>         compatible = "aspeed,ast2600-pwm";
>         >>         reg = <0x1e610000 0x8>;
>         >>         #pwm-cells = <3>;
>         >>         #address-cells = <1>;
>         >>         #size-cells = <0>;
>         >>         pinctrl-names = "default";
>         >>         pinctrl-0 = <&pinctrl_pwm0_default>;
>         >>         clocks = <&syscon ASPEED_CLK_AHB>;
>         >>         resets = <&syscon ASPEED_RESET_PWM>;
>         >>         status = "okay";
>         >> };
>         >>
>         >> pwm1: pwm1@1e610010 {
>         >>         compatible = "aspeed,ast2600-pwm";
>         >>         reg = <0x1e610010 0x8>;
>         >>         #pwm-cells = <3>;
>         >>         #address-cells = <1>;
>         >>         #size-cells = <0>;
>         >>         pinctrl-names = "default";
>         >>         pinctrl-0 = <&pinctrl_pwm1_default>;
>         >>         clocks = <&syscon ASPEED_CLK_AHB>;
>         >>         resets = <&syscon ASPEED_RESET_PWM>;
>         >>         status = "okay";
> 
>         > BTW, these are not two PWM devices but one. I don't understand why you
>         > changed previous design into something like this, but this is not
>         > representing your hardware.
> 
> The previous design of my patch treated our PWM controller as having 16 PWM channels.
> However, from a hardware perspective, it consists of 16 individual PWM chips, each
> with its own set of two 4-byte control registers. These chips operate independently
> and are not affected by each other.

They are affected by each other - you use the same clock and reset line.
I really doubt you have 16 PWM controllers. Anyway, I cannot judge.
Either your previous submissions were totally bogus or this one is.

Best regards,
Krzysztof

