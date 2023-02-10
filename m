Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F5691B0C
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 10:14:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCp2v6mq1z308w
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 20:14:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zpFhFXVL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zpFhFXVL;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCp2n1Pwgz308w
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 20:14:25 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id z13so3320466wmp.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 01:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ku9VL6FSKb9gFMPxdQiucBun4fHwkM9uag4osJcxFjQ=;
        b=zpFhFXVLYIlooFUU8rmXcAkDC+adxJhCuHSkelNbjIJ2DmP8jlwg118JGvPgbkRCKw
         BZMX2FB4Ds2EeVcox5073/bb4xQdDbRUbgXFT93qn2Tce5I+n1w5lvolsfHx9E6ejyvF
         MA5Pgei1Z0mwQHdaZ+LSRIlQkZNw1HdSqARmrKGpbnG0VIu9HpQ6AprWV4WkEE3s9wxM
         yAKVUnhHPq8cS0v8E5yORCAptQTmZWd6K3bkw/+WgZfqKNwqjPwuedVTq67nuRHV7GXH
         wyODILu7O65DKUtpF0OfAtCptNBzyoZYKOZdxJaLMeoRpKNv5VGacNMvwq33GhNkup7Y
         2hJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ku9VL6FSKb9gFMPxdQiucBun4fHwkM9uag4osJcxFjQ=;
        b=rcHvPQ7Z33bG0Jja7tU1naeujmybI0kKbt9Nt5rTllWYHRyq3G+ozLoNH0+WFbiBWb
         0+uLmde3gRqu5zz5JATx81gcuzCIBt3l3IM9vResvTW0JeT1ZdBBMs9o4wRTH1eWMlWo
         MerPiXuTb/ZdRj+R2kdITN1HJg6skfANbPHexCs+0LJJWB8AWeeRj/daG1a6skxRL4oz
         0+M/hLwWllIC00omdyxKGvqt9petS0IU5GG+BwVFviGX+F23kp1o1Hx7wv+RtyvrF1xU
         wJY9QZbnIjg7qjVQcJ9Pxm+afDLkv9egAiWyftSreezpySriL+dTbmQLwW6SjQPBZj47
         IxvQ==
X-Gm-Message-State: AO0yUKWp4jrey9wjmJMsOXqYZmmkkbGxhzt4I75D8G9SyUVsUiqghCn3
	nCirpXF9mqouV1W0NAhzx7cYtA==
X-Google-Smtp-Source: AK7set9cCPWlEwC4medSmZPNUYBTeGZ/QbBenDQeIUy/vE+DLny3N/6q1pDUgVbtRT7Pd2+x0zrW7A==
X-Received: by 2002:a05:600c:319d:b0:3df:e1cc:94ff with SMTP id s29-20020a05600c319d00b003dfe1cc94ffmr12077511wmp.28.1676020462376;
        Fri, 10 Feb 2023 01:14:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f24-20020a05600c491800b003dc0cb5e3f1sm4053386wmp.46.2023.02.10.01.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 01:14:22 -0800 (PST)
Message-ID: <db065c0a-6c0e-ebf1-1867-6271b0cb5e8a@linaro.org>
Date: Fri, 10 Feb 2023 10:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] ARM: dts: aspeed-g6: Add UDMA node
Content-Language: en-US
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au,
 andrew@aj.id.au, jirislaby@kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
 <20230210072643.2772-5-chiawei_wang@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210072643.2772-5-chiawei_wang@aspeedtech.com>
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

On 10/02/2023 08:26, Chia-Wei Wang wrote:
> Add the device tree node for UART DMA controller.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index cc2f8b785917..3f4e9da8f6c7 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -850,6 +850,13 @@ fsim1: fsi@1e79b100 {
>  				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
>  				status = "disabled";
>  			};
> +
> +			udma: uart-dma@1e79e000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +				compatible = "aspeed,ast2600-udma";

Please run scripts/checkpatch.pl and fix reported warnings.



Best regards,
Krzysztof

