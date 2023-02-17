Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B169BF10
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 08:48:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKHjV1gXyz3c8n
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 18:48:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alpha.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
X-Greylist: delayed 3008 seconds by postgrey-1.36 at boromir; Sat, 18 Feb 2023 02:24:25 AEDT
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJFwT1ZrZz3f99
	for <linux-aspeed@lists.ozlabs.org>; Sat, 18 Feb 2023 02:24:25 +1100 (AEDT)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1pT1o3-0001zG-00; Fri, 17 Feb 2023 15:33:47 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 19465C28A2; Fri, 17 Feb 2023 14:28:16 +0100 (CET)
Date: Fri, 17 Feb 2023 14:28:16 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/17] gpio: idt3243x: Convert to immutable irq_chip
Message-ID: <20230217132816.GA9335@alpha.franken.de>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
 <20230215-immutable-chips-v1-10-51a8f224a5d0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215-immutable-chips-v1-10-51a8f224a5d0@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 19 Feb 2023 18:42:49 +1100
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

On Thu, Feb 16, 2023 at 10:37:11AM +0100, Linus Walleij wrote:
> Convert the driver to immutable irq-chip with a bit of
> intuition.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-idt3243x.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
> index 1cafdf46f875..00f547d26254 100644
> --- a/drivers/gpio/gpio-idt3243x.c
> +++ b/drivers/gpio/gpio-idt3243x.c
> @@ -92,6 +92,8 @@ static void idt_gpio_mask(struct irq_data *d)
>  	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
>  
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
>  }
>  
>  static void idt_gpio_unmask(struct irq_data *d)
> @@ -100,6 +102,7 @@ static void idt_gpio_unmask(struct irq_data *d)
>  	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
>  	unsigned long flags;
>  
> +	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
>  	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>  
>  	ctrl->mask_cache &= ~BIT(d->hwirq);
> @@ -119,12 +122,14 @@ static int idt_gpio_irq_init_hw(struct gpio_chip *gc)
>  	return 0;
>  }
>  
> -static struct irq_chip idt_gpio_irqchip = {
> +static const struct irq_chip idt_gpio_irqchip = {
>  	.name = "IDTGPIO",
>  	.irq_mask = idt_gpio_mask,
>  	.irq_ack = idt_gpio_ack,
>  	.irq_unmask = idt_gpio_unmask,
> -	.irq_set_type = idt_gpio_irq_set_type
> +	.irq_set_type = idt_gpio_irq_set_type,
> +	.flags = IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>  
>  static int idt_gpio_probe(struct platform_device *pdev)
> @@ -168,7 +173,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
>  			return parent_irq;
>  
>  		girq = &ctrl->gc.irq;
> -		girq->chip = &idt_gpio_irqchip;
> +		gpio_irq_chip_set_chip(girq, &idt_gpio_irqchip);
>  		girq->init_hw = idt_gpio_irq_init_hw;
>  		girq->parent_handler = idt_gpio_dispatch;
>  		girq->num_parents = 1;
> 
> -- 
> 2.34.1

Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>


-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
