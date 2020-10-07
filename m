Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1F285E3E
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Oct 2020 13:34:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5sgX0F3VzDqNF
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Oct 2020 22:34:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nej5WNcI; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5sgK27KpzDqKL
 for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Oct 2020 22:34:17 +1100 (AEDT)
Received: by mail-qv1-xf43.google.com with SMTP id ev17so919964qvb.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Oct 2020 04:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5gd24hGze2dlKa1wOLIr4c2viYI7MlJtHZphDgoFUVs=;
 b=nej5WNcIK56SyOCybSZumZqJf6A/JHEfjj+e5VIiFKbJBj6j7UWT81hQlpCTN37QGo
 NvnDzREDJxVx9252ux3ihNf+AC2FgEuJhUyjBIjDG909ls7E6QR5TTMewcZStskxnYXc
 k9OsItoE1oB7RI1mFp0plZooxsP2BJhrpy17w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5gd24hGze2dlKa1wOLIr4c2viYI7MlJtHZphDgoFUVs=;
 b=lrT/2qrIKPisQDhk4cKCx1NXlqX0MhhiKkT7ehNKd8RVItXl1W8QY0mUVLYrIGtNlP
 AWpm9CmempBq9516dGkp8+B17NV+QRKHsSwUU8nU0OmGnvVu8HOg6ms+B4veJgvj728o
 4yG5kt5tjnRpQHHBh9IZOn0WZeEtpdfhjniknBK8nUHoPZNBbPbE60dOBVOfgDV4NHQU
 l7xjTm5grLW312ttifl7Nyp/Ao/UwmJEXIZFyrdJyV/X3WSpsHp7WqtjMcrI0dqODy3y
 igmTVxyukMwF6jiQnlVILY7FR+VSiv1bcEmJTj1oXD2sI1+xKLxDRET22U5LCWS4K4QS
 8p+Q==
X-Gm-Message-State: AOAM533LH05CqHPJVq3sjfEA0h2U3YcYbs4+MEMpvQgUWd5A+yEVl6hs
 x8KA2kw+pPPKrkrgTcKJ90CGkzVkADzUUURQVBw=
X-Google-Smtp-Source: ABdhPJxHGdLEOTYZ/YuiJaeWNOoKwHPMWh2RBpBkOnkUGWbXX9IQhzyjEUxAW3FfGri+qbzFdcHFn6OEjIS9aoHCpWo=
X-Received: by 2002:ad4:51c6:: with SMTP id p6mr2793618qvq.18.1602070453395;
 Wed, 07 Oct 2020 04:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200928070108.14040-1-ryan_chen@aspeedtech.com>
 <20200928070108.14040-2-ryan_chen@aspeedtech.com>
 <CACPK8XcjmxBGUfDxE2WB3zBgG8OCoRMogfG=Fk5f+wNZu0pjMg@mail.gmail.com>
 <HK0PR06MB338059A24B66C14675298D0BF2320@HK0PR06MB3380.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB338059A24B66C14675298D0BF2320@HK0PR06MB3380.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 11:34:01 +0000
