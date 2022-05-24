Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 770025333EE
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 May 2022 01:30:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L79RJ1ybSz3bkP
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 May 2022 09:30:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qwBgfbWm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qwBgfbWm; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6qJl4TlXz306M
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 May 2022 19:53:25 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id bq30so29968633lfb.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 May 2022 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f3EaAl5YGKF2nwF2lKP9920mWbceFLAyXVzRrf1riF4=;
 b=qwBgfbWmJ9JO/NgcfvPrVh7ad1QWFamF+e+B5pOruIZiFpe8i1j29cDKqxSyNDtwuc
 dCACEEqZrA1t/50tI9dLJSXuvzcJAp6HKn2mdr/1aHSg75me98KAHY2XEko0pI/6ls8Q
 UTAFzkLewsrgTD64NlNPSfGlFs8Ow3ezNBCoFI7kefPrYNfGnahzmoG/5rwGyqLiWJHO
 rnQYvkH7qPc3DofvTAGVhjUyQ8KD3QyWv/YoLDOvY19wC305TWSeyT/SDZIAmqKEgoNZ
 leh4jRMT59ev6gAtfo7GFtcmWnGlDH/chAsuaI0bb5xRcybKJlq8zokwGkJSrjIa65lt
 2kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f3EaAl5YGKF2nwF2lKP9920mWbceFLAyXVzRrf1riF4=;
 b=bwINBem/2bLximq/36mdrjAmszG02UOTF5/+CACaP7mTeRh9KZrweqLUkftjJAVu03
 yo7sGCW1gdWokUdCSLaWAIWiB81M9ef1Mh2ff6AJd4piTHkwnC/VBQKgSqZGeJXnYydv
 +4+01wNgfoz558jmM44YKrsg6vSDqw0dbnWPUQw0HSJjv4u5cR2yH9kgRHv8uMZA9qcs
 +pg1QRH39E5VZ+IWFhKn0sgnu8nYES7qBZpxDzLdl2yvgjJDFyp9t0D6Oz+Eqq3EEyoj
 tSP2iENuxEOQvAABYNeNrpGx2wzlYH28h9oAsdwVuPn3NwogJb2Ge9QriSWYtEn82O2W
 ICKQ==
X-Gm-Message-State: AOAM53007REvkAM6qg7tuh9D+DG6pCdtQVPowKHq5A20zkaw5ZjsK9X8
 3O23+oobx4tS8ZNKiirhdOwAjw==
X-Google-Smtp-Source: ABdhPJx1PniuT5qa9mQZG/emNiS0626VVTzY6C2GFS7u3+z9a2qzGnnM6NLsqhcyXb+NByXjxm/3GA==
X-Received: by 2002:a19:e050:0:b0:477:b0ae:1312 with SMTP id
 g16-20020a19e050000000b00477b0ae1312mr18329856lfj.357.1653386000033; 
 Tue, 24 May 2022 02:53:20 -0700 (PDT)
Received: from [172.20.68.48] ([91.221.145.6])
 by smtp.gmail.com with ESMTPSA id
 o10-20020ac2434a000000b0047255d211b4sm2442218lfl.227.2022.05.24.02.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 02:53:19 -0700 (PDT)
Message-ID: <dd67a453-b75b-d092-f999-3faf05ef8160@linaro.org>
Date: Tue, 24 May 2022 11:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH -next] ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220523175640.60155-1-quic_jaehyoo@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220523175640.60155-1-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 25 May 2022 09:28:38 +1000
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 23/05/2022 19:56, Jae Hyun Yoo wrote:
> Nuvia has been acquired by Qualcomm and the vendor name 'nuvia' will
> not be used anymore so rename aspeed-bmc-nuvia-dc-scm.dts to
> aspeed-bmc-qcom-dc-scm-v1.dts and change 'nuvia' to 'qcom' as its vendor
> name in the file.

And all users of this DTB now have to update their bootloaders, scripts,
installation methods. We did not rename FSL or Marvell boards, so
neither should be renamed this one.

> 
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
>  arch/arm/boot/dts/Makefile                                    | 2 +-
>  ...eed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename arch/arm/boot/dts/{aspeed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} (97%)
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 03f5b3a15415..2a3c95387613 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1584,7 +1584,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-lenovo-hr630.dtb \
>  	aspeed-bmc-lenovo-hr855xg2.dtb \
>  	aspeed-bmc-microsoft-olympus.dtb \
> -	aspeed-bmc-nuvia-dc-scm.dtb \
>  	aspeed-bmc-opp-lanyang.dtb \
>  	aspeed-bmc-opp-mihawk.dtb \
>  	aspeed-bmc-opp-mowgli.dtb \
> @@ -1597,6 +1596,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-witherspoon.dtb \
>  	aspeed-bmc-opp-zaius.dtb \
>  	aspeed-bmc-portwell-neptune.dtb \
> +	aspeed-bmc-qcom-dc-scm-v1.dtb \
>  	aspeed-bmc-quanta-q71l.dtb \
>  	aspeed-bmc-quanta-s6q.dtb \
>  	aspeed-bmc-supermicro-x11spi.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> similarity index 97%
> rename from arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> rename to arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> index f4a97cfb0f23..259ef3f54c5c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> @@ -6,8 +6,8 @@
>  #include "aspeed-g6.dtsi"
>  
>  / {
> -	model = "Nuvia DC-SCM BMC";
> -	compatible = "nuvia,dc-scm-bmc", "aspeed,ast2600";
> +	model = "Qualcomm DC-SCM V1 BMC";
> +	compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";


You need also change bindings.


Best regards,
Krzysztof
