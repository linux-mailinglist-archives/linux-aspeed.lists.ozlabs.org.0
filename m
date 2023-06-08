Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FBE72789A
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 09:20:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcFwl4pHzz3dsR
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 17:20:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l725wZUx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l725wZUx;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcFwc2JcLz3cLT
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 17:20:15 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-977d55ac17bso57466566b.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Jun 2023 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686208811; x=1688800811;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCl6rtqI/lnsAp34i7m13i8YaVFA5i7mUTO1m89CYUc=;
        b=l725wZUxx6r1Ycdzj7cFBsrukTjy35bP8IPHmCSPAz2hwoQ7qy8PxBKnau50bylSgD
         HR75/QKRHMZqVnep07+5VoUwjXIK1GOar8CmX+kSwjwZWQBzxsrJ3vI/jvm6cGzwUz0G
         h4BXewrylaAkKZWViWZzgE2aRhGAcI6xcMtveDLMcSp9Cl6zrvAKlUt0b7xoRBdosabR
         MOoX7D2/feSpNpjMkhKJM30W0R1//Ojj8UTP/OZW+U47/wyyxY6cduOrMp4VijBrz+7a
         NveV1pzoP2fV+SB8xaAMgkXATbpJ4PAH5tckzUVAwOU8ilr5RuWYZXWQ/NtkyW/CFKc1
         6VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686208811; x=1688800811;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCl6rtqI/lnsAp34i7m13i8YaVFA5i7mUTO1m89CYUc=;
        b=P6VvFWer/4lbXOdlMCXVTeWCKLYdyu/GIvZ6P0lGqfhbrkCUFVJy6O+sVsVMa2dpoZ
         4EH07kD6AFyMdyd0p7C4yCPtzUQx3SJSMUzPs+2dvtvSRm7F/CHHLOd3USyKsaBxHODM
         BcAqsV6DhupWOjvUa2fziKuzmTyFqxLxSx0jW5l1verI0WqGv3+reNf6fyt1ShUpqIlM
         iBRp8VJmHdCV9LznLAN4hXv9xWDcA/qDVYXvkVG+V5SzQd/D5AlXchZC59l9v066Pu3K
         ghnF1EQzV0pJpRvdVKx9mnKdBvCHwk25iGJS4PUKlpWH3sT0/6RRMQroa8bMjdQLulDT
         CvKA==
X-Gm-Message-State: AC+VfDyA3S2odDm87KV12Nb4Koo+0er4uWSWKKqnN2GgoISYb6auryVi
	hvIr4Vm+e+rMNopGyVTrsOoXEQ==
X-Google-Smtp-Source: ACHHUZ5dyxvogNuartC9WpRJfkks70+K3BJ8tJOfNobMtwn0tLJXermHSdQpCm9l7vzWKuJsNrZRpA==
X-Received: by 2002:a17:907:1628:b0:974:5e8b:fc35 with SMTP id hb40-20020a170907162800b009745e8bfc35mr8746192ejc.26.1686208811151;
        Thu, 08 Jun 2023 00:20:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id j24-20020a170906051800b00965e1be3002sm309402eja.166.2023.06.08.00.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 00:20:10 -0700 (PDT)
Message-ID: <5000d481-2125-95e0-4033-d9c71a49cbd7@linaro.org>
Date: Thu, 8 Jun 2023 09:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v4 1/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "lee@kernel.org" <lee@kernel.org>,
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-2-billy_tsai@aspeedtech.com>
 <c4b188b1-06a4-3cb0-a758-e12942e1f67b@linaro.org>
 <ce99a709-ba4a-eb53-39ac-88a194879000@linaro.org>
 <SG2PR06MB3365AE9D075601CB62C6E7F78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR06MB3365AE9D075601CB62C6E7F78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
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

On 08/06/2023 09:15, Billy Tsai wrote:
>         On 23/11/2022 09:24, Krzysztof Kozlowski wrote:
>         >> On 23/11/2022 07:16, Billy Tsai wrote:
>         >>> Add device binding for aspeed pwm-tach device which is a multi-function
>         >>> device include pwm and tach function.
>         >>
>         >> Subject: drop second, redundant "bindings".
> 
>         > Where did you implement this comment in your v6?
> 
> Sorry, I guess by "Subject: drop second, redundant "bindings"" you meant to remove the second "bindings" string from my subject. So I change the subject from "dt-bindings: hwmon: Add bindings for aspeed tach controller" and "dt-bindings: pwm: Add bindings for aspeed pwm controller" in v4 to "dt-bindings: hwmon: Add ASPEED TACH Control documentation" and "dt-bindings: pwm: Add ASPEED PWM Control documentation" in v6.

A nit, subject: drop second/last, redundant "documentation". The
"dt-bindings" prefix is already stating that these are bindings and
documentation.

> If I have misunderstood your comment, please let me know.

You replaced one redundant with other redundant. I only asked to drop
it, not replace it.


Best regards,
Krzysztof

