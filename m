Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C4178A624
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Aug 2023 08:58:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TuVb55xB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ1cP1B6Tz3bVS
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Aug 2023 16:58:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TuVb55xB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ1cH5Hxpz3012
	for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Aug 2023 16:58:37 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52a5c0d949eso1798961a12.0
        for <linux-aspeed@lists.ozlabs.org>; Sun, 27 Aug 2023 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693205912; x=1693810712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsZ4PYkksl2Z8LuGRY4k7e471htU4x9LtGFbo6V1i60=;
        b=TuVb55xBcsGHkiLQRQqCHC52wDMkxqyZMBEB4E/SO+/bgyNb5hP9KYyM6Tv6aLhAwT
         5sRRxDFx97PN6sJY7ydODM/gO9sEGK3hJnFLABlUfT3nZo+yM49q63w3VELDmYk8gEc7
         abbXKrh8neYynegrRvEVCXu5BeHHZQNzMfWiKdskqSFBkcWzt2xlM8FifQKGwnW54UGa
         gB6+pTSORTVzUmB+xO0d2NSx0ZiFcKVX9sYQPGP04NPKKG/QuR/Mq+TiFRw0Av/lQSmb
         ufEdfDqkbeVw/b8rPAcUpcQR0wKeajakB0H830qpL1TvYsmW1U5suG6LYAxhxJjrkh8n
         vHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693205912; x=1693810712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsZ4PYkksl2Z8LuGRY4k7e471htU4x9LtGFbo6V1i60=;
        b=TSImH+zsNHiyxH4w/NItSdUCxt3lavHTyszyfNmHu238HJNfCIYJsC+0MOfl0arybH
         Uimu+iX/CglzH7l2qek4/vsUHLL2y4J0/5kuAoulMa2K0vzIXRr/GHJCf06yG+R66WWs
         AuMy3Q6tJfg5VA0/B/41E3bYMuzZsGo4chFwlDa6lKDwbf4HEoMPeN4p7NpCSH3flrQB
         of7PN5Ja7rc6nmEYGUhGDhFzXfrwhinSxZF9STU8Vt+a0b3n9RXgIowRgAb3EV4EUHXZ
         14LQtdEce+eV86DUrF03xntklDsauci3IjpEraP97GkVtMC8LpLSksAXdzfQ1OonYqnk
         BDzw==
X-Gm-Message-State: AOJu0Yx2/iltsJQdtaAah9xBVdNAyWlnJOnJP/1KgOX9xVwKlpD1MTqe
	wK1ckWFq6Kr6cI8wkxjSDWbb1w==
X-Google-Smtp-Source: AGHT+IGOJdi3bdWqq58P4lkBUQArH19QV7szZwfpc+gLL4zEowMV2nVFxe15AvzDXno7DvE31yt3dg==
X-Received: by 2002:aa7:c38e:0:b0:523:3e5d:8aa2 with SMTP id k14-20020aa7c38e000000b005233e5d8aa2mr19724002edq.14.1693205912287;
        Sun, 27 Aug 2023 23:58:32 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id f2-20020a056402150200b005233609e39dsm4170009edw.30.2023.08.27.23.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 23:58:31 -0700 (PDT)
Message-ID: <9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org>
Date: Mon, 28 Aug 2023 08:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] Minerva: Add Meta openBMC Minerva dts file.
Content-Language: en-US
To: peteryin <peteryin.openbmc@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230828031714.107382-1-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230828031714.107382-1-peteryin.openbmc@gmail.com>
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

On 28/08/2023 05:17, peteryin wrote:
> This is for Meta openBMC Minerva dts.
> 
> Kernel:dev-6.1

??? NAK. We do not develop there.

Also subject is totally wrong. Drop redundant pieces, drop full stop.
Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

> 
> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
> 
> ---
> v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
> 
> Change log:
> v1:
>     1. Create minerva dts file.
> v2:
>     1.Add facebook,minerva-bmc in aspeed.yaml
>     2.use stdout-path
>     3.Add Makefile
> ---
> 
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.


>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 329 ++++++++++++++++++
>  3 files changed, 331 insertions(+)
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
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6a897ff40ff0..e7c00905a08b 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1603,6 +1603,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-wedge400.dtb \
>  	aspeed-bmc-facebook-yamp.dtb \
>  	aspeed-bmc-facebook-yosemitev2.dtb \
> +	aspeed-bmc-facebook-minerva.dtb \

Wrong order. 'm' is not after 'y'.

...

> +	/*X0-X7*/	"","","","","","","","",
> +	/*Y0-Y7*/	"","","","","","","","",
> +	/*Z0-Z7*/	"","","","","","","","";
> +};
> +

Still redundant blank line.

Best regards,
Krzysztof