Message-ID: <CACPK8XdBmkhZ8mcSFmDAFV8k7Qj7ajBL8TVKfK8c+5aneUMHZw@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: aspeed: modify some default clks are critical
To: Ryan Chen <ryan_chen@aspeedtech.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 29 Sep 2020 at 08:40, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Tuesday, September 29, 2020 4:04 PM
> > To: Ryan Chen <ryan_chen@aspeedtech.com>; Jae Hyun Yoo
> > <jae.hyun.yoo@linux.intel.com>; Andrew Jeffery <andrew@aj.id.au>
> > Cc: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> > <sboyd@kernel.org>; linux-clk@vger.kernel.org; Linux ARM
> > <linux-arm-kernel@lists.infradead.org>; linux-aspeed
> > <linux-aspeed@lists.ozlabs.org>; Linux Kernel Mailing List
> > <linux-kernel@vger.kernel.org>; BMC-SW <BMC-SW@aspeedtech.com>
> > Subject: Re: [PATCH 1/1] clk: aspeed: modify some default clks are critical
> >
> > On Mon, 28 Sep 2020 at 07:01, Ryan Chen <ryan_chen@aspeedtech.com>
> > wrote:
> > >
> > > In ASPEED SoC LCLK is LPC clock for all SuperIO device, UART1/UART2
> > > are default for Host SuperIO UART device, eSPI clk for Host eSPI bus
> > > access eSPI slave channel, those clks can't be disable should keep
> > > default, otherwise will affect Host side access SuperIO and SPI slave device.
> > >
> > > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > > ---
> > >  drivers/clk/clk-aspeed.c  | 8 ++++----  drivers/clk/clk-ast2600.c | 8
> > > ++++----
> > >  2 files changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c index
> > > 411ff5fb2c07..d348c4fd3f9f 100644
> > > --- a/drivers/clk/clk-aspeed.c
> > > +++ b/drivers/clk/clk-aspeed.c
> > > @@ -54,15 +54,15 @@ static const struct aspeed_gate_data aspeed_gates[]
> > = {
> > >         [ASPEED_CLK_GATE_DCLK] =        {  5, -1, "dclk-gate",
> > NULL,   CLK_IS_CRITICAL }, /* DAC */
> > >         [ASPEED_CLK_GATE_REFCLK] =      {  6, -1, "refclk-gate",
> > "clkin", CLK_IS_CRITICAL },
> > >         [ASPEED_CLK_GATE_USBPORT2CLK] = {  7,  3, "usb-port2-gate",
> > NULL,   0 }, /* USB2.0 Host port 2 */
> > > -       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate",
> > NULL,   0 }, /* LPC */
> > > +       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate",
> > NULL,   CLK_IS_CRITICAL }, /* LPC */
> > >         [ASPEED_CLK_GATE_USBUHCICLK] =  {  9, 15, "usb-uhci-gate",
> > NULL,   0 }, /* USB1.1 (requires port 2 enabled) */
> > >         [ASPEED_CLK_GATE_D1CLK] =       { 10, 13, "d1clk-gate",
> > NULL,   0 }, /* GFX CRT */
> > >         [ASPEED_CLK_GATE_YCLK] =        { 13,  4, "yclk-gate",
> > NULL,   0 }, /* HAC */
> > >         [ASPEED_CLK_GATE_USBPORT1CLK] = { 14, 14, "usb-port1-gate",
> > NULL,   0 }, /* USB2 hub/USB2 host port 1/USB1.1 dev */
> > > -       [ASPEED_CLK_GATE_UART1CLK] =    { 15, -1, "uart1clk-gate",
> > "uart", 0 }, /* UART1 */
> > > -       [ASPEED_CLK_GATE_UART2CLK] =    { 16, -1, "uart2clk-gate",
> > "uart", 0 }, /* UART2 */
> > > +       [ASPEED_CLK_GATE_UART1CLK] =    { 15, -1, "uart1clk-gate",
> > "uart", CLK_IS_CRITICAL }, /* UART1 */
> > > +       [ASPEED_CLK_GATE_UART2CLK] =    { 16, -1, "uart2clk-gate",
> > "uart", CLK_IS_CRITICAL }, /* UART2 */
> > >         [ASPEED_CLK_GATE_UART5CLK] =    { 17, -1, "uart5clk-gate",
> > "uart", 0 }, /* UART5 */
> > > -       [ASPEED_CLK_GATE_ESPICLK] =     { 19, -1, "espiclk-gate",
> > NULL,   0 }, /* eSPI */
> > > +       [ASPEED_CLK_GATE_ESPICLK] =     { 19, -1, "espiclk-gate",
> > NULL,   CLK_IS_CRITICAL }, /* eSPI */
> >
> > This is fine for systems that have eSPI. For systems that do not use eSPI, the
> > clocks are not "required".
> >
> > I was sent a similar patch by Jae some time ago:
> >
> >
> > https://lore.kernel.org/openbmc/697a184b-ef99-a46e-bf98-4d339b3aafd8@lin
> > ux.intel.com/
> >
> > Better is to associate drivers with these clocks, and those drivers will ensure
> > they are left enabled.
> >
> > Alternatively, we will need to come up with a device tree binding to describe
> > the hardware requirement that these clocks are left on.
> >
> ASPEED BMC SoC have SuperIO device that default enable, even without BMC fw boot.
> Host can use SUART1/SUART2/GPIO....
> That the reason even Linux kernel boot should not change the SoC default clk, that is the impact.

Ok, that makes sense. Linux will not enable these clocks if a driver
is loaded for them though, so we should load a driver for them.

ESPI: We do not have an upstream driver for eSPI, but once you submit
one this will solve the eSPI issue.

LPC: The existing LPC driver will enable the clock, so by loading that
this clock will be left enabled.

UART1/UART2: This is harder, as the SUART mode means the BMC does not
load a driver for these devices. We could add a property to the device
tree to describe the clocks that must be left on?

Cheers,

Joel
