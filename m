Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA1872776E
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 08:39:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcF1f4PTmz3drw
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 16:39:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GBvMPK/c;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GBvMPK/c;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcF1W1GLkz3cNY
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 16:39:26 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-977c88c9021so48463766b.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Jun 2023 23:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686206363; x=1688798363;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20VwnX/WoaRKV9arNTXMhn8ioZI7RTq9D1ov94KZAt0=;
        b=GBvMPK/cs2To8yEXE9SsipYC/K1njPu288BNro/g9k2fonTbbPNHjR6x/v6lQUDK1X
         BAS3uVWDIcWav1fDn/+ErtHtI7UEwBChae4r6rHEQMuY/PtUZrRTn4FVSI5aosRItmCw
         K/FePCj+GiqS7lxluja8iwNLBGIHNfZTg528SQ89huvg5dJ5iHnnbrCZEmf23JyU8lUe
         /SpaTtwUyRK8fgCmvhCmnzoZX3t2SRvOH6XyQ4bNSXGBXwKtRn31zQ/i8BijKOmZOV6C
         e8nS4f7O07aT7ZkG40L16LctrvwEkwkmMoKd31xIw3hk9r+D3QelJVr/FHc6AlSw5vb8
         LDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206363; x=1688798363;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20VwnX/WoaRKV9arNTXMhn8ioZI7RTq9D1ov94KZAt0=;
        b=goNAtefu+HexfsC1cg8xy+7Yv02/Oelbs/p2cWGJN9GRElTwUHL7jBBf4s8kmDlu4U
         02+tPghVVgCeby1PFOnbEZTxsQg0KUS+tjiyD7RQsMMcvIE/Tdhm8HhvweqN36knvZhj
         /xdS4pcFeW16Pfy7T6qq1pBym+XAr1s8M7/GjhPQ7AQyRcxTsO2HMtPri2+HR63DV1zL
         Q2+unt1CGtmQme66gVRDqUgZMzkcrXpw2zGNRSlKuWLwsnN1ZhzvixN/6LAaw9rJriCH
         t1LpXzBTV3rIxJxaArelBCY/FqmdN2ZO0SISep1RWp9xNFrOszeYqbY+AsfTGkpEH9/r
         /uzw==
X-Gm-Message-State: AC+VfDzssfrh+cGnTTlaUfHHKfiUuMOMvcTobP0ybxA05zU6Mco2kDRY
	VsCjm9WDYy5Xl2HXqL/gmYNslA==
X-Google-Smtp-Source: ACHHUZ4hT0e0tzGvbuWncVx7177VvT2kgg6YTLUjvuP4pV7zePZzqsLUl/diPhvVAIOjdTJZ3WZG2A==
X-Received: by 2002:a17:907:1c0c:b0:973:d857:9a33 with SMTP id nc12-20020a1709071c0c00b00973d8579a33mr9347535ejc.11.1686206362925;
        Wed, 07 Jun 2023 23:39:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t4-20020a17090616c400b00977d7ccd9fdsm272257ejd.95.2023.06.07.23.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:39:22 -0700 (PDT)
Message-ID: <b0f5f061-60ce-815f-4228-2033335e562d@linaro.org>
Date: Thu, 8 Jun 2023 08:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org, patrick@stwcx.xyz
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608021839.12769-2-billy_tsai@aspeedtech.com>
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

On 08/06/2023 04:18, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm device.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

I don't understand why you make the same mistakes, even though I pointed
them out two times already.

I am not going to point third time. Sorry, it's a waste of my time.

NAK.


Best regards,
Krzysztof

