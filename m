Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7916F557381
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 09:05:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTB9Y27fKz3bts
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 17:05:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z3kQtFfl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z3kQtFfl;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTB9Q0dztz3blf
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 17:05:45 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id lw20so16693586ejb.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 00:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FUqOVP3OH7BWYjo6vdlKJOAexlQHETbAKu5icdi+qLI=;
        b=Z3kQtFflp9ce1ZM08KTXQjN3/rys8fUPdg6bFciqs7HRkuvSLYCXT30XIGG74Whnbo
         2w2TMEoeFr/jQ7RQNYBZX3WPP5GrFk6oOSuyDI9iPU2/AHQZ6C3F6D69i7TAYI3AQQtz
         03JTE7KKCSegXy9fyXaKRjsfYlgjaEyvipR/xWN811r3xokYYx+HFE3F5ZdyalC7aENR
         vA1meuxYwHmUkmw/DxdH3xTNO2C67JIpX/1FtHHpbjEWfLwrWMaDNk579g3X2kiFsKrt
         e7ADgDiACVsdABiMnm2fv7466/IE4PddktbRMemlBGqZsK+KKh5QmuNkv2XKCq9hHXvk
         aKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FUqOVP3OH7BWYjo6vdlKJOAexlQHETbAKu5icdi+qLI=;
        b=GI7eO7c51H8kgqhXYSOriixoEii1VuSOqPpYz0GJMYRq8t0WTHftSaqVQO06Speaqu
         3PXt9i59IBu2N0UXhs2SR9PvmP+aAUjN96YQvRQigJCmV6lKZElXu/E1W00065TL2nbO
         dHycz7pyg1VVLkQ9kbdyJE3t/I1sihsWasBZQ9SO5NsHE06CYRq21dkJ5O6aAnFCRQ3M
         IL+pARSTX9A8gtDgNj08FqsujzzfTrLYni0JWSXZHiwout0XP/pA5ez+yp44OvzDgvIR
         x1/I8toe/37eEvZYcGe9jm3BHA4uRTeLJawHb54RvjEPcvwYjtcS2PVHpTDYKbleM/Fc
         Aajg==
X-Gm-Message-State: AJIora9SElxEGQCP6W48j0H9cwGI7DBV+wQxhQG4Tv/dTnLqtn8oyBz6
	49co148hw7/uLD8bvZHC9LYNQw==
X-Google-Smtp-Source: AGRyM1sSWLw+uz9Wo/Vqcc2Qzmpm0rtmfs9IKZ6vHicf79GE/X5RwZggFtUqWDuVFpql/v0tm0c+Uw==
X-Received: by 2002:a17:906:9c82:b0:6df:c5f0:d456 with SMTP id fj2-20020a1709069c8200b006dfc5f0d456mr6845907ejc.287.1655967938872;
        Thu, 23 Jun 2022 00:05:38 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a24-20020aa7cf18000000b004356c18b2b9sm12227191edy.44.2022.06.23.00.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 00:05:38 -0700 (PDT)
Message-ID: <84cba0c8-fb31-3314-5e2c-7a0c13030b9a@linaro.org>
Date: Thu, 23 Jun 2022 09:05:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: (subset) [PATCH 7/7] ARM: dts: aspeed: centriq2400: use qcom
 compatible
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <20220529104928.79636-7-krzysztof.kozlowski@linaro.org>
 <165589305701.29629.10216921074802952879.b4-ty@linaro.org>
 <CACPK8XfxXi8kQr+vxta8rD6SBgxLf_oBjAH0UkPBacQta552YQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACPK8XfxXi8kQr+vxta8rD6SBgxLf_oBjAH0UkPBacQta552YQ@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Wang <David_Wang6097@jabil.com>, Steven Lee <steven_lee@aspeedtech.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ken Chen <chen.kenyy@inventec.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 23/06/2022 07:34, Joel Stanley wrote:
> On Wed, 22 Jun 2022 at 10:17, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On Sun, 29 May 2022 12:49:28 +0200, Krzysztof Kozlowski wrote:
>>> "qualcomm" is not a documented compatible and instead "qcom" should be
>>> used.
>>>
>>>
>>
>> Applied, thanks!
> 
> What tree did you apply this to? Did you get review from the maintainer?

Tree was mentioned below.

> 
> This board is unmaintained and unused. I would prefer it removed
> rather than meaningless fixes be applied.

I can drop the patch. I'll send the patch to remove the board.

> 
>>
>> [7/7] ARM: dts: aspeed: centriq2400: use qcom compatible
>>       https://git.kernel.org/krzk/linux/c/6202c6063145cf9ec22b40aac219122dd702a10f
>>
>> Best regards,
>> --
>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
