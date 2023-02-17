Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865E69A63E
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 08:49:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ3qs5LC0z3f4j
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 18:49:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=atomide.com (client-ip=72.249.23.125; helo=muru.com; envelope-from=tony@atomide.com; receiver=<UNKNOWN>)
Received: from muru.com (muru.com [72.249.23.125])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ3qn59sPz3cfY
	for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Feb 2023 18:49:41 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 202B880C1;
	Fri, 17 Feb 2023 07:49:39 +0000 (UTC)
Date: Fri, 17 Feb 2023 09:49:37 +0200
From: Tony Lindgren <tony@atomide.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 15/17] gpio: omap: Convert to immutable irq_chip
Message-ID: <Y+8xkV5aUrAajLNP@atomide.com>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
 <20230215-immutable-chips-v1-15-51a8f224a5d0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215-immutable-chips-v1-15-51a8f224a5d0@linaro.org>
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
Cc: Marc Zyngier <maz@kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-omap@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Mun Yew Tham <mun.yew.tham@intel.com>, Kevin Hilman <khilman@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jay Fang <f.fangjian@huawei.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Romain Perier <romain.perier@gmail.com>, William Breathitt Gray <william.gray@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

* Linus Walleij <linus.walleij@linaro.org> [230216 09:38]:
> Convert the driver to immutable irq-chip with a bit of
> intuition.
> 
> This driver require some special care: .irq_ack() was copied
> from dummy_irq_chip where it was defined as noop. This only
> makes sense if using handle_edge_irq() that will unconditionally
> call .irq_ack() to avoid a crash, but this driver is not ever
> using handle_edge_irq() so just avoid assigning .irq_ack().
> 
> A separate chip had to be created for the non-wakeup instance.

Nice, works for me.

BTW, I still see these warnings remaining on boot:

gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.

Seems like we might be able to get rid of those too now or are
there still some dependencies with /sys/class/gpio for example?

Reviewed-by: Tony Lindgren <tony@atomide.com>
Tested-by: Tony Lindgren <tony@atomide.com>
