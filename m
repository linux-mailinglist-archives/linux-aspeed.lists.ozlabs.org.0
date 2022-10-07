Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B42095F748A
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Oct 2022 09:06:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkK9q677kz3cdY
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Oct 2022 18:06:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=foHGxaip;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=foHGxaip;
	dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkK9g4wN5z2x9J
	for <linux-aspeed@lists.ozlabs.org>; Fri,  7 Oct 2022 18:06:44 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id q7so2218369ljp.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 07 Oct 2022 00:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FSmGNYPsHl9Ro1MJ7SK0qxA2b0opEEGQTUXyGcDbh9o=;
        b=foHGxaipVhE4g1J2J3AKimMGWlMyYJ94BYSHus4iZXvHzycxZHOaxVIcx75vQhOkhM
         RUVn3+LF8DvwQqMfdRMsxSMAJQngOWfZ6Svfr2JJ+G/4EvJx4bwVbjnmBY4t8CWfPni/
         aOR68VVLHTz7M7lPiPwoxWld9aXAT2/zkWVus3Zvn8q61bqVvRZ33+lRHBUNJTqjTFbs
         7XOGhE0fGA7qyBmXMZYY+mSQ5mFW34rU2W0UDjJGmxSIG+Y43UQsQLQ/lMx7EWFebWB4
         /P3j0y4pT6ICbE7mbZW5+cWBwZvsuC95D1CrY8tVaGHo0rW8nIQJiv1qvS6CfpB+hnHJ
         9lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FSmGNYPsHl9Ro1MJ7SK0qxA2b0opEEGQTUXyGcDbh9o=;
        b=IG9AvrhTMRVQFel19lf8HqyGwlQZKSeG1AR2sIvCarWdt7guzKst4bYLMrt2EcOHT5
         XQqWm0nY6uAJ8oE9ezdzS5W80sg2Giqr4dw3XLyf91CTN70q0o8EPDPvjNaWFuP2JA/Q
         jDiUFV5zktAs/rufLsHoIahoIMHFCO451xhPTqz7dp6hq1IBqmmwWNjLHIFYbM6+/qal
         Q1+0B0FhFTc0t2x+b8D+ItWpV3HL1AjHDUOCcP6iEMWLD3q/T5GjPT0qu5THZTPi6Xou
         tzlMAg77E36JfR1FHDqAP+CA6z501CE3N/U3S4TV5OpRMJ52aeeFPtASTgKqCEZCgjS1
         cEsA==
X-Gm-Message-State: ACrzQf2igbLKA/ppDdTyLNieJrmTDYTFPwjIu/ed33+64AUUdiXS6dXg
	oc6J59Qqxbqm6l/tpJxs0yFatw==
X-Google-Smtp-Source: AMsMyM7eIvv5GKIgDiCZIjDDnCooaDnHvZD7wBLGQTTRpllEwxZlb9pUXT4af4QcZRMvuZKVS512JA==
X-Received: by 2002:a2e:92c8:0:b0:25d:6ddf:e71d with SMTP id k8-20020a2e92c8000000b0025d6ddfe71dmr1129408ljh.170.1665126398407;
        Fri, 07 Oct 2022 00:06:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512201100b004a27bb1ad62sm173557lfb.205.2022.10.07.00.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 00:06:38 -0700 (PDT)
Message-ID: <4b861177-df32-ab9c-c746-f32f0ee6438d@linaro.org>
Date: Fri, 7 Oct 2022 09:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 krzysztof.kozlowski@linaro.or
References: <20221007055346.3484180-1-Delphine_CC_Chiu@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007055346.3484180-1-Delphine_CC_Chiu@Wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Bonnie Lo <Bonnie_Lo@Wiwynn.com>, garnermic@fb.com, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 07/10/2022 07:53, Delphine CC Chiu wrote:
> Add linux device tree entry related to
> greatlakes specific devices connected to BMC SoC.
> 
> ---
> --- v3 - Add documentation of board compatible (bindings)
> ---    - Add board compatible
> ---    - Remove the bootargs
> ---    - Revise the DTS node name
> ---
> --- v2 - Add binding document
> ---
> --- v1 - Initial draft

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

> ---
> 
> Signed-off-by: Bonnie Lo <Bonnie_Lo@Wiwynn.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-facebook-greatlakes.dts    | 241 ++++++++++++++++++

You need to document the binding. I think you already did, but then
submitted without it. Read the process:

https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst

Best regards,
Krzysztof

