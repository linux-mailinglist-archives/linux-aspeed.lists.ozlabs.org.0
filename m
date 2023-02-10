Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934B6691B08
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 10:13:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCp212sSdz3cgV
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 20:13:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ioeihDRp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ioeihDRp;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCp1s3JD3z3bZl
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 20:13:37 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso3541491wms.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 01:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlncjyUCwyJrK1zxs8hOgkWlTAUHyGxnew5NJR5HoOk=;
        b=ioeihDRpWkLc0NiYcHmP2VjAXuXfJgTno0+GGHtc2ApSbnwf8ZttX4ToE2X1LGl9e3
         rn0sey7JRnTQvxRc9a3hCc/7r45zXLqRIBZVMQhygpAOE4Kh4evGQl/j2/5F58fj7KSV
         mkiLmdMz6lwrqwc3wgONkzWFfGxTEUllHMuDNYzHvkFyWPr5YSoA0usILw4IbULG6f7I
         oXf5tkS+Il5qR0PLlz/SUDOY1KL66rp4mRNBPhrD6skoJVFrascRyehbrjc6xoYBILoc
         MguYi5u3ynlBMdb34LDZjITpHuQ8jG00Y1tLH4kmK9EWK5Mr4E+koLbcI0+gzvwtr1br
         Yj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HlncjyUCwyJrK1zxs8hOgkWlTAUHyGxnew5NJR5HoOk=;
        b=PLCXDpr020sK1oGfO26AOevL52kvbfvcauy3Co0yXbQE6cCwT5DxOsVSOJBnDYY80X
         ad98rbptkgH+iVUBw0/DRSRJqswX3MQ7gXm6WbBf261EtMx8yv+7/q62H0tfZacfDdkJ
         V6nqfn+Y/u1JlF+2/39sD++RO5AnJbPAi7pyckbepbRFpuu9YrewpMW2TUXF6Q8KRTBa
         bv7ZfrkDWo41gK/1tusAVoz5bw60N5Px4JihB63vt8QCPdcKRLYNna5ds6l2XGm9Ge5J
         A+fjr5OeLS/J4Z8RRNzHaL8zTBGjysw7ZwEMnR/ArSO/meeYQJX5efQsqL8CF5HT2aL0
         bL6A==
X-Gm-Message-State: AO0yUKXHyNH4rTCU7F5Zoq44XNlhIEUS8pJGgl7jIHY8BUixUpu8vpoZ
	vNRFD8zXha8y4xMY1NQUx7osN2YJnwDlNTJ3
X-Google-Smtp-Source: AK7set9hTzR19H75OZ+KCGwk0xY4ukdRB5fD+F5y3OEC4AKzPLXqs450JrI5RSl1Ypsyl9gIdXzqNA==
X-Received: by 2002:a05:600c:990:b0:3da:fc07:5e80 with SMTP id w16-20020a05600c099000b003dafc075e80mr1549310wmp.12.1676020414014;
        Fri, 10 Feb 2023 01:13:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c2cd300b003dfefe115b9sm4965219wmc.0.2023.02.10.01.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 01:13:33 -0800 (PST)
Message-ID: <c1e096fa-5941-cdd8-2cdc-ecf04661a389@linaro.org>
Date: Fri, 10 Feb 2023 10:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] soc: aspeed: Add UART DMA support
Content-Language: en-US
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au,
 andrew@aj.id.au, jirislaby@kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
 <20230210072643.2772-3-chiawei_wang@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210072643.2772-3-chiawei_wang@aspeedtech.com>
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

On 10/02/2023 08:26, Chia-Wei Wang wrote:
> This driver provides DMA support for AST26xx UART and VUART
> devices. It is useful to offload CPU overhead while using
> UART/VUART for binary file transfer.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  drivers/soc/aspeed/Kconfig             |   9 +
>  drivers/soc/aspeed/Makefile            |   1 +
>  drivers/soc/aspeed/aspeed-udma.c       | 447 +++++++++++++++++++++++++
>  include/linux/soc/aspeed/aspeed-udma.h |  34 ++

NAK.

DMA drivers do not go to soc, but to dma subsystem.

>  4 files changed, 491 insertions(+)
>  create mode 100644 drivers/soc/aspeed/aspeed-udma.c
>  create mode 100644 include/linux/soc/aspeed/aspeed-udma.h
> 

(...)

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id aspeed_udma_match[] = {
> +	{ .compatible = "aspeed,ast2600-udma" },

Undocumented compatible.

Please run scripts/checkpatch.pl and fix reported warnings.



Best regards,
Krzysztof

