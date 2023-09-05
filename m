Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA217921E5
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 12:38:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SGzG7NqA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rg26f13y6z3bx0
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 20:38:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SGzG7NqA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rg26W3QYMz2xpd
	for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Sep 2023 20:38:41 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-98377c5d53eso335883966b.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Sep 2023 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693910314; x=1694515114; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4WKpCpzUJa8iRluzL4OMCEUy6exJH98L6niCS735SFI=;
        b=SGzG7NqAoZ0DqPEN+bJFx3rq642ECTI96kIa80GarKJqMbnpk2twGWUcL9ydTYeEw1
         tM+SZzTitP3htvV1DA1gJV9zpwOckdiBrhWsxxdljSMfRR1U4wwNhirwP20aV0WR/jHr
         y4Ml4wMHVPwJIi/XVR8fTS7eD4likEvnwJmcDhFSy7fFynk1QuhsWA0VqoN36YGq2pF5
         xEvVXsQVYuzBl5pHEKaQuQykVEGQCiBAGouKgxsXIERv3DngZ+lTHe/uUmpbjwlRZVgP
         A8hRMMRzufbEaMIs8ksWyZ63DnEULV6z5XXwN0O9uN4+JTR7xWvjGnm7psx/l0Vrzrqk
         vsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693910314; x=1694515114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WKpCpzUJa8iRluzL4OMCEUy6exJH98L6niCS735SFI=;
        b=hA5Up7SmCxbpJl97GBbDGsobC9icPYK1G1uEeUmNRMoCpFpFkzLY0M86XO4qQguWLX
         hCh6DnS9QDVoicA/K1eKPtIXuwYZ/wgZxJ7rAfkQ8kqad6LTjWYcMjkP0L6kXd6o232R
         4KfOTveAtOG31kKgwZO/EZ6TIHoTWaqRWRyEtOE6chPjFMFjjdA8xvA/XdZ4x20OyZu+
         OxSdDdbFsHuU1Ijxu32VCtqSllvzB5WlXZBJxltR5SIuNyvl6h5NxCzrU36xruiPbx6Z
         c6iqNyzrIbf7cgnvVieumTuy4K9uaN6nFfeQv+6tkhGfDDcfQfyrFlPcSJ0KtFCvVAir
         I1Fg==
X-Gm-Message-State: AOJu0YxGkye8QhMrZNUx8j+JBp8ibkFJ6xn39yd5rXmAv/zCVpgP1UPK
	p4fJWGyx6quV0nH5ifBTIhktXQ==
X-Google-Smtp-Source: AGHT+IGDPbqZkn81hlAaihoCBFF4Kq/KErYZluh4+aPmtASgvaAQ5tkK7GxPPmEKCJnHVZaZn7mygQ==
X-Received: by 2002:a17:906:319a:b0:9a5:d095:a8e4 with SMTP id 26-20020a170906319a00b009a5d095a8e4mr8946249ejy.1.1693910313669;
        Tue, 05 Sep 2023 03:38:33 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id ss22-20020a170907c01600b00992e14af9c3sm7437367ejc.143.2023.09.05.03.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 03:38:33 -0700 (PDT)
Message-ID: <a0f0ab97-2333-542a-327f-f5711136b35a@linaro.org>
Date: Tue, 5 Sep 2023 12:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Content-Language: en-US
To: PeterYin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
 <20230830090212.3880559-2-peteryin.openbmc@gmail.com>
 <b9cbe9be-b03e-6c7a-d06c-b75b012b5b25@linaro.org>
 <18b78489-6a12-a09f-620d-985be747f9da@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <18b78489-6a12-a09f-620d-985be747f9da@gmail.com>
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 05/09/2023 11:55, PeterYin wrote:
> 
> On 8/30/23 17:44, Krzysztof Kozlowski wrote:
>> On 30/08/2023 11:02, peteryin wrote:
>>> Add linux device tree entry related to
>>> Minerva specific devices connected to BMC SoC.
>>>
>>> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
>> To clarify: your full name or known identity is "peteryin"?
>>
>>> ---
>>>   arch/arm/boot/dts/Makefile                    |   1 +
>>>   .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 385 ++++++++++++++++++
>>>   2 files changed, 386 insertions(+)
>>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 9e1d7bf3cff6..edb0b2105333 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>   	aspeed-bmc-facebook-wedge400.dtb \
>>>   	aspeed-bmc-facebook-yamp.dtb \
>>>   	aspeed-bmc-facebook-yosemitev2.dtb \
>>> +	aspeed-bmc-facebook-minerva.dtb \
>> Nothing improved here.
>>
>>>   	aspeed-bmc-ibm-bonnell.dtb \
>>>   	aspeed-bmc-ibm-everest.dtb \
>>>   	aspeed-bmc-ibm-rainier.dtb \
>>
>>> +	"","","","","","","","",
>>> +	/*O0-O3 line 224-231*/
>>> +	"","","","","","","","",
>>> +	/*O4-O7 line 232-239*/
>>> +	"","","","","","","","",
>>> +	/*P0-P3 line 240-247*/
>>> +	"","","","","","","","",
>>> +	/*P4-P7 line 248-255*/
>>> +	"","","","","","","","";
>>> +};
>>> +
>> Nor here.
>>
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
>> feedback got lost between the quotes, maybe you just forgot to apply it.
>> Please go back to the previous discussion and either implement all
>> requested changes or keep discussing them.
>>
> Could you please clarify for me?
> 
> Are you asking if the last line should not have a blank line, or I can't 
> set a comment for the sgpio line like this:

6 or 7 versions ago I said:
"Still redundant blank line."
so it is about stray blank line.

https://lore.kernel.org/all/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/

Best regards,
Krzysztof

