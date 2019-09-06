Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5BAC0C4
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 21:46:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q7Nf0lH4zDrDf
	for <lists+linux-aspeed@lfdr.de>; Sat,  7 Sep 2019 05:46:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="YUqGDAHk"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q7NT1t0zzDr2c
 for <linux-aspeed@lists.ozlabs.org>; Sat,  7 Sep 2019 05:46:32 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id f10so6847524qkg.7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2019 12:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HsrQyq0fSQ6NSNordv4m3ugR52nxCtwTVlUHfUbQ0EI=;
 b=YUqGDAHkNC1LA/qFGmWHHXUhy7OgS3YOmBlvZmolATepPJ+zNPP5giD8aLLP0r1HSy
 dCIT7OwBod1u/izNfI3LKZz3oFN9Ng7NLUdiHIM6EygUgG1HoOPGQIsbpzL/NBCIsXWe
 0SyN6XKhfQ0GFs1PqfP+fXP/erND0Ab26Wvm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HsrQyq0fSQ6NSNordv4m3ugR52nxCtwTVlUHfUbQ0EI=;
 b=M4eIWxsCgolvm5rv9LSVK6akxCFiYEDtZp2ons3NBBQFQ6VtmewsOyh/ZS2m0coLjp
 VWDjF/o3f2nC6R3DBruz+mHCqQfP89zFYNFKSK7c/qrnpCwl5uEgBlP9JO3QurGvVI/Z
 1OudIKcZyykpVbyz1IQ9RfAEhSsb33QPmRlMvpQb9ELPK91k8T3z38IoWf4mnJjEdVrj
 mDQ4kLJlre+GFJNLw/20HJ50CROM0zqqAkOWAa40QhK4RaVIZ9quoF1f+SnKm4i90YSj
 dhhBuaNN9+HBBe9GNLP6ODAA0vio4y4ddnY9cMlhkqjW8oN+s9l0gkY4aFgXWsdzD87+
 Ideg==
X-Gm-Message-State: APjAAAXNtu3D/nbqwN656Kt6Uv6bICN/VPdWeGX49qOehzaA9py7EQmV
 N9yqvMTa95aEz2SXNerhINyT+RJdqIqZMpMY+9pFXQ==
X-Google-Smtp-Source: APXvYqwNq2ZlKzt+IPAsPeskkSnOA2qCbZo3zhZPKfOkyDsHGhfdMhr7xtW8vDKerDug2KA8rdNL44wm9pzUVYV04yc=
X-Received: by 2002:a37:f61e:: with SMTP id y30mr10837593qkj.208.1567799189999; 
 Fri, 06 Sep 2019 12:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062623.13354-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062623.13354-1-rashmica.g@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 6 Sep 2019 19:46:18 +0000
Message-ID: <CACPK8XeAohB1qZsWHaxa0zEJM5jVhvV6PSj0fKajobC5HYbMtg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] gpio/aspeed: Fix incorrect number of banks
To: Rashmica Gupta <rashmica.g@gmail.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 6 Sep 2019 at 06:26, Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> The current calculation for the number of GPIO banks is only correct if
> the number of GPIOs is a multiple of 32 (if there were 31 GPIOs we would
> currently say there are 0 banks, which is incorrect).
>
> Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.d.au>

> ---
>  drivers/gpio/gpio-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 9defe25d4721..b83e23aecd18 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>         gpio->chip.base = -1;
>
>         /* Allocate a cache of the output registers */
> -       banks = gpio->config->nr_gpios >> 5;
> +       banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
>         gpio->dcache = devm_kcalloc(&pdev->dev,
>                                     banks, sizeof(u32), GFP_KERNEL);
>         if (!gpio->dcache)
> --
> 2.20.1
>
