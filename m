Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D4BCFA1F
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 14:40:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ncPq4GwpzDqNn
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 23:40:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="fydorapL"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ncPd5CSrzDqJ5
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 23:40:05 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id u40so24984404qth.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Oct 2019 05:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0jJTLY2axsts6GZT3PA6D788BPaMX3GUaWV0Vzd1RXM=;
 b=fydorapLglYueHDm9H8p4AT688wrHVmN/5BLYTckwzJV/hAERlr6H3K4qoiKBtFGyo
 Qqsz931IkrwgOJzNNIHLJ4B3AVscmOsqqQrfmBYgtSP2tKBChMznGpsmEugFmEbcT5KX
 SkpxY/1+OmNS7lpVyQHn1fjYhxCoKBBR8JLvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0jJTLY2axsts6GZT3PA6D788BPaMX3GUaWV0Vzd1RXM=;
 b=OM2mOj2QAHUvwi75PxQh3lRZlYOq4YBpq9cL2wxCAnx08KT+LC2FZf45PNxmRdoNes
 xNYwImUEDfYR8L/6roejUXMVO5Hk6207aTi36JoQ1L5ZlbbVfa5htzSY8NPbnb6X5V1S
 87YzrqjRFho4YISN5p4Z3yW/KhnUie1oeXmX4O4oID/Bd98k0CNtqBf/T82xG1qbYvwn
 d/x/Y/Osy8XA09co0hkLZjBfPyTm5F6f11la5sL1oxYFEJI5f6ci+jcBMlFcnjCsdfM8
 ybir8fD0JJNQWHBu4dYmQLIzmkTB3j+8QAWxvDK0wgQC3OuDhuywnVYQENLpibk/cLLq
 8a3A==
X-Gm-Message-State: APjAAAUM/l4A20pAhq0DBySzwAGUXumlnPWiIClDEwkZY5JjECwKnm5z
 cXOD1H5H6YnX3qyryaWWmwx/XR0r6zBZwRuItH4=
X-Google-Smtp-Source: APXvYqyIRMp1F0ik7vkJep0KVirm5HNPl0oLZUOXJNQc+afvhAryjXpJ1n7wrnxW5Q1z+DRlElhn/MKulVSC3i9vSX0=
X-Received: by 2002:ac8:2e94:: with SMTP id h20mr36037220qta.234.1570538400593; 
 Tue, 08 Oct 2019 05:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191008113553.13662-1-andrew@aj.id.au>
 <20191008113553.13662-3-andrew@aj.id.au>
In-Reply-To: <20191008113553.13662-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Oct 2019 12:39:49 +0000
Message-ID: <CACPK8XfSrKym55eQ91Lhf3wXtzCD5AH7P8t19jow2K-5JRb0ZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: ast2600: Add RMII RCLK gates for all four MACs
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
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Oct 2019 at 11:35, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> RCLK is a fixed 50MHz clock derived from HPLL/HCLK that is described by a
> single gate for each MAC.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

We could have mac12rclk and mac34rclk described in the device tree, as
was mentioned in previous reviews of the aspeed driver, but I think we
can defer that
rework until we rework the rest of the driver. Importantly, that won't
change the MAC bindings or the code that the drivers need to use.

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  drivers/clk/clk-ast2600.c | 47 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 1c1bb39bb04e..3d6fc781fee0 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -15,7 +15,7 @@
>
>  #include "clk-aspeed.h"
>
> -#define ASPEED_G6_NUM_CLKS             67
> +#define ASPEED_G6_NUM_CLKS             71
>
>  #define ASPEED_G6_SILICON_REV          0x004
>
> @@ -40,6 +40,9 @@
>
>  #define ASPEED_G6_STRAP1               0x500
>
> +#define ASPEED_MAC12_CLK_DLY           0x340
> +#define ASPEED_MAC34_CLK_DLY           0x350
> +
>  /* Globally visible clocks */
>  static DEFINE_SPINLOCK(aspeed_g6_clk_lock);
>
> @@ -485,6 +488,11 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_SDIO] = hw;
>
> +       /* MAC1/2 RMII 50MHz RCLK */
> +       hw = clk_hw_register_fixed_rate(dev, "mac12rclk", "hpll", 0, 50000000);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
>         /* MAC1/2 AHB bus clock divider */
>         hw = clk_hw_register_divider_table(dev, "mac12", "hpll", 0,
>                         scu_g6_base + ASPEED_G6_CLK_SELECTION1, 16, 3, 0,
> @@ -494,6 +502,27 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_MAC12] = hw;
>
> +       /* RMII1 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "mac1rclk-gate", "mac12rclk", 0,
> +                       scu_g6_base + ASPEED_MAC12_CLK_DLY, 29, 0,
> +                       &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC1RCLK] = hw;
> +
> +       /* RMII2 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "mac2rclk-gate", "mac12rclk", 0,
> +                       scu_g6_base + ASPEED_MAC12_CLK_DLY, 30, 0,
> +                       &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC2RCLK] = hw;
> +
> +       /* MAC1/2 RMII 50MHz RCLK */
> +       hw = clk_hw_register_fixed_rate(dev, "mac34rclk", "hclk", 0, 50000000);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
>         /* MAC3/4 AHB bus clock divider */
>         hw = clk_hw_register_divider_table(dev, "mac34", "hpll", 0,
>                         scu_g6_base + 0x310, 24, 3, 0,
> @@ -503,6 +532,22 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_MAC34] = hw;
>
> +       /* RMII3 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "mac3rclk-gate", "mac34rclk", 0,
> +                       scu_g6_base + ASPEED_MAC34_CLK_DLY, 29, 0,
> +                       &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC3RCLK] = hw;
> +
> +       /* RMII4 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "mac4rclk-gate", "mac34rclk", 0,
> +                       scu_g6_base + ASPEED_MAC34_CLK_DLY, 30, 0,
> +                       &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC4RCLK] = hw;
> +
>         /* LPC Host (LHCLK) clock divider */
>         hw = clk_hw_register_divider_table(dev, "lhclk", "hpll", 0,
>                         scu_g6_base + ASPEED_G6_CLK_SELECTION1, 20, 3, 0,
> --
> 2.20.1
>
