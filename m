Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951B277299
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Sep 2020 15:38:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxx2S6FQgzDqjX
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Sep 2020 23:38:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=bgolaszewski@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=bZq4o3WQ; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxx273QKNzDqbl
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 23:38:05 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id e22so3408976edq.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xik+LU5D4/fnn9O5Zg87zvohwDV0OOxnMU6Rsd+HY5c=;
 b=bZq4o3WQtLEJr2hF7mu9T4voHEBiRZ/TRwujICZ9S7HZhEwolwqG/vQ7kdo5O4CyP4
 oLSU+r7N7Xllvo9LRKTKkXdRSl06zc1J1mF+kRJI9EUJdNLfEb0Zd5227/HqtRZuMK1b
 YdKMV32umoR833Fj8DoHg5lE7GpkmpqmyqQD8penWeGszWRjo6JbNdwNTXj9Y/f3NRDQ
 E7DpO2ULfgrybDDJtmMI/eTqX6pRyQEQSHOL4FZULVTe1MLBStA1OGaqljfBHPhAFcZ0
 WLSe32GdalfrwK8CwaBPP2Vp9KvNvg2Kq/eXn9z1QeJMTTihSei/Ae+OXG/zu8nJ+EFl
 PSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xik+LU5D4/fnn9O5Zg87zvohwDV0OOxnMU6Rsd+HY5c=;
 b=MhExO+FrC0NwjfANmL0COfmgeNfazuvPXBzzsb77mU1czbY3RcwEHSvaYpHyNsffwg
 9eowqwpN2Nxq+kxkEY0ITx46SixWNXRy4IsH8FSWRxcy362guqj3AHz95aX7uAS7KOec
 QQQrEQv7k8s+3Ys3FVEWzO2XV0J72jCbwzuYbjZPawk75Xxz/QDk7W+iiiyLLoEgYvYZ
 e/214PQ6mnkubmh+jCPTwk5Qnefq3q0sYK+aRNPyyHkuGok+4IZvLHz5Tg+/wbE4h1IA
 IrLFh2zzM5JAdighNFhKit2ocATBtVPyWkNZuqBTrxXHPViQTArBXm5cb6ZF0JF1Lo0e
 PS9g==
X-Gm-Message-State: AOAM530/QrhTNuX7PcES2RgNxZcG3Qr+uGJZSfKqErqdPsxyDkGapmD8
 9a6BqhZbWnSOcIvOokpW+cNzgGZmizLZTu1IEpvd6g==
X-Google-Smtp-Source: ABdhPJwUCSvUnwIjhMwXdH5/5JtzPZNKnNR+yIgd72G5d87Unxa+rzC+LUlKdHxuhlTagtPeDVImVhVFGvN3yixC0jU=
X-Received: by 2002:a50:e79c:: with SMTP id b28mr1109705edn.371.1600954680607; 
 Thu, 24 Sep 2020 06:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200916204216.9423-1-rentao.bupt@gmail.com>
In-Reply-To: <20200916204216.9423-1-rentao.bupt@gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 24 Sep 2020 15:37:49 +0200
Message-ID: <CAMpxmJWR7VqU9urj=-KypKLm3aFooMd9iyusYtr5dNY2oOgXQQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
To: rentao.bupt@gmail.com
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>, openbmc@lists.ozlabs.org,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 10:42 PM <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> GPIO_U is mapped to the least significant byte of input/output mask, and
> the byte in "output" mask should be 0 because GPIO_U is input only. All
> the other bits need to be 1 because GPIO_V/W/X support both input and
> output modes.
>
> Similarly, GPIO_Y/Z are mapped to the 2 least significant bytes, and the
> according bits need to be 1 because GPIO_Y/Z support both input and
> output modes.
>
> Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 879db23d8454..d07bf2c3f136 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1114,8 +1114,8 @@ static const struct aspeed_gpio_config ast2500_config =
>
>  static const struct aspeed_bank_props ast2600_bank_props[] = {
>         /*     input      output   */
> -       {5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
> -       {6, 0xffff0000,  0x0fff0000}, /* Y/Z */
> +       {5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
> +       {6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
>         { },
>  };
>
> --
> 2.17.1
>

Queued for fixes, thanks!

Bartosz
