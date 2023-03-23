Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC546C67C3
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 13:13:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj44j4TK4z3cf8
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 23:13:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LXcwVizv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LXcwVizv;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj44c6vXcz3cfg
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Mar 2023 23:13:36 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id e65so24480483ybh.10
        for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Mar 2023 05:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679573612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DrtQ8CwDcwRA/DKiIVaGSBD/b1SSGaInqX/K7jpVRKA=;
        b=LXcwVizvFL7SjKCXKuCoQfWAYpHOQFMIsfvaBv9J6ZIhI6mlTEb/OoL/PGa2EYhDKy
         aQNsr29CKBreYNUaDvAFNZYVQ83GbRN6+wEcg1BKTCsqEoS/1dZnpd/FxTAtaw3BK4np
         4DXFFWefgVSPCWNzoguFllSpnuEEIA6kZ9WA7WFS602rAyB2UX8afTfhNXRd7SM6+Vat
         AC8vmciKYPSiQF5/PEGpA4+iRnjwHaRE2jhB9ZmD8pMwnJhXaPqu4/lz8sQaJVhujOXp
         rvoxT99I4g/pi0v5T8Djhfz9aSpX06eQNrsM42xMbbPr4pFvchLC7xsajuWVyc19ilWz
         aQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrtQ8CwDcwRA/DKiIVaGSBD/b1SSGaInqX/K7jpVRKA=;
        b=WjbvDU3ZxB7KwrYhVX9YDHZDz2bpEOrVBp4Jghy9fEmSb6lFBS4XgKazwJbgGc26AA
         jt73FWlmYlm+8dY+0uNR8dZDTMIk3HP7ZlX5qUiONMuGqceTcsN7kAuUTdByVJJLsgA+
         8u5F05XeNqb4WovUC+ZMXQ7MZfdGim1Z5Abbeuu8g1fNF0M5CM/S9aLl8d4Ak9e2SFky
         QY5yPI7L6x/QFziQy0D3GQrQRJoFms/NjzhtIPgS11rQPJNVeVG8l723CjKINMUdLv2h
         jOcFUL3R1NnZrkZ2AUmg1FYOk0lY9v8jVCLe83ibY0husBEgOxPuOg/ymrNLzNPToir+
         BdFA==
X-Gm-Message-State: AAQBX9ee5r/BgzHPL6+MsNNRLVQRoGkz8wAqxCX4hY9eLqmtGOgWmpv7
	krJLVVhTxa5JKrL5KgPt1VMz1geTecCWR5q790jlhg==
X-Google-Smtp-Source: AKy350Y6PAngVYMC5aIvNHmGoOD2wdu03PXzck6qzjHGv4u4r/rSe3V4PKht12FdYJJ+8QYKiBvoXSmOWogaFoo1tbA=
X-Received: by 2002:a05:6902:722:b0:b68:7a4a:5258 with SMTP id
 l2-20020a056902072200b00b687a4a5258mr2072334ybt.3.1679573611981; Thu, 23 Mar
 2023 05:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230315055023.61779-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230315055023.61779-1-yang.lee@linux.alibaba.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Mar 2023 13:12:56 +0100
Message-ID: <CAPDyKFrcATB2qxzpkHGKD=VGK21Vr83xmHYcaX708F0Qjek4xA@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: sdhci-of-aspeed: Use devm_platform_get_and_ioremap_resource()
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: oel@jms.id.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 15 Mar 2023 at 06:50, Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> According to commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()"), convert
> platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index ba6677bf7372..25b4073f698b 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -547,8 +547,7 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       sdc->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       sdc->regs = devm_ioremap_resource(&pdev->dev, sdc->res);
> +       sdc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &sdc->res);
>         if (IS_ERR(sdc->regs)) {
>                 ret = PTR_ERR(sdc->regs);
>                 goto err_clk;
> --
> 2.20.1.7.g153144c
>
