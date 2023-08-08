Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B08773C12
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 17:59:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=APBgrt3C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKyZ13Zr6z303p
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 01:59:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=APBgrt3C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKyYs035lz2xqH
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 01:59:44 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bcf2de59cso851287866b.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Aug 2023 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510381; x=1692115181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMxa/gVKuibvIVWmpuZpFEwzt5/SE/hyALHDnspMprc=;
        b=APBgrt3C3itVlNbiO6kRKj9GJylAzpbSRWqWoH7imhPKP4364nZOfJjIuU8NP4tW0+
         OBLn3dRTQvbr9xaTZLE3Eq+Dk9FIxUOKTqZgKCdE//N/HNdbee9Xk3SJq128K9pBzgf3
         q39fkzthJTV1YTeBceTrvWDiINhKaUeM895bXJHwlQbVKgF7ps3Pc+I0mOQZmbX0p6rC
         UhFf6hfUn3sHjnR5yGJ19swURzA172Uc0IZ4508FtCASzqMUb+G3CMQHhb6SdLAJ02Mj
         4iXzIHqztOevMtzQP3xdoVamuz3EZVkcJigPVlGX/FG/X3DRViYo3lp97lIktNvSD4Ib
         jwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510381; x=1692115181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMxa/gVKuibvIVWmpuZpFEwzt5/SE/hyALHDnspMprc=;
        b=lBZD5+tChGbefEpQed78ucWuWxNOHokH6ABSTYarf7pD9odMzE1m9FW9dMog0f00Fz
         9/Pypa9yNIDMCCnVkB4omIBfRQzAJNMfJaMGkHilJwZ/dANWIGsK2iyzumQ5vNjs4R5W
         NXu5YAKYh6YmwvjNlaTN5ykVKdUuVc6wlsFOyn2uQzjCAt8c4NrRJ+WJZUVHTYn1kBcL
         tO2crRm0XoLc8SeHePH1dK8drngRpHPi2/g0JSotpnVoJ1iqxCIDX382u4MV7VP4lir9
         9X7oSweE3or6gusGfmP6agZYH3mPdngSFalgfpe1RWL3ddtkCCqfgkGOfx3jmvb+EU+z
         Yawg==
X-Gm-Message-State: AOJu0YyRPdjDCfusXWHYmM+FFBJapzlcvHDHPfWAuV+zOq02O7/y8UHb
	vvWmn1dzpXOTMKvGmP0NOgni7g==
X-Google-Smtp-Source: AGHT+IHhsovjxambnGZbWubCZ75bBFP/uvpp7zDOuVqUVK6QAMMeX03Ka2xjCi2S22J1Wto5SIwDqA==
X-Received: by 2002:a17:907:2c75:b0:99b:4378:a5ab with SMTP id ib21-20020a1709072c7500b0099b4378a5abmr9603548ejc.74.1691510381238;
        Tue, 08 Aug 2023 08:59:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id bn10-20020a170906c0ca00b00992b0745548sm6886811ejb.152.2023.08.08.08.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 08:59:40 -0700 (PDT)
Message-ID: <49edf46a-b35c-1135-c500-2382a453e58d@linaro.org>
Date: Tue, 8 Aug 2023 17:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] dt-bindings: i3c: ast2600: Add resets and reset-names
Content-Language: en-US
To: Dylan Hung <dylan_hung@aspeedtech.com>, jk@codeconstruct.com.au,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@aj.id.au, p.zabel@pengutronix.de, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
 <20230808154241.749641-3-dylan_hung@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808154241.749641-3-dylan_hung@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 08/08/2023 17:42, Dylan Hung wrote:
> Add two reset lines to the AST2600 I3C controller:
> - core_rst: the reset line of the controller itself
> - global_rst: the reset line of the I3C global register block. Since all
> six I3C controllers in AST2600 share this global register block, the
> driver needs to handle this carefully. Generally, this reset line should
> only need to be de-asserted.

The commit msg does not explain why this is now required.

> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> ---
>  .../devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml  | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> index fcc3dbff9c9a..3166d6f3a39c 100644
> --- a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> @@ -23,7 +23,12 @@ properties:
>      maxItems: 1
>  
>    resets:
> -    maxItems: 1
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: core_rst
> +      - const: global_rst
>  

Drop "_rst" suffixes from both.

>    interrupts:
>      maxItems: 1
> @@ -48,6 +53,8 @@ required:
>    - compatible
>    - reg
>    - clocks
> +  - resets
> +  - reset-names


Best regards,
Krzysztof

