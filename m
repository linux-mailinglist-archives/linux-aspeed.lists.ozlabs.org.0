Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279984BD87E
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 10:24:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2H2237m5z3cBN
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 20:24:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TRVxoyTG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TRVxoyTG; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2H1y3j8Tz2yMx;
 Mon, 21 Feb 2022 20:24:36 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id n6so30499517qvk.13;
 Mon, 21 Feb 2022 01:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NfLzYG7x5hWrxzh3aPbQ9F5T1m6I+7za53WlrcA8RHg=;
 b=TRVxoyTG2DYkX1CqX/AOQCl8MjLoZXTSrvOrHA6WfxVVOX2y5CdFMbwaDVMW+LVeeb
 mObzVMrLCuE+wAiN8TIVOviFEz0Szf/Pguz4Mgc/3HSPwDX3BDZrevH3kahBMj6QrjXb
 ZoencRJpPY4e4K66dWYBXJKt6X3gNJvrLwC5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NfLzYG7x5hWrxzh3aPbQ9F5T1m6I+7za53WlrcA8RHg=;
 b=It311fX/xrFYQkAI7WeddWOYBEVAq6DImOXsVKCl1skqL7FlRQ3O4wkS7LTgrC1FMr
 DayYPh7SH/fgRrHDV1p/LoeRPvTGOD21e6NunwI8g8oLXEzaai9YOm+VdNES/DzqGFSF
 zpd7RtAw3K43JY/swhvs3UoBkM/SMrbueEcNvYvfWPzcoHwYC3fBOj2wOqKYVZW9bEnE
 6iErkTMxXH0NJJXSlmrSpfhvCQsEWiQOlhyMmdEw+vX0vM6DDDYTihjBikK9NmRxbUB7
 7WRo+cMw/R8yehlGb4n0jfuvibgD823MxbYAkFUANcglIpaVLVqiqap6blsQSL9SqxBg
 2AUQ==
X-Gm-Message-State: AOAM533UkUXH9zHYtFp1UaZkMJpQn34QZAaLDwYuWwbwoWhp8L6zMupD
 40h8uOkRQrUCdIPA1mp2pRri2qfQrffh+phbepc=
X-Google-Smtp-Source: ABdhPJy9KlKEyt6s72SDOXKeNCVDgTsHYzPzdxKYJL2f5Y/OKpVgI2rlT7MItO9kJmKriRxMRYZKSWvL/3gNIyoDRa8=
X-Received: by 2002:ad4:5ba2:0:b0:42d:64b8:52c3 with SMTP id
 2-20020ad45ba2000000b0042d64b852c3mr14533967qvq.21.1645435474500; Mon, 21 Feb
 2022 01:24:34 -0800 (PST)
MIME-Version: 1.0
References: <2c123f8b0a40dc1a061fae982169fe030b4f47e6.1641765339.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <2c123f8b0a40dc1a061fae982169fe030b4f47e6.1641765339.git.christophe.jaillet@wanadoo.fr>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Feb 2022 09:24:22 +0000
Message-ID: <CACPK8XfxZRXtU0Bn+f0=B3CGUE8A8i9Ob_a9=2t=TzLc5a+75w@mail.gmail.com>
Subject: Re: [PATCH v3] fsi: Aspeed: Fix a potential double free
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
 kernel-janitors@vger.kernel.org, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Alistar Popple <alistair@popple.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Thanks for the patch.

On Sun, 9 Jan 2022 at 21:56, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> A struct device can never be devm_alloc()'ed.
> Here, it is embedded in "struct fsi_master", and "struct fsi_master" is
> embedded in "struct fsi_master_aspeed".
>
> Since "struct device" is embedded, the data structure embedding it must be
> released with the release function, as is already done here.
>
> So use kzalloc() instead of devm_kzalloc() when allocating "aspeed" and
> update all error handling branches accordingly.

This looks like a problem with the design of the fsi master structure.
It's a common pattern to devm_alloc the platform devices as they are
probed, the fsi masters all embed a copy of struct fsi_master, which
as you say embeds struct device.

Can we learn from other bus drivers (eg i2c?) how we should lay out
these structures?




>
> This prevent a potential double free().
>
> This also fix another issue if opb_readl() fails. Instead of a direct
> return, it now jumps in the error handling path.
>
> Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: Keep the release function which is correct
>     s/devm_kzalloc()/kzalloc()/ instead
>
> v3: Update the error handling path to free "aspeed" [Guenter Roeck]
>     Fix another issue when opb_readl() fails [Guenter Roeck]
>
> I hope that fixing both issues in the same patch is ok. It makes no sense
> to me not to update the goto to the correct label if opb_readl() fails.
> ---
>  drivers/fsi/fsi-master-aspeed.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 8606e55c1721..0bed2fab8055 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -542,25 +542,28 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>                 return rc;
>         }
>
> -       aspeed = devm_kzalloc(&pdev->dev, sizeof(*aspeed), GFP_KERNEL);
> +       aspeed = kzalloc(sizeof(*aspeed), GFP_KERNEL);
>         if (!aspeed)
>                 return -ENOMEM;
>
>         aspeed->dev = &pdev->dev;
>
>         aspeed->base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(aspeed->base))
> -               return PTR_ERR(aspeed->base);
> +       if (IS_ERR(aspeed->base)) {
> +               rc = PTR_ERR(aspeed->base);
> +               goto err_free_aspeed;
> +       }
>
>         aspeed->clk = devm_clk_get(aspeed->dev, NULL);
>         if (IS_ERR(aspeed->clk)) {
>                 dev_err(aspeed->dev, "couldn't get clock\n");
> -               return PTR_ERR(aspeed->clk);
> +               rc = PTR_ERR(aspeed->clk);
> +               goto err_free_aspeed;
>         }
>         rc = clk_prepare_enable(aspeed->clk);
>         if (rc) {
>                 dev_err(aspeed->dev, "couldn't enable clock\n");
> -               return rc;
> +               goto err_free_aspeed;
>         }
>
>         rc = setup_cfam_reset(aspeed);
> @@ -595,7 +598,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>         rc = opb_readl(aspeed, ctrl_base + FSI_MVER, &raw);
>         if (rc) {
>                 dev_err(&pdev->dev, "failed to read hub version\n");
> -               return rc;
> +               goto err_release;
>         }
>
>         reg = be32_to_cpu(raw);
> @@ -634,6 +637,8 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>
>  err_release:
>         clk_disable_unprepare(aspeed->clk);
> +err_free_aspeed:
> +       kfree(aspeed);
>         return rc;
>  }
>
> --
> 2.32.0
>
