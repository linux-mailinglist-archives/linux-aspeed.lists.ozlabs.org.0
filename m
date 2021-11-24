Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B0045B7CC
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 10:50:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzbpn3xPkz3c7L
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 20:50:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bdEK2Mif;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=bdEK2Mif; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzbpj0fvRz2xWt
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Nov 2021 20:50:20 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id q14so2022024qtx.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Nov 2021 01:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a4UIF5PwI9JEhE41/mv5NdEHtmlln1VA/6VmE86RQ7E=;
 b=bdEK2MiflBM0Wl3B08XP+LZ4MgpveoqVSTXe+kqJqhmfq0g7qEXgkGo6XTK/KxVDMd
 +ZoS7gklT9ARQX9fckgEmhOPY2FwWY+vQu0nvK3gEeznITkZu1rGSaIz5w/h1mxk0whY
 U01/WvhuM7gXlEz0eQ6Tzu7t9i335xEahXm1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a4UIF5PwI9JEhE41/mv5NdEHtmlln1VA/6VmE86RQ7E=;
 b=Hjx0qSQopkKZ6Y2FUvjR8UR5PvJAwIYp+NfVU2/JXXMhootMsRKSeGgn29pzbbNq4i
 IKujPF519ts913H+Pyp/VnCJojN3r55I+J8ZFfq3zCkXE/PC5OAW6HXM/qYRONu8Q2jp
 07tnGkQBKrN73J47aEAu0JmT+wRXxSwcjD84wDZymJOGYo54VBiclyR0CuGMmq6nNqmt
 vAPheRtk4nnGpi3LZQvguao3TvwOB3myfJyeRyoXEpz6pJX/D7Y9W3YeNQ/IveaXVMGW
 YB1Kdu7eh5uX4L2AlCAmRkWv0602KQzvZypixB76yW9b/Q1HhJtstVTbqSdqD5pzTCms
 XQhA==
X-Gm-Message-State: AOAM531fExh0At76DVxJwh52JkZwAfh4MX/f6BaRn75bzSkSaXKBR3hJ
 dK7Gjf7bMovKrviaNWzgLEbnxIldVQvWa5buB2k=
X-Google-Smtp-Source: ABdhPJy6GzbB4D2zJxxVEqK2rARHn/wnYym2enOfxFcyg3IVpUwCOOxs306fuf/cj8vsEhKRcMJCw5thQh+kvqODXXE=
X-Received: by 2002:ac8:674a:: with SMTP id n10mr5160904qtp.145.1637747414112; 
 Wed, 24 Nov 2021 01:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20211124094348.11621-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20211124094348.11621-1-billy_tsai@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Nov 2021 09:50:01 +0000
Message-ID: <CACPK8XeyCbKzjPF6sSj=CZOd3dYmyAzhZDFRRDERMHykwvSMAg@mail.gmail.com>
Subject: Re: [PATCH] irqchip: Replace update_bits with write_bits.
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Marc Zyngier <maz@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 24 Nov 2021 at 09:43, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> The interrupt status bits are cleared by writing 1, we should force a
> write to clear the interrupt without checking if the value has changed.
>
> Fixes: 04f605906ff0 ("irqchip: Add Aspeed SCU interrupt controller")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Good catch. This should go to stable too.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Is there any reason to use the regmap abstraction in this driver?
AFAICT the registers aren't shared, so we could replace the regmap
calls with readl/writel. Such a cleanup probably wouldn't be
backported, so this patch is still useful.

> ---
>  drivers/irqchip/irq-aspeed-scu-ic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
> index f3c6855a4cef..18b77c3e6db4 100644
> --- a/drivers/irqchip/irq-aspeed-scu-ic.c
> +++ b/drivers/irqchip/irq-aspeed-scu-ic.c
> @@ -76,8 +76,8 @@ static void aspeed_scu_ic_irq_handler(struct irq_desc *desc)
>                 generic_handle_domain_irq(scu_ic->irq_domain,
>                                           bit - scu_ic->irq_shift);
>
> -               regmap_update_bits(scu_ic->scu, scu_ic->reg, mask,
> -                                  BIT(bit + ASPEED_SCU_IC_STATUS_SHIFT));
> +               regmap_write_bits(scu_ic->scu, scu_ic->reg, mask,
> +                                 BIT(bit + ASPEED_SCU_IC_STATUS_SHIFT));
>         }
>
>         chained_irq_exit(chip, desc);
> --
> 2.25.1
>
