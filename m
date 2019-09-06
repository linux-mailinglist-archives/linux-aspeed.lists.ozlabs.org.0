Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5AEAC0DA
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 21:48:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q7QS0Q4XzDrF1
	for <lists+linux-aspeed@lfdr.de>; Sat,  7 Sep 2019 05:48:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="LgST1CJV"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q7QK10RrzDr2c
 for <linux-aspeed@lists.ozlabs.org>; Sat,  7 Sep 2019 05:48:09 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id c9so8457965qth.9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2019 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iUo+RAfa/ck7sxO/vrTAcMV5/EPMZ8UlL+MvZ/FXZXo=;
 b=LgST1CJV9YA7mttan8L01i3+eoJrRdysbvUiwWvM6KWQbaxEK29uzeyzZSLlkcS3eG
 S5ulY+M3I8TszhtbLSQJdkTbrOw55QatC87Sv1oIpwbI9UkD3ug+eUiNiJ9JXOOU+SSJ
 ELK+5ZbKl3TP1suF2E4ZsSA1YzriQ2mZgfw7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iUo+RAfa/ck7sxO/vrTAcMV5/EPMZ8UlL+MvZ/FXZXo=;
 b=uHRAuDGxBX6bDmRyVM3FhIOSYmMEEYrDZpl2/Od52i6ZPH1nhpdhjY0LVDJfTpfx3D
 6+ZzgdFCydjpAbbWmpOOYSDA5M1L8SmWgnZLLhC6bU6ElTNSXKnrJdkBKhLV0zUj9yeM
 8juA5U7NyC4gYck87kfj+bgeYYLEfCgiQjqBGq+WsNkQI4hH4+90FemPapfItRvTLXzI
 rn3YkdAjTK6j1xSLkN6RjxFuK+iWhCdcCBpy3kR7KgLv2OilMPebeUYaYf/9XPDCIypx
 cd3Krm7t4xolyLyqJJv35+v3xv1N2fr5VYLsW/E3qHW48jPrbUvEdifud8U1KLlMLgW5
 OaAw==
X-Gm-Message-State: APjAAAX0JYnavYjFrTRXixB2dZf/eNIQ5GzOk093i4CLXQzcHWPco+OB
 ozL4f/YCR/1VwxXeGvqcHLKHWfc+0UI3B8Eha+M=
X-Google-Smtp-Source: APXvYqzFyczhuU4vELy3FEnLbpNgDv8ZSb9uoaP+A83ZFTCAHt0aG0j50/6DoriEh8Y6hPfF9qnzGXcUaTg6VlJXffI=
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr6351886qvl.38.1567799286186; 
 Fri, 06 Sep 2019 12:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062727.13521-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062727.13521-1-rashmica.g@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 6 Sep 2019 19:47:55 +0000
Message-ID: <CACPK8XfjGY4A1g0eJAUC7SmiguBa6fLhBBz_FzTRa3hQ1kWDSA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpios: Use ngpio property from device tree if
 available
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

On Fri, 6 Sep 2019 at 06:27, Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> Use the ngpio property from the device tree if it exists. If it doesn't
> then fallback to the hardcoded value in the config.
>
> This is in preparation for adding ast2600 support. The ast2600 SoC has
> two GPIO controllers and so requires two instances of the GPIO driver.
> We use the ngpio property to different between them as they have
> different numbers of GPIOs.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/gpio/gpio-aspeed.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 16c6eaf70857..c3d5ecba343b 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -694,7 +694,7 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
>                 for_each_clear_bit(offset, &input, 32) {
>                         unsigned int i = props->bank * 32 + offset;
>
> -                       if (i >= gpio->config->nr_gpios)
> +                       if (i >= gpio->chip.ngpio)
>                                 break;
>
>                         clear_bit(i, gpio->chip.irq.valid_mask);
> @@ -1007,10 +1007,10 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
>         unsigned long flags;
>
>         if (!gpio->cf_copro_bankmap)
> -               gpio->cf_copro_bankmap = kzalloc(gpio->config->nr_gpios >> 3, GFP_KERNEL);
> +               gpio->cf_copro_bankmap = kzalloc(gpio->chip.ngpio >> 3, GFP_KERNEL);
>         if (!gpio->cf_copro_bankmap)
>                 return -ENOMEM;
> -       if (offset < 0 || offset > gpio->config->nr_gpios)
> +       if (offset < 0 || offset > gpio->chip.ngpio)
>                 return -EINVAL;
>         bindex = offset >> 3;
>
> @@ -1055,7 +1055,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
>         if (!gpio->cf_copro_bankmap)
>                 return -ENXIO;
>
> -       if (offset < 0 || offset > gpio->config->nr_gpios)
> +       if (offset < 0 || offset > gpio->chip.ngpio)
>                 return -EINVAL;
>         bindex = offset >> 3;
>
> @@ -1119,7 +1119,8 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>  {
>         const struct of_device_id *gpio_id;
>         struct aspeed_gpio *gpio;
> -       int rc, i, banks;
> +       int rc, i, banks, err;
> +       u32 ngpio;
>
>         gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>         if (!gpio)
> @@ -1145,7 +1146,10 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>         gpio->config = gpio_id->data;
>
>         gpio->chip.parent = &pdev->dev;
> -       gpio->chip.ngpio = gpio->config->nr_gpios;
> +       err = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);
> +       gpio->chip.ngpio = (u16) ngpio;
> +       if (err)
> +               gpio->chip.ngpio = gpio->config->nr_gpios;
>         gpio->chip.direction_input = aspeed_gpio_dir_in;
>         gpio->chip.direction_output = aspeed_gpio_dir_out;
>         gpio->chip.get_direction = aspeed_gpio_get_direction;
> @@ -1158,7 +1162,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>         gpio->chip.base = -1;
>
>         /* Allocate a cache of the output registers */
> -       banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
> +       banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
>         gpio->dcache = devm_kcalloc(&pdev->dev,
>                                     banks, sizeof(u32), GFP_KERNEL);
>         if (!gpio->dcache)
> --
> 2.20.1
>
