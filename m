Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2646D3F6C73
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Aug 2021 02:08:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvRC60jpnz2yKS
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Aug 2021 10:08:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=F9nMiLn+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=F9nMiLn+; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvRBy4zrFz2xlF
 for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Aug 2021 10:08:09 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id l4so180031qvl.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Aug 2021 17:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dy34Bpa772Ms7Y11k1wGoCbDLkxQgvtHnyVRMjlZLu0=;
 b=F9nMiLn+D95+1WKb6lhWm0igc6Zfw+sTemFxdOegTj+5pfHi2BBs44IaADiOUSx0kR
 tD2Rjur+7CPNp2fLUaASMt/FMEBjO8y2MghMjX3NfzvTSWaSFuS5QDJr/X641j+Oi6NY
 VeVn3md9ggxz4Cx79j8u2Hi+IS6gTsTAva8b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dy34Bpa772Ms7Y11k1wGoCbDLkxQgvtHnyVRMjlZLu0=;
 b=EblxzsM9pi46agt7suwotlkowIgBk293AHmomqKbdnyHfjpMd/gSYCmPYu79uyEVG5
 76qW4OBje8dx5atLYeuXjfxsBK3pP+mmi7U68Am2Y0K7l0qtQhjRlCRNrPzQBl5UcaxP
 9+sdVZFNjAkoL++5IUK60IQcx2cZ07tueeMMfgmdnR9P37HUDRWjVxtiIfMAxg/qaHRA
 XQ3WqksNMa1wvIE+Wn9KVDt3qrDUukrtLk1ewGS+/MXrEfiiy3rE6RXAIIqILTrcBxJs
 ocQyYbvmNFVCpdniNLRN19dxBmYNO4xsIM6pXkiO9eeiuCotR1V65XWC0bGIBQJyHlTA
 ivGA==
X-Gm-Message-State: AOAM53248dtGiQSXLVffYRGy6na1VhmQGkRyCcjAmmN//aCSsbjBCL4z
 PRxjSJN+T4DzcjtSAg3xXAKU8+Z0okZLqNDv+Sw=
X-Google-Smtp-Source: ABdhPJy1iZ2N3owLASCJrIAxdQb/2bP1MaYxdzyrij7SGAad/j1NBfSzGRrl87bSWJKdaT+YdBjPc4fuPaGDOGwhd7U=
X-Received: by 2002:ad4:5bc8:: with SMTP id t8mr41409487qvt.18.1629850087535; 
 Tue, 24 Aug 2021 17:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210824085522.1849410-1-yangyingliang@huawei.com>
In-Reply-To: <20210824085522.1849410-1-yangyingliang@huawei.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 Aug 2021 00:07:55 +0000
Message-ID: <CACPK8Xc9kfB1wYPOsitP1PAoF9dZtB-N1c=XTaaS2zPNONnv5w@mail.gmail.com>
Subject: Re: [PATCH -next v2] soc: aspeed-lpc-ctrl: Fix missing
 clk_disable_unprepare() on error in aspeed_lpc_ctrl_probe()
To: Yang Yingliang <yangyingliang@huawei.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 24 Aug 2021 at 08:49, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> Move syscon_regmap_lookup_by_compatible() above the
> devm_clk_get() to avoid missing clk_disable_unprepare().
>
> Fixes: 2f9b25fa6682 ("soc: aspeed: Re-enable FWH2AHB on AST2600")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks for the patch. I will send it to the soc maintainers for merging.

> ---
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> index 6893c5ec3259..72771e018c42 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> @@ -295,6 +295,16 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> +       if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl")) {
> +               lpc_ctrl->fwh2ahb = true;
> +
> +               lpc_ctrl->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2600-scu");
> +               if (IS_ERR(lpc_ctrl->scu)) {
> +                       dev_err(dev, "couldn't find scu\n");
> +                       return PTR_ERR(lpc_ctrl->scu);
> +               }
> +       }
> +
>         lpc_ctrl->clk = devm_clk_get(dev, NULL);
>         if (IS_ERR(lpc_ctrl->clk)) {
>                 dev_err(dev, "couldn't get clock\n");
> @@ -306,16 +316,6 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
>                 return rc;
>         }
>
> -       if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl")) {
> -               lpc_ctrl->fwh2ahb = true;
> -
> -               lpc_ctrl->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2600-scu");
> -               if (IS_ERR(lpc_ctrl->scu)) {
> -                       dev_err(dev, "couldn't find scu\n");
> -                       return PTR_ERR(lpc_ctrl->scu);
> -               }
> -       }
> -
>         lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
>         lpc_ctrl->miscdev.name = DEVICE_NAME;
>         lpc_ctrl->miscdev.fops = &aspeed_lpc_ctrl_fops;
> --
> 2.25.1
>
