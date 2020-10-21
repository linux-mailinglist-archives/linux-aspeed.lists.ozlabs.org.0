Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0A29578E
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 07:03:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGwHR5x5CzDqPW
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 16:03:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=SulhYNa9; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGVT42R4KzDqXS
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Oct 2020 23:40:24 +1100 (AEDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 546D822249
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Oct 2020 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603284021;
 bh=D2u3+25VPgAQHY5Nn343gmMQCCel5dPS87ZHZwoyNjM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SulhYNa9FDK7tCPx33fBxxU+9Yxu+f5QO9QlRPrywEn983DgQfusZOtcpYTDYgJtl
 0jc9q7B7J7DkpABX85e7jROgeSzwaPxWLHB12B0gNmJLxAJCLZ35PWuBDL+WAGWqOK
 LX9z2XZfy4yU4K1vKtZXacaRvI8yXZxvYo7JhGZQ=
Received: by mail-qk1-f180.google.com with SMTP id i22so2136001qkn.9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Oct 2020 05:40:21 -0700 (PDT)
X-Gm-Message-State: AOAM533D83hKfb5Rc7fAm2XAYfhmqNvq3XXe3MhuA/q+0oPiJBkZT4zU
 B3Xqs8ZpOLM09g4EeNM01c9nv5n4kqUGmaPMy5w=
X-Google-Smtp-Source: ABdhPJxaYfqMELfS/UA0bXc2jA/eaagXcZCcnNsgAaV8d9zfQVqdARFwKphCh/C0TXvS9gdaX5eGQgOxG4PgPN+L8lc=
X-Received: by 2002:a37:2dc6:: with SMTP id t189mr2894076qkh.394.1603284020397; 
 Wed, 21 Oct 2020 05:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201020220639.130696-1-joel@jms.id.au>
In-Reply-To: <20201020220639.130696-1-joel@jms.id.au>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 21 Oct 2020 14:40:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3gz4rMSkvZZ+TPaBx3B1yHXcUVFDdMFQMGUtEi4xXzyg@mail.gmail.com>
Message-ID: <CAK8P3a3gz4rMSkvZZ+TPaBx3B1yHXcUVFDdMFQMGUtEi4xXzyg@mail.gmail.com>
Subject: Re: [PATCH] net: ftgmac100: Ensure tx descriptor updates are visible
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 22 Oct 2020 16:03:23 +1100
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 21, 2020 at 12:39 PM Joel Stanley <joel@jms.id.au> wrote:

>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 331d4bdd4a67..15cdfeb135b0 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -653,6 +653,11 @@ static bool ftgmac100_tx_complete_packet(struct ftgmac100 *priv)
>         ftgmac100_free_tx_packet(priv, pointer, skb, txdes, ctl_stat);
>         txdes->txdes0 = cpu_to_le32(ctl_stat & priv->txdes0_edotr_mask);
>
> +       /* Ensure the descriptor config is visible before setting the tx
> +        * pointer.
> +        */
> +       smp_wmb();
> +
>         priv->tx_clean_pointer = ftgmac100_next_tx_pointer(priv, pointer);
>
>         return true;
> @@ -806,6 +811,11 @@ static netdev_tx_t ftgmac100_hard_start_xmit(struct sk_buff *skb,
>         dma_wmb();
>         first->txdes0 = cpu_to_le32(f_ctl_stat);
>
> +       /* Ensure the descriptor config is visible before setting the tx
> +        * pointer.
> +        */
> +       smp_wmb();
> +

Shouldn't these be paired with smp_rmb() on the reader side?

      Arnd
