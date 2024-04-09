Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5F489DB7F
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 16:01:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NvDmcQxT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDSKq0ZVSz3dXh
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Apr 2024 00:01:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NvDmcQxT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDSKg04Krz3dRY
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Apr 2024 00:00:53 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-41663330f9dso15427895e9.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Apr 2024 07:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712671250; x=1713276050; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6XY9gemEnKQZfGkDJK75MYVrheD1n1AVfYd5ZmSr3os=;
        b=NvDmcQxT7CMk6yDE9DfBwVPRvvTKWQodfXIb0I/ZALH7WVBbu87PWwFczjCJqjRoo+
         iBuyVtcE7bI6c70lwBsGtIGMiY7pg323cHlXQDEQGabDgyQtk7r/3LVqIfVeHsSpaJn1
         tJ3zZN9GWA+hwi5ywXwxhQvn4InR1SpUOIDJ77GrYDieI/q/TunSaV/LAQ+30i94wcQN
         64mo+0gbBdkWsAs/RWEiCpVD6zVT5xIocFNFT9f8pm2vg8RO3wSB2pNgL+Tv3ORGCGWY
         WV5uCgNBcFSWyvgG2KRWmQUo+UhrKuHpQGu5JMw1HMfr2DhKDDAb+wSknX2O9RK8Rb8S
         cW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712671250; x=1713276050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XY9gemEnKQZfGkDJK75MYVrheD1n1AVfYd5ZmSr3os=;
        b=jkyuWiWhH4HQ34/sZ2TZpe5ZsYPw0kmtgjo+kW7YOY/bKAwOJNdXo2ddhJbuyKj2iF
         62ff+tBU67ZLw2MFo5xISDZ+4k/hqyuZXbwcVSBl4MdHAf6d0e+NOGVTXY+2bat0hHo2
         hGkb95FW63+4sTlaomzjK/dMq7QqmaJN2YUu/clc+e4+TM9DIrROW8NuVAl7lpxw/e90
         Bp4ek3E5U1Tmcy9LnhoarKEj3RrgX8WWTvh6C1ilPsdEjwXm6T3zwa/UQAjebgJFlL5m
         ZJyxUkDDIaDeLXGsjas0XNZV8pcSNzQFTMR/eqiyt2Jj1VLtUZ3p74DoQwkOUOY057ny
         BHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCb6oyIaWweAtWrPtXyEA6HoqQHzh+ZtvHANyHePY4LVYLIVudFx1+pY8bVR8w9HOTYBXRbubw3OUDpF5hVMf437IjGdFmpo68NIqBvQ==
X-Gm-Message-State: AOJu0Yzj8fU/pfyCdd5CdtbL1G5RnWRh59JFN/xUUkMchykLPsvff7Hs
	GSuiKmSPyhXGzdg/0j8os5jgFrOnW4J4PwNNFeI1c+Vf1qxnoZSvARRoiunDIrc=
X-Google-Smtp-Source: AGHT+IGlFsNH05uCK+fbodwNpF/BH1Rgvdob2lMI9FViPbIBrYDefgMlLM4xPEmC3bN1HA3QS/eQgA==
X-Received: by 2002:a05:600c:154b:b0:416:9c95:b712 with SMTP id f11-20020a05600c154b00b004169c95b712mr1832422wmg.20.1712671249933;
        Tue, 09 Apr 2024 07:00:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c4fc600b0041663450a4asm8879318wmq.45.2024.04.09.07.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 07:00:49 -0700 (PDT)
Message-ID: <5e80dc7b-e848-46d5-879b-b72c1ac6ba97@linaro.org>
Date: Tue, 9 Apr 2024 16:00:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] ARM: dts: aspeed: greatlakes: correct Mellanox
 multi-host property
To: Rob Herring <robh@kernel.org>
References: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
 <171266958251.1032405.3082451019333889181.robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <171266958251.1032405.3082451019333889181.robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 09/04/2024 15:38, Rob Herring wrote:
> 
> On Fri, 05 Apr 2024 08:46:20 +0200, Krzysztof Kozlowski wrote:
>> "mlx,multi-host" is using incorrect vendor prefix and is not documented.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v2:
>> 1. None
>> ---
>>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ampere-mtmitchell.dtb aspeed/aspeed-bmc-facebook-greatlakes.dtb aspeed/aspeed-bmc-facebook-harma.dtb aspeed/aspeed-bmc-facebook-yosemite4.dtb aspeed/aspeed-bmc-facebook-yosemitev2.dtb' for 20240405064624.18997-1-krzysztof.kozlowski@linaro.org:
> 
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: ftgmac@1e690000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mellanox,multi-host' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
> 

Just FYI
These warnings are expected and not a result of my patches.


Best regards,
Krzysztof

