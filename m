Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEBC393971
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 01:52:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Frl3M4Plcz2ymF
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 09:51:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x8HVgNcT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=x8HVgNcT; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Frl3G0MXjz2yYY
 for <linux-aspeed@lists.ozlabs.org>; Fri, 28 May 2021 09:51:51 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id v8so2620170lft.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 16:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=igQk9HIuYQm9nCu5NIGuLrsyKhw3Yali5yjk1GzMK1g=;
 b=x8HVgNcTHMj5JVGKRHW/wCa3LzV4elPUTOyr+cwzxoYv/27GB6Vr5op7LDnUCrQFQo
 WClXOUO77mmSoBaztmYxV8lugmBtCRQACzf+KqoyxqoGDbVxEomeRxcBR4MgVdbD/m5i
 j25ZjBBY4pv64I9XaA0eR9FuybSYgX7dryXNdk8y8qVTsxyR9yV6Djus+gGeRVCxDvPO
 EZyjheDf/tD+dxsik7cLUNYci9rcPmcLz5hzC9h6Uo7Im8AZyZKnkKN+0XCYy4ajfYbZ
 hHJIqjRu9BdZbwuVeDWwXXKiwVex14BZgs29gHFPMxbvAMLfiO7aPGM550kGaBBHNQ4Z
 f8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=igQk9HIuYQm9nCu5NIGuLrsyKhw3Yali5yjk1GzMK1g=;
 b=T7hNjV5i65RqmWnlOvkn3SkYmKVw9BnxZ5s3c22Rf0oN/x5mGkKpLInCZvEDszLlZy
 RjxBKrzCOfFTzysdQuaOS8y/Z7Kf6IkSZKDke9QM9vzC3yWYktL9X9uID19ekQauvNpQ
 koWxZKcYNOUoZAlvzkzer5Yrwk9rdNSp/g9ys9BeO595TpOnk531z8YftMwrS1wJJIWf
 xtpCj7cu6sWlF9+DlYswzA29/2zeucP9mvYJidMI4Mg/anHJA+81aD0O0zIdwa9mCfr+
 sBQ5ViZhZcQdjEyrzYulwZhwYarjG86nqEpmCm8KySCfJlVtQ1LP2IaLQY0xuV/LxGjk
 yNWg==
X-Gm-Message-State: AOAM530kRY1dGIqqB3ffAbyd1xZcj9TUxakUULQQH/+0/5CtJNzxc7oQ
 7fLKf3IvfNv88KihDlN/5SvGrx5g4kZkDFsC0FBEtg==
X-Google-Smtp-Source: ABdhPJybPcEZ/Uc2pjQ/Pot5Bu/AWSlrkkKli5p3yYDQa2Q+8qdoEZ6ydt1owgyaEmIRgkW/fdP9HLTgWRAV6Jx6RxU=
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr3824704lfp.649.1622159506776; 
 Thu, 27 May 2021 16:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
 <20210527005455.25758-2-steven_lee@aspeedtech.com>
In-Reply-To: <20210527005455.25758-2-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 01:51:35 +0200
Message-ID: <CACRpkdZFcFuT9rdrc8BfEBmhy0--9uLMSJWfr=A+nU117_BT8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings to
 yaml.
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 27, 2021 at 2:55 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> SGPIO bindings should be converted as yaml format.
> In addition to the file conversion, a new property max-ngpios is
> added in the yaml file as well.
> The new property is required by the enhanced sgpio driver for
> making the configuration of the max number of gpio pins more flexible.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
(...)
> +  max-ngpios:
> +    description:
> +      represents the number of actual hardware-supported GPIOs (ie,
> +      slots within the clocked serial GPIO data). Since each HW GPIO is both an
> +      input and an output, we provide max_ngpios * 2 lines on our gpiochip
> +      device. We also use it to define the split between the inputs and
> +      outputs; the inputs start at line 0, the outputs start at max_ngpios.
> +    minimum: 0
> +    maximum: 128

Why can this not be derived from the compatible value?

Normally there should be one compatible per hardware variant
of the block. And this should be aligned with that, should it not?

If this is not the case, maybe more detailed compatible strings
are needed, maybe double compatibles with compatible per
family and SoC?

Yours,
Linus Walleij
