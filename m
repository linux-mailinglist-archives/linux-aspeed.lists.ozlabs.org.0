Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB84687812
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 09:59:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6t5M6241z3cgt
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 19:59:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KqQd7vhY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KqQd7vhY;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6t5D03Vbz3cf2
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 19:59:27 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id bg26so836573wmb.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 00:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hsJTBdBXvAT2vsiyDP+3ee1Ylym3acJqhZJzhX5LOJg=;
        b=KqQd7vhYI/iZ+SraS3+jN430dfeWKtC7dQnvjMKqIgRPLJA30+f3hzCpZZewoikvJa
         m6PK4TtaZzorXOGT3aK5T6PYaL82MiShIBQTta83ILNmB0ykCKJMtH91DkZnYafIzDoj
         RwaWjglaAb9oKO5PeA1IU4Y7hjLpxh+4R4A/k490DbyoEOBAiNFQXeJfxiN6LrtPlW9c
         E1hNfCpOESx332k4wS7LaY7LdMhrxH0+SBPnA5JOj5mDuy5/IBfbTrFQey3UWAtiMD0Q
         paDsz1GLNSkxTNJhx+HEJHu90oitIUQw1FAdQQqzYeB81e4C0bNJMbIRmiWssWqZPk9v
         TY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsJTBdBXvAT2vsiyDP+3ee1Ylym3acJqhZJzhX5LOJg=;
        b=rcODU+Vz8KWqJ6ZtNuYaHZh+DUGej/ufU98NxgdBt00bxTgczjGthrFUjsoXQeSP1W
         mzoN6zi5zYEqRUjeLilLakOUqaF83gCU0ovgSB9xpDr7vTTBC2Rxtxe4610S4+AwbHkN
         lwSeCBL/CPbks/ZSlsjPfHZN0bvGjlez26vcDUH+yh679AmoVbsc56QN09sFBGEKZm6d
         H7ubwOSQiUeQW/9z7kRGdjJ5/ttkiKS+EBL71kYAeQRs6ZrHXl+OCW7/vU2cVVoWoOf/
         he/KrWkehsekcjA+wb3S2oMWfSrjkviJY0nmrYiBlsREVl8mKhzoraJNJYA1hWeTfNHw
         Owlw==
X-Gm-Message-State: AO0yUKW1vfbnevTPYCI101IXKoT3tuJUwUPSoIaVgQ15Z1scN0C2fh5p
	L6I9PH4aqFUEgFBHcZmpj4vlIA==
X-Google-Smtp-Source: AK7set9/1FcFxPrq0WBVJMLzwCimgSNxARmXcry+CIZV/rUvfMFDq00iEwXyb32WVU4crlOmtuH89A==
X-Received: by 2002:a05:600c:314a:b0:3d9:f559:1f7e with SMTP id h10-20020a05600c314a00b003d9f5591f7emr1288370wmo.20.1675328364085;
        Thu, 02 Feb 2023 00:59:24 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x14-20020a1c7c0e000000b003daffc2ecdesm4151880wmc.13.2023.02.02.00.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 00:59:23 -0800 (PST)
Message-ID: <0555a7ae-60b7-a10d-e444-c0b6c3a2cf59@linaro.org>
Date: Thu, 2 Feb 2023 09:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/3] i2c: aspeed: support ast2600 i2c new register mode
 driver
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-4-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201103359.1742140-4-ryan_chen@aspeedtech.com>
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

On 01/02/2023 11:33, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The i2c new register mode have separate register
> set to control i2c master and slave.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  MAINTAINERS                             |   10 +
>  drivers/i2c/busses/Kconfig              |   11 +
>  drivers/i2c/busses/Makefile             |    1 +
>  drivers/i2c/busses/i2c-ast2600-global.c |   94 ++
>  drivers/i2c/busses/i2c-ast2600-global.h |   19 +
>  drivers/i2c/busses/i2c-ast2600.c        | 1811 +++++++++++++++++++++++
>  6 files changed, 1946 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ast2600-global.c
>  create mode 100644 drivers/i2c/busses/i2c-ast2600-global.h
>  create mode 100644 drivers/i2c/busses/i2c-ast2600.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 749710e22b4d..67d338d834b4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3209,6 +3209,16 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
>  F:	drivers/usb/gadget/udc/aspeed_udc.c
>  
> +ASPEED AST2600 I2C DRIVER
> +M:	Ryan Chen <ryan_chen@aspeedtech.com>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.yaml
> +F:	Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.yaml
> +F:	drivers/i2c/busses/i2c-ast2600-global.c
> +F:	drivers/i2c/busses/i2c-ast2600-global.h
> +F:	drivers/i2c/busses/i2c-ast2600.c
> +
>  ASPEED XDMA ENGINE DRIVER
>  M:	Eddie James <eajames@linux.ibm.com>
>  L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 7284206b278b..5ef3ee6aa70f 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -389,6 +389,17 @@ config I2C_ALTERA
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-altera.
>  
> +config I2C_AST2600
> +	tristate "Aspeed AST2600 I2C Controller"
> +	depends on ARCH_ASPEED || MACH_ASPEED_G6 || COMPILE_TEST

MACH_ASPEED_G6 is useless and redundant

> +	select I2C_SMBUS
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  Aspeed I2C controller with new register set.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-new-aspeed.
> +
>  config I2C_ASPEED
>  	tristate "Aspeed I2C Controller"
>  	depends on ARCH_ASPEED || COMPILE_TEST
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index c5cac15f075c..ce83dfdc2094 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -38,6 +38,7 @@ obj-$(CONFIG_I2C_POWERMAC)	+= i2c-powermac.o
>  obj-$(CONFIG_I2C_ALTERA)	+= i2c-altera.o
>  obj-$(CONFIG_I2C_AMD_MP2)	+= i2c-amd-mp2-pci.o i2c-amd-mp2-plat.o
>  obj-$(CONFIG_I2C_ASPEED)	+= i2c-aspeed.o
> +obj-$(CONFIG_I2C_AST2600)	+= i2c-ast2600-global.o i2c-ast2600.o

Why this cannot be merged to existing driver?

The same question for bindings... actually let me comment on this
separately.

(...)

> +static const struct of_device_id ast2600_i2c_global_of_match[] = {
> +	{ .compatible = "aspeed,ast2600-i2c-global", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ast2600_i2c_global_of_match);

This not how it works. You cannot have two drivers in one module.
(...)

> +
> +static const struct of_device_id ast2600_i2c_bus_of_table[] = {
> +	{
> +		.compatible = "aspeed,ast2600-i2c",

NAK. We already have it.



Best regards,
Krzysztof

