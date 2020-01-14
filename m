Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 052A313A0E3
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Jan 2020 07:16:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xgFP3BkSzDqNZ
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Jan 2020 17:16:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=VtlV23SB; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xgFC5cjMzDqM0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Jan 2020 17:15:59 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id i13so11510113qtr.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jan 2020 22:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ch4JFaWZ+4hulVW/75xxG1rRsAkPE8hB8vp6jGgpbd4=;
 b=VtlV23SBZz6TEZdceHzpbWroE1C4NMpU13ieE1Bsl/va9EE9/lFhqmpRUeRPnIxQ3D
 5OA9uuF5pxcwG9SNt/GUdoZdSPxtL8wo3DBThSw8cL1vaPGnEzKmuK4lqQVO/u+12R+h
 IZksJ8HSFDxJlOgZJhCY0wvHN66LNhu5enBzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ch4JFaWZ+4hulVW/75xxG1rRsAkPE8hB8vp6jGgpbd4=;
 b=MA3eNEVyqc787RDxJzSmF2RZaM+iyVwsVATRVaQGtkGQipg7BXO8xO03H2ClzDz5Y1
 O516qHjub49+x1XZ3rwnVoMkDYyHwG2nbyR7tXbtqMcjCmBbUdrS9dDKsSTM/Zjq9G4z
 +VDVWlTjn/lY4fKagK5NWYbBhZbJznSNzQwUrgnzbn6B6ZQs4DfsCQz4NyrHFr6EjvEZ
 YdWKV8E5ZF7MfGwDiqnKc0J7ExEfG3D0eU5Q3iTmyeRsKIoUI6qN+T+51qLsQe6xRC2k
 S7xblmdOHU0PXpexThQGGWIBCgsu0ZrF66+XCXp/hmGibwsxvpnPlApd7rl/0oyZ+NcU
 aVcA==
X-Gm-Message-State: APjAAAXxP1ZOlt2fJ+RjGBBMsI/Z/ODv6kyinn97HZuKinVh9+PeyXiN
 5M4O70yhM03UhtgJRjq8CuR/Y8MLWdhRoPLd/Fg=
X-Google-Smtp-Source: APXvYqxGOHfPgoNxBhydrYQjWY/pdNkxc8V8q5t4XPG2AnZ51P0xjiURnDVSATAJro+qmMalgYFzAyr8L81/7IC0eiM=
X-Received: by 2002:ac8:1aeb:: with SMTP id h40mr2277927qtk.269.1578982555458; 
 Mon, 13 Jan 2020 22:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20200113213453.27108-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200113213453.27108-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Jan 2020 06:15:43 +0000
Message-ID: <CACPK8Xf0Oa62BsNOQ55rqAp_a=V-_9bm1c4nu_+Oo5zB=2+zpA@mail.gmail.com>
Subject: Re: [PATCH] clk: ast2600: enable BCLK for PCI/PCIe bus always
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 13 Jan 2020 at 21:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> BCLK for PCI/PCIe bus should be enabled always with having the
> CLK_IS_CRITICAL flag otherwise it will be disabled at kernel late
> initcall phase as an unused clock, and eventually it causes
> unexpected behavior on BMC features that are connected to the host
> through PCI/PCIe bus.

This is true for systems that have PCIe connected. There are systems
that do not, and in that case we don't want to have the clock enabled.

Are you doing this to support the case where the PCIe device not load
a BMC driver? (eg for host VGA use). If not, then you can have the
driver you're loading request the BCLK.

If this is for the host VGA device, then you will need to come up with
a mechanism that makes the enabling of this clock depend on the device
tree.

Cheers,

Joel

>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/clk/clk-ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 392d01705b97..42bfdc16bf7a 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -64,7 +64,7 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
>         [ASPEED_CLK_GATE_GCLK]          = {  2,  7, "gclk-gate",        NULL,    0 },   /* 2D engine */
>         /* vclk parent - dclk/d1clk/hclk/mclk */
>         [ASPEED_CLK_GATE_VCLK]          = {  3,  6, "vclk-gate",        NULL,    0 },   /* Video Capture */
> -       [ASPEED_CLK_GATE_BCLK]          = {  4,  8, "bclk-gate",        "bclk",  0 }, /* PCIe/PCI */
> +       [ASPEED_CLK_GATE_BCLK]          = {  4,  8, "bclk-gate",        "bclk",  CLK_IS_CRITICAL }, /* PCIe/PCI */
>         /* From dpll */
>         [ASPEED_CLK_GATE_DCLK]          = {  5, -1, "dclk-gate",        NULL,    CLK_IS_CRITICAL }, /* DAC */
>         [ASPEED_CLK_GATE_REF0CLK]       = {  6, -1, "ref0clk-gate",     "clkin", CLK_IS_CRITICAL },
> --
> 2.17.1
>
