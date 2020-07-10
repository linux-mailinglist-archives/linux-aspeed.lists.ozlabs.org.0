Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9821AD3A
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 05:03:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2yY522GdzDrGp
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 13:03:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OXG6ZPCA; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2yXt00WHzDrDp
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2020 13:03:25 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id dp18so4405112ejc.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jul 2020 20:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6KRtR9SdpYUMidTMu6Xmuj8Q02i63whibThkqFtREHc=;
 b=OXG6ZPCAxCCAFxKGeTL6Oy1pdHDCjLE7HmgixA5c+sRgOyvyagscU036gw792Jyvro
 3ApdT4aFjcKGMIsGHK9bR2eNPTljVrUkQMhnn2ty4A2hcBYb5GlR7nQdsVN71AcTsm84
 dz/ySub8Vy57uB369VOkcXgz9JwwkjVndGkx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6KRtR9SdpYUMidTMu6Xmuj8Q02i63whibThkqFtREHc=;
 b=jld0eR6OEKc4ZZv2L5bxqm77utvjz64pDAXSMgRbXu8qlICDZeaOU0XTITDmWobYRl
 TL+/FL7jeu579hgKW2kIJsCGKQSFUtiIpcVVbAoOT0pyQOGZu2Qy9lmH3M97eNOpoTej
 Hu19DSEZ7cJiq82JSKurB614X8aHReiVK8/u/xiSiFNWv+fOaTHepQkLzuU/4XlLOT/D
 SmsEO2E1bzJJi16pqRk87KDkI0WM1lLj4Cv/87WMfbFFmdcTrnAng3BNre022vls3O3r
 sdWxlzF1io19yJphs3RQ2psksXbY1MA6SqHIz5bWOkCE+2LGuMouVqDxdPNcd7GbPo2t
 Txcg==
X-Gm-Message-State: AOAM530hrI698jRm87tB+y3lcb34ta1iI9ygtLb9E/dDD0eESCBfZTEb
 d8zV8+o0a05bEmMxoMH9IbtbzD64bouMSqJS24U=
X-Google-Smtp-Source: ABdhPJybxKH1f3z78Ubuw7bl1ZVf6foagkpmQuQSht982jLtNvxBTTVwTwgziMcBKS0m9Ulr5MgSCknrai84CeLlCCk=
X-Received: by 2002:a17:906:841:: with SMTP id
 f1mr25340332ejd.229.1594350200465; 
 Thu, 09 Jul 2020 20:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200709195706.12741-1-eajames@linux.ibm.com>
 <20200709195706.12741-2-eajames@linux.ibm.com>
In-Reply-To: <20200709195706.12741-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jul 2020 03:03:08 +0000
Message-ID: <CACPK8Xd1RMXooVR99xZLxWdgb+Suw8KZrSX6nN1Ua0eUM=mH3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: AST2600: Add mux for EMMC clock
To: Eddie James <eajames@linux.ibm.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-mmc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 9 Jul 2020 at 19:57, Eddie James <eajames@linux.ibm.com> wrote:
>
> The EMMC clock can be derived from either the HPLL or the MPLL. Register
> a clock mux so that the rate is calculated correctly based upon the
> parent.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>
Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")

Stephen, I think this should go to stable too.

Cheers,

Joel

> ---
>  drivers/clk/clk-ast2600.c | 49 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 41 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 99afc949925f..177368cac6dd 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -131,6 +131,18 @@ static const struct clk_div_table ast2600_eclk_div_table[] = {
>         { 0 }
>  };
>
> +static const struct clk_div_table ast2600_emmc_extclk_div_table[] = {
> +       { 0x0, 2 },
> +       { 0x1, 4 },
> +       { 0x2, 6 },
> +       { 0x3, 8 },
> +       { 0x4, 10 },
> +       { 0x5, 12 },
> +       { 0x6, 14 },
> +       { 0x7, 16 },
> +       { 0 }
> +};
> +
>  static const struct clk_div_table ast2600_mac_div_table[] = {
>         { 0x0, 4 },
>         { 0x1, 4 },
> @@ -390,6 +402,11 @@ static struct clk_hw *aspeed_g6_clk_hw_register_gate(struct device *dev,
>         return hw;
>  }
>
> +static const char *const emmc_extclk_parent_names[] = {
> +       "emmc_extclk_hpll_in",
> +       "mpll",
> +};
> +
>  static const char * const vclk_parent_names[] = {
>         "dpll",
>         "d1pll",
> @@ -459,16 +476,32 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_UARTX] = hw;
>
> -       /* EMMC ext clock divider */
> -       hw = clk_hw_register_gate(dev, "emmc_extclk_gate", "hpll", 0,
> -                       scu_g6_base + ASPEED_G6_CLK_SELECTION1, 15, 0,
> -                       &aspeed_g6_clk_lock);
> +       /* EMMC ext clock */
> +       hw = clk_hw_register_fixed_factor(dev, "emmc_extclk_hpll_in", "hpll",
> +                                         0, 1, 2);
>         if (IS_ERR(hw))
>                 return PTR_ERR(hw);
> -       hw = clk_hw_register_divider_table(dev, "emmc_extclk", "emmc_extclk_gate", 0,
> -                       scu_g6_base + ASPEED_G6_CLK_SELECTION1, 12, 3, 0,
> -                       ast2600_div_table,
> -                       &aspeed_g6_clk_lock);
> +
> +       hw = clk_hw_register_mux(dev, "emmc_extclk_mux",
> +                                emmc_extclk_parent_names,
> +                                ARRAY_SIZE(emmc_extclk_parent_names), 0,
> +                                scu_g6_base + ASPEED_G6_CLK_SELECTION1, 11, 1,
> +                                0, &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       hw = clk_hw_register_gate(dev, "emmc_extclk_gate", "emmc_extclk_mux",
> +                                 0, scu_g6_base + ASPEED_G6_CLK_SELECTION1,
> +                                 15, 0, &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       hw = clk_hw_register_divider_table(dev, "emmc_extclk",
> +                                          "emmc_extclk_gate", 0,
> +                                          scu_g6_base +
> +                                               ASPEED_G6_CLK_SELECTION1, 12,
> +                                          3, 0, ast2600_emmc_extclk_div_table,
> +                                          &aspeed_g6_clk_lock);
>         if (IS_ERR(hw))
>                 return PTR_ERR(hw);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_EMMC] = hw;
> --
> 2.24.0
>
