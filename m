Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8D55F5E2
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 07:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXrNM1DQ8z3by6
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 15:57:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JkUoMSVH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JkUoMSVH;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXrNH6mCrz2ywN
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 15:57:50 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id ay16so30351500ejb.6
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Jun 2022 22:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1WfdVfNcXkp3OxFuJuEQhMM39v5eC68bY2ADm6rLKI0=;
        b=JkUoMSVHOd8FXIU1nP7mHg39NA+HAkmXOBLZHIkIRWjuF2QXpez6vuJMIWGUWFHEby
         5o4bGCiXixkuKlUlu2olkq0QLN2UOIntPX6lG3+7PbXV+avqVfJ253cahNkw20GGXPeA
         MHvSKO3EVsTxg+HQtXEwBaZzsvry24d4BvkcEdAr5jVs9aGqW6Xuvyy663JNPBbkngxL
         ek6xf1/RqwKb2cDwtZy8lrOxsp43tHw2dRO21IpABqGEytjhcHxUraOi/YMWnoRgDrmq
         fIbCX7sv+Ga3+sPyzf/OYbX6uTY+nt3ooO/FRKAj9IUFTzcd83VY9OMyTF/rzwkUp2rw
         iYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1WfdVfNcXkp3OxFuJuEQhMM39v5eC68bY2ADm6rLKI0=;
        b=wOztezSHcF62Ck/V8xaTSvYETEE8o6lDuW20GD6b/ySP3khJJM8oJcpHNubWkYRwga
         zxIlcdIb4pDVuf3i5Y3GYac20O/FV0XUzYnErH4xYBS7Y0/7YCzK7cihyBodcIW7PnSj
         UBblC+W29CBXeFNFvDNXZms8ZHHtGk6zS/9zb3OqginRIVaxIEi7iZH8/0nG9nGMRwxv
         8v7buQjhHLuJL0u1c2j7ukTHZziWByWlC17hCKvVLoF4e4Rkc3K7tN8mkTcxAooNpjYB
         Pfms1ez3hxLN16YYJbHqw8chS3ZuHM3BaPbUiEsPdU5qIarS1iXcBcl3iqS28EjUvcRs
         vkzA==
X-Gm-Message-State: AJIora/tsxffILrM6P6h9SKd6X3lc3qmtKbyP+3kkrKbrfVvFYqE3e9S
	JbdTSDnuhYkfTvq7uLZiVkaAtA==
X-Google-Smtp-Source: AGRyM1tKY3/ufkVIb0NqXcBrOPVDKBLhqSVvGuyqn+dsBxeoxntoXm1sQv41p5v8Kn71T36sBhLAmA==
X-Received: by 2002:a17:907:7213:b0:726:9f27:8fc8 with SMTP id dr19-20020a170907721300b007269f278fc8mr1551543ejc.523.1656482262769;
        Tue, 28 Jun 2022 22:57:42 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d20-20020aa7ce14000000b00435d4179bbdsm10892308edv.4.2022.06.28.22.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 22:57:42 -0700 (PDT)
Message-ID: <b70e06e7-81fc-dfc1-f9c5-f83cb4a18293@linaro.org>
Date: Wed, 29 Jun 2022 07:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 2/5] dt-bindings: clock: Add AST2500/AST2600 HACE reset
 definition
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Randy Dunlap <rdunlap@infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Dhananjay Phadke <dhphadke@microsoft.com>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220629032008.1579899-1-neal_liu@aspeedtech.com>
 <20220629032008.1579899-3-neal_liu@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629032008.1579899-3-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 29/06/2022 05:20, Neal Liu wrote:
> Add HACE reset bit definition for AST2500/AST2600.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  include/dt-bindings/clock/aspeed-clock.h  | 3 ++-
>  include/dt-bindings/clock/ast2600-clock.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
> index 9ff4f6e4558c..6e040f7c3426 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -46,11 +46,12 @@
>  #define ASPEED_RESET_MCTP		1
>  #define ASPEED_RESET_ADC		2
>  #define ASPEED_RESET_JTAG_MASTER	3
> -#define ASPEED_RESET_MIC		4
> +#define ASPEED_RESET_HACE		4

I did not ack such change. This is a significant change from previous
version, invalidating my previous ack.

This breaks the ABI, so NAK without proper explanation why ABI break is
accepted.

>  #define ASPEED_RESET_PWM		5
>  #define ASPEED_RESET_PECI		6
>  #define ASPEED_RESET_I2C		7
>  #define ASPEED_RESET_AHB		8
>  #define ASPEED_RESET_CRT1		9
> +#define ASPEED_RESET_MIC		18
>  
>  #endif
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index 62b9520a00fd..d8b0db2f7a7d 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -111,6 +111,7 @@
>  #define ASPEED_RESET_PCIE_RC_O		19
>  #define ASPEED_RESET_PCIE_RC_OEN	18
>  #define ASPEED_RESET_PCI_DP		5
> +#define ASPEED_RESET_HACE		4
>  #define ASPEED_RESET_AHB		1
>  #define ASPEED_RESET_SDRAM		0
>  


Best regards,
Krzysztof
