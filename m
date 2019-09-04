Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7AAA86AA
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 18:40:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NqLN6CW5zDqxM
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 02:40:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z7MJE3qJ"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NqL83s7tzDqww
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 02:39:59 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id y22so7955948pfr.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Bk5FCrmIebdNTJxqeSp5asp911jjtdI8aFxkaoSkUA=;
 b=Z7MJE3qJHR8e1zg4M/OzjRMI8uXwVNEOcJS7BGFiaDV6mFALldUUSXDzH7MDyjvIPC
 N3ORyV1v0tHe0bs85LwIt8W3EDERZ9+ixgYiqYntooIRtWwd0cs7l/fnCUltEybL5LnU
 AxSYEpWniZ9Vc9HG6/XZyqZTO3u9wlVyUmwU9p7BU8s7K7YCcQ2O8/SGOBjo4uPyS6zx
 nsN0/ojOMkS3Jj2Vk7LwCMkBQY3EvHhBSKnV2G+lZMK7koE2fAZwP+wc19x3joGmOyTQ
 d/eDjlbD1Ea+xJ4ZG3I1n6BpTMlO0Ow++2Hu03dK+pWgvMIOwmtd/bC/EWjXYZh9p51n
 BSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Bk5FCrmIebdNTJxqeSp5asp911jjtdI8aFxkaoSkUA=;
 b=GnalTldgG3BAxCUcen7TFdcktLjJ+LtQB830X/V6bEQinYHpLfYFN6AiRWqLPOkFVd
 psG8KErVXxeAdjGAXlsEB6fCwFikyTBhrQV25+Z/CV6TQJgeGSURJXcDPKqm8LsB3p3Z
 iaHj18/O4xG9PXpvoUK/pi9aTrB31mFpyojoDLGjxb+Lc3/p/X9p3wnyHcAGRIVo0/nH
 Um5j5TWa+xG2yi94Ld+TtdhNQH14KKjYWZxPvsYSd81xHJMYQ9G/obg73tAYuyYabdSa
 CFt6UXGD41V44J2cmfS7PJyrnaEJf3FKVM18O7UrmVC2oQKPIqfzTtZGqYpXrUKs4blN
 Cixg==
X-Gm-Message-State: APjAAAXOU20Mg77MdtawkR19TXyErUzXrd+O8r5nrWTBBn6zHw/Re4dT
 w/9wVCDVJfodRXrOJck+LLYyRuZQhV7lI9+6E5U=
X-Google-Smtp-Source: APXvYqwfTMyky+gr506dU7vA5RQA2gAYCn+ZMYC+IVVNtVkdvfPY6ix3mRDrBzSvrtUGH0BfnF3ha8tgX/jGZ72bAxY=
X-Received: by 2002:a17:90a:19c4:: with SMTP id 4mr5998093pjj.20.1567614620706; 
 Wed, 04 Sep 2019 09:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com>
 <20190904061245.30770-3-rashmica.g@gmail.com>
In-Reply-To: <20190904061245.30770-3-rashmica.g@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Sep 2019 19:30:09 +0300
Message-ID: <CAHp75Ve0zEkuD-75aZ6FU+A=DvX8NvVvY3n9p_pYDyfa76sxoQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: Add in ast2600 details to Aspeed driver
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
> The ast2600 has two gpio controllers, one for 3.6V GPIOS and one for 1.8V GPIOS.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

> -       for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
> +       banks = (gpio->config->nr_gpios >> 5) + 1;

Same comment as per the other patch.

> +       for (i = 0; i < banks; i++) {

> +static const struct aspeed_bank_props ast2600_bank_props[] = {
> +       /*     input      output   */
> +       {5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
> +       {6, 0xffff0000,  0x0fff0000}, /* Y/Z */

Perhaps GENMASK() for all values?

> +       { },

Comma is not needed here.

> +};
> +
> +static const struct aspeed_gpio_config ast2600_config =
> +       /* 208 3.6V GPIOs */

> +       { .nr_gpios = 208, .props = ast2600_bank_props, };

Seems curly braces missed their places.

> +static const struct aspeed_bank_props ast2600_1_8v_bank_props[] = {
> +       /*     input      output   */
> +       {1, 0x0000000f,  0x0000000f}, /* E */

GENMASK()?

> +       { },

No comma.

> +};

> +static const struct aspeed_gpio_config ast2600_1_8v_config =
> +       /* 36 1.8V GPIOs */
> +       { .nr_gpios = 36, .props = ast2600_1_8v_bank_props, };

Location of the curly braces?

-- 
With Best Regards,
Andy Shevchenko
