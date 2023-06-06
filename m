Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 948A3723FD6
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 12:42:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb6Vh4SfGz3dyF
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 20:42:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xt5rNJ5A;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xt5rNJ5A;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb6Vb579vz3bck
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Jun 2023 20:42:14 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-970056276acso879818266b.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Jun 2023 03:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686048128; x=1688640128;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hztYX3lCCszrQN2sLS6OQQbXo0IrqmI3DHUIMhxyE4=;
        b=xt5rNJ5A92ysQqwhJJhYw0coJTIrKX4DgtbH5fGHfhu5LpDsAZHObPbCnwNHtaMZJq
         G1rbDd7KajXMFc+VlKEkb1tJTOGEcY7/xrhIrYpkQ6NAxSb06EhGap3os+1IPzumdbTF
         wbOv9kZC+/oWDrZJALtqTUYOSS/Mu1JkbYw8DDRMZ0b/QllhL3Mr/xv73KHFNAIlRoLT
         N353oc5ZG3FbdvSogTOYrSGcWRHNGgeZbzsm8NPlkfj4bGhDSe3Z3M8OgaaNxvm36rbO
         3HEAplByMqOIHmg9Atam/7BlRPW9QgKS8pJNMJM0zuw+kF8TNi4FSLN+vtrxaXlrXIfT
         LzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686048128; x=1688640128;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hztYX3lCCszrQN2sLS6OQQbXo0IrqmI3DHUIMhxyE4=;
        b=iIL2FyBWq7cD0n1MMXdABbjDTUjj6ps1mW7PldL0AYEV+t6+4mTqviSPUiuqqli+7J
         0mancN4WHV8+3s3Rx63pD1P7vkZidDCdzORdwabO70ZLhTgECD2sUodKsRwaiays9rzm
         2T/fnozNZzvDGAzfUvLvcbzesDryO4vIrJP+a+h0NnMHDvIvz2l2U5jSN29fxAPFmE0Y
         fo7r1Vlj1X3zj+8bqZi11hW3VeaJWaFVAz7+ikMKKJmXOS+GPMiZSpIAxtlGW/RomNe1
         tmL+hUQnhPcpe7K0ZQdIXt3mMqOaBiqsjWWWMg3VR8+ukXWg/xqWqc+LypTJbe2mNO5n
         3zvg==
X-Gm-Message-State: AC+VfDxD2k8JB3Sk74VK0vOj+5ikOS51aAoe7POF2UXDP6rH6vIXlIXl
	zY4104Z7FX542sw8lecuWnabCg==
X-Google-Smtp-Source: ACHHUZ4AfaeSpVY/ckQkqL5x95HhvZI47BGZCIoqkV64ZUEXQa8B+xm4b1XkP3o7H2cESv0dYCWcVw==
X-Received: by 2002:a17:907:7f10:b0:974:4f34:b04c with SMTP id qf16-20020a1709077f1000b009744f34b04cmr2114952ejc.41.1686048128277;
        Tue, 06 Jun 2023 03:42:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id fx4-20020a170906b74400b00977d0f1c5bcsm3115801ejb.69.2023.06.06.03.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:42:07 -0700 (PDT)
Message-ID: <636526b0-b5b3-aa80-49f7-fa805ebbac5c@linaro.org>
Date: Tue, 6 Jun 2023 12:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 1/5] dt-bindings: pwm: Add bindings for aspeed pwm controller
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, lee@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org, patrick@stwcx.xyz
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-2-billy_tsai@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606094535.5388-2-billy_tsai@aspeedtech.com>
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

On 06/06/2023 11:45, Billy Tsai wrote:
> Add the aspeed pwm device which should be the child-node of pwm-tach mfd.
> 

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.


Best regards,
Krzysztof

