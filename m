Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7932F695F44
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 10:33:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGGGR21sJz3cMn
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 20:33:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=istsi7Gm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=istsi7Gm;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGGGJ3djdz3cJ7
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 20:32:54 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so11051123wms.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 01:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MLuBLD78Bk/WCCe5sve1xzKFGxY4R42+Rs7+yeXALAU=;
        b=istsi7GmTmIwcO0fG/ko7vNkTDDQafoZTlJjX8l0+/SilWGHPFB75+CrmnLjmblaIE
         aMy4Uwfxpo7ypN3zEMvBp3nx+8rBb/cGGtQ5WCRUTedMoJKqvaAJ5VEDxao3ycIsiXEG
         y5FV9RxlHz+U8siPdgWUmDR3kBF4Wmi0dr6/hih5d68ALcwKXBvpVq/wDyjs39Dio0Cm
         No/ht9fokeYlUDuoW2hY4cknir2u1SNtQ6DH0GVb7HA9Q0I0c/hZiV4nAzi+hWbFaiz4
         OFfEzNQGACfnorqMm0PmURyJUDyT4baMEXeUE6h6M1PfAADYWLCeCk1Dv2dJTbDMzonK
         qlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLuBLD78Bk/WCCe5sve1xzKFGxY4R42+Rs7+yeXALAU=;
        b=QH1KoJj6dBselSFcX+O73DA9c/CizouCv932/ckiaJKuWQcdWO8iWnJBqu/hmmoA1y
         ZXQk2LguVNfQ4JWueZV2hxurn04Mt25LHTqB2u6wv8CpQZbUz58o2/uWSteVddjhROY5
         XKQyCDHEWHit0snOBTi5kcEAB9dk2yUvstWhgYp1sc0/NtOZHJtON0tyCSHyNBxXkCze
         BskCYORRyyIM+o7VfHRSh7dM/ig7xf8Hf7miXzookvDCmTf80RftEHn/zEtb8aGlaO0M
         0lMhxwodcHY4Rh4UxgSV8a10+/3Cz5sC4wNEhuzdcdwguM2rKk8lGA6b+ljaOYc4znqI
         z0/A==
X-Gm-Message-State: AO0yUKW+6ztQOwWCbzbf4rl5PPnIxmO7I3nUs5j1uPOtNBYw4fKsirqT
	W6GnxscxMue1FLYukwNdY+dP6Q==
X-Google-Smtp-Source: AK7set8NZLajgBib5iKu1gYHtOr/juXF9ASCjAqRwrnGMSrXuXG0OeClrPvFAnecusNR0XWJktIpFg==
X-Received: by 2002:a05:600c:4f87:b0:3de:e447:8025 with SMTP id n7-20020a05600c4f8700b003dee4478025mr1372710wmq.21.1676367171137;
        Tue, 14 Feb 2023 01:32:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c191400b003dd8feea827sm21824818wmq.4.2023.02.14.01.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:32:50 -0800 (PST)
Message-ID: <efabae13-9018-1570-8daf-4401fa146441@linaro.org>
Date: Tue, 14 Feb 2023 10:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/3] i2c: aspeed: support ast2600 i2c new register mode
 driver
Content-Language: en-US
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
 <013cc486-dc70-a8b9-69d2-d0ae991549fd@linaro.org>
 <SEZPR06MB5269752C96643832E32F8AD1F2A29@SEZPR06MB5269.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269752C96643832E32F8AD1F2A29@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 14/02/2023 09:57, Ryan Chen wrote:
> Hello Krzysztof,
> 
>>
>> On 14/02/2023 07:12, Ryan Chen wrote:
>>> Hello Krzysztof,
>>>>
>>>>> On 02/02/2023 10:16, Ryan Chen wrote:
>>>>>>>>> +static struct platform_driver ast2600_i2c_global_driver = {
>>>>>>>> +       .probe  = ast2600_i2c_global_probe,
>>>>>>>> +       .driver = {
>>>>>>>> +               .name = KBUILD_MODNAME,
>>>>>>>> +               .of_match_table =
>>>> ast2600_i2c_global_of_match,
>>>>>>>> +       },
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static int __init ast2600_i2c_global_init(void) {
>>>>>>>> +       return
>>>>>>>> +platform_driver_register(&ast2600_i2c_global_driver);
>>>>>>>> +}
>>>>>>>> +device_initcall(ast2600_i2c_global_init);
>>>>>>>
>>>>>>> Maybe module_platform_driver() instead?
>>>>>>
>>>>>> Due to i2c global is top of all i2c bus like the scu, it make sure
>>>>>> the driver is
>>>>> before the i2c bus driver probe.
>>>>>> It is needed use device_initcal function.
>>>>>
>>>>> No, we do not do such ordering. device links and proper resource
>>>>> sharing handle the order. This must be module_platform_driver()
>>>>> (assuming we do not drop entire submission).
>>>>
>>>>
>>>> If global driver use module_platform_driver, does i2c driver will
>>>> latter the global driver probe?
>>>> If yes, I think it will workable.
>>>>>
>>> I find a good way instead.
>>> subsys_initcall(ast2600_i2c_global_init); is better ?
>>
>> Not really, this is not a subsystem. This is module platform driver so use it.
>>
> But, I need i2c-global to be early then i2c-ast2600 driver. The subsys_initcall is needed.
> I2c-global driver to initial full i2c clock and reset, after this, i2c bus driver(i2c-ast2600.c) can work. 

I wrote already what gives you the proper ordering. Why they do not or
cannot work here?

> So I suggest to use subsys_initcall in i2c global driver. Is it ok?

So for the third time - no. I gave reason what is the proper solution.
Manual ordering of drivers is error prone, not portable, easy to break
and actually does not work later when the platform grows.

Best regards,
Krzysztof

