Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CCC78E638
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 08:21:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qHzf7Yb2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbrdh1ClXz30NN
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 16:21:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qHzf7Yb2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbrdW5xRfz2yh2
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 16:21:01 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bcc0adab4so43930566b.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693462857; x=1694067657; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pG3JY/czPpavqqVu3lLo9xEZ0gRVLmUoMl7zqpjOA3s=;
        b=qHzf7Yb2XFvEjYANQGsN4a7iO79t6rWm/Nw8gkvv+FOqzxyK+zuK1lM+rYYyLNTfcY
         YfBnNLl0e45K+y6KCt8OjA94x+dKJAU51iEKSw/dUZLTqxAqiSB57D1IFfi0k9ScpIW7
         OW9DciTRUC0//EBPTiu6Y2fa8vgIHbR5vQQ/uHp+t6aXkPCXLgRdeJ6xeWG/enEQoKe1
         A2XgNqqmY2HkkWpfG6yNXMeaxOm5jy5UdOrPcMWLM8mxufZ2TUbBajVKd4UF6jzSraHs
         UOtlJEq+m8cfYgc8v2si2QiWtLYdc7YQ1yCfNZld5qo6Cs/e7xP/T+fhhIAbrynHh2cl
         snLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693462857; x=1694067657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pG3JY/czPpavqqVu3lLo9xEZ0gRVLmUoMl7zqpjOA3s=;
        b=j16pNMvECMv114bH+QGK8LYk20yo1SO2Zw8gkMiQjHGFwmI/k2Whbk4pkwYVROZhz6
         YHQvf/83Pxxbm41D+rgNlopHcMtw0ircvlCRdyaqW2KgwrM302lKpwLksRwFzLLuv5DM
         iLCm87N/Vxdwr4YYTY2JiE/hPfn28vfzqGhshVprquHecwMHt6rbunC+Y2/CrbDdM0dE
         PEyuVBdp1iem+bdUIXS/dGmnzo0JgabRZvSoUFAviqJBrbXuucP8VBR459YLP/z+7u0B
         dehXSwt8Xv9eHhVLhUP6QTrFAmsky7NSakWXzgxXAqlldkN6oU26ZNJ+Ok1rIaS70Qgj
         FjIQ==
X-Gm-Message-State: AOJu0YxBuYKrMaqpKluLo1Vd4i96uQ80XHyhfKcHBRCyrOaTfCUKpk9O
	IzH9Yqj7PUa+K2DbNlE75eluLQ==
X-Google-Smtp-Source: AGHT+IE5VrHVFgWGXJLbJl+dOweoU18kkN+ftvOBbWJPeXG1U8hZQKsjqxQ+o+0QMmm7ATpbH7hmvA==
X-Received: by 2002:a17:906:8466:b0:9a5:c4ae:9fd4 with SMTP id hx6-20020a170906846600b009a5c4ae9fd4mr3234720ejc.59.1693462857179;
        Wed, 30 Aug 2023 23:20:57 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id h18-20020a1709066d9200b0099b5a71b0bfsm384516ejt.94.2023.08.30.23.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 23:20:56 -0700 (PDT)
Message-ID: <4cbe662d-cd20-ceef-e3e4-6608029f94b7@linaro.org>
Date: Thu, 31 Aug 2023 08:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Content-Language: en-US
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
 <20230831055030.3958798-2-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230831055030.3958798-2-peteryin.openbmc@gmail.com>
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

On 31/08/2023 07:50, Peter Yin wrote:
> Add linux device tree entry related to
> Minerva specific devices connected to BMC SoC.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 377 ++++++++++++++++++
>  2 files changed, 378 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 9e1d7bf3cff6..edb0b2105333 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-wedge400.dtb \
>  	aspeed-bmc-facebook-yamp.dtb \
>  	aspeed-bmc-facebook-yosemitev2.dtb \
> +	aspeed-bmc-facebook-minerva.dtb \

Third or fourth time: that's not a correct order. This is a nit, but
since you keep ignoring it, I don't believe any other feedback was
applied. Why you did not respond to my comments but just ignored them?


Best regards,
Krzysztof

