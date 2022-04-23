Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37750EE95
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 04:13:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQQR55lQz3bXw
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 12:13:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RGyL6Ekz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RGyL6Ekz; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlmH62cyxz2xfC
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Apr 2022 19:30:58 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id e30so9565779eda.0
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Apr 2022 02:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=pkvDUU62lynJQSg3x7Q2ysN7bQVpze/eLNbrFVUvmq4=;
 b=RGyL6EkzJUFNdtTTCvO3YMxWYRwcd7Iluj0CRawSFhhmMurPYboao3CieRHPD6E9Zb
 W/o6UykPOI7eB1MAbE+JUSTSh55jLYRerC6Slx7T9SZgAiKNhR3Q6MU8ctg3pbHTnTaG
 cWgduvoJKRq77qG27GsXAudsX4Qk8Jn83Y5grgAQfkNVoRgpHNDz7hx5FqfV0oUxLx86
 DyDs0UKhOqY2WhYvLyS2njGlXfmKJMwfwkJBMCect0VHCq3g41vgvVxN6vsPUz2YUvnz
 s5Vrg1RqXZfwUFMvnCImrlvo5Xrg8I8M759YWUP2SYYPNiHwMkgg5NtODF9KhQPXaspw
 2+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pkvDUU62lynJQSg3x7Q2ysN7bQVpze/eLNbrFVUvmq4=;
 b=Obm/30b7hfqpvPFpjpJTjOUPD8uZZ8l1+gWkQM7I/T20D0bAIftsMosnvZmt+hOMQu
 ZEPQrsYNBgkWfqtnBLMARvmlxjAC2FJYHdONCcKCYG8Jh8y4GmHIkwPuyXFpyMvbwKo+
 gKGVhGmEEeJ1diptDjzMXhX/9uKjEx5yYZnSk/WcNtE2ICNQEUmlhTjyUxy9wMM0T+ev
 nHZqpDesdK3RSYRus2HGL4+CpVhEGGqqdeaY0XSzagN5Ddgd8fS8TxB7vSll+tqu4BRi
 m5Js9Yk+IqOe2YDItYzEAi7Y7ll19BOPZp/5yZtoEjUKqzNBNXOdNUsJMFI0FisRaiTw
 JuVA==
X-Gm-Message-State: AOAM531rueCbDnLjna++RKbqWTTuPJjNBvkfpqOZb7XYEfn7DmzQ5zXE
 DmZ+f56ZgnOXqTdAvFYCxSeOZg==
X-Google-Smtp-Source: ABdhPJzhZvUE3x+ixRC1vFvxCF/wqqE1T9MfdIhpwHIVY1+9sCJKoBjuE+btJdS/IseO3GpADTLsAA==
X-Received: by 2002:a05:6402:1a42:b0:424:20bb:3e37 with SMTP id
 bf2-20020a0564021a4200b0042420bb3e37mr9339460edb.29.1650706254422; 
 Sat, 23 Apr 2022 02:30:54 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 n14-20020a50934e000000b0042053e79386sm1987249eda.91.2022.04.23.02.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 02:30:54 -0700 (PDT)
Message-ID: <3eb57a4c-95b6-0bf5-aa1a-90ee2fd336e1@linaro.org>
Date: Sat, 23 Apr 2022 11:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] irqchip/aspeed-i2c-ic: Fix irq_of_parse_and_map()
 return value
Content-Language: en-US
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
References: <20220422104536.61451-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422104536.61451-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:21 +1000
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 22/04/2022 12:45, Krzysztof Kozlowski wrote:
> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
> 
> Fixes: f48e699ddf70 ("irqchip/aspeed-i2c-ic: Add I2C IRQ controller for Aspeed")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/irqchip/irq-aspeed-i2c-ic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
> index a47db16ff960..cef1291ae783 100644
> --- a/drivers/irqchip/irq-aspeed-i2c-ic.c
> +++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
> @@ -77,7 +77,7 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
>  	}
>  
>  	i2c_ic->parent_irq = irq_of_parse_and_map(node, 0);
> -	if (i2c_ic->parent_irq < 0) {
> +	if (!i2c_ic->parent_irq) {
>  		ret = i2c_ic->parent_irq;

This is wrong (same in patch 2). I will send a v2.


Best regards,
Krzysztof
