Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C554A6AB714
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 08:29:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVVZ64MNWz3cKG
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 18:29:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=atomide.com (client-ip=72.249.23.125; helo=muru.com; envelope-from=tony@atomide.com; receiver=<UNKNOWN>)
Received: from muru.com (muru.com [72.249.23.125])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVVZ12d0Fz308b
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Mar 2023 18:28:56 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 61AC58027;
	Mon,  6 Mar 2023 07:28:53 +0000 (UTC)
Date: Mon, 6 Mar 2023 09:28:52 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 15/17] gpio: omap: Convert to immutable irq_chip
Message-ID: <20230306072852.GB7501@atomide.com>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
 <20230215-immutable-chips-v1-15-51a8f224a5d0@linaro.org>
 <Y+8xkV5aUrAajLNP@atomide.com>
 <20230217173108.1448ce92@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217173108.1448ce92@aktux>
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
Cc: linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Kevin Hilman <khilman@kernel.org>, Marc Zyngier <maz@kernel.org>, William Breathitt Gray <william.gray@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Jay Fang <f.fangjian@huawei.com>, linux-gpio@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mun Yew Tham <mun.yew.tham@intel.com>, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, Romain Perier <romain.perier@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

* Andreas Kemnade <andreas@kemnade.info> [230217 16:31]:
> On Fri, 17 Feb 2023 09:49:37 +0200
> Tony Lindgren <tony@atomide.com> wrote:
> 
> > Hi,
> > 
> > * Linus Walleij <linus.walleij@linaro.org> [230216 09:38]:
> > > Convert the driver to immutable irq-chip with a bit of
> > > intuition.
> > > 
> > > This driver require some special care: .irq_ack() was copied
> > > from dummy_irq_chip where it was defined as noop. This only
> > > makes sense if using handle_edge_irq() that will unconditionally
> > > call .irq_ack() to avoid a crash, but this driver is not ever
> > > using handle_edge_irq() so just avoid assigning .irq_ack().
> > > 
> > > A separate chip had to be created for the non-wakeup instance.  
> > 
> > Nice, works for me.
> > 
> > BTW, I still see these warnings remaining on boot:
> > 
> > gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > 
> > Seems like we might be able to get rid of those too now or are
> > there still some dependencies with /sys/class/gpio for example?
> > 
> on what are you testing? on -next? I thought I have fixed theese warning with
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=92bf78b33b0b463b00c6b0203b49aea845daecc8

You're right, sorry looks like I pasted the wrong line from the dmesg
output :)

I intended to paste this example instead of the static allocation line:

gpio gpiochip1: (gpio-32-63): not an immutable chip, please consider fixing it!

Regards,

Tony
