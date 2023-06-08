Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC146727A21
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 10:39:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcHhX5S8Bz3cCh
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 18:39:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iyAq0hoQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iyAq0hoQ;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcHhP5Q2Tz3cCh
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 18:39:48 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5147f4bbfdaso452670a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jun 2023 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686213584; x=1688805584;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T60h+W0DC18nxsqz7trELMiyE2WR3VGoPPEa5hHXx+Q=;
        b=iyAq0hoQryh8EvDralt4E7z318BYMnia1f7pBiPyvP4AF+SIcXMPpSRzvhVbxF1JUH
         zLxoD7Z/W1y3YSrJ3d8QsupMO4uBHea6A3IJoYsc1TCmiMPwTTn9EcowtqzR5BS3t8+X
         PtHWFRxR2ljn4Qh94PXTURZW7oabLNX41piHq2O4284la+7jYsDq6S/ll0SKqrA7Ook3
         rqMg7w4WzEZZI3KX2DPDiQEPiFrvs09O7xsWFP+sbYSa7nLnusOd7HJyMkwBhxDOhCxz
         aQu1jVMiUskjy5c60nGo5TNqaNmBBd0NgP96Vm7fk4KFb0HAndFnWgmuYef6ZTMOPHS2
         3wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686213584; x=1688805584;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T60h+W0DC18nxsqz7trELMiyE2WR3VGoPPEa5hHXx+Q=;
        b=C6v8v5a4klzYJHLmCmzo2Yv8SUjhBf5Izb+cTK+4cmCuxoCXqifxhS0e9+Vf+J1EjA
         MKlcCSve8/JSv8M5f0YEmCj2iDn5t5kReRr9CvsXyfFviKZuPL2ZKzkZRugXWWM//Icq
         QDn3Y8QDqeAYugQaji0ZVGj30vFGmPX3qPycUq1TbYwiEK3vlSN5a2cyGFQK4iSNRZWb
         3QPb+VjXsA8KQlUiyLbCadSSSsIwi3bEqiVw5RpGy1xLmC2ImefxqEvO5UEHPSZtZu+7
         Vs3K/2OJWikuH17P0/hgM9NTrKQLVsUKRiB6x6tcFW9YKwYD23VQ17zFCX4WM9wpim5f
         tckQ==
X-Gm-Message-State: AC+VfDxGlE+3jEvR4VcCp/BcUUv0mcaBAiW7HlC/f3tctCI7oLjtduJR
	s8LSst9Ti3pwJnz5tuoNUwCCdA==
X-Google-Smtp-Source: ACHHUZ6+DFaOWxwBnwwn5BBCqCuWBnfpxcMfTyfrJlrYZN4vwswZ9T70B750ae6ffwKKz5XAccdyTg==
X-Received: by 2002:a17:907:7e84:b0:978:6489:f9f with SMTP id qb4-20020a1709077e8400b0097864890f9fmr9130565ejc.52.1686213584247;
        Thu, 08 Jun 2023 01:39:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709065fd600b0096f830337e3sm384465ejv.129.2023.06.08.01.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 01:39:43 -0700 (PDT)
Message-ID: <fb3cb26b-61d7-5f57-41de-f419aa50ac0b@linaro.org>
Date: Thu, 8 Jun 2023 10:39:41 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR06MB336528007D2685F8D95DF4078B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
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

On 08/06/2023 10:21, Billy Tsai wrote:
>         On 08/06/2023 09:47, Billy Tsai wrote:
>         >>
>         >>   >> +
>         >>   >> +allOf:
>         >>   >> +  - $ref: pwm.yaml#
>         >>   >> +
>         >>   >> +properties:
>         >>   >> +  compatible:
>         >>   >> +    enum:
>         >>   >> +      - aspeed,ast2600-pwm
>         >>   >> +
>         >>   >> +  "#pwm-cells":
>         >>   >> +    const: 3
>         >>
>         >>   > 3 cells? For one PWM? What are they?
>         >>
>         >> channel, period and polarity.
> 
>         > Don't cut my responses. You wrote you have one PWM output, so only one
>         > channel. What do you put then in the channel?
> 
> You need to put 0 in the cell of the channel, the example of the dts usage will like following:
> 
> pwm0: pwm0@1e610000 {
>         compatible = "aspeed,ast2600-pwm";
>         reg = <0x1e610000 0x8>;
>         #pwm-cells = <3>;
>         #address-cells = <1>;
>         #size-cells = <0>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_pwm0_default>;
>         clocks = <&syscon ASPEED_CLK_AHB>;
>         resets = <&syscon ASPEED_RESET_PWM>;
>         status = "okay";
> };
> 
> pwm1: pwm1@1e610010 {
>         compatible = "aspeed,ast2600-pwm";
>         reg = <0x1e610010 0x8>;
>         #pwm-cells = <3>;
>         #address-cells = <1>;
>         #size-cells = <0>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_pwm1_default>;
>         clocks = <&syscon ASPEED_CLK_AHB>;
>         resets = <&syscon ASPEED_RESET_PWM>;
>         status = "okay";

BTW, these are not two PWM devices but one. I don't understand why you
changed previous design into something like this, but this is not
representing your hardware.

Best regards,
Krzysztof

