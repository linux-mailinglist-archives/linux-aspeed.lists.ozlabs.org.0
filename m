Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56223A9739
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 01:34:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P0XS5NlJzDqt0
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 09:34:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bgNGAHlo"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P0XC2YRzzDqQS
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 09:34:18 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id k1so320257pls.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 16:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=zEfGTR202P+nwSsU1qSBd5C7kGsRpjPGHZxgayed3co=;
 b=bgNGAHlojCAsmb10/j/F4VrV1/7ILP14DPCXfjdhzRir4IZQWwkF6Hg4EJKc2JLDzb
 cgpVtDjEzBNDrKQEIvw55Uam/IjHauVNHZMcV702fkUgEYcFZJ5n7g+9MY1zHi6vMF5E
 jUoJ3GvvFLZsZvdxgYyVI6Y2u4EjUgciFSQFZoVkEKzXHD2HaVmayQYgfXwEYGHD7bM8
 OVDp35v2L0+znwSHmDf4ljqbUB1Q52eIcyj3phJ28h4Znsr2pSYzjgqvNimEHF0RPZtl
 wH7Hd7K0vzSVh+vDM4bSH9SifMeSZaYfZ2e2C7CVJZQiwHPRvvms4cxoSe18y8QKWV3/
 LE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=zEfGTR202P+nwSsU1qSBd5C7kGsRpjPGHZxgayed3co=;
 b=BH0ADsfHqIgHBI/76mA13urduIhrZX2Xoox6U57ABBp/MOVJvVi8JZSVgiNop30Lkd
 YaFn2VpZLVpXF6wk6hGOzm+p2X3kn7rDqGHr01T1HI4Uxs5EUhcWP1HoAVbolOAmD65f
 LZuoaUdg2D+NQtn2wki3zMHlNSvk+deknlVX5gj7K5AjcZjffnicTz+8aAuH7cfoiMkY
 SyqQgk8ixlJzsi5adajEdHV3R+Ze5dcsjPaCj8Lv38HR0wvsjFD7f+hej8eUXelElAzy
 t1MKVGKI6zrcOc8OxxRmOMmi/zfGq82k1j4Gq/4CSbV1ilcMWYFDfBIiqSyjSIXWrqxm
 SeCg==
X-Gm-Message-State: APjAAAVgKwN5aXtWXsv+W6G6y9B5jLEejiqK0stPEmUw5TtMk9QXCSWR
 SBun+daePfhFb/0+CiU/c2w=
X-Google-Smtp-Source: APXvYqw3odHmU1fPWW8sZtm0x+bGwW0rkNDvCptjLNdQshanr2Coj2SEZMCxGSIfz+2XD+ZWxq8Gvg==
X-Received: by 2002:a17:902:a415:: with SMTP id
 p21mr261987plq.319.1567640055590; 
 Wed, 04 Sep 2019 16:34:15 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id c138sm179277pfc.80.2019.09.04.16.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 16:34:14 -0700 (PDT)
Message-ID: <1ca6ffddd2452e218ef19ea84ac6c6277e1a9725.camel@gmail.com>
Subject: Re: [PATCH 3/4] gpio: Add in ast2600 details to Aspeed driver
From: Rashmica Gupta <rashmica.g@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 05 Sep 2019 09:34:10 +1000
In-Reply-To: <CAHp75Ve0zEkuD-75aZ6FU+A=DvX8NvVvY3n9p_pYDyfa76sxoQ@mail.gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
 <20190904061245.30770-3-rashmica.g@gmail.com>
 <CAHp75Ve0zEkuD-75aZ6FU+A=DvX8NvVvY3n9p_pYDyfa76sxoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
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
Cc: linux-aspeed@lists.ozlabs.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-04 at 19:30 +0300, Andy Shevchenko wrote:
> On Wed, Sep 4, 2019 at 9:14 AM Rashmica Gupta <rashmica.g@gmail.com>
> wrote:
> > The ast2600 has two gpio controllers, one for 3.6V GPIOS and one
> > for 1.8V GPIOS.
> > 
> > Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> > -       for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
> > +       banks = (gpio->config->nr_gpios >> 5) + 1;
> 
> Same comment as per the other patch.
> 
> > +       for (i = 0; i < banks; i++) {
> > +static const struct aspeed_bank_props ast2600_bank_props[] = {
> > +       /*     input      output   */
> > +       {5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
> > +       {6, 0xffff0000,  0x0fff0000}, /* Y/Z */
> 
> Perhaps GENMASK() for all values?

Perhaps this and your other comments below would be best addressed in
an additional cleanup patch? This patch follows the formatting of the
existing code and it's not very clean to differ from that or to change
the formatting of the current code in this patch.


> 
> > +       { },
> 
> Comma is not needed here.
> 
> > +};
> > +
> > +static const struct aspeed_gpio_config ast2600_config =
> > +       /* 208 3.6V GPIOs */
> > +       { .nr_gpios = 208, .props = ast2600_bank_props, };
> 
> Seems curly braces missed their places.
> 
> > +static const struct aspeed_bank_props ast2600_1_8v_bank_props[] =
> > {
> > +       /*     input      output   */
> > +       {1, 0x0000000f,  0x0000000f}, /* E */
> 
> GENMASK()?
> 
> > +       { },
> 
> No comma.
> 
> > +};
> > +static const struct aspeed_gpio_config ast2600_1_8v_config =
> > +       /* 36 1.8V GPIOs */
> > +       { .nr_gpios = 36, .props = ast2600_1_8v_bank_props, };
> 
> Location of the curly braces?
> 

