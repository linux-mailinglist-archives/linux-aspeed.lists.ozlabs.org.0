Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 945D7EBCE9
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Nov 2019 05:51:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4748sT0PTQzF6WX
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Nov 2019 15:51:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ihRZ8UOW"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4748sF12C1zF6W6
 for <linux-aspeed@lists.ozlabs.org>; Fri,  1 Nov 2019 15:50:56 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id t26so11548985qtr.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Oct 2019 21:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yA9zmwK+y0+vYb9mhZkiWIdcsL4UA+4k04MjQIXnKfI=;
 b=ihRZ8UOWwqbfVpNv19Ub5/RXorNawHtfnVMhoUjPKbrcr0JblVBgy0itL9CzHUnQgk
 ru4WPZs8/9O0HHeAOCJbw88ElH5RLVqFDb4qfGlBO6aaSqpB8t0L7H2o3kQT/LaEgTdV
 +GuF3oVnw7kqIAaAa8kJzGRCaV60znAMMGaLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yA9zmwK+y0+vYb9mhZkiWIdcsL4UA+4k04MjQIXnKfI=;
 b=Sc6bZ+urHUl7JVLc+69CZC1PLywgboWD141WGovIaWxdT4xx/2R+erv5WPos7NngAe
 10/iRPk2A8Zg14++PI+6egYnro5jjMdhuDcTkt9EkMKzIrzIuyTwtoc6SgvcO7ZR/G5S
 0t4T6x9ssUbD+Yigq7qgn/0PmlgN8Djwkcz+H4uQQ/htqmDG/fKAnXt/8MS4JgflMSf9
 VlrrkOS+l7ujwytcC+/RpLJH4XQNgEXkL3IliG5oxW0vbklbJel9QAUne42skAbrbaEa
 IlO70Nf6WXIFzng3+OD95ndtuRZNRvocB7avxNHbqVAc4IlDxixQpD8sGDBG1EfXAX+5
 t7Fw==
X-Gm-Message-State: APjAAAUvPXbaV6y2P8H7MgaWyoEFi/pi/rF+3hQ10YNb+LJ9Xwh4FLQX
 G+gon7w7+xXvjZ57lvewyO68QkQc/O7c1YmVa2k=
X-Google-Smtp-Source: APXvYqz7qXvpd39WjR1smej7kH/DFLwcwnDkz0IJAQhEJT1fnwfpJP75htsUCUl08Y8XeO+iMg5OtJcPeapplKUfTrE=
X-Received: by 2002:ad4:5446:: with SMTP id h6mr8216660qvt.20.1572583854007;
 Thu, 31 Oct 2019 21:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191010020725.3990-1-andrew@aj.id.au>
 <20191010020725.3990-2-andrew@aj.id.au>
In-Reply-To: <20191010020725.3990-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 1 Nov 2019 04:50:42 +0000
Message-ID: <CACPK8XcGgGsoLNpCccKPb-5bojQS4c5BePewwocc-z29On7Rjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate
 definitions
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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
 devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi clock maintainers,

On Thu, 10 Oct 2019 at 02:06, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2600 has an explicit gate for the RMII RCLK for each of the four
> MACs.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I needed this patch and the aspeed-clock.h one for the aspeed dts
tree, so I've put them in a branch called "aspeed-clk-for-v5.5" and
merged that into the aspeed tree. Could you merge that into the clock
tree when you get to merging these ones?

https://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git/log/?h=aspeed-clk-for-v5.5

Cheers,

Joel

> ---
>  include/dt-bindings/clock/ast2600-clock.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index 38074a5f7296..62b9520a00fd 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -83,6 +83,10 @@
>  #define ASPEED_CLK_MAC12               64
>  #define ASPEED_CLK_MAC34               65
>  #define ASPEED_CLK_USBPHY_40M          66
> +#define ASPEED_CLK_MAC1RCLK            67
> +#define ASPEED_CLK_MAC2RCLK            68
> +#define ASPEED_CLK_MAC3RCLK            69
> +#define ASPEED_CLK_MAC4RCLK            70
>
>  /* Only list resets here that are not part of a gate */
>  #define ASPEED_RESET_ADC               55
> --
> 2.20.1
>
