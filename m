Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060169C8DA
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 11:44:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKzZK2Myfz3c8f
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 21:44:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fnNTy2X7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fnNTy2X7;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKzZC3PDPz3bNj
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 21:44:35 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id f13so2318063edz.6
        for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 02:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nAr9XKr2ows0ZL4lWEGiuUXi4Y81IFXVXwxMIX5eq8A=;
        b=fnNTy2X7U8y7zMHj3DYo1PryRXOURd89hFD5uJ/Ggth6z/KwfDvYFiLZYsMlm3DN6i
         H2XPOhHfMFMIbDTvPRiclRvEAagO8eQP/zKSz4n8W+v622f67KQgiG0VuDabQnPR8XE1
         DlWni/m4VJw33Ph4yaupo9+wY/RCdJyQFxg95z2Wza5X0AfPJB4nhxl5+U5MOAECJtqP
         9jHEQQ4WVeaTEdcobqWQ3eqkiOD5/ftfv9IYNwXCJv0jDWDVcqLToVV6By7mpv2KYxu8
         CMS20gUqO1iC/53OXx2Y2qJ5X+JKs4UtdNtWXugUfqbVXo5DTGjBZC+DFZlxODup9e+X
         +4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAr9XKr2ows0ZL4lWEGiuUXi4Y81IFXVXwxMIX5eq8A=;
        b=D/BAZPtJ5PYur4WlYEGRsgXI0vFCQ7vcZ355vaNGIsonVjrC5Igx33HzVIIsFiNUY6
         iqxWQy7H2DGmqZEvP+/2Bi2fvA10MSzBu/2nhVYme00ai4FHFlp8nS8zLvi8J0Gzgh29
         QmLuBG51IF9zuLI/JeBF9R++xqI3myARIzqLBFGBy/8kNvkZEaRXyPDzWi+LKk4zPM0/
         EJRijCVpcUo2HkzYhdhyBkLvrBS7rYZjfvtYvgZGnK+6daXAtAWB87895FdhBrt0AIq8
         hg44c/P/yoGCI96PjQFj+dR/m/xjhDFvHzpQZOlCw8VzdblgVf9gDzJr0nadcQyNtSZC
         44yA==
X-Gm-Message-State: AO0yUKWR/BvIkiDAEdd5Hry8foufHfyWs3ZSCXYMqguKGCjc0xAJHvZc
	+cZzpfgAb0BzfXmux+qmiQPkaw==
X-Google-Smtp-Source: AK7set8TR+cAzF/JDkXW72w5dUn26frqdxo8bQYFTgM6H9WQ5kSiovRMhPpgNXwj63DdPlZX5wdONw==
X-Received: by 2002:a05:6402:10d9:b0:4ac:bd35:d05b with SMTP id p25-20020a05640210d900b004acbd35d05bmr180522edu.27.1676889872004;
        Mon, 20 Feb 2023 02:44:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u15-20020a50950f000000b004ad61135698sm1911398eda.13.2023.02.20.02.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 02:44:31 -0800 (PST)
Message-ID: <7dfdb0fb-3a8b-0584-e8b1-6d2200f18097@linaro.org>
Date: Mon, 20 Feb 2023 11:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/2] i2c: aspeed: support ast2600 i2cv2 new register
 mode driver
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-3-ryan_chen@aspeedtech.com>
 <63986fb1-f8d4-f348-bae9-72e08369213b@linaro.org>
In-Reply-To: <63986fb1-f8d4-f348-bae9-72e08369213b@linaro.org>
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

On 20/02/2023 09:43, Krzysztof Kozlowski wrote:
> On 20/02/2023 07:17, Ryan Chen wrote:

(...)

>> +	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency", &i2c_bus->bus_frequency);
>> +	if (ret < 0) {
>> +		dev_warn(&pdev->dev, "Could not read bus-frequency property\n");
>> +		i2c_bus->bus_frequency = 100000;
>> +	}
>> +
>> +	/* Initialize the I2C adapter */
>> +	i2c_bus->adap.owner = THIS_MODULE;
>> +	i2c_bus->adap.algo = &i2c_ast2600_algorithm;
>> +	i2c_bus->adap.retries = 0;
>> +	i2c_bus->adap.dev.parent = i2c_bus->dev;
>> +	i2c_bus->adap.dev.of_node = pdev->dev.of_node;
>> +	i2c_bus->adap.algo_data = i2c_bus;
>> +	strscpy(i2c_bus->adap.name, pdev->name, sizeof(i2c_bus->adap.name));
>> +	i2c_set_adapdata(&i2c_bus->adap, i2c_bus);
>> +
>> +	ast2600_i2c_init(i2c_bus);
>> +
>> +	ret = devm_request_irq(&pdev->dev, i2c_bus->irq, ast2600_i2c_bus_irq, 0,
>> +			       dev_name(&pdev->dev), i2c_bus);
>> +	if (ret < 0)
>> +		goto unmap;
>> +
>> +	if (of_property_read_bool(pdev->dev.of_node, "smbus-alert")) {
> 
> There is no such property. Don't add undocumented properties to your code.

Actually such property exists, so this one is fine.

Best regards,
Krzysztof

