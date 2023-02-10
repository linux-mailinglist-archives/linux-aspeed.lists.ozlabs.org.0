Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA5B691A71
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 09:56:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCnfS5sNTz3cL1
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 19:56:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VH99WeYM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VH99WeYM;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCnfK3LrLz3bZS
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 19:56:38 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so3526566wms.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 00:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZ+f3iNC4UgNVPziXFfD8EZktQn5DJOz0Zpd0I2PkVM=;
        b=VH99WeYMF5yNKSPDbejJR2fnGBGHu7owHpzE83+tg1SQCsUAPGia+aPCjhlnzuICBJ
         7LXDjJ5ubhKDKAfU7IkOCcuLjo4S/TIaN8ljH4S8kH1Cv0m8QujlNoyPxgFflCqb88Bn
         EZgDZhZShm7956siFhfcOzONw/5HKMor98dQRvOZbZBlHIagrMDqpBdcpJNNdyIyLCqh
         F7+9DP8SWzi7ZkTXGHSMKneKMv2BubXlI7GKaPG9EUvPmG8JTUKGOYl6U1pckU364J/J
         wmoMe2Q9KYhuYZWO7My+UlzsPggI9X5PFL2lDZyLzkIWPFcfyuaKjie9dlXq0iVjMJQe
         DMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZ+f3iNC4UgNVPziXFfD8EZktQn5DJOz0Zpd0I2PkVM=;
        b=IJ4dy1t2bpl4CYwvw/Xb9npfWHJM2HjVRqvMpI0sAlHMoRjdcqsQ0NZfEw6wdBUWJf
         mYJhCPhm43nA+WDRJlczqVTBVEki0rlgarQkpTwuShw380o/bxtVHxlVNLEkyUusBObH
         lYZ0P3lo4obCoG4+8Ce6SznMpQc0GSH80+WDPUVTN4xJr3M+kP8PJgJ9HYxgNjjRYAz5
         hxm/HHSKy56rRt4rBKHo9MlSZ93uA1bq3dfK0eTS1NIB5ms7/i8J/64Na5E6ufYUL2vm
         trEBEMTl+2j7k1vHSKNCrCBRFaNB+6ZSS0+U6JvDUC+uerP7Z++oX0e0VKWNLGHRpGoX
         umeQ==
X-Gm-Message-State: AO0yUKU1cU5jhQ9wKu2iFXIOE7FMp6TUw1msiv7hi4MW03+e9qC91cWj
	i508yrq9A4OqU7Pm5CZzIgqALQ==
X-Google-Smtp-Source: AK7set/WowO5q/KnieW1zymc9H4EETfqzpWgHbPuDdPwkHpc6T3r4xFw+0Tyid295hdXskt7OZiEfQ==
X-Received: by 2002:a05:600c:2ac8:b0:3dd:638d:bc31 with SMTP id t8-20020a05600c2ac800b003dd638dbc31mr15440661wme.26.1676019391138;
        Fri, 10 Feb 2023 00:56:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s11-20020adfeccb000000b002bfcc9d9607sm3028821wro.68.2023.02.10.00.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:56:30 -0800 (PST)
Message-ID: <4b735136-d9c0-cf01-e453-c8da31754a93@linaro.org>
Date: Fri, 10 Feb 2023 09:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] ARM: dts: aspeed: Add device tree for Ufispace
 NCPLite BMC
Content-Language: en-US
To: Jordan Chang <jordan.chang@ufispace.com>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
 robh+dt@kernel.org
References: <20230210055451.72153-1-jordan.chang@ufispace.com>
 <20230210055451.72153-4-jordan.chang@ufispace.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210055451.72153-4-jordan.chang@ufispace.com>
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/02/2023 06:54, Jordan Chang wrote:
> Add initial version of device tree for Ufispace NCPLite platform
> which is equipped with AST2600-based BMC.
> 
> Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

From where did you get my Ack? I don't recall it.

Best regards,
Krzysztof

