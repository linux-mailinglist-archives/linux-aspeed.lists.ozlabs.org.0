Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF828299016
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Oct 2020 15:54:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKdCC6GhxzDqPj
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Oct 2020 01:54:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=bgolaszewski@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1Sn3eS1r; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKdBw1dYvzDqNt
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 01:53:34 +1100 (AEDT)
Received: by mail-ej1-x644.google.com with SMTP id w27so14006679ejb.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Oct 2020 07:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=38JUOSBu4GFhBOvq+9SNCXQcv0KkWmqy9Hp4RPYwxR0=;
 b=1Sn3eS1rPkIUw4yZiZX8LDfpFMLxcQy2ZruTRUmGgiz+JxtDdBR02bS/uctUytpc46
 z9HKtqNOkFLB/Upy2/aXJgE8WL34vioY4yt2S8RoFyfewKlVA03zZc0Xlo5GGaPsAh24
 1zdq5HXwORHbeB+vgHEktCppgeIqhTKKqx4JWZiowRpevfeYmrnx06YzykdN4qVkDUnf
 rWuH8Wdhph/3Rt6CGHS0iN6sSOSnRTyCcBmnMSymJLpaP4Lf2XVDhwEqJ7K+iAb416PP
 lxOQg5ZWtRj6YCgojg0IRPv99BN/xWGUbHFrMbc+tOc96VcepJeR6i9u3SFCbY1dB7iI
 6njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=38JUOSBu4GFhBOvq+9SNCXQcv0KkWmqy9Hp4RPYwxR0=;
 b=bQgZgcpXRPnkFPI9yYey/nB1QAFX2HTQYD9LitJ893l9UKM4e2q1JLQSJkF14fpDA+
 7zZIeAAS9g7ZTavDUivVvJC70JezsHGiK9J+rZjXknz8jUBbAc/i6GPjRe4NDluTUcpX
 2eUPrZyYpnLzTr5Pf02E+rQ6HEIQJdQ/cuqAzc+BTuxEXIQhAivsO90xgvC2/PjW7iCV
 YX1SQGTnSK/EjfevrRmE6ov5Ep5+jCIumQTMaoXNdiU+l98/XzZ3jjcsm3D9eMGuzf6Z
 oe4cqYjYXGudPo5qqO1xl8VSg7hc63Hnvh1cxmMwHQ7HxcQSQt/sDG+R4P36NG7MhxJg
 +i5w==
X-Gm-Message-State: AOAM531PBKo9uWbgolmIK/MBP/nkX8QPUNt+2IYJN4iYezaPSMQJ6pdH
 VN7jaObKk0meojbpu2NqCMrL4c4XgKncARWR7CjY4w==
X-Google-Smtp-Source: ABdhPJxmm7PP+RKNyuOdsuUjuGYXmXHXzRcdDH1ZWgN2nvf0gIXhlqZ5eyc1qgr7/me1aVyIp28B9EnRl+4aNr55jsI=
X-Received: by 2002:a17:906:3146:: with SMTP id
 e6mr15346860eje.363.1603724001628; 
 Mon, 26 Oct 2020 07:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 26 Oct 2020 15:53:09 +0100
Message-ID: <CAMpxmJXzku3+gfs3jnfpRzLxmQFx3QAJArXEJ0maRx=EKK4WTw@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio <linux-gpio@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Oct 19, 2020 at 6:50 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> GPIO_T is mapped to the most significant byte of input/output mask, and
> the byte in "output" mask should be 0 because GPIO_T is input only. All
> the other bits need to be 1 because GPIO_Q/R/S support both input and
> output modes.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d07bf2c3f136..f24754b3f6d1 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1114,6 +1114,7 @@ static const struct aspeed_gpio_config ast2500_config =
>
>  static const struct aspeed_bank_props ast2600_bank_props[] = {
>         /*     input      output   */
> +       {4, 0xffffffff,  0x00ffffff}, /* Q/R/S/T */
>         {5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
>         {6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
>         { },
> --
> 2.17.1
>

Applied to fixes with reviews collected and added the Fixes: tag.

Bartosz
