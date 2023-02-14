Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 112F3695ADB
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 08:47:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGCx565b1z3cKj
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 18:47:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HA8sxClP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HA8sxClP;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGCw36W2Wz3cCD
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 18:46:59 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id z13so10346681wmp.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 23:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xiN5OciC5wJIK01x/O0sqc8trI5yF/COjXVP57rEmL0=;
        b=HA8sxClPNtSiHwRQtnhNTwyiO8HQPupil/A1bDjUbloLKc//cttP+kRzCyDOPRCn6z
         XJFXNAbxZn4gSmWz/6q6iAqPUpML+yEIYqoy9O/TqMZDGx9OzxDSnXHqCkFx3uu5wTQu
         OdSq9qdU4e3+9z5ZcfZgLU7vP1opIsHhrNSeaVj6QWoEoOL66iTs/y8y7I5mA3zFukX8
         OaofQEwsYOSPGinRQE1/khQ2JHH+Os07hFUubo9/B1QRk3NtKWvxc7tkiwjSrZNCsKOO
         v2QGVtxleMx7FvYBypw9lBl8Ow4mCD/W0NBBigDWRfraYJ/i4OwzKWzQ4Atm+bwZ8gwx
         Jf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xiN5OciC5wJIK01x/O0sqc8trI5yF/COjXVP57rEmL0=;
        b=j4nQ6cfJNjrWWUo7FyDixty+z3FfW4cgW38Lu5QxBoUqPfDmKa1Ze+/fj3ekrPSxrM
         JvEWVKyr/DPdY35EPkchPp8OLheimD0x4N0H2K39/s165cAHPZHQROiCy/53UQoAUVYG
         5hJuG2inCWx5pNlJSLXyLm0tlRbnEgf2G73jHVwXLD0loDdgyxRq8pCGnbV+FmBiJDgE
         4Nayapoos1dCix/zE2tuNdNNM0Gu/wNuT/zgTJ5aXTnLQweH8ga4i0atWg4W92dCk9db
         fpVCupPmrv+Bg5bnICIPGxXQ+PWM6NZUOC6h5MbjSPcAWpNbZVM8EKXP/LXH9utGvR+9
         7+9A==
X-Gm-Message-State: AO0yUKWFPaZy1s2t7aznVN2KUZafDEtDhGv+N52z/H+Py85ZA5ELeCG9
	6QspvoDMFoqC+xcs0BjHwvuQng==
X-Google-Smtp-Source: AK7set+cM/GMcB7S+Os2oo/pJOIOqgKj+NlZItz9O0bu4qnPSI9ctl34sJ9AQPFoW5w9U96Cr0pzsA==
X-Received: by 2002:a05:600c:319d:b0:3e0:e77:3056 with SMTP id s29-20020a05600c319d00b003e00e773056mr1305998wmp.30.1676360816615;
        Mon, 13 Feb 2023 23:46:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i20-20020a1c5414000000b003dc53217e07sm16573905wmb.16.2023.02.13.23.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 23:46:56 -0800 (PST)
Message-ID: <013cc486-dc70-a8b9-69d2-d0ae991549fd@linaro.org>
Date: Tue, 14 Feb 2023 08:46:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/3] i2c: aspeed: support ast2600 i2c new register mode
 driver
To: Ryan Chen <ryan_chen@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-4-ryan_chen@aspeedtech.com>
 <30c7cbbf57abbdfb5f974d6ee17b2218d124c7e8.camel@ozlabs.org>
 <SEZPR06MB526941A3DDB25529F0671112F2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <5239ea2f-284a-dcf5-6dd4-be3b13b319e6@linaro.org>
 <SEZPR06MB526951F24B841965C0DD6B84F2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <SEZPR06MB52698009DA893813FECBE76FF2A29@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB52698009DA893813FECBE76FF2A29@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 14/02/2023 07:12, Ryan Chen wrote:
> Hello Krzysztof,
>>
>>> On 02/02/2023 10:16, Ryan Chen wrote:
>>>>>>> +static struct platform_driver ast2600_i2c_global_driver = {
>>>>>> +       .probe  = ast2600_i2c_global_probe,
>>>>>> +       .driver = {
>>>>>> +               .name = KBUILD_MODNAME,
>>>>>> +               .of_match_table =
>> ast2600_i2c_global_of_match,
>>>>>> +       },
>>>>>> +};
>>>>>> +
>>>>>> +static int __init ast2600_i2c_global_init(void) {
>>>>>> +       return
>>>>>> +platform_driver_register(&ast2600_i2c_global_driver);
>>>>>> +}
>>>>>> +device_initcall(ast2600_i2c_global_init);
>>>>>
>>>>> Maybe module_platform_driver() instead?
>>>>
>>>> Due to i2c global is top of all i2c bus like the scu, it make sure
>>>> the driver is
>>> before the i2c bus driver probe.
>>>> It is needed use device_initcal function.
>>>
>>> No, we do not do such ordering. device links and proper resource
>>> sharing handle the order. This must be module_platform_driver()
>>> (assuming we do not drop entire submission).
>>
>>
>> If global driver use module_platform_driver, does i2c driver will latter the
>> global driver probe?
>> If yes, I think it will workable.
>>>
> I find a good way instead. 
> subsys_initcall(ast2600_i2c_global_init); is better ?

Not really, this is not a subsystem. This is module platform driver so
use it.

Best regards,
Krzysztof

