Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED8C7532BE
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 09:14:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OC+YjhwB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2N530v1wz3c3M
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 17:14:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OC+YjhwB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2N4v2zlbz307d
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 17:14:04 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso14385535e9.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 00:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689318837; x=1691910837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8K9L3dLhDzQTv7y7e0RVrZSX+FOOeLwX47IYpkosCNQ=;
        b=OC+YjhwBAquXA8bRTVqSc71oDkaWMW+X/CVE2b19QZwxMyZMKHAvPRMmvfaxAc4qjH
         wS7bNaVBc65aNTvjFBCqH8OBSvvBxi62KVint4c5u3f5LPVie/jV2eC+Cnb++NzUzrAA
         1WmPu1XVuNiQma+6ojXOFZSB2R3c3FD2ObygN3AbnrskivYYp264Mt3hLNiGN3o7ziS9
         Zp5AMIbOkQqdPvl3/2powKYJl/VMwFZs6r91+UKudYvK4oe5VoTtD+WXIvp3zAO3GKEB
         KYIRZB0B2uxWT66+BqOdlF2MALmKB4mznl4YuvMyV5H2X5vRACwCik0jnwWm2Fe4fqtO
         tEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689318837; x=1691910837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8K9L3dLhDzQTv7y7e0RVrZSX+FOOeLwX47IYpkosCNQ=;
        b=XwbLzUO18APXnl3no3xIwWlt00xEWpj+xSkUkOqz4orO5WElOV9I7HStBPdOxrMV6t
         gaBwYA5FsZ0cMNu0H03ZHbTb2NoAZS/psQz3RXKNpbGANFTmdCsas2FGFDXrF4etPQHs
         iScLKgwHcO6s8L85+77adFJI431oZtsniS2BjbBwN7pPd1rG9GRN5ueEPFGWinK33Hss
         DYisbf5Jx8LrTD4I8pH7jy56P1BGZK+GKHXUj4e1eKCmuJS7a4CRmnHJcvmTlNGSzW6v
         ucUgFcoQswO+o4gBT8yBv2NwqUylW1rcppewQ0fJU/FWZrfQBbCsIOTNTLqvWuoKrjLL
         u3Fg==
X-Gm-Message-State: ABy/qLYHQdoWJ33HXjhyxnbCfElFpFzVua+ZBUBO1joRM1qFTja/zBbO
	vcDyDCwLztlNQWWHlwj/1PHY2A==
X-Google-Smtp-Source: APBJJlFlh8jTiL5Fqlv9Labt5kPhUqu1Mydh9K2EVtifJxi6rOHGarAs9UJGSqlz51WFJVdcIGWexg==
X-Received: by 2002:a5d:67c9:0:b0:313:ece8:e05c with SMTP id n9-20020a5d67c9000000b00313ece8e05cmr3230412wrw.33.1689318837343;
        Fri, 14 Jul 2023 00:13:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d58ee000000b003143c532431sm10042716wrd.27.2023.07.14.00.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 00:13:56 -0700 (PDT)
Message-ID: <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org>
Date: Fri, 14 Jul 2023 09:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
To: =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com" <jdelvare@suse.com>,
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
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 Billy Tsai <billy_tsai@aspeedtech.com>
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 14/07/2023 09:04, 蔡承達 wrote:

>         > This is because our register layout for PWM and Tach is not
> continuous.
> 
>         > PWM0 used 0x0 0x4, Tach0 used 0x8 0xc
> 
>         > PWM1 used 0x10 0x14, Tach1 used 0x18 0x1c
> 
>         > ...
> 
>         > Each PWM/Tach instance has its own controller register and is not
> dependent on others.

Your email reply quoting style is very difficult to read.

> 
> 
> 
> Hi Guenter,
> 
> 
> 
> Did you receive a response to my previous email?
> 
> I would like to inquire if you have any further concerns regarding the PWM
> and Tach with 16 instances.

But isn't like this in all PWMs in all SoCs?

Best regards,
Krzysztof

