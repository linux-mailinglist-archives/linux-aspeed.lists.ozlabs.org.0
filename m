Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F96728109
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 15:18:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcPsp6nSKz3dyG
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 23:18:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K4GWIYXT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K4GWIYXT;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcPsk1nbdz3cds
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 23:18:17 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-543c6a2aa07so265640a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jun 2023 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686230294; x=1688822294;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=D7t/IcsLb1sT149B6ebMikIHDMKdt1t6KHWtlJh10/o=;
        b=K4GWIYXT3UU+cMQQ9MmBi0hMM0SFVFnM2dt0AhYzqQABRQdYWtL79TlQGkIPQz1jS4
         j55JKWZeEMYrCfaH0CB8RQ4z0/XvIjIbQw9FiHIi7qRO7VgKAU8XSSVRO50Le2wUROBy
         hYx/mbWxDd4z4XSFH1+weJ6o3Bf3DpMs3zuPZdEXLf0ugnP4e2nFAFemUqcGc1CfBZ9H
         POQRpHfPq75yAiPFGsOCS/CN+kzmaTuAXs/BqMdfn6LCKHXq5GeH09gv4X8E8/kRDclF
         yOoVOoMoM0da32wBUR44aUNaE2gGyfmbgDJwWHq9632pppxAtP2vwHnkJ5zZhcqrC/ng
         nZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686230294; x=1688822294;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7t/IcsLb1sT149B6ebMikIHDMKdt1t6KHWtlJh10/o=;
        b=EKngEhJPu4bnxE1qO8SjzqGrKrIumdtEhOKBduYfG0W38HWx6ViqQfAxSEJBzYPiaR
         4uHfqZtMKV/AhEyt4f1rav3GSrCELeYWmsgzjjcyPJ2rBIth/mi/T3y2VTiJhaLZrGjh
         TAsM52CmxS6iTQcHixJ5/Hn9EaH1iKwnpzRZIZAzKAMK1UgtR6xraaU4YlfCnwXWAKUY
         CpsXQAEJ+/LRQBo3uQqg4Ktw9S4B2BIkyCshMnoypV3BYLIwn5Pw7PYb5OtwLOvD9zin
         ONZeeSZJ8mF0YQNjZYQX6aTXCAwpCb6NMLaj2Dnq0NJ8DCEiEWGusEBrETHIE1ubJxJb
         s8YQ==
X-Gm-Message-State: AC+VfDywp/2XT3Z+rkEMs2NxnwCpD8L4x9BC/AybRSw2W6VEuazpQnvK
	Eaohse0YW7Y9TUiEbRXTRGM=
X-Google-Smtp-Source: ACHHUZ5M/cI7gc7yzFDF3kqFxm4rWeaJQMCH5IYlgrLd2Urk2wIeKfwBQ3qpgm5c0VI/CYCFNUAMfg==
X-Received: by 2002:a17:903:1207:b0:1b0:ec0:7d01 with SMTP id l7-20020a170903120700b001b00ec07d01mr4863322plh.35.1686230294140;
        Thu, 08 Jun 2023 06:18:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t12-20020a170902b20c00b001ac741dfd29sm1387520plr.295.2023.06.08.06.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 06:18:13 -0700 (PDT)
Message-ID: <f76f89a0-7773-6f64-c890-293093d4aba3@roeck-us.net>
Date: Thu, 8 Jun 2023 06:18:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-3-billy_tsai@aspeedtech.com>
 <c1c485b0-b68b-4db7-4b67-5d59f1ecb84e@roeck-us.net>
 <SG2PR06MB3365E360F3FCDE639F3D2D1E8B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <SG2PR06MB3365E360F3FCDE639F3D2D1E8B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/7/23 23:21, Billy Tsai wrote:
>          > The code says:
> 
>          > In Aspeed AST2600 SoC features 16 TACH controllers, with each
> 
>          > controller capable of supporting up to 1 input.
> 
>          > which is a bit different. I guess there are no examples anymore,
> 
>          > but I'd really like to see how this looks like in the devicetree file,
> 
>          > and how the driver is supposed to distinguish/select the 16 inputs.
> 
> Hi Roeck,
> 
> The node in the devicetree file will looks like following:
> 
> tach0: tach0@1e610008 {
> 
>          compatible = "aspeed,ast2600-tach";
> 
>          reg = <0x1e610008 0x8>;
> 
>          #address-cells = <1>;
> 
>          #size-cells = <0>;
> 
>          pinctrl-names = "default";
> 
>          pinctrl-0 = <&pinctrl_tach0_default>;
> 
>          clocks = <&syscon ASPEED_CLK_AHB>;
> 
>          resets = <&syscon ASPEED_RESET_PWM>;
> 
>          status = "disabled";
> 
> };
> 

Neither reg nor pinctrl is mentioned in the bindings. Maybe that is not needed nowadays,
but I find it confusing.

Either case, it is highly unusual that there would be 16 instances of this device
instead of one. Why is this done ? It doesn't really make sense to me.

Guenter

