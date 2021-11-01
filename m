Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C58BC44240B
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 00:33:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hjq9350Ldz2y7M
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 10:33:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lNS0lW0B;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lNS0lW0B; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hjq8z0z4Xz2xB1
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 10:33:23 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id h4so16818173qth.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Nov 2021 16:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QjgwzgqwbzNK9oqZJgz4ZvJB5kDRKduRYLNHBkFbBKo=;
 b=lNS0lW0Bf3LqiISo6ssIQiWgPZf7bKwxkn3ypLuarmolLkV7h0JTX8fxQ15zZKQNK9
 ig2f3An/FuWvcM/Uu2F6ibnE4irSOI3KsOo4S66A6wbgMDgQz4sHkRLGoS33vyAb3bI2
 jHGcLz3yhD9xyou5z5lLd/nc6nh0RibNXhy1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QjgwzgqwbzNK9oqZJgz4ZvJB5kDRKduRYLNHBkFbBKo=;
 b=xJPfv3ve+epSFUzIdq2cGBByjU47V/MNz1ipjH8VFE0jG4a8h6Wyob36NW6DP1v49B
 li43/FWFg5MwUF3Uu409AiqrFw609K6mD4ceFqG+u7G4qqT3yKQd6dWmtSucK/+zEUMH
 O4F2OEhExe2l054e1INcgohF1WDe+l6dAYyjxj1DXawK0dQRCf2cmhFYs2ez57SIdQDG
 Fn8PaR7ZPNhBSLjnYYH55/i5ZdnB/SNlv1VeTEdI39p/mFwvNumH0fMuMbwu7/OpkmPy
 6an87h/BomHGLaSjGusRz64jOtaDTXWUQMnUCNW7o4FlOWRDJYfetDdAIWu42XxQ2nZU
 EwtA==
X-Gm-Message-State: AOAM532vKyU3ock393P3MdwdMoUvxDcXCQS6GFm5BcNHhU0nfwHHpkDp
 ktoZvIgKF6h+xH6Wg1SUNTfou3ZjU6DkGGYq0ys=
X-Google-Smtp-Source: ABdhPJychv7F4FV4O5kk7VzRh9L9Ls0Typ4y+FpsD/Tr4jzGYwH3BzgraY2LvoFZRqz6d9h/RUeOBScQu+l3HvFt1Lg=
X-Received: by 2002:ac8:5cd5:: with SMTP id s21mr9578033qta.392.1635809599964; 
 Mon, 01 Nov 2021 16:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-5-jae.hyun.yoo@intel.com>
In-Reply-To: <20211101233751.49222-5-jae.hyun.yoo@intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Nov 2021 23:33:08 +0000
Message-ID: <CACPK8Xc-NVyZ31+_L8oL3aaGHX9TLRxJy9666570ZOuirUYw_w@mail.gmail.com>
Subject: Re: [PATCH -next 4/4] ipmi: kcs_bmc_aspeed: add clock control logic
To: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh+dt@kernel.org>, Cedric Le Goater <clg@kaod.org>,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 1 Nov 2021 at 23:18, <jae.hyun.yoo@intel.com> wrote:
>
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>
> If LPC KCS driver is registered ahead of lpc-ctrl module, LPC
> KCS block will be enabled without heart beating of LCLK until
> lpc-ctrl enables the LCLK. This issue causes improper handling on
> host interrupts when the host sends interrupts in that time frame.
> Then kernel eventually forcibly disables the interrupt with
> dumping stack and printing a 'nobody cared this irq' message out.
>
> To prevent this issue, all LPC sub drivers should enable LCLK
> individually so this patch adds clock control logic into the LPC
> KCS driver.
>
> Fixes: be2ed207e374 ("ipmi: add an Aspeed KCS IPMI BMC driver")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 31 ++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 92a37b33494c..00706472cc4d 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -6,6 +6,7 @@
>  #define pr_fmt(fmt) "aspeed-kcs-bmc: " fmt
>
>  #include <linux/atomic.h>
> +#include <linux/clk.h>
>  #include <linux/errno.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -126,6 +127,8 @@ struct aspeed_kcs_bmc {
>                 bool remove;
>                 struct timer_list timer;
>         } obe;
> +
> +       struct clk *clk;
>  };
>
>  struct aspeed_kcs_of_ops {
> @@ -620,24 +623,37 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> +       priv->clk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(priv->clk)) {
> +               rc = PTR_ERR(priv->clk);
> +               if (rc != -EPROBE_DEFER)
> +                       dev_err(&pdev->dev, "Couldn't get clock\n");
> +               return rc;
> +       }
> +       rc = clk_prepare_enable(priv->clk);
> +       if (rc) {
> +               dev_err(&pdev->dev, "Couldn't enable clock\n");
> +               return rc;
> +       }
> +
>         spin_lock_init(&priv->obe.lock);
>         priv->obe.remove = false;
>         timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
>
>         rc = aspeed_kcs_set_address(kcs_bmc, addrs, nr_addrs);
>         if (rc)
> -               return rc;
> +               goto err;
>
>         /* Host to BMC IRQ */
>         rc = aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
>         if (rc)
> -               return rc;
> +               goto err;
>
>         /* BMC to Host IRQ */
>         if (have_upstream_irq) {
>                 rc = aspeed_kcs_config_upstream_irq(priv, upstream_irq[0], upstream_irq[1]);
>                 if (rc < 0)
> -                       return rc;
> +                       goto err;
>         } else {
>                 priv->upstream_irq.mode = aspeed_kcs_irq_none;
>         }
> @@ -650,13 +666,19 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>         rc = kcs_bmc_add_device(&priv->kcs_bmc);
>         if (rc) {
>                 dev_warn(&pdev->dev, "Failed to register channel %d: %d\n", kcs_bmc->channel, rc);
> -               return rc;
> +               goto err;
>         }
>
>         dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n",
>                         kcs_bmc->channel, addrs[0]);
>
>         return 0;
> +
> +err:
> +       aspeed_kcs_enable_channel(kcs_bmc, false);
> +       clk_disable_unprepare(priv->clk);
> +
> +       return rc;
>  }
>
>  static int aspeed_kcs_remove(struct platform_device *pdev)
> @@ -664,6 +686,7 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
>         struct aspeed_kcs_bmc *priv = platform_get_drvdata(pdev);
>         struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
>
> +       clk_disable_unprepare(priv->clk);
>         kcs_bmc_remove_device(kcs_bmc);
>
>         aspeed_kcs_enable_channel(kcs_bmc, false);
> --
> 2.25.1
>
