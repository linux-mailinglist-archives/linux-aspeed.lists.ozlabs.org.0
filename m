Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ED32F0B04
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Jan 2021 03:24:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDcx02KnfzDqVl
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Jan 2021 13:24:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kBLXwma7; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDcwr25DCzDqTb
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Jan 2021 13:24:43 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id a1so1094477qvd.13
 for <linux-aspeed@lists.ozlabs.org>; Sun, 10 Jan 2021 18:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MGQGE/P7zFeVjmp8sXkUln0e8v6TZ5uhfq3Bnowm7sI=;
 b=kBLXwma7GmjHOu9EnI+4kzdu6mLbzGBHunbcBL53iYVea9o9twxuwVa/v8ecYOgkn0
 aF44jCNymnQOZ0tLwQMfcsXOOpCmjLV8EhX2pNgKJhOdxOddbsvwwwpuf0ho/1nlbFIN
 o7GZkyXTl8kK5METyATFCT28HtoLcHEE291yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MGQGE/P7zFeVjmp8sXkUln0e8v6TZ5uhfq3Bnowm7sI=;
 b=l/W/E+lGWPLAQblzc+IhcKhNPDXRxffDN6YAs4bQI+bCcarDKrJ4q0qtRv8GHuww4d
 1eY765ujicqGG5u5jhqgD1gy2SOEEJYYmyRcQCnENtr4qmnDQNICxlMcgxYIkgRPHyFh
 WxsYvxMebVUl+4fZJWYr/kryFD/VrQ0NM/bB63lUe5dOPqujTVAZJEbn/86G3k8rEEVb
 kTA7UwUh+wqxITCCtISDY+Wyj7Ctm+HGAdicTvG1f9S9qwLDXU+WRIOqvECQs1tT2sIr
 A30d63mU2avq52rz1C/40cLqC0xhiq3uhATOEmHSCMhYtD0iNPSuSFJZQKyeWgI4ku8q
 0aTg==
X-Gm-Message-State: AOAM530E0zKmHklGp63HoBFpButSKBmbjmZLTtxdJ2x099RX1MCMt/en
 pbZEUVE8P8Dgi+9kyHVSyOWx9NJS9Lvg56ncZzc=
X-Google-Smtp-Source: ABdhPJxaouI1Ui10wouE803ofFsrqx8gIkuSfvXhW51lYC9+Xwm3efzJcConRIfxsHULH9ZAnV5bDCL5+uB1oErJMKM=
X-Received: by 2002:a0c:a98c:: with SMTP id a12mr9902794qvb.43.1610331879213; 
 Sun, 10 Jan 2021 18:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20210108081238.10199-1-ryan_chen@aspeedtech.com>
 <20210108081238.10199-2-ryan_chen@aspeedtech.com>
In-Reply-To: <20210108081238.10199-2-ryan_chen@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Jan 2021 02:24:27 +0000
Message-ID: <CACPK8XdWKY4QmuojaZ13tmKR3MVEzU8MOV=bmqyTiotScaGfRA@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: gadget: aspeed: fix stop dma register setting.
To: Ryan Chen <ryan_chen@aspeedtech.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 8 Jan 2021 at 08:13, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>
> The vhub engine has two dma mode, one is descriptor list, another
> is single stage DMA. Each mode has different stop register setting.
> Descriptor list operation (bit2) : 0 disable reset, 1: enable reset
> Single mode operation (bit0) : 0 : disable, 1: enable
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/epn.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> index 0bd6b20435b8..02d8bfae58fb 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> @@ -420,7 +420,10 @@ static void ast_vhub_stop_active_req(struct ast_vhub_ep *ep,
>         u32 state, reg, loops;
>
>         /* Stop DMA activity */
> -       writel(0, ep->epn.regs + AST_VHUB_EP_DMA_CTLSTAT);
> +       if (ep->epn.desc_mode)
> +               writel(VHUB_EP_DMA_CTRL_RESET, ep->epn.regs + AST_VHUB_EP_DMA_CTLSTAT);
> +       else
> +               writel(0, ep->epn.regs + AST_VHUB_EP_DMA_CTLSTAT);

This looks correct, as whenever the driver re-enables DMA it uses
ep->epn.dma_conf for the value of this register. So we're not losing
any configuration by setting it to 0.

Acked-by: Joel Stanley <joel@jms.id.au>
Fixes: 7ecca2a4080c ("usb/gadget: Add driver for Aspeed SoC virtual hub")

I've cc'd Ben for his ack too.

Cheers,

Joel

>
>         /* Wait for it to complete */
>         for (loops = 0; loops < 1000; loops++) {
> --
> 2.17.1
>
