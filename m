Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9B7442405
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 00:32:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hjq8K6FcYz2yHJ
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 10:32:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Jp0dzjCc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Jp0dzjCc; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hjq8D70p3z2x9g
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 10:32:42 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id bm28so3022450qkb.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Nov 2021 16:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+2AekMdRuUmfOF7hhTuIxKtH3t+eGKh3B1xilMoKACM=;
 b=Jp0dzjCcHMjdLxHSiQYMeJjotS4CWEV+xV5wUqv2FCfd8S6n8/a+8yzv9m94JTRNtk
 XhrGnn0FwdRRmoOKp0+beuC4ACgLpZAxXDqsB+6KbmXx1ub0GP8i35r0Yt5p0J+eQY4c
 L56WI5Gn1IT7cwDkHiTeUWV7sNJ99pWs2nTtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+2AekMdRuUmfOF7hhTuIxKtH3t+eGKh3B1xilMoKACM=;
 b=PmT/HtrWkqmu0igyogwTNPc+YHgLlR+Gl2ikjEjRNpTHuJ92sx1EtjMmcL/ooDSKRP
 rQNEACB1ShpPMyPBAKAVxrAa67udFv7ZcYFRDc9935kqJtvJKGp9ecnbygQEY4d3dZpF
 yiQbeBpIs7rz9IeO1EbPdELTviS6vYyDu5MjM5if4L9GsYMODQpONMAaUtcKHyUxENW2
 SQ7ttMODItPN3cRo1++zQbZJLh9b5qSbxj/4Ry+3mBXuxtKj0pdwF4E/Uu7uJzZSpsS5
 jUoLzO5SDw/VGcDD1wdVLsfuOTJNmueHFvR+wadgrR9waGkPjIM3l/paJLTETEpPeo6m
 aTCg==
X-Gm-Message-State: AOAM531WHONgd0Ake2V34dygLyQl1kkkv8NpxbRAeySXuXZA4253I0OY
 8vrTQSP3mpYOVQJir+XZ1vPPUOo7w0LzWVMIP6I=
X-Google-Smtp-Source: ABdhPJwl3foI/6kisHiZGLKmg+JxVJubW0Q7Ez6VewrfNRBphIvGg4bOcd8M2Wj3eAHSQO3KK1ed65VJIOIQSICSmMc=
X-Received: by 2002:a05:620a:4588:: with SMTP id
 bp8mr18490618qkb.292.1635809558119; 
 Mon, 01 Nov 2021 16:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-3-jae.hyun.yoo@intel.com>
In-Reply-To: <20211101233751.49222-3-jae.hyun.yoo@intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Nov 2021 23:32:25 +0000
Message-ID: <CACPK8XeF2UZDmhXE69pgXXRzJW6Ni=86O=QRNCo2Y1+wyf0YwQ@mail.gmail.com>
Subject: Re: [PATCH -next 2/4] ipmi: bt: add clock control logic
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
> If LPC BT driver is registered ahead of lpc-ctrl module, LPC BT
> hardware block will be enabled without heart beating of LCLK until
> lpc-ctrl enables the LCLK. This issue causes improper handling on
> host interrupts when the host sends interrupts in that time frame.
> Then kernel eventually forcibly disables the interrupt with
> dumping stack and printing a 'nobody cared this irq' message out.
>
> To prevent this issue, all LPC sub drivers should enable LCLK
> individually so this patch adds clock control logic into the LPC
> BT driver.
>
> Fixes: 54f9c4d0778b ("ipmi: add an Aspeed BT IPMI BMC driver")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/char/ipmi/bt-bmc.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index 7450904e330a..a20f92cc7b18 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -5,6 +5,7 @@
>
>  #include <linux/atomic.h>
>  #include <linux/bt-bmc.h>
> +#include <linux/clk.h>
>  #include <linux/errno.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -62,6 +63,7 @@ struct bt_bmc {
>         wait_queue_head_t       queue;
>         struct timer_list       poll_timer;
>         struct mutex            mutex;
> +       struct clk              *clk;
>  };
>
>  static atomic_t open_count = ATOMIC_INIT(0);
> @@ -423,6 +425,19 @@ static int bt_bmc_probe(struct platform_device *pdev)
>         if (IS_ERR(bt_bmc->base))
>                 return PTR_ERR(bt_bmc->base);
>
> +       bt_bmc->clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(bt_bmc->clk)) {
> +               rc = PTR_ERR(bt_bmc->clk);
> +               if (rc != -EPROBE_DEFER)
> +                       dev_err(dev, "Unable to get clock\n");
> +               return rc;
> +       }
> +       rc = clk_prepare_enable(bt_bmc->clk);
> +       if (rc) {
> +               dev_err(dev, "Unable to enable clock\n");
> +               return rc;
> +       }
> +
>         mutex_init(&bt_bmc->mutex);
>         init_waitqueue_head(&bt_bmc->queue);
>
> @@ -433,7 +448,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
>         rc = misc_register(&bt_bmc->miscdev);
>         if (rc) {
>                 dev_err(dev, "Unable to register misc device\n");
> -               return rc;
> +               goto err;
>         }
>
>         bt_bmc_config_irq(bt_bmc, pdev);
> @@ -457,6 +472,11 @@ static int bt_bmc_probe(struct platform_device *pdev)
>         clr_b_busy(bt_bmc);
>
>         return 0;
> +
> +err:
> +       clk_disable_unprepare(bt_bmc->clk);
> +
> +       return rc;
>  }
>
>  static int bt_bmc_remove(struct platform_device *pdev)
> @@ -466,6 +486,8 @@ static int bt_bmc_remove(struct platform_device *pdev)
>         misc_deregister(&bt_bmc->miscdev);
>         if (bt_bmc->irq < 0)
>                 del_timer_sync(&bt_bmc->poll_timer);
> +       clk_disable_unprepare(bt_bmc->clk);
> +
>         return 0;
>  }
>
> --
> 2.25.1
>
