Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D25A7D13
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Aug 2022 14:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHjnd2HB5z3bln
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Aug 2022 22:16:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AqpsGQxz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AqpsGQxz;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHjmn2yWvz3bcF
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Aug 2022 22:15:19 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id kk26so27917612ejc.11
        for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Aug 2022 05:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kWB6H8/eRT0uvs+7dpZN0LfgkIKsMbM/vLGI21NZpGM=;
        b=AqpsGQxz0Z5xEtEA2iTVL+MHr93DKFmuEVs5lC21yVoP8sAEtUttoNxOg16xoO8FWT
         iz5fcIJSylAWLoJdbt/iB1BSAvpsnm6J5BdtLWRy18zlaYp9FFyUFHSPby+PN6ZittFK
         Rv78F+ZJ/VU4Z3YIxyXQvP6F7TFAm8EhqeMstDp+b6d40NuB3kvomcK1QKE0tMSHOSTE
         hrVsRkdiXae/rFdkub4hNciY8Xp22pq6x/XBmKVzhIkk5lDO2Cx5w+9jdRem5Ue/3hnO
         Lxjeb5a6QfoyPwnSyew3K3/QEEs4sGEB4j4ypct9IJsNhKWIkE6V3pu2e0sM+WGqFYO/
         XsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kWB6H8/eRT0uvs+7dpZN0LfgkIKsMbM/vLGI21NZpGM=;
        b=uh8cwHAy+ufemGuWr3mzS3/FuGetlb1yt0Zn43Rd6JcWAfQdKqq9OkAktwV9VYGIsp
         mV+qPsargLAuj/s7LFIBkmH58dBsV/uipPXNGEd/syBrOaBuxzkNQyIuP6A3jDCXTtQ4
         uYHldStHln/n5ZURj95q65mk9/9w5rwJrKbSkj44R0cMg3R7q3Yq8qjen9LJFXVaZy7Y
         nksIFjZr16suggTrK2j+UZxF2V8xHOr4dqmjOBX1fJ5A1CHaI7xmX2VAtCi6MXhflvG+
         z3E1ZRtL09Y+rmUWOX41OI9rL8FwsL+J3vkrYAWQqE0jVgsH0mwK2WzTod04veFbNI30
         i9aQ==
X-Gm-Message-State: ACgBeo0znrZXycByWH8zRQUtOGKxITHrg356Jv1RlVQ0WGfqKiu+Qeqn
	IZfAq8q+OjgjLi6LjSmqvWu/5uxBgNS0bLh4jYlkfQ==
X-Google-Smtp-Source: AA6agR431HKmf0TUg6YlMD0uxoGOijdkT6OeZopqLPwbMGaOIN9VRF8Kz4zNCsyebmooon1v1jTmK62J5TvWsl8ex3g=
X-Received: by 2002:a17:906:cc5a:b0:741:5240:d91a with SMTP id
 mm26-20020a170906cc5a00b007415240d91amr13306282ejb.500.1661948115397; Wed, 31
 Aug 2022 05:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Aug 2022 14:15:04 +0200
Message-ID: <CACRpkdZSw9Nn8hp+C3SPw4_EkXn0mkLh8tSO5zhGR8xdv=Jk8g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Force to disable the function's signal
To: Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 18, 2022 at 12:18 PM Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> When the driver want to disable the signal of the function, it doesn't
> need to query the state of the mux function's signal on a pin. The
> condition below will miss the disable of the signal:
> Ball | Default | P0 Signal | P0 Expression               | Other
> -----+---------+-----------+-----------------------------+----------
>  E21   GPIOG0    SD2CLK      SCU4B4[16]=1 & SCU450[1]=1    GPIOG0
> -----+---------+-----------+-----------------------------+----------
>  B22   GPIOG1    SD2CMD      SCU4B4[17]=1 & SCU450[1]=1    GPIOG1
> -----+---------+-----------+-----------------------------+----------
> Assume the register status like below:
> SCU4B4[16] == 1 & SCU4B4[17] == 1 & SCU450[1]==1
> After the driver set the Ball E21 to the GPIOG0:
> SCU4B4[16] == 0 & SCU4B4[17] == 1 & SCU450[1]==0
> When the driver want to set the Ball B22 to the GPIOG1, the condition of
> the SD2CMD will be false causing SCU4B4[17] not to be cleared.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied!

Yours,
Linus Walleij
