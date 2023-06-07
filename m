Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C677268A6
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 20:26:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbwmH1CzSz3dws
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 04:26:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pzkOcuk2;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pzkOcuk2;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbwm45V0Pz3cXl
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 04:26:44 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51475e981f0so1997506a12.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Jun 2023 11:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686162401; x=1688754401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRj+mE8jCuZmOYVQqkftbO+ddM2GLO7xQ0oXcx+IVPg=;
        b=pzkOcuk2QH5o8cSqzHedtXSDBcDhlF3m1WDSJvl7OVrVSK0Q3W5DgsoqMvf5fE6X1O
         JiAdA/oH10Y2IzEdmhHsNm8PNLmX60mlHAlZAIOXaP2bSe8a+0mEOri7GwAahN3I5w+f
         1OL1nbq2JFg8rTKxc6LBUiNSYG4iuckRDEIeTaOeihJgbOKV0yrHA8pB6c9bi1DrhM94
         tqerLRwLfB06wLXl+kKoTWrJ4q7Zr+C2dRU4lQUXsjOcOb6mq4R8VySKoRElUYe2vN6X
         DevUHmBVJ+Pq2mmfVm3H5BZBlHQLtIch9DGumt1Ttpem2iJLme0pspfd6gIMqNQYVqXF
         8bqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686162401; x=1688754401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRj+mE8jCuZmOYVQqkftbO+ddM2GLO7xQ0oXcx+IVPg=;
        b=G7TOck85FsiW2WsjLjCjMZMW1S/D9hLPqBlhNZxScj3eNxRjW15LM0QnstmZiT9JKH
         IY5x9OIM+LhMJnRXJ3cEWV+aQFZ6cIpP4ehAFc/8JJcz9tMfhnKuG5JtY0bC3ulqMuiw
         17i925RXeBLbBDZTkPzXsJJAdjREmhEDMG4vErS2OFHvGMYJaJPnR28gDJ3aK7sQ1pya
         2c6O7r5oESgZsmI9Jr7WRZsg5CruPpmTMn4UnRjVEHe+cbQYcA/zTWbIIZKFASKKbrl5
         uV0aHF0ymoMw6pF+cxuDe+a88YV8q/paD27Xyk0eLXriGkaHNLxirOjfwK+seECAuDBE
         4xeQ==
X-Gm-Message-State: AC+VfDxUI7ROoDuS1zXuXOvsk79KdIsNe92Xpet4I8On4Mk9AOAhuk2b
	lGv4Uew5pulS01yNjyw3TB/lsw==
X-Google-Smtp-Source: ACHHUZ5YUulZzqwNfYTpRRDDYzgUjLAdgZeSBYf9eA5aKTpF9KWdikk8pq/Ts0lAJ7VXnuCh4iWv0Q==
X-Received: by 2002:a17:907:3e1e:b0:96f:b58e:7e21 with SMTP id hp30-20020a1709073e1e00b0096fb58e7e21mr7507816ejc.52.1686162401374;
        Wed, 07 Jun 2023 11:26:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bv2-20020a170906b1c200b009659ad1072fsm7215357ejb.113.2023.06.07.11.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:26:40 -0700 (PDT)
Message-ID: <fdb342c0-393b-dc34-bbc4-f23f1d59492a@linaro.org>
Date: Wed, 7 Jun 2023 20:26:38 +0200
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "lee@kernel.org" <lee@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 07/06/2023 08:26, Billy Tsai wrote:
>> Missing description. But more important - why do you have such child
>> nodes? Your example does not have them. What's the point? Do you expect
>> different number of fans per one device (one compatible)?
> 
> In this patch series, I have included examples and descriptions to provide additional information.
> The child node is used to enable the channel of this tach controller.


Children are not for this. Look for cells examples (e.g. gpio-cells,
pwm-cells). It seems this is the same as Nuvoton NCT7362Y, so no. Don't
use reg for that purpose.

Best regards,
Krzysztof

