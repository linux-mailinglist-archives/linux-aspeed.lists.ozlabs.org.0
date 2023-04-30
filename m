Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FEF6F28D5
	for <lists+linux-aspeed@lfdr.de>; Sun, 30 Apr 2023 14:15:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q8QJx5F1xz3c7d
	for <lists+linux-aspeed@lfdr.de>; Sun, 30 Apr 2023 22:15:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e7asCzmC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e7asCzmC;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q8QJp2Fzkz30Jy
	for <linux-aspeed@lists.ozlabs.org>; Sun, 30 Apr 2023 22:15:03 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94f3df30043so250412266b.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 30 Apr 2023 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682856895; x=1685448895;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mt9USrv+ZHcnB3z89zQ2BG1WQ2PVUi4+cTzv7FJVs5M=;
        b=e7asCzmCbvm127ZLY+yeej1czNgSxlxzCx5F8yqPo2i+MUEQNGfE2kv9QSfmNrDQbb
         04FD5GNWq7RY1yEw0pzec9eBTIuNxN4MvNKIKb7XMrIwOc9MpxSCgKJghMvbSbSE4sQp
         NbC3LHNdtDKP6NFcHSPOcDw7jqOUqDKgXRtfuRtRqwuICACCp9duo6fOtRp7QOaTCnXe
         wK0gKHd7oqidnQGkoBPGql3BG3OARD4RiVLGujNLLHtIZktzcY/6DkNDvapUr0bqH57N
         ivUvgMOHsW215MioSAOEj2GuqF8WqSQ4FHDv+xYB1NEPCH0sL6VgQhL3FDjvsim+2vlJ
         8Zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682856895; x=1685448895;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mt9USrv+ZHcnB3z89zQ2BG1WQ2PVUi4+cTzv7FJVs5M=;
        b=Bu0KlPC1OIxb/2QimvJ31z+INJEkdgmReMA2gYePcVEcuvA5eVYOVkFV8sVvVI4svR
         lBHRCK0EOT/y7hvHAaO7ePgy0DI9B7cUtV1/FTYSry95UlDyTAJFxPpuaBPShAMzUOS/
         fdLqyJh1DvLQSsHB498d142G/TisK8z8WZj4amfH0Dv1rRLsQZHFCdPV3rt3B3in8mZT
         WY/Sm5kOt2nZvuviPJGyz/stmyNMvR7MXUKV9tbT40fzXTcmPpF/QBtitruymXBZRs6V
         mg9nO16vHC8aUK3R+857R2gz4G0UKjhFmvC9I+LO4hnMA9McKndJpGv5KVzcefWexd1D
         80Cw==
X-Gm-Message-State: AC+VfDyKl/1IZnRHlJuW5nzmCtm4OQB574yKy3Dj2JY6etKHHhpZeJKY
	B9GuDmFKXfsgQZVAHpbfnWDi+Q==
X-Google-Smtp-Source: ACHHUZ7M5DuoGnPjgZjSVIWy4ZD2G37gn0fdV1/PvV73VqDv0LTYTlXEbiq0L/b8h/TXkgeCKf5Ugw==
X-Received: by 2002:a17:907:3f04:b0:94a:4d06:3de3 with SMTP id hq4-20020a1709073f0400b0094a4d063de3mr10212201ejc.72.1682856895398;
        Sun, 30 Apr 2023 05:14:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4f23:e9a6:a1cf:ebd3? ([2a02:810d:15c0:828:4f23:e9a6:a1cf:ebd3])
        by smtp.gmail.com with ESMTPSA id va2-20020a17090711c200b0093a0e5977e2sm13794807ejb.225.2023.04.30.05.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 05:14:54 -0700 (PDT)
Message-ID: <93773f00-1301-cf77-9bde-5de0595fec8d@linaro.org>
Date: Sun, 30 Apr 2023 14:14:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v11 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
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
References: <20230430041712.3247998-1-ryan_chen@aspeedtech.com>
 <20230430041712.3247998-2-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230430041712.3247998-2-ryan_chen@aspeedtech.com>
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

On 30/04/2023 06:17, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.



Best regards,
Krzysztof

