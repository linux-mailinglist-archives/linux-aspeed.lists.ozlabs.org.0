Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E865391AEE
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2019 04:04:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bcg261KNzDqw6
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2019 12:04:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="eAkzqdRH"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bcfy08nLzDqc5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2019 12:04:09 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id y26so322763qto.4
 for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Aug 2019 19:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FdqGTZilsvAWJPaR0r/39oQNhzP+xm4M+Hqj2f46Le4=;
 b=eAkzqdRHxj7xl3kdMzG92M7hwnZCYFCErUC8N9g4vwMUz9x7GxI8gB6LRTI7evg9r7
 GxsfBoyyVf9vAUgqjNSxcW/qJZySMptuMHbrE2T1o6VOrFU0Z0z+5aGIgMSQM9pKFObO
 5dQU4vqa82LdalDmFhWSJIc8Eiw5uU/RjebCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FdqGTZilsvAWJPaR0r/39oQNhzP+xm4M+Hqj2f46Le4=;
 b=TlC1rnxJ1ahfyb6s6tBFkty5lhNv8+rO+ZX1zTF6EnwlMdJJiPA431ObBdH4jUbq9s
 QYQf3ilsWYhYpyOcC/t0cnsigCrWj/JwY8mg4UatdQ1rJTX1GciHreu5RpYrky3w9bMu
 1BGbul86kdXhTc1nkpjV3BjymE40TfypSCRQH9BwGwiLNsHR9RwMZyjaFik3OdjwXOfc
 S6I1BEUM93dscMAqPjeZUpHIg9Ql/vfHAw4Ievu3hTL/s2nuZJnrEsK+FelNKUCV/eJB
 nvHBYucAkc6gEHjj9Eq1UtRjE7DmchIrkajW/fd0CrGDI0q7Kr+p3JGT2LodHmF879dq
 IfTw==
X-Gm-Message-State: APjAAAX109G9fcrXkShE3rujcqz4kfhOrwvn982SHkjrN1XndW2zz1fn
 MqUm/cuyTa8hM8vzpYfw6X7LkZ8rmwBJPjk1a4s=
X-Google-Smtp-Source: APXvYqwaqW1bDbSfWZoN/blgOOuB7rbNcyl7kFtP95yF52dZJtwbw4h7rCAX8fzCnG8TYPmCF1JZE9109RjBT+A7qVI=
X-Received: by 2002:ac8:24b4:: with SMTP id s49mr18690956qts.255.1566180246129; 
 Sun, 18 Aug 2019 19:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190816155806.22869-1-joel@jms.id.au>
 <20190816155806.22869-3-joel@jms.id.au>
 <20190816171441.3B8F720665@mail.kernel.org>
In-Reply-To: <20190816171441.3B8F720665@mail.kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Aug 2019 02:03:54 +0000
Message-ID: <CACPK8Xf3C36KMgDmmRtNFqVFHzZx81ko+=54PA4+d5xPitum3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: Add support for AST2600 SoC
To: Stephen Boyd <sboyd@kernel.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 16 Aug 2019 at 17:14, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Joel Stanley (2019-08-16 08:58:06)
> > diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> > new file mode 100644
> > index 000000000000..083d5299238c
> > --- /dev/null
> > +++ b/drivers/clk/clk-ast2600.c
> > @@ -0,0 +1,701 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +// Copyright IBM Corp
> > +// Copyright ASPEED Technology
> > +
> [...]
> > +#define ASPEED_DPLL_PARAM              0x260
> > +
> > +#define ASPEED_G6_STRAP1               0x500
> > +
> > +/* Globally visible clocks */
> > +static DEFINE_SPINLOCK(aspeed_clk_lock);
>
> I guess we can be guaranteed that the two drivers aren't compiled into
> the same image? Otherwise this will alias with clk-aspeed.c and make
> kallsyms annoying to use.

I will change the name.

>
> > +
> > +/* Keeps track of all clocks */
> > +static struct clk_hw_onecell_data *aspeed_g6_clk_data;
> > +
> > +static void __iomem *scu_g6_base;
> > +
> > +static const struct aspeed_gate_data aspeed_g6_gates[] = {
> > +       /*                                  clk rst  name               parent   flags */
> > +       [ASPEED_CLK_GATE_MCLK]          = {  0, -1, "mclk-gate",        "mpll",  CLK_IS_CRITICAL }, /* SDRAM */
>
> Please document CLK_IS_CRITICAL usage. I guess it's memory so never turn
> it off?

Yes.

I added some comments and removed some uses that I didn't know the
reason for. We can add them back later if required, with the
reasoning.

> > +static const char * const vclk_parent_names[] = {
>
> Can you use the new way of specifying clk parents instead of just using
> strings?

How does this work? I had a browse of the APIs in clk-provider.h and
it appeared the functions all take char *s still.

> > +       hw = clk_hw_register_fixed_factor(NULL, "ahb", "hpll", 0, 1, axi_div * ahb_div);
>
> There aren't checks for if these things fail. I guess it doesn't matter
> and just let it fail hard?

I think that's sensible here. If the system has run out of memory this
early on then there's not going to be much that works.

Thanks for the review. I've fixed all of the style issues you
mentioned, but would appreciate some guidance on the parent API.

Cheers,

Joel
