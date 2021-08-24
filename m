Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94023F576C
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 06:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtxYd4NJpz2yLb
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 14:52:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jK5R/1J6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jK5R/1J6; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtxYT4Ms8z2xrx
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Aug 2021 14:52:28 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id a66so3049302qkc.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Aug 2021 21:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yq1+yUuzy73wmTqQz582kZA2h/Vz+BygSw30/pNdJ98=;
 b=jK5R/1J6FGwa7V2HDP+dXM6DehJp7486SAVwEyNuLuzgvf+sUdjX/wWc+Bf2BgAy8q
 wgdW3wlF0ucp00hRnzrnw2rUIeY3lexLJMLtcoMq7eJg5AT8W5UvOj03nQaqgwALNixa
 7+wLEGad9gskiyOBs9z/0F8hP572nFkcRbbLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yq1+yUuzy73wmTqQz582kZA2h/Vz+BygSw30/pNdJ98=;
 b=ewNmBTmH0RBLp3FYSI48vBsiw0TM+2ygy0n+u6KSpsPPyS5a06ePquA7a8Rr+MzoNE
 T4vZM35jjYh2GNhAutY16gN0a4UYOs6n2E6yMDnw0mVrVTNcSNxjSVBKv7YG5snzfnWN
 KQbU2Zj9dGHme9wcU+2vLIeAOVn//etoNWeerxPuHimdJoWgfmLlrlT92NzbNIbwZoMz
 KLW/2KYdlyRhqv5VetiJehlnyIDnQfqn8R/66TCgKhEJtkDGQXisCDtK/hex+sAfFbWa
 N/FoVQykHQJyXq/oBEAs5eOQiPpVeyLwah7xeBZaAuL4JETqTI+takFm47mh7y/C+GQ6
 jX2A==
X-Gm-Message-State: AOAM532axQ++43jRq08TsLLHZtTeaHQ9YEZ6pA47QhWCOBhJc7OYO0oC
 wpgD1AI2WV1JrYhmAsSDKI49CXvxH3GWO+/ciFI=
X-Google-Smtp-Source: ABdhPJyx48VNVn8ol4dHMHg/fYDo3nox3UD2s0gnTQTNfkARsC33l5P49m6oxctyuUZfRLtV/EdKCXG0diG20/iqz0w=
X-Received: by 2002:a37:a094:: with SMTP id
 j142mr25021107qke.465.1629780745130; 
 Mon, 23 Aug 2021 21:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210823130043.1087204-1-yangyingliang@huawei.com>
In-Reply-To: <20210823130043.1087204-1-yangyingliang@huawei.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 24 Aug 2021 04:52:13 +0000
Message-ID: <CACPK8XeUJV2cCaCu+xnX-pGkHVxV9vp3LPj8dJbJbi8SC4Bazw@mail.gmail.com>
Subject: Re: [PATCH -next] soc: aspeed-lpc-ctrl: Fix missing
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

On Mon, 23 Aug 2021 at 12:55, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> Fix the missing clk_disable_unprepare() before return
> from aspeed_lpc_ctrl_probe() in the error handling case.
>
> Fixes: 2f9b25fa6682 ("soc: aspeed: Re-enable FWH2AHB on AST2600")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> index 6893c5ec3259..f4c989584d6b 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> @@ -312,7 +312,8 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
>                 lpc_ctrl->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2600-scu");
>                 if (IS_ERR(lpc_ctrl->scu)) {
>                         dev_err(dev, "couldn't find scu\n");
> -                       return PTR_ERR(lpc_ctrl->scu);
> +                       rc = PTR_ERR(lpc_ctrl->scu);
> +                       goto err;

Thanks for the patch. Alternatively, we could move this code above the
devm_clk_get/clk_prepare_enable. I would prefer that option, if you
want to send a v2.

Cheers,

Joel
