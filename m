Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FF161DD56
	for <lists+linux-aspeed@lfdr.de>; Sat,  5 Nov 2022 19:44:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4RHH01pPz3cNL
	for <lists+linux-aspeed@lfdr.de>; Sun,  6 Nov 2022 05:44:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=i8fgFmif;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=i8fgFmif;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4RH54wb2z3c6d
	for <linux-aspeed@lists.ozlabs.org>; Sun,  6 Nov 2022 05:44:15 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id b9so10702775ljr.5
        for <linux-aspeed@lists.ozlabs.org>; Sat, 05 Nov 2022 11:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqM95oaPnJH5MWhlRXsh/pWYkhJUcy6fi/S/KLDeWUY=;
        b=i8fgFmifmE2Phhsq1JPfWQNpmrQX0+ooyicsgoxgtQAmqDeRap3MBc7AoGm0MJ7M3M
         Har1YTulusg/2t3IN/iBpL3sK3EsnGVE/pGFJlCjTe1xrZb46hVwZKzfz65FOmc1Uz8R
         rmwsRRKwlnbGBfN4dYB1qptl5Yfu1PNVZV9rOH4zQFXNYqjRBCMOwVBHgUW+Vrfxawt6
         wGf/Q0BoF2U23YLWy0YQVKf3Q2oRqK1PrEldxJ1zHXSS6wPpoq7WK/wC/qjetG32yN47
         Q1lq/MB7nBpivCwjpjVYSsbjan0knjOuKIqeZZPKM6PNmY0W2Voove26aW731rivYfKm
         nmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqM95oaPnJH5MWhlRXsh/pWYkhJUcy6fi/S/KLDeWUY=;
        b=ikjQEu32ofUP89GVXQdWexYP8cHJIYlJDhK+7QDgdeEB9DMmxdPWDTaT0FXXa3gyI5
         39hDga13e+nF9GUeRNZefwlJmCWh2yI/YJc9DyeZ2OI3jCfHG5Xc+bCf8eZ5nt+zaUxy
         XIE01K3D89AHnf2xFGOKy//lUO6UqiuFJwIATHO5yfyaGqIBg6yOqFHo0qhhvSbXQFT8
         Pp5EtJXIBy4LROn5DuOwz2gtRXDyhtBbxddFwxZgc+V1eUy7yv1xy9hx0I/rnW43Z2Fm
         Yq5bA4lieyP2GHkLz98mLDNPSzE1gm5Ipkrh+Uyl0SansIs3pAQ3h1OMfL68ShTNw8og
         DAYQ==
X-Gm-Message-State: ACrzQf2lb19zqsL4u8c2ZalJjYWZAiiH9v9fN8vTWUjp9dqwcl8UEmS3
	ZcMtFgojbbqaxddzv4FB7jZrmA==
X-Google-Smtp-Source: AMsMyM7OO4zYB/vcy8i1R2jRRjgDN+xMBxQNR3RbzhMCOaS4aSSPJtSTQhnXBAgmsT65yZmr79W0Ng==
X-Received: by 2002:a2e:91c4:0:b0:277:e53:151a with SMTP id u4-20020a2e91c4000000b002770e53151amr15950844ljg.81.1667673848114;
        Sat, 05 Nov 2022 11:44:08 -0700 (PDT)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id a21-20020ac25e75000000b004991437990esm386360lfr.11.2022.11.05.11.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Nov 2022 11:44:07 -0700 (PDT)
Message-ID: <35b095a0-6bda-32c2-99e2-6815a852f9f0@linaro.org>
Date: Sat, 5 Nov 2022 19:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
To: Zev Weiss <zev@bewilderbeest.net>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, soc@kernel.org
References: <20221105013321.2719-1-zev@bewilderbeest.net>
 <20221105013321.2719-2-zev@bewilderbeest.net>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221105013321.2719-2-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 05/11/2022 21:33, Zev Weiss wrote:
> Document Delta AHE-50DC BMC board compatible.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

