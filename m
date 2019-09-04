Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD0FA7C25
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 08:58:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NZQq04gXzDqrm
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 16:58:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=baylibre.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=bgolaszewski@baylibre.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Pvsm0jkN"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NZQh5TBBzDqbs
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2019 16:57:59 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id o101so19526025ota.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2019 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dt75WhUIfHVQfvigwZn6/besGZVEJEtBIQcEOqZ+B54=;
 b=Pvsm0jkNiRhObMK4vm9PFjK6gDG1RInx1dfQIY+anapAMmQ7BBqa+FSp2oQcED/5ZB
 fMFHq1bQSJaQxWDjSZDwYSgSZiGzcMYKOHp3BHHpvmkR/bFVtnN1/nZhEyIerU3Ius5Z
 nhj9GQwxsboOGg+Xy6lXBu8TMN5aY7NAg746v/3ONWMWbQRN3cS84RI2pA4veYqocRhW
 Tk70wmmQirUWHbVtRF2QYa5Fa7ZUVBzx4h5df3jv2vIplCQB6rnVK09hgrU5zieTdwdI
 HxM/Gs7C8qN25BCH3ub6QKRMsgVuWSajuOJsabMCCXmOevSJjqfqamqw3aKhEiPWNJMV
 /Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dt75WhUIfHVQfvigwZn6/besGZVEJEtBIQcEOqZ+B54=;
 b=PQMVPEelss5//V2WSW16c/LIpzQqN0utIRFLuruv43fUXiCsEwYQk97XALxCEhyO9n
 WFEro2so6OlC61Jy4DGDOfQYfqd1Z8Y72BStlZRcgLqSnyA/9aSeDODg8iYk47NlpXmP
 ntmNNJFa8w1AQPBnaybY9tkIhWMv1UOhSvDSIQpCgfaYZMqz6EtyrE4xYeKVz6Mt8by9
 KzOktUEOUfLO8/rT8O0N2m4NaFiYrrllTQj0Z4pr9YPJqmmiM4Agj06fvuoRZy68GX49
 0CafEW3paFR9PmPQejZ+iXSsRoQYTTWfsF6iErU5EHTsaCUhzscGJK3yGeJ0kaerv+ec
 y4GQ==
X-Gm-Message-State: APjAAAUWwp5ewgYayUo7U0rS9VUlJp25dQDaBdSlkuwN1ARenmMn3XCC
 6NQw7Tw8pI+1YFW8hRWTnfR1S27Y3GokW4X8bFek6A==
X-Google-Smtp-Source: APXvYqwU0uoAvsRitFcgVrGOxLPCnceC5cmEGe0+fYS1mNopOondiib3itWCLOA9ZD86Hadp9khJFTIPsIhusxb2mrI=
X-Received: by 2002:a9d:6c0d:: with SMTP id f13mr1329516otq.85.1567580275770; 
 Tue, 03 Sep 2019 23:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com>
In-Reply-To: <20190904061245.30770-1-rashmica.g@gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 4 Sep 2019 08:57:44 +0200
Message-ID: <CAMpxmJUVijPRGDw3GcSVt=MYod4nCD-npQKVmn2L4AdBSy5++w@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio/aspeed: Fix incorrect number of banks
To: Rashmica Gupta <rashmica.g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

=C5=9Br., 4 wrz 2019 o 08:13 Rashmica Gupta <rashmica.g@gmail.com> napisa=
=C5=82(a):
>
> Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
>

Please, add a proper commit description. Checkpatch should have warned
you about it.

Bart

> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 9defe25d4721..77752b2624e8 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct platform=
_device *pdev)
>         gpio->chip.base =3D -1;
>
>         /* Allocate a cache of the output registers */
> -       banks =3D gpio->config->nr_gpios >> 5;
> +       banks =3D (gpio->config->nr_gpios >> 5) + 1;
>         gpio->dcache =3D devm_kcalloc(&pdev->dev,
>                                     banks, sizeof(u32), GFP_KERNEL);
>         if (!gpio->dcache)
> --
> 2.20.1
>
