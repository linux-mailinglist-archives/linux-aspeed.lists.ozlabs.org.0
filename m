Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E10A2D20B5
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 03:19:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqkQc1sCnzDqfH
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 13:19:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=T3DbAd5x; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqkQR68sNzDqZb
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 13:19:27 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id l7so11019685qtp.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Dec 2020 18:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fO52pUkJlN6AoDogKEqqkgiecTp8LWVBd7vtkWUxWdI=;
 b=T3DbAd5xf2dIMA5cx/Wu1DAv0tqoL52nTodBmCjcVt75jGw5iksNr8SnDxuN4zOlgO
 lARgX79dbdt60OW2B7uT5rKFN75geTkZgLBG+/SC20vV93ygG7u3m2tkCfarGn/wMmSw
 3iOYHKs5KDKMeTIT5fup/GQpu2KRjBeb6sy0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fO52pUkJlN6AoDogKEqqkgiecTp8LWVBd7vtkWUxWdI=;
 b=EotQLiqem17gIK9WxAqU9MoY9mUmE24UfREG/PdAjG8Dcj7BQnpuZYM4zixfzH3XSs
 QrAtYh6teQIVlupuH9NiRlrehF1+eW4Iz8xPOikrJhMSCsoTdccCq94gI5aOkkIE8O9k
 IGKeNdQeucfNn+usz7HdqostR89WearGrd/koFLitdpdldzKmY0Muj//3qiUlbu0XORT
 fHa1YzMkLqS4pH+ayP5vq3fcQNVnNivlbER42ODW0bzUIrsf/sNeCvsDjHx68gFeDT2b
 aN6dCNNioygXPYL6ij8xkTz7d31mFj3wx85RiHKsY2GxWJNJoXFilgDcpqnlk9Fx+5hI
 jjbQ==
X-Gm-Message-State: AOAM530XypW86it8RXqw/4TL5oOymB3EGzUTaU3kOEkp11RUnghDiUV3
 wNAFB1yNXl6jrEeltB9eY0FgVUo4JZSO+dr7XrE=
X-Google-Smtp-Source: ABdhPJzjrpkK3MTHJW6l1VEnz+NDNE3QBwSZFU0/8Mp8PzXMDzGOcpDwOk7TernzHHzMQtSp2LSKAeG/26XRZzJIsLc=
X-Received: by 2002:aed:2f64:: with SMTP id l91mr27646487qtd.363.1607393963552; 
 Mon, 07 Dec 2020 18:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20201202051634.490-1-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20201202051634.490-1-wangzhiqiang.bj@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Dec 2020 02:19:10 +0000
Message-ID: <CACPK8Xf317mv_q96b7L2ohswkoiRrGDMdqs_zSCyBux99XjHEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] misc: Add clock control logic into Aspeed LPC SNOOP
 driver
To: John Wang <wangzhiqiang.bj@bytedance.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, Vernon Mauery <vernon.mauery@linux.intel.com>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>, xuxiaohan@bytedance.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Dec 2020 at 05:16, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
>
> From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
>
> If LPC SNOOP driver is registered ahead of lpc-ctrl module, LPC
> SNOOP block will be enabled without heart beating of LCLK until
> lpc-ctrl enables the LCLK. This issue causes improper handling on
> host interrupts when the host sends interrupt in that time frame.
> Then kernel eventually forcibly disables the interrupt with
> dumping stack and printing a 'nobody cared this irq' message out.
>
> To prevent this issue, all LPC sub-nodes should enable LCLK
> individually so this patch adds clock control logic into the LPC
> SNOOP driver.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks for sending these John. It is an excellent idea to upstream
fixes that have been developed.

I assume we will have the same issue for all devices that use the LPC
bus? eg. vuart, bt, kcs, lpc2ahb? It looks like only the lpc-ctrl
(lpc2ahb) does this so far:

git grep -l clk drivers/soc/aspeed/aspeed-p2a-ctrl.c
drivers/soc/aspeed/aspeed-lpc-ctrl.c
drivers/char/ipmi/kcs_bmc_aspeed.c drivers/char/ipmi/bt-bmc.c
drivers/soc/aspeed/aspeed-lpc-ctrl.c




> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 30 ++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 682ba0eb4eba..20acac6342ef 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -11,6 +11,7 @@
>   */
>
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/interrupt.h>
>  #include <linux/fs.h>
>  #include <linux/kfifo.h>
> @@ -67,6 +68,7 @@ struct aspeed_lpc_snoop_channel {
>  struct aspeed_lpc_snoop {
>         struct regmap           *regmap;
>         int                     irq;
> +       struct clk              *clk;
>         struct aspeed_lpc_snoop_channel chan[NUM_SNOOP_CHANNELS];
>  };
>
> @@ -282,22 +284,42 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> +       lpc_snoop->clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(lpc_snoop->clk)) {
> +               rc = PTR_ERR(lpc_snoop->clk);
> +               if (rc != -EPROBE_DEFER)
> +                       dev_err(dev, "couldn't get clock\n");
> +               return rc;
> +       }
> +       rc = clk_prepare_enable(lpc_snoop->clk);
> +       if (rc) {
> +               dev_err(dev, "couldn't enable clock\n");
> +               return rc;
> +       }
> +
>         rc = aspeed_lpc_snoop_config_irq(lpc_snoop, pdev);
>         if (rc)
> -               return rc;
> +               goto err;
>
>         rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 0, port);
>         if (rc)
> -               return rc;
> +               goto err;
>
>         /* Configuration of 2nd snoop channel port is optional */
>         if (of_property_read_u32_index(dev->of_node, "snoop-ports",
>                                        1, &port) == 0) {
>                 rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 1, port);
> -               if (rc)
> +               if (rc) {
>                         aspeed_lpc_disable_snoop(lpc_snoop, 0);
> +                       goto err;
> +               }
>         }
>
> +       return 0;
> +
> +err:
> +       clk_disable_unprepare(lpc_snoop->clk);
> +
>         return rc;
>  }
>
> @@ -309,6 +331,8 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
>         aspeed_lpc_disable_snoop(lpc_snoop, 0);
>         aspeed_lpc_disable_snoop(lpc_snoop, 1);
>
> +       clk_disable_unprepare(lpc_snoop->clk);
> +
>         return 0;
>  }
>
> --
> 2.25.1
>
