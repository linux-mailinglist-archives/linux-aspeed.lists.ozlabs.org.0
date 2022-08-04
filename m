Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6577A589E5F
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Aug 2022 17:10:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzBxJ1VzDz3bN6
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Aug 2022 01:10:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kh85gxdh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kh85gxdh;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzBxD46Q9z2xJZ
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Aug 2022 01:10:24 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id r17so6259389lfm.11
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Aug 2022 08:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=hpeUu0NXjIKeDxrj1XvCVY0IHP/A19r5SCTdBTc4poo=;
        b=Kh85gxdhYSlqdAnFGKtWf1X96UzuK99fB6PMLFsVEir/gy4CUTXn9Q7gSQH5HL+hmH
         5fiv8sKP+9XHg8rdOWvWxqwaj7k32XabwOvuFHXm6V4+fiSewoNo7hCDwZjQhDueqYs4
         XmK1MIYM4pM3wyYF1RxI+TH/M5vUofrOuwJjH0qoJncp45EVEmEP8BBdkio5kcQRusl5
         eCOAyTxCaTM1qoZfqFataziHaodtWfuCxYzmBQ/270eymSl6EMjyM2W4U37kyJfn992J
         UFAdcrInWKtDTeTvAAK+KXcKmUpewoBoic0kwTpHhwXWs6UQBsaP/Cx8RMrW0w73Raa0
         nGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hpeUu0NXjIKeDxrj1XvCVY0IHP/A19r5SCTdBTc4poo=;
        b=5FcsmgLLBGA7lbbpkb83C59qvILbZsCQq/AXlACcjNUoLEP/BQeb0Jdbh8yDtI3p0/
         7Wiv08fWeRZ0tHbwkCwHro3S4vlLAaxHXw1V9i3Xyp5uE6hoUiWrESOyAqTfG79WFC9Z
         8LM9n+Lhu+KuAVekw/NcUFKpWwCiDsUDw2tFg5jQGyWf4wTREvCLdf0ttJtQJPnT5Fnq
         nIU+SR04w/ZF9FwzFefGqN1r+chGmQFL3Dsyz38w9P3OlCOfr4MFL7hMh2NTTFLQJApJ
         ueyZvPcJycuQsjd2lHxwce5+s2t5mjnqqUTcERAXCBtMtSAYC+Y7T6la7xilHivpFLsp
         6mbw==
X-Gm-Message-State: ACgBeo2h0g9S0kuoiiavu44Fa9VhjM1A8R4rrqrj8XJXcILQANKB57TN
	cS8sHvA88QDdSOAZNEoUW1eDdw==
X-Google-Smtp-Source: AA6agR5P+y/EbBAMoQ+LTEgNQu0vBX7lomMzrDb+OspfhiiXti9s5Ad+GU6HMsv+zF+cKNzhJcVZ5Q==
X-Received: by 2002:a05:6512:3192:b0:48a:a8fe:1407 with SMTP id i18-20020a056512319200b0048aa8fe1407mr889711lfe.550.1659625821153;
        Thu, 04 Aug 2022 08:10:21 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id h4-20020a19ca44000000b0048b041d96dasm149994lfj.153.2022.08.04.08.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 08:10:20 -0700 (PDT)
Message-ID: <1260ddb0-7022-4934-e579-8ca6d9e87b7f@linaro.org>
Date: Thu, 4 Aug 2022 17:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: arm: aspeed: adjust qcom,dc-scm-v1-bmc
 compatible after rename
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220804092710.64636-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804092710.64636-1-krzysztof.kozlowski@linaro.org>
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

On 04/08/2022 11:27, Krzysztof Kozlowski wrote:
> The Nuvia DC-SCM BMC board compatible was renamed iin commit
> 7f058112873e ("ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom"),
> so adjust the bindings as well.
> 
> Fixes: f77024c80147 ("dt-bindings: arm: aspeed: document board compatibles")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 1895ce9de461..20469519e497 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -80,7 +80,7 @@ properties:
>                - ibm,tacoma-bmc
>                - inventec,transformer-bmc
>                - jabil,rbp-bmc
> -              - nuvia,dc-scm-bmc
> +              - qcom,dc-scm-bmc

I missed to add last-minute change, so this is not correct.

Best regards,
Krzysztof
