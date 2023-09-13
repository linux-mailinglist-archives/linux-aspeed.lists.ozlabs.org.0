Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F321379ED7E
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 17:42:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kZd8uRg1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm4T26Sbbz3cFg
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Sep 2023 01:42:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kZd8uRg1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm4Sv0npnz3c9m
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Sep 2023 01:42:05 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so8989756a12.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694619719; x=1695224519; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tNjhlH206IzUUkrLOTH6KtlKVYXz/q75ZTuPPcqMFk=;
        b=kZd8uRg1W0G3VLRGexNrjiiBmZ3EGpBRoGoaas6k9VpgFc8lOztBDGj3KWI9N6KmrK
         6uBhYUKsx+v3tXIA4gbeDGFIcHFDPXniZb1c2MkO1qvIL5d68QyRkxosy+Z+5XyWG3PY
         YxiQTUm3SR5INEWf3QZ84DXyNxALpX5nNaVuQeUDVATCHfvhMjMB416qWKRkTs1NYRDP
         CctXkVU3PpZoWdgqJxQmydsOLS/jXzRwFwhULi0oY4BrppOWe8TNRRnkjKKLTO/TvuwZ
         64tAv1Z38eiYNzdOduRaRE/td/Uw19MgU6/0gGQ9i7JvxfvsD6G57zr9IFNNRHK9EXI4
         dWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694619719; x=1695224519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tNjhlH206IzUUkrLOTH6KtlKVYXz/q75ZTuPPcqMFk=;
        b=ejKuytiC8FLww8KI2ErRGceZrqYLa8K54YCQr4YR9GKmVj59ulRcY+ifWo7YA0oh6Y
         IdWlZ8TPeusJ+BXz5kBgB5ZCCTJHDAJ9Aa5R6s+pWR+3Trpb5j+JKyGbNIT5IaFtlIbG
         awM9pOc+5RY1ucwsqHOKxb7a7iWvBfmnPAP8PJ3s+hawSFFi6nFhkF80h1kvBg/K8lgv
         UTzPnkkYkEGlTZAm4LBWkbrZ5CmUok69GkLCQnQjd411gWjVYdcUeGDmaVsSqojNB0RI
         RO9Q1Wb9iTkpovf5B2l7eez+ddzGBuga2j4z7zeZoTMRI+6nM7KsQ6oh1StGiB7sPbsm
         tsCQ==
X-Gm-Message-State: AOJu0YyzW0VPcJqp70pusuV1HJkPFuRJuoq6k84AlwuW4Wq27C1pcaj6
	fH2htIrQdXZua1dRxbzFjHdxFg==
X-Google-Smtp-Source: AGHT+IE/Qamlm4QU08NosxmsDomDBqURds6+LWtMhxScI4jMdvKLNkx5zTwjQJgqvPSmZB1yXEVn4g==
X-Received: by 2002:a17:906:5181:b0:9ad:7f8b:21b with SMTP id y1-20020a170906518100b009ad7f8b021bmr2468995ejk.13.1694619719145;
        Wed, 13 Sep 2023 08:41:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id kf4-20020a17090776c400b0099c53c4407dsm8580766ejc.78.2023.09.13.08.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 08:41:58 -0700 (PDT)
Message-ID: <11c822f3-96f1-17d6-6c2a-feaa950aeea1@linaro.org>
Date: Wed, 13 Sep 2023 17:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva CMC
 board
Content-Language: en-US
To: Yang Chen <yangchen.openbmc@gmail.com>
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-3-yangchen.openbmc@gmail.com>
 <1bfdc230-e358-6aa4-7d60-03b5477a6be9@linaro.org>
 <CALFa7M_GvCgmEZxvo_ZSYoCPOe+9-tQt3KHn=_cu3n7psP+PTA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CALFa7M_GvCgmEZxvo_ZSYoCPOe+9-tQt3KHn=_cu3n7psP+PTA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eddie.Chen@quantatw.com, patrick@stwcx.xyz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/09/2023 15:57, Yang Chen wrote:
> Hi Krzysztof,
> 
>> +
>> +&i2c15 {
>> +     status = "okay";
>> +
>> +     eeprom@50 {
>> +             compatible = "atmel,24c128";
>> +             reg = <0x50>;
>> +     };
>> +};
>> +
>> +&adc0 {
>> +     ref_voltage = <2500>;
> 
> There is no such property in the bindings.

Fix your email setup. This is my response, not yours.

> 
>> +     status = "okay";
>> +     pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
>> +             &pinctrl_adc2_default &pinctrl_adc3_default
>> +             &pinctrl_adc4_default &pinctrl_adc5_default
>> +             &pinctrl_adc6_default &pinctrl_adc7_default>;
>> +};
>> +
>> +&adc1 {
>> +     ref_voltage = <2500>;
> 
> NAK, there is no such property.
> 

So who says what?

> Thanks for your advice, I will change this property to
> "aspeed,int-vref-microvolt" which is defined in the binding in the v2 patch.

No, why? Drop it. There is no user.

Also, do not top post.



Best regards,
Krzysztof

