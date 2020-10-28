Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A6029CDDE
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 05:38:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLbRx3G92zDqRK
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 15:38:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Tp4mM3D0; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLbRl75pQzDqJq
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 15:38:26 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id 140so3488702qko.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 21:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4MykbGw6bHee+sbWD2NGwMwnxeBN9iL5rF1OE9UjJ1Q=;
 b=Tp4mM3D0AUMmouj4W6RXfvIIS810w5N6ZfCPO62M4OTOOqdefYTFMYQvkv8RZjTxbg
 KAwVGVb9sPj2KNyn/uQFfuZFIpk3TCBmrRM/UUX++fbrobzL1xmClclUj417B+x7JZeD
 zg0GOP0R5Nrw9atwCSZjMc4mbSbOk8lUN+0Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4MykbGw6bHee+sbWD2NGwMwnxeBN9iL5rF1OE9UjJ1Q=;
 b=WcFECM+xk60SnjaAKH4JhJ7ay4sWKAXA6p/PGiu/0mN2xWy1RGjba5Nyx3acneNk93
 JNiCGIiUhaxsnNs6I8YcpdKYD/vqmqaNYg1hpCLp7G0AcRiZ3SpgwPfIv851HEUeMB/n
 l4VsZjizvOm4+Jn7WQVQ20hqjNhih7iiScx6I3uZcZ85FGKV7R5HYu8xZd28AARjdzh7
 foHSGg25DS2SrOXGdMYs4bTDNzax4FlbBZ/we3LJTQ9OEHLP/2qkI0nw7kcKxE850n//
 RmeEuSiQO2b5g801vK0WP8Y0XPKpJdKQd1mSa+r3tewBOiYuAZ2WLfU580m6KHUYRBKr
 +GAg==
X-Gm-Message-State: AOAM532RGL4Dz90Twon9TxIY+CGYFp/NJnYT7D9EtfM9epkI5WUqkjbE
 /yxQoL1l/jIe8jd7CGKa4H07qBriC1NTOECkvf4=
X-Google-Smtp-Source: ABdhPJwwjgO8IqC8w+C79BxSvAYXYDw1GUHfrT/SZUU3zpmx1+2t9DpDIW5G3LtpRjVBq3ypIaEi6EQ8SBJWcM+Xai0=
X-Received: by 2002:a05:620a:1303:: with SMTP id
 o3mr5769587qkj.66.1603859902807; 
 Tue, 27 Oct 2020 21:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200928070108.14040-1-ryan_chen@aspeedtech.com>
 <20200928070108.14040-2-ryan_chen@aspeedtech.com>
 <160264382296.310579.9835482254268204873@swboyd.mtv.corp.google.com>
 <CACPK8Xe-_hTey7hTJjG2-EcDsTN0qOw3bWBcrZZohEK3QOJuvg@mail.gmail.com>
 <160269577311.884498.8429245140509326318@swboyd.mtv.corp.google.com>
In-Reply-To: <160269577311.884498.8429245140509326318@swboyd.mtv.corp.google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 04:38:10 +0000
Message-ID: <CACPK8XeGRq2XeJAjdQ=pT1oKk7-wk1==4Byfc50_6+-UijU12w@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: aspeed: modify some default clks are critical
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
Cc: BMC-SW <bmc-sw@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Thanks for the response Stephen. Sorry it's taken me a while to get back to you.

On Wed, 14 Oct 2020 at 17:16, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Joel Stanley (2020-10-13 22:28:00)
> > On Wed, 14 Oct 2020 at 02:50, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Ryan Chen (2020-09-28 00:01:08)
> > > > In ASPEED SoC LCLK is LPC clock for all SuperIO device, UART1/UART2 are
> > > > default for Host SuperIO UART device, eSPI clk for Host eSPI bus access
> > > > eSPI slave channel, those clks can't be disable should keep default,
> > > > otherwise will affect Host side access SuperIO and SPI slave device.
> > > >
> > > > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > > > ---
> > >
> > > Is there resolution on this thread?
> >
> > Not yet.
> >
> > We have a system where the BMC (management controller) controls some
> > clocks, but the peripherals that it's clocking are outside the BMC's
> > control. In this case, the host processor us using some UARTs and what
> > not independent of any code running on the BMC.
> >
> > Ryan wants to have them marked as critical so the BMC never powers them down.
> >
> > However, there are systems that don't use this part of the soc, so for
> > those implementations they are not critical and Linux on the BMC can
> > turn them off.
> >
> > Do you have any thoughts? Has anyone solved a similar problem already?
> >
>
> Is this critical clocks in DT? Where we want to have different DT for
> different device configurations to indicate that some clks should be
> marked critical so they're never turned off and other times they aren't
> so they're turned off?

Spot on.

> It also sounds sort of like the protected-clocks binding. Where you
> don't want to touch certain clks depending on the usage configuration of
> the SoC. There is a patch to make that generic that I haven't applied
> because it looks wrong at first glance[1].

That binding is exactly what I had in mind. I wasn't aware of it.

The drawbacks outlined in the commit message do sound concerning. I
take it we could avoid those drawbacks by having a driver-specific
implementation of protected-clocks, like qcom does?

> Maybe not registering those
> clks to the framework on the configuration that Ryan has is good enough?

I didn't quite follow here. Did you mean with protected-clocks, or
using a different mechanism?

Cheers,

Joel

>
> [1] https://lore.kernel.org/r/20200903040015.5627-2-samuel@sholland.org
