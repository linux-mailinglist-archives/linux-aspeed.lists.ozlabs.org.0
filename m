Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3420D53C6EB
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Jun 2022 10:25:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDwv041Nvz3bnJ
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Jun 2022 18:25:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bJ/VFZ9T;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bJ/VFZ9T;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDwts6DkQz30DC
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Jun 2022 18:25:41 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id v4-20020a1cac04000000b00397001398c0so5952187wme.5
        for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Jun 2022 01:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vlHNlkkfhwq7JFKAn7mhXh4Kqw+dpNnKiTAAOerdCbU=;
        b=bJ/VFZ9T86Dpad/2A+PantdPhNRldCUJi7CH06worJoLs4fV89CmA83GPQv4XX3oQO
         owubLRZ5eh0a3aawSkEGY5U5OJvREJW5yKC0SwJ8/R5Yh/lcudMzNWlYvqpDhNfpYTLn
         JWo0yWc4hgNyLIqrxiDclZNllTE86MdDxnebI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vlHNlkkfhwq7JFKAn7mhXh4Kqw+dpNnKiTAAOerdCbU=;
        b=zu64nYClMddvsZo76FC/NG4au744dWQ1J7mF08eOdzei7mCBoxuSICzk5yZqS9cSac
         TtzzcDNIdU2Bu4sZqGJoW3SnlPU9SA0vhtmmJGsnCH+l/G4vvNSW1fnJNoAn2cxNP3gM
         dMhIANFMD5e4Xj/JQSsoyIS5y0cqp3A/SaLR6wlDveohycX1EyeryWX+3c+AUgoMzaBi
         lpIrijY7Q6qDHkGasiPnEJcMtVcqkCivY4Ia5dY9gmEWbyxEPvsV/UtMm4x0Of9YmKSW
         3PRqVg+Ra84LzmmuK6V3IBI/ITM/fCTNByWQQCuL44CM9tUv/DvjiTxGWadffVZXzQVs
         1oKA==
X-Gm-Message-State: AOAM530h027F9nksAKbdXRt/+xTlYctVuqPbWTCqoSxEi3ly9DHg9Bzd
	ksrvNdemXVQQvgAnTudXh+nB0BcCXW7zfuKASzY=
X-Google-Smtp-Source: ABdhPJyu0PRaX/h4+QsgQWWvHZT59GgYnKr45nwnrWKogESQid/p43kyo7JfjDE0gBDkfLGxLEDy2LKuKmP8rqYtJaQ=
X-Received: by 2002:a05:600c:3d11:b0:39c:1c62:cebc with SMTP id
 bh17-20020a05600c3d1100b0039c1c62cebcmr14918974wmb.147.1654244735516; Fri, 03
 Jun 2022 01:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220603082336.3867-1-linmq006@gmail.com>
In-Reply-To: <20220603082336.3867-1-linmq006@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Jun 2022 08:25:23 +0000
Message-ID: <CACPK8XdiqZ_bN+iMO8_RvMLQzJtMm1gw-dUaT8Q00vtZSeAsCQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] soc: aspeed: Fix IRQ check in aspeed_lpc_snoop_config_irq
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Patrick Venture <venture@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 3 Jun 2022 at 08:23, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> platform_get_irq() returns negative error number instead 0 on failure.
> And the doc of platform_get_irq() provides a usage example:
>
>     int irq = platform_get_irq(pdev, 0);
>     if (irq < 0)
>         return irq;
>
> Fix the check of return value to catch errors correctly.
>
> Fixes: 524feb799408 ("soc: add aspeed folder and misc drivers")

That's not the commit that introduced this code, that's simply a
commit that moved the drivers.

> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> Link: https://lore.kernel.org/r/20220114064357.18562-1-linmq006@gmail.com
> In previous thread:
> Reviewed-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index eceeaf8dfbeb..c4a03b3a5cf8 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -167,8 +167,8 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
>         int rc;
>
>         lpc_snoop->irq = platform_get_irq(pdev, 0);
> -       if (!lpc_snoop->irq)
> -               return -ENODEV;
> +       if (lpc_snoop->irq < 0)
> +               return lpc_snoop->irq;
>
>         rc = devm_request_irq(dev, lpc_snoop->irq,
>                               aspeed_lpc_snoop_irq, IRQF_SHARED,
> --
> 2.25.1
>
