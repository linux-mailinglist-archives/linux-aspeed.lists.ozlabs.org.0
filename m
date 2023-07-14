Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030897534A7
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 10:09:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bhP8fYX9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2PJP6PF7z3cZW
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 18:09:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bhP8fYX9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2P9X1mZYz3dH7
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 18:03:10 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b71ae5fa2fso24169781fa.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 01:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689321786; x=1691913786;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPlbjouEMCmtmH35L0gqCQg6vRDnBuMdkZij3f/ssMc=;
        b=bhP8fYX9dEU6bOySzvgHG85Mf+FRPQJ29brY+5xL+9sI6Zk2L1zBr7GTr0g9agHgYR
         zIslyE+apPJK65b1dc3D7F59KuGXOq7xmx/CQQP2zLBp/0lFfVRs+t0U05eDoFEIDJnF
         0vx5nFx1lVNtV61P+85zRE/yms7crKlL4Ab7LXl4Xn7wwxcbAgFvDMLSKNSm6ie9qxZz
         jKZkhqrT2JoOR76B33eQ/FE6leBS2sTEmJgMrDMqEU9CHgDSAIuoztc+0ACZfmw3IysD
         /RwHIHWrrtUwBoFLxJYQTBQq823r4UbGZjCexmAGc9QOZmPJwD9z8Rm4Bua7DljOpD2j
         MU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689321786; x=1691913786;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPlbjouEMCmtmH35L0gqCQg6vRDnBuMdkZij3f/ssMc=;
        b=W/DG6z0tqMJUPjA1A8v6Ar1EzhX6VhTPytrFUYyv9GdC2q+EiOz/IBv7zEYBe0nDMv
         ijIxcECPyw2eR80pf1VK0bX4cNauPXzXKS8Q2g115FxrA1AM3a3fZ1/b1ABWefJqL6JT
         YBwPl8k9ZczgA7fyoFNeUFD9r6/MqgRrVwKbmFiHsxo1G+llcKVL+TTjSJV8zsUWOWUb
         dVLBI2cJW410dCf4LkfqPO5rululyPmpFkArEvKGwR+oOogk0pCfqZS0LJNROGs4xQy3
         agD3x2N7QkoJCiNDm8deYpFV74hxNsrJv8aDl/OUnJOlr7kt2xWalyTBt5Ksd/eykuXa
         ndZA==
X-Gm-Message-State: ABy/qLYRg46OXwhLcJlvJXR2t3JmsEJbiUwcLSFJcLVn1O3SOsrljn/8
	wyUrMiOITtLTFu0/Y/uu6NqC6g==
X-Google-Smtp-Source: APBJJlF60HULCfG7k/5a41y7t6j2dZdb5LzfuFbVWl51hjMtFsl7R8EmVJR0j5t4/VA4mA94vdHLYQ==
X-Received: by 2002:a05:6512:3b90:b0:4f8:7524:8431 with SMTP id g16-20020a0565123b9000b004f875248431mr3592714lfv.44.1689321786367;
        Fri, 14 Jul 2023 01:03:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c24-20020aa7d618000000b0051df1797222sm5427691edr.11.2023.07.14.01.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 01:03:05 -0700 (PDT)
Message-ID: <eda7789d-a603-d565-c9da-edfe9493a05d@linaro.org>
Date: Fri, 14 Jul 2023 10:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Jean Delvare <jdelvare@suse.de>, William Zhang <william.zhang@broadcom.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, =linux-kernel@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714074522.23827-3-ryan_chen@aspeedtech.com>
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

On 14/07/2023 09:45, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The i2c new register mode have separate register
> set to control i2c master and slave.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---

...

> +	ret = devm_i2c_add_adapter(dev, &i2c_bus->adap);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_remove(struct platform_device *pdev)
> +{
> +	struct ast2600_i2c_bus *i2c_bus = platform_get_drvdata(pdev);
> +
> +	/* Disable everything. */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
> +
> +	i2c_del_adapter(&i2c_bus->adap);

I have doubts that you tested this. I think you have here double
free/del of the adapter.

> +	devm_free_irq(&pdev->dev, i2c_bus->irq, i2c_bus);
> +


Best regards,
Krzysztof

