Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F168A5E5BAC
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 08:52:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY5ZL08nqz3c2q
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 16:52:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NKMnWZgS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NKMnWZgS;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY5ZG3T7pz307C
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Sep 2022 16:52:38 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id h3so9839196lja.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 23:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HpPp0BHUrPNweVTZtr7NErbLRKsWdneVoqjGlBiJPh8=;
        b=NKMnWZgS5BSvCK945ZAajPqZeW1VEAPF/K92kxSO4ojFqEyhY8uY9CH+GHuAXdXtOd
         SfSN5wRHjrXBzsEv2ctbxRIk+0qiV8ELcEryUMxTeLdWAxOYJhtm4pVh4nX611N262zw
         btTtSVEQlc5bzd8yrbHKYbpE+5XChRGCVaGtbwozWlmXAF70qot5gRQS8AhJ+KwdGUtV
         BAv7WxehOAK1Go0BWI1ZwmbfAD66AxqIxc5g/1txVRCAqFK/Ar1RKkdYZig5/oV8jbjz
         S0NAZ5x8Uk5mvit51bkHuua9/6uHPIy150GK6No/16fjALgvzhVK1961Gf4rf4YawyYC
         SiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HpPp0BHUrPNweVTZtr7NErbLRKsWdneVoqjGlBiJPh8=;
        b=30mTkYEtTo7iGmI9OLEjY2Aula7JD0kK3cYr6rdWXZfHGoVe/mBA1wq6UcSDCSPN/m
         kVEcfZSRfYTrMoWQ8/n5X42pHSGbz+wofT/qjjC42Kre2iblRu86905ioDW469motFDm
         QKQo0xFcAucp2msqYGvwMFmGbzZkl2oZDesm0pAMz3KcFqZEUhWnAVP7cyv4+N8ppFVK
         5MLYKzT/iiiOD4MWQ9lkzSLvyUrqhWg5oT4XmPLOfpicJqsvxE142+AkmlEq3Zi1QHc8
         jYoaHoC1tTbXrvCfVfLH0pTCzdpwetvjA9JgmfXVy39KRPIyPU++lTqXsqIIfzW+NLru
         j7Wg==
X-Gm-Message-State: ACrzQf2TGZ3rWYSvMyzAbtkEYgi4wXJsPzw16nZZ4czMj14SaHhpFyHe
	njs/hix6yO5Tru8n8+5iZFa53w==
X-Google-Smtp-Source: AMsMyM78If/cBNQ1SnC+v6xychOd6uY7sVFoQMHHASjrPCwbCyMRcKsSoHMRnkbuxCvoylYmkrHGyw==
X-Received: by 2002:a2e:7309:0:b0:26c:3db7:8fe2 with SMTP id o9-20020a2e7309000000b0026c3db78fe2mr525386ljc.387.1663829554770;
        Wed, 21 Sep 2022 23:52:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a7-20020ac25e67000000b00499b57032c1sm784269lfr.144.2022.09.21.23.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:52:34 -0700 (PDT)
Message-ID: <f84250e7-39fe-80d9-9e50-700f9752367a@linaro.org>
Date: Thu, 22 Sep 2022 08:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add AMD DaytonaX BMC
Content-Language: en-US
To: Konstantin Aladyshev <aladyshev22@gmail.com>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
 <20220921210950.10568-3-aladyshev22@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921210950.10568-3-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/09/2022 23:09, Konstantin Aladyshev wrote:
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.
> 
> AMD DaytonaX platform is a customer reference board (CRB) with an
> Aspeed ast2500 BMC manufactured by AMD.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts | 319 ++++++++++++++++++
>  2 files changed, 320 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

