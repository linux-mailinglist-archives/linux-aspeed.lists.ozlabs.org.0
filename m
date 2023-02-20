Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DDF69C8D8
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 11:44:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKzYg518tz3cB4
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 21:44:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gVs4IsdJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gVs4IsdJ;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKzYY4qSrz3bNn
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 21:43:59 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id ec43so2332130edb.8
        for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 02:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nA3eNnkwq+ImGT4j+R/hGpDPVwCQnM+eNRIMDN8kMg=;
        b=gVs4IsdJTUvkMxOUokihjicJW7urma5sunOhHff5RTIE0Etzk1oa1UuK+zoxG+n29R
         7P+OHkh9+sVsfzEhUu1uvWHr4AmgeRpImejxPNmmpUz1RoL/AQM63w7cBKS3TeryDSi6
         i4tTVGT2d5X7w56lVSJkumLfaxVvGLG8CaY8EhvQYOpo6eQ2jw5TDMKi6JuLNxcu70pQ
         KdbrUDJp1RfAY546KDHPdaekWyV6bckEkEKoanz8WTrLtR/D7e/WePLGXD/I01zOeeV8
         5h/7SrH2xJRg6I0yXcED19Iyh9NvE+GznhyRpulOuc+G/DocIS1bkAdfnsUbREICMx1T
         XKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1nA3eNnkwq+ImGT4j+R/hGpDPVwCQnM+eNRIMDN8kMg=;
        b=2Hcc5TjH3OvTlllAFH+KAelu00BwOcHPxGaZ+JBEY6gtlhVOwfu0qMt5zgao86bdtE
         gOkYRQAeB2eY9XEJXwluiCjHkCSZHIjm0/1zZQJzqR9dwE5GJg501ekbiRXyoHRPzAGz
         2hOLMMsaOW9ZFb0PgNxzQY/kFJjss4B1oCpweb0z214a5jxZAdwG6xfGuM1kCvG+SEQv
         LWvcPfcloJkMJxHHVeLJW64ddkLJCuZQrq+IGpEnb113JDggB9IgkeY1/aYon1Y7D2gW
         uhRMGxZ13z2Sn+JWk3vzrOkDJJuls060ZTFwXcL2sz+LvzCyQcNJsegH4fCeN0Ac9cKS
         Shdw==
X-Gm-Message-State: AO0yUKWy60/+Dihru+TRu97aWSQiK2AXqgcdX8vWDWIV6YGTVRfPo5pK
	1JWJ/tF6EIIuR5d5Kns5ZVLVlg==
X-Google-Smtp-Source: AK7set+Iay3lUuiaGj+f62EUAjQtYrSkeHGgYZW75QXTJl0YvGTHUhvTE52plH0XTmV9oJ5bthH+1g==
X-Received: by 2002:a17:906:71c2:b0:88d:2a41:2a4b with SMTP id i2-20020a17090671c200b0088d2a412a4bmr6635748ejk.60.1676889835438;
        Mon, 20 Feb 2023 02:43:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id qn19-20020a170907211300b008baeb5c9bdbsm3349814ejb.141.2023.02.20.02.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 02:43:55 -0800 (PST)
Message-ID: <e2765493-0502-8c6d-39ce-e59581131dbf@linaro.org>
Date: Mon, 20 Feb 2023 11:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
 <2141e513acc750bf26775f5b435f4dccd41244aa.camel@codeconstruct.com.au>
 <TYZPR06MB5274714E58C319B4FE3B6E1BF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYZPR06MB5274714E58C319B4FE3B6E1BF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
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

On 20/02/2023 10:50, Ryan Chen wrote:
>> These are common to all i2c controllers, but I see that i2c-controller.yaml
>> doesn't include them (while i2c.text does).
>>
>> I assume we're OK to include these in the device bindings in the meantime.
>> But in that case, you may also want to include the common "smbus-alert"
>> property, which you consume in your driver.
>>
> Since i2c.text have multi-master, smbus-alert. I don't need those two right?

Yes, these should be dropped.

> 
>>> +  timeout:
>>> +    type: boolean
>>> +    description: Enable i2c bus timeout for master/slave (35ms)
>>> +
>>> +  byte-mode:
>>> +    type: boolean
>>> +    description: Force i2c driver use byte mode transmit
>>> +
>>> +  buff-mode:
>>> +    type: boolean
>>> +    description: Force i2c driver use buffer mode transmit
>>
>> These three aren't really a property of the hardware, more of the intended
>> driver configuration. Do they really belong in the DT?
>>
> Sorry, I am confused. 
> This is hardware controller mode setting for each i2c transfer. 
> So I add it in property for change different i2c transfer mode.
> Is my mis-understand the property setting?

You described the property as "Force I2C driver", so it is a not correct
description. DTS is not for controlling driver. You must describe here
hardware feature/property, not driver behavior. Also, it must be clear
for us why this is being customized per each board.

> 
>> [and how would a DT author know which modes to choose?]

Exactly.


Best regards,
Krzysztof

