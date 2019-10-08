Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCAACF20D
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 06:55:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nQ5B39WszDqNx
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 15:55:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="b1UAUxoB"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nQ5422lSzDqN3
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 15:55:03 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id c4so10484150qtn.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Oct 2019 21:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NuipLPrWDOHTna4R81Ns0ysok+dpoazuekwN/UYksCI=;
 b=b1UAUxoBcI9azVyX+4fyfcr8QslbKfW+ZNjl72tAkSBp/Jy1YWJ+tFCP3v/iE6uGZo
 uFsmfF5NevYXiJYD5i7adKbaXEvLAmRipJapvNOvu3mvQmzrlB3fmOhmdHk3VfVgkcIQ
 vSxJM5Stk3ECN5ymfkv9mvlbQe33hpkkFLtxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NuipLPrWDOHTna4R81Ns0ysok+dpoazuekwN/UYksCI=;
 b=Pcg2ae+VcAj3UvCiK1ATQKJR/KefJHH/aKiQAu/qmH07EljIW86GptQXYyOKeaBJAK
 IwuYJgFprYzp48jue7/eCkvAJTArQMrFeTduPdDAecNVg6filelHjX3wi6k5GPsDH1CP
 qm/XNqrAz3frQIj2WhGf8HEeVXjmyT6QKcd2A5yAjplal2/7ronQBFbORXQSHT0XGRbm
 eMU2+ycYZty4khpBUI6TlDsT2kSvia/sZfCkvUL3+HEbPXMMxwpYNIMM/wW6YV4I5M5J
 sG5CWrvrjCAbQVyEz3vrh6w7R/Mms65VIyY1lVDZn44TgJ01VrGYIax/tx2xZswJNcj9
 VwDw==
X-Gm-Message-State: APjAAAWz9XVt4/WCSuwLSN5mZiIHRuOzgGgK/+NCJZHiLImshcKrb/3m
 1C3fWdCaRsBkqDvyuOtkMCbmS6GHzpDXFSIqYVs=
X-Google-Smtp-Source: APXvYqz5wHXB1nmfXhmlr/qLAPDW3G+ziIzScyrrHSPrhN9j+O+3LkVT/JnM12/t9lcaqiMe59v/oRgpIA9UeoUtEwI=
X-Received: by 2002:ac8:670c:: with SMTP id e12mr33620565qtp.169.1570510499983; 
 Mon, 07 Oct 2019 21:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191008044153.12734-1-andrew@aj.id.au>
In-Reply-To: <20191008044153.12734-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Oct 2019 04:54:47 +0000
Message-ID: <CACPK8XeKx_W0_b6ZLJzVdtQQOL8eZ3FcscB5TZT5NXMwRi4r6g@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: Fixes for AST2600 support
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, johnny_huang@aspeedtech.com,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Oct 2019 at 04:41, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This series resolves several issues found in testing by Johnny Huang from
> ASPEED, who also contributed the patches to fix them. We'll have more patches
> from him in the near future (which I'm pretty happy about).

For the series:

Reviewed-by: Joel Stanley <joel@jms.id.au>

These patches have been in the OpenBMC tree for a while and look good.

Cheers,

Joel

>
> The major issue resolved is the way I grouped the eMMC pins. What I had was
> ugly and I want to get rid of it before the binding is solidified with the 5.4
> release.
>
> The remaining fixes are minor issues that stem from lack of documentation or
> understanding on my part, and at least one brain-fart.
>
> Please review!
>
> Andrew
>
> Andrew Jeffery (4):
>   dt-bindings: pinctrl: aspeed-g6: Rework SD3 function and groups
>   pinctrl: aspeed-g6: Sort pins for sanity
>   pinctrl: aspeed-g6: Fix I2C14 SDA description
>   pinctrl: aspeed-g6: Make SIG_DESC_CLEAR() behave intuitively
>
> Johnny Huang (3):
>   pinctrl: aspeed-g6: Fix I3C3/I3C4 pinmux configuration
>   pinctrl: aspeed-g6: Fix UART13 group pinmux
>   pinctrl: aspeed-g6: Rename SD3 to EMMC and rework pin groups
>
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       |  86 ++++++------
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    | 124 ++++++++----------
>  drivers/pinctrl/aspeed/pinmux-aspeed.h        |   3 +-
>  3 files changed, 98 insertions(+), 115 deletions(-)
>
> --
> 2.20.1
>
