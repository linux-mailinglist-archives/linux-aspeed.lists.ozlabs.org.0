Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B77257C7
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 10:34:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbgcR3qy6z3dt7
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 18:34:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U2hVnnnQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U2hVnnnQ;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbgcG59Y7z3bxY
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Jun 2023 18:34:05 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-977d0ee1736so548620166b.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Jun 2023 01:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686126840; x=1688718840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHYmPirAe/9yvPI0Un/v2zVHDoxK5QiPyOUyzdkadvI=;
        b=U2hVnnnQHDbTv1gfXtWS8Pqlo7XQNgezPdGgIOH15eBZc69fe4DzqxB+O0KT+AwOd0
         U/ONfqGQEzf+j24bGuDllsF83FLGhDWc19JJWKjOeDe4bNSvAtGmeBPYHdMjrZsakqcD
         NaiGPG6Ts0znHSVO4WYEQVESzMF8KM4qlRZPKL6QCxWPRecPCQsKEZJmLaHIs0QWtwv9
         XGOG4DtNMaj67xC4rdSipeUjR4h+PxN9m4SGyy9kc3xrSsLiR7l2EaHPO94FL2RT8xwf
         aTQMXrc1m90PqKIfLUJr3psB9ASdlkyuH2y+nqiyxMkhx1sgmXUBP5Sk8XiFZ/fbeGj8
         djDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686126840; x=1688718840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHYmPirAe/9yvPI0Un/v2zVHDoxK5QiPyOUyzdkadvI=;
        b=e7yM1iBKKtQOwBu/JQ53LGzL57riZeAMk9mNwlQ9e4Jwr/ICA3L6zZNQI/Y3trBl1c
         N3ldWkEMPLVXvitvjP1NdbLCGvCfYW5zbMULxnEFBaY5YsdB+AuXO9wji/jUoNKi9xdB
         yCqeftaalaG3XuTLj9N/3fDp81LAVYAkbZn8gFCMJd3tdWPk8qMb6XgjXag9KsTjn6Bb
         zdIO5sF4zQezBHMeRmGkzyt0yquwBwwdPK9qgJygt7yE++XpcTExXrKIHI7OX6y7+rQg
         tzNPB9QQdregm59/ep63kwo/t0zUf91mQohdRgBowCLUyts3Azlt3tFzM5IMND9aJOl/
         evDw==
X-Gm-Message-State: AC+VfDwMU41BUH2ZGChOp+K5dPha7rnqifIsup+B80s56fIXIJU48HXn
	E/CEtiezKxAW9wO++Z/3dEKjrw==
X-Google-Smtp-Source: ACHHUZ6h6766vJMwn/tNHn3JSBfjpWgC88xarXppxRZ+ze1TywPShnS202vrMK1Xo6zB8ufvs3B7nw==
X-Received: by 2002:a17:907:e8f:b0:978:8925:7a00 with SMTP id ho15-20020a1709070e8f00b0097889257a00mr266294ejc.15.1686126840620;
        Wed, 07 Jun 2023 01:34:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ci17-20020a170906c35100b009787ad3157bsm823497ejb.39.2023.06.07.01.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:34:00 -0700 (PDT)
Message-ID: <2af1bc5b-0be6-46cc-3155-307f13fbba11@linaro.org>
Date: Wed, 7 Jun 2023 10:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-4-billy_tsai@aspeedtech.com>
 <35bf0a69-bcf6-ae35-eb3c-e74cfcf9c571@linaro.org>
 <ZH89fXknZlhGmM_H@heinlein.vulture-banana.ts.net>
 <c28f963e-d13c-6b5c-c389-996e986f81d5@linaro.org>
 <SG2PR06MB33652E18980E9CF8E4F0894D8B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <742d3161-3a4d-ea77-7bd4-85f6636bf400@linaro.org>
 <SG2PR06MB33657063A2E3239AD0A21F718B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR06MB33657063A2E3239AD0A21F718B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "lee@kernel.org" <lee@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 07/06/2023 10:32, Billy Tsai wrote:
> Ok, I got it. I will remove usage of the simple-mfd and parent node in next version of the patch.
> Thanks
> 

1. Whether parent node stays or not, depends on the hardware. Please do
not make random changes which do not correspond to the hardware.

2. Implement all, *all* the comments from previous discussions, not only
this one.

Best regards,
Krzysztof

