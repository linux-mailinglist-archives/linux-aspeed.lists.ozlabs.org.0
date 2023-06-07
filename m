Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459D7258B8
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 10:55:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbh4r01MLz3cCh
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 18:55:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D2ESwCvV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D2ESwCvV;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbh4k4fNcz3cCh
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Jun 2023 18:55:16 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-516a008e495so369608a12.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Jun 2023 01:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686128112; x=1688720112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTpA5qOAPRS8MQZfyN8Ss9cXLKE3reuQWNe17eVOs98=;
        b=D2ESwCvV3EMJ4Ca9Xo0YrNr2h8zDu3w8UAFRDTvjKd+CzOHysYAMrUv95WmgXW6pef
         PsKk6OT+GE3LhG59KbziqQ8SX2zQaEPT9u8GVDR84WIwdNAJaeEZI0k91AdVnjG4fkba
         7QfIE+0YEtfGCqwMJjmHD0uUn7sG3yGccZKVA9w7gvuWa2pSa7UzCkUG/q57UumGb1EA
         4OKi4guQJOqGhlKfXqujVgAzpzyCQ7hJotGxoUFQ9FHVd4N13KRLYrRg+JJE1C5Pxxon
         yqRiF+kOeMILJ7ArRRRzkzEFaxvUjTteQsnxlZPRwwLMcnLuFClt6rOtK1yjIsDrIlmd
         ftfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128112; x=1688720112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTpA5qOAPRS8MQZfyN8Ss9cXLKE3reuQWNe17eVOs98=;
        b=F9+iMDCun9rqgOJhlx8tp1ng4MIOmbvqZSOovp/k1CT1aR0WDUwp7b6B82f+ap714N
         /uCzPu5a9xhalcxAKqleWA0Tkb8Onu5ggB8cRj8t/By+Quh5Q9jE/M4b/g5J1MxBAC4L
         KXVS5IbxI+Z4LMS+cQ3hd7J8wxVaAVBlvhZsAfUGP+oRcptX7EH6HimgdHR5IGq3KllU
         EM/ZbaXZcLHJEMHNKQIQSg9WLtSgHV2V2OSloTib8sMK+1hWPhDA6DgYQZI6jPImzvDj
         g9sDzSBzsaCiUWwhlyb3Z4iK42k5422/SIsvfIThag2k7WYqU4Kn3a/d6lNXAlKOXbMu
         /44w==
X-Gm-Message-State: AC+VfDwNGMf9p6wHnaOw5NSeVTtft0qMCkZ/PnrY4mOSvZ8LYIydyq+4
	ykxyJ+1OsDGRbdgoNSsjeBzB4A==
X-Google-Smtp-Source: ACHHUZ68EljsPgkNMfLt/pjzYCbcf3rch3Eqf0hQ739bCBHvP3l1XP1YD46PoScoXp1Rg3YgbqRIWg==
X-Received: by 2002:aa7:c59a:0:b0:514:9e47:4319 with SMTP id g26-20020aa7c59a000000b005149e474319mr4990483edq.5.1686128111991;
        Wed, 07 Jun 2023 01:55:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u6-20020aa7d0c6000000b0050488d1d376sm5951735edo.0.2023.06.07.01.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:55:11 -0700 (PDT)
Message-ID: <c8fe71a4-f8bb-d0a5-a227-14040fa024a9@linaro.org>
Date: Wed, 7 Jun 2023 10:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-4-billy_tsai@aspeedtech.com>
 <35bf0a69-bcf6-ae35-eb3c-e74cfcf9c571@linaro.org>
 <ZH89fXknZlhGmM_H@heinlein.vulture-banana.ts.net>
 <c28f963e-d13c-6b5c-c389-996e986f81d5@linaro.org>
 <SG2PR06MB33652E18980E9CF8E4F0894D8B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR06MB33652E18980E9CF8E4F0894D8B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "lee@kernel.org" <lee@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 07/06/2023 08:26, Billy Tsai wrote:
>         >>
>         >> He felt what he was trying to accomplish met the documented
>         >> expectations.  Are there some changes that need to be done in mfd.txt to
>         >> further clarify when to use it and when not to?
> 
>         > I think mfd.txt clearly states:
>         > "For more complex devices, when the nexus driver has to
>         > probe registers to figure out what child devices exist etc, this should
>         > not be used. In the latter case the child devices will be determined by
>         > the operating system."
> 
> About the mfd:
> For our pwm and tach devices, there is no need to check/apply any hardware register from parent to determine child’s existence or functional.
> They don’t have any dependency on the parent node. In fact, it doesn’t require a specific driver to bind with the "aspeed,ast2600-pwm-tach" label. Their purpose is solely to share the same clock, reset phandle and base address. The main reason for using simple-mfd in this case is because these two independent devices share the same base address.

Actually one more thoughts. I have doubt that you have two independent
devices. If you share the clock, reset line and register address space,
this means *you do not have two independent devices*.

You have most likely only one device.

Best regards,
Krzysztof

