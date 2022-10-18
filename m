Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A02602D0C
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 15:32:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsFCw44VZz2xGv
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Oct 2022 00:32:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZjLD7F1V;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZjLD7F1V;
	dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsFCm2kJ7z2xGv
	for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Oct 2022 00:32:33 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id z30so8564179qkz.13
        for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Oct 2022 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kaCHs2xS34elvJKmekTcmuQN9rNgKKexethJB2Y5REc=;
        b=ZjLD7F1VbceTQdc2FVYGM7rpP0gstOOB09yNhHNiAVOxHHRSI7rGQKG/pWUAG9tV9u
         xsu9qHuKEEYagg01nvbAohXXIwLdUGr59Bf+RzhYYiPHCII2jlQ5LBcNagarjtuR7QKz
         x49vCaGeYNSKtFDuti8ryyppzuXuaHEsY/ezLvw7QniellFRh24Ql7wd4m6hgzrF1JBF
         d84sYUuyKZlSpbZPk/76KcsOZxmzkzXbooe39RKpshXZEqRVWUhwKjCJHcF/qzXAFMBO
         v4UapfMF9rX5/53ohSH4zefn1KbtUo1MBUIY+TvJoWYx1ua+XHg40ymsrkA/SF8QfoeK
         masg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kaCHs2xS34elvJKmekTcmuQN9rNgKKexethJB2Y5REc=;
        b=QtKlCnxk82E5BQVGeDTuWN6MwZPMTrrwKg49EVtNXMQXN9Rl5DXjCcOKoaHWiR2nXY
         Dtl6QJv4iy0OPXpN3TIZ3ZldiOdHv3oSKFTMv8yJFXcwgcvh3Fr0thYE0sJEse+YqRQU
         PyGyd+Q0tog+W37vVSj1f4r6Q05v0gaiiVhn54idXv/4iO2ifAESTO4CmFTy//x3vBkS
         7VFqu8Zz/sMc/P/tspDgFzNYOW2b1xtLO1vr/JQqu2VhOsPr2OmxpXsb77HzlzU4GLAO
         QG9SzZk2B5DzWjI9tgY0yCKhvXKChVg/u0mbH8KWYD1h2xgTSnse4emCAky4H8PG+24m
         2r6w==
X-Gm-Message-State: ACrzQf22ZJb6tVlEvQRYu5+vrz3AGl4grGbxBXyzu9xhSaWktouvdUQS
	B6cCqksBpFoqhwfIZLH2Sdeh1Q==
X-Google-Smtp-Source: AMsMyM6HmKsH2C2pBgFfSroERxT1KE12W4nAI9sADy1phl2YVcta9wYDoZr46YTDutbO0FZuaKq7aA==
X-Received: by 2002:a05:620a:2150:b0:6e0:79d1:3216 with SMTP id m16-20020a05620a215000b006e079d13216mr1799310qkm.406.1666099950341;
        Tue, 18 Oct 2022 06:32:30 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id l12-20020a05620a28cc00b006ecf030ef15sm2427438qkp.65.2022.10.18.06.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 06:32:29 -0700 (PDT)
Message-ID: <d681e41f-fd8e-f233-2a25-53c4e0a52c33@linaro.org>
Date: Tue, 18 Oct 2022 09:32:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] ARM: dts: ast2600-evb: correct compatible (drop -a1)
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20220804092727.64742-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804092727.64742-1-krzysztof.kozlowski@linaro.org>
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

On 04/08/2022 05:27, Krzysztof Kozlowski wrote:
> Due to copy-paste, the ast2600-evb and ast2600-evb-a1 got the same
> compatible.  Drop the '-a1' suffix from the first to match what is
> expected by bindings.
> 
> Fixes: aa5e06208500 ("ARM: dts: ast2600-evb: fix board compatible")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index c698e6538269..2010e3cb6158 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -8,7 +8,7 @@
>  
>  / {
>  	model = "AST2600 EVB";
> -	compatible = "aspeed,ast2600-evb-a1", "aspeed,ast2600";
> +	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";

This is weird. I sent this patch on 4th August but it was never
applied... yet instead I see a commit in mainline from end of September:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d916109169159f9319f45ce7e1339e41eccf22c4
which was never sent to mailing list.

So instead of picking up existing commit from mailing list waiting there
for 1.5 months, Joel just committed something without sharing in public way.

Best regards,
Krzysztof

