Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F073D6878DE
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 10:33:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6trS63tFz3f2q
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 20:33:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zF6Hd/0M;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zF6Hd/0M;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6trJ6XRdz3cdv
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 20:33:19 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id r2so1088461wrv.7
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 01:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZRRcs/XgyQ/lB8jyBhr4ijAcGvBbqK6iTjBnN5tzBo=;
        b=zF6Hd/0MHCM72whVsxMy36TLfuHH+dVwl7tpMxD2GVkTWc4xEBJCQXu4MtcCN0BJf3
         EJlG9pZ44GuGIkUc300Q+XJ+SM5yATxGEI7RHNvg1NRDE+YvugfmRwihXqoPKglSQ8Nb
         Y5un0/KCPWlBRiV+elljuNWvXfeUAByQRwIil9EMHo5pCJ5DXqtz3ff+h6FeYEzYlERa
         SI/rqVA0+6X+4JO+kFNH6D1TKG0YSs8UH5Z0hjrKgqXcihwWIgcBcmXDoyTMS1MSAYsC
         QDQn0QOizZu80Dxaqz8SqSr0KJxlEpyql2M/NhLwthCwkOEU1DZBbU5IyrfRJXSSL8u3
         8jUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZRRcs/XgyQ/lB8jyBhr4ijAcGvBbqK6iTjBnN5tzBo=;
        b=Ct1nKbSxNZrQ3Jh0Nbdxyvz4Go8jx5VDUhszM8NH2rE1EK+W5x1LDocmykw8MA86Zd
         4G//K2KD6+v/pEkybTW85CK+0t99wToNDlEX7d3lRkP9Vip98NBbb8F4nljaXlZa0ulh
         mCDvNCpCpaGSnbiKIbKJjGAahIveQAf5m9AydlVtcaU1NnlsWTOzyLQ6I0ZQofmD6hI8
         tymGsM8TpYRxiZqoEPNQ1o71vU4bmHnFatduYWxKRdMBx53sOxpYUeuQCOUu+GiGJzTh
         njslnKcnt6MMgBDLM56Ua7+Do0hYyw9GJ0iS8pjSjfqSC0tNKGJwo+evkzJ98mKL7iiC
         UMhA==
X-Gm-Message-State: AO0yUKUuWt2YHv8MdAoMSB0295ePT20TL7If2Wb3kl7A3YvjuurGy5Fs
	5oae+wal7tLR9sL8ULHSRXDUWw==
X-Google-Smtp-Source: AK7set/ylZEizs/1BVpvDGKf9pWVDclDYopXyXn5t99Hsk5zRJfPo8VwT6sgNGECtHxqxfwZmWKDrA==
X-Received: by 2002:a5d:4810:0:b0:2bf:c09a:c60e with SMTP id l16-20020a5d4810000000b002bfc09ac60emr5449034wrq.2.1675330395635;
        Thu, 02 Feb 2023 01:33:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p8-20020adff208000000b002423edd7e50sm19592610wro.32.2023.02.02.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:33:15 -0800 (PST)
Message-ID: <5239ea2f-284a-dcf5-6dd4-be3b13b319e6@linaro.org>
Date: Thu, 2 Feb 2023 10:33:13 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB526941A3DDB25529F0671112F2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 02/02/2023 10:16, Ryan Chen wrote:
>>>> +static struct platform_driver ast2600_i2c_global_driver = {
>>> +       .probe  = ast2600_i2c_global_probe,
>>> +       .driver = {
>>> +               .name = KBUILD_MODNAME,
>>> +               .of_match_table = ast2600_i2c_global_of_match,
>>> +       },
>>> +};
>>> +
>>> +static int __init ast2600_i2c_global_init(void) {
>>> +       return platform_driver_register(&ast2600_i2c_global_driver);
>>> +}
>>> +device_initcall(ast2600_i2c_global_init);
>>
>> Maybe module_platform_driver() instead?
> 
> Due to i2c global is top of all i2c bus like the scu, it make sure the driver is before the i2c bus driver probe.
> It is needed use device_initcal function.

No, we do not do such ordering. device links and proper resource sharing
handle the order. This must be module_platform_driver() (assuming we do
not drop entire submission).



Best regards,
Krzysztof

