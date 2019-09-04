Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9513EA86A6
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 18:36:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NqGQ44kdzDqx0
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 02:36:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u96W3i3h"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NqFT2d03zDqg1
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 02:35:50 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id w10so11524179pgj.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 09:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h04RkzjT3hXLTqVi3hxMYt7+XgkxZzlEb0BXvzdW1Iw=;
 b=u96W3i3h8EyeOAeUHfKxUJeZZrPcR78dwH/TA9Q0gcEBy2fX0/RospEgR+NpW6qmL8
 x7Cw14anhZMC/3swXtc5wbpMZ+zCJqv4YzAVxVQuTkU+2IspzSnhZM3Gv5klXmNda5mw
 wVF9asAXOiNpj3HEIMkNLKBdRy6DO8xyWZEufSISyBoqV0U9AFhOxjXiRaF3BcQWN0kq
 zWWkmevlB+++8fGIjUZFmXsFgLzRrXmjtPLiUiaPDrwTQ3LzcfaJ7vq2GqaVRy5rrt5u
 b4hUoaq7bsGZDSpHsgo2hT8e70WUzAVYai9e+pS1NGd+erk4+IDj3tcPJyGAyEfYLupO
 Z28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h04RkzjT3hXLTqVi3hxMYt7+XgkxZzlEb0BXvzdW1Iw=;
 b=RqKRqsfQbWCB7nIXOj5HLOPo2O1cbwuKHJFF/XZboh0rlnAE2Xxv2eZJiwiU5cSDnc
 37YW270afN5SAXit8tbpdMQxlkL7SH0YQ820BhnRJKWzT2mjFED9dQcR5bRwLdge4PwY
 m+6J6eVSNY8OgidHnFMmqAIXQBn7lQhXhndGj5LnP0puvHbEtsA2vm77fmal94g6zNSf
 r5VdCme4Cnr+PFvlV+lhR1pz0Tgal1u8BJdsGmuf3ZjbWHF2q0zTgaPtCIlHgclPeNlc
 Vq8w2qCgQpgozdz0+OkWFK4SEm/xfBHaqrET4r8gprQ3GvDdzUffL6s9qr8ux5nDOOtY
 ryYw==
X-Gm-Message-State: APjAAAVcxH/4HRmux2eRu94qTMwBzdoG3VGqYc8x6jpYuW8xSTOyC+s3
 elyUrRofXdlE5hqbaz6fdx/E5mr7DYdgWw55j7o=
X-Google-Smtp-Source: APXvYqzS8bxdeH8zm+j+hxb1ouuCS1ZUvEOMUS0WH79z6S5Qndoz6KZ4UIiuE9srzqOavs3O1cbyfUGHH5iUYCJJZFI=
X-Received: by 2002:aa7:93a8:: with SMTP id x8mr14577315pff.151.1567614464501; 
 Wed, 04 Sep 2019 09:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com>
In-Reply-To: <20190904061245.30770-1-rashmica.g@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Sep 2019 19:27:33 +0300
Message-ID: <CAHp75Vd_6Rpt5=BjzV8YFCiFP7qsRrYHHo7+=gWwnZH-zT9jNw@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio/aspeed: Fix incorrect number of banks
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
Cc: linux-aspeed@lists.ozlabs.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 4, 2019 at 9:14 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

>         /* Allocate a cache of the output registers */
> -       banks = gpio->config->nr_gpios >> 5;
> +       banks = (gpio->config->nr_gpios >> 5) + 1;

Shouldn't be rather DIV_ROUND_UP(nr_gpios, sizeof(u32)) ?

>         gpio->dcache = devm_kcalloc(&pdev->dev,
>                                     banks, sizeof(u32), GFP_KERNEL);


-- 
With Best Regards,
Andy Shevchenko
