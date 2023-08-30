Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCE078D36F
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 08:57:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jkbqWnub;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbFTR0sSkz2xdR
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 16:56:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jkbqWnub;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbFTH2FH9z2y1c
	for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 16:56:50 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9f0b7af65so77054521fa.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Aug 2023 23:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693378604; x=1693983404; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKNC/Ecmczb+pprJRVI/jNOGGup4YFMq8hyWzf6I3EM=;
        b=jkbqWnubUHVJ7pDBtsbjCJpI7opzjRkpNOhZWxyh3ewKJiV347cttUtFAB5exqm2SY
         cLKf46VUd9ucUG9J5CFPvL7azJ3rSek847s6jY/M3W0d1HQZjTqrKVnOzy7IiAW9YTo4
         peGPNKRtgOrEqPCc3Rv7cxKCOBde7iDSNZpYrAa+dqgx9WqxlJAln1VlgtD7yG2mdwv6
         KYoY8iPHL0Kp8k/RmSkZaaD1RHaKOGDoRhs245JG5P1YIl8j7zFlQEIjmhltEA2yuoVv
         27wrbMMh9rUjXINMF67mKMAcwzSsHjs4Y1yBpHRSnk9Tf3Yu+AhRK5k+QxmgWCRDQLJj
         TJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693378604; x=1693983404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKNC/Ecmczb+pprJRVI/jNOGGup4YFMq8hyWzf6I3EM=;
        b=H02XY4wqdBOP9HB3F8nQ4QOa0owBCWIK57rl7np5nJsIXglXxCT8/jPqkyWzsnfRth
         T8Os0hVvwRMRN3uIavrlNMMlw7w9FjwqyLztY43IzTA6wuh2dtJeAwlHu1jpOaZIfGrW
         K895ms49M6RGgM280ost4horWkKaleo3eMMaqdu9VBvlT8Yu1PJFlhxBzTtwRf8gsLbk
         g2JeXw5FxBdAmSu+jyww/ZlLFWe4/trE7XDOq86MNaoQ8v0rHcSmjIRqjlLXOcc7RyhD
         AB550vEdmd3/5+4bP2cTNYZU/QjqhiYAJjIDAptdfhqP0kNFDrqtTf4ORZIFjHsVtuEJ
         akRA==
X-Gm-Message-State: AOJu0Yz8oBKZm32/Mi9VOqsQCMHIXA6QW1+uHQ3kHKA2kU5Cm16grs0x
	/DLse7wjzIljnzp7MMQda0FgCQ==
X-Google-Smtp-Source: AGHT+IEkicIQuRpUPzDVnA0JHWBk+8C+LPUAUHJor3ONxVqWsbLcrf8WjtNGb6UOKF8JDaWBm8ZWqA==
X-Received: by 2002:a2e:8619:0:b0:2bd:10d3:214 with SMTP id a25-20020a2e8619000000b002bd10d30214mr1105105lji.11.1693378603617;
        Tue, 29 Aug 2023 23:56:43 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id fx19-20020a1709069e9300b0098e0a937a6asm6796450ejc.69.2023.08.29.23.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 23:56:43 -0700 (PDT)
Message-ID: <03729949-1994-6ce1-253b-886a254ac0af@linaro.org>
Date: Wed, 30 Aug 2023 08:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/1] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Content-Language: en-US
To: peteryin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230830025133.3756506-1-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830025133.3756506-1-peteryin.openbmc@gmail.com>
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

On 30/08/2023 04:51, peteryin wrote:
> Add linux device tree entry related to
> Minerva specific devices connected to BMC SoC.
> 
> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
> ---
> v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
> v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
> 
> Change log:
> 
> v3:
>     1.Fixed commit description.
>     2.Add sgpio line name to sgpioP.
>     3.Add ipmb debug card bus.
> 
> v2:
>     1.Add facebook,minerva-bmc in aspeed.yaml
>     2.Use stdout-path
>     3.Add Makefile
> 
> v1:
>     1. Create minerva dts file.
> 
> ---
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 384 ++++++++++++++++++
>  3 files changed, 386 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index fb4ce5df2fa0..9d1b26e7ca6b 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -79,6 +79,7 @@ properties:
>                - facebook,elbert-bmc
>                - facebook,fuji-bmc
>                - facebook,greatlakes-bmc
> +              - facebook,minerva-bmc
>                - ibm,everest-bmc
>                - ibm,rainier-bmc
>                - ibm,tacoma-bmc

Nothing improved here. Checkpatch still complains. Bindings are always
separate patches.

Also, this patch does not apply to any tree.

Best regards,
Krzysztof

