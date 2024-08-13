Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D28950175
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Aug 2024 11:44:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b5/TQWYH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Yo+CnOYr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjmgf6Vndz2yQ9
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Aug 2024 19:44:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b5/TQWYH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Yo+CnOYr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 530 seconds by postgrey-1.37 at boromir; Tue, 13 Aug 2024 19:44:25 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjmgY6vwnz2xKg
	for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Aug 2024 19:44:25 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723541726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPWBBDJU7xycHw83tZfdCxw6fWdvqJgVNnPRw9B4yYQ=;
	b=b5/TQWYHviQ+nW8b2BeGJJJa+nhVp9dMiGiVqEXbL6stHi4kqSjJV9+KD/yM22uLBuypv8
	sxCkkqTcdTv3z/bNpVguXEppD0dghagT51vFwNh2Yij3nPNlBBMdGEiZwlYyQ/+WTP2Ltp
	KgkOoA/SSxRVPqCPBT9bZqicmlgom2KDcfvVfrXvaSMP+n0IJkzzKUFzm1K6yZNGbTvCpn
	oWcSNOrSERIcAF041nYr4qHMlNUNGtlRE67+7DrvkPpTDYzFQ8taO0Chl2gAvMy26G51zI
	65FMDYJ95BhXaK1E7gsEuCmi/GoGE2HVrD6Ywq4e0H50qLmfnqasvsP4MRJZ1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723541726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPWBBDJU7xycHw83tZfdCxw6fWdvqJgVNnPRw9B4yYQ=;
	b=Yo+CnOYrpmW3Yt1nO9Kha4AaH4X+qDnHwgTE6qp1Rz+M95+QVDhsKh0Z/K8f4WuGGZGnX9
	9xjWE9A8/DOiS+CA==
To: Kevin Chen <kevin_chen@aspeedtech.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, kevin_chen@aspeedtech.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v1 2/2] irqchip/aspeed-intc: Add support for 10 INTC
 interrupts on AST27XX platforms
In-Reply-To: <20240813074338.969883-3-kevin_chen@aspeedtech.com>
References: <20240813074338.969883-1-kevin_chen@aspeedtech.com>
 <20240813074338.969883-3-kevin_chen@aspeedtech.com>
Date: Tue, 13 Aug 2024 11:35:25 +0200
Message-ID: <87h6borciq.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Aug 13 2024 at 15:43, Kevin Chen wrote:
> There are 10 interrupt source of soc0_intc in CPU die INTC.
>   1. 6 interrupt sources in IO die of soc1_intc0~soc1_intc5.
>   2. 2 interrupt sources in LTPI of ltpi0_intc0 and ltpi0_intc1.
>   3. 2 interrupt sources in LTPI of ltpi1_intc0 and ltpi1_intc1.
> Request GIC interrupt to check each bit in status register to do next
> level INTC handler.
>
> In next level INTC handler of IO die or LTPI INTC using soc1_intcX combining
> 32 interrupt sources into soc0_intc11 in CPU die. In soc1_intcX, handler
> would check 32 bit of status register to do the requested device
> handler.

I can't figure out what this word salad is trying to tell me. Nothing in
the code does any combining. The handler reads the very same
INTC_INT_STATUS_REG.

>

This lacks a Signed-off-by: tag. See Documentation/process/

> ---
>  drivers/irqchip/Makefile          |   1 +
>  drivers/irqchip/irq-aspeed-intc.c | 198 ++++++++++++++++++++++++++++++
> +
> +#define INTC_INT_ENABLE_REG	0x00
> +#define INTC_INT_STATUS_REG	0x04
> +
> +struct aspeed_intc_ic {
> +	void __iomem		*base;
> +	raw_spinlock_t		gic_lock;
> +	raw_spinlock_t		intc_lock;
> +	struct irq_domain	*irq_domain;
> +};
> +
> +static void aspeed_intc_ic_irq_handler(struct irq_desc *desc)
> +{
> +	struct aspeed_intc_ic *intc_ic = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	unsigned long bit, status, flags;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	raw_spin_lock_irqsave(&intc_ic->gic_lock, flags);

There is no point for irqsave(). This code is invoked with interrupts
disabled and please convert to:

        scoped_guard(raw_spinlock, &intc_ic->gic_lock) {

> +	status = readl(intc_ic->base + INTC_INT_STATUS_REG);
> +	for_each_set_bit(bit, &status, 32) {

Please use a define and not a hardcoded number.

> +		generic_handle_domain_irq(intc_ic->irq_domain, bit);
> +		writel(BIT(bit), intc_ic->base + INTC_INT_STATUS_REG);
> +	}

        }

> +	raw_spin_unlock_irqrestore(&intc_ic->gic_lock, flags);
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static void aspeed_intc_irq_mask(struct irq_data *data)
> +{
> +	struct aspeed_intc_ic *intc_ic = irq_data_get_irq_chip_data(data);
> +	unsigned int mask = readl(intc_ic->base + INTC_INT_ENABLE_REG) & ~BIT(data->hwirq);
> +	unsigned long flags;

Invoked with interrupts disabled too.

> +	raw_spin_lock_irqsave(&intc_ic->intc_lock, flags);
> +	writel(mask, intc_ic->base + INTC_INT_ENABLE_REG);
> +	raw_spin_unlock_irqrestore(&intc_ic->intc_lock, flags);

        guard(raw_spinlock)(&intc_ic->intc_lock);
	writel(mask, intc_ic->base + INTC_INT_ENABLE_REG);

> +}
> +
> +static void aspeed_intc_irq_unmask(struct irq_data *data)
> +{
> +	struct aspeed_intc_ic *intc_ic = irq_data_get_irq_chip_data(data);
> +	unsigned int unmask = readl(intc_ic->base + INTC_INT_ENABLE_REG) | BIT(data->hwirq);
> +	unsigned long flags;

Ditto.

> +	raw_spin_lock_irqsave(&intc_ic->intc_lock, flags);
> +	writel(unmask, intc_ic->base + INTC_INT_ENABLE_REG);
> +	raw_spin_unlock_irqrestore(&intc_ic->intc_lock, flags);
> +}
> +
> +static int aspeed_intc_irq_set_affinity(struct irq_data *data, const struct cpumask *dest,
> +					bool force)
> +{
> +	return -EINVAL;
> +}

No point for this stub, just leave irq_set_affinity uninitialized. The
core code checks that pointer for NULL. Aside of that this stub and the
assignment would need a #ifdef CONFIG_SMP guard.

> +static struct irq_chip aspeed_intc_chip = {
> +	.name			= "ASPEED INTC",
> +	.irq_mask		= aspeed_intc_irq_mask,
> +	.irq_unmask		= aspeed_intc_irq_unmask,
> +	.irq_set_affinity	= aspeed_intc_irq_set_affinity,
> +};
> +
> +static int aspeed_intc_ic_map_irq_domain(struct irq_domain *domain, unsigned int irq,
> +					 irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_and_handler(irq, &aspeed_intc_chip, handle_level_irq);
> +	irq_set_chip_data(irq, domain->host_data);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops aspeed_intc_ic_irq_domain_ops = {
> +	.map = aspeed_intc_ic_map_irq_domain,

	.map	= aspeed_intc_ic_map_irq_domain,

> +};
> +
> +static int __init aspeed_intc_ic_of_init(struct device_node *node, struct device_node *parent)
> +{
> +	struct aspeed_intc_ic *intc_ic;
> +	int ret = 0;
> +	int irq;

        int irq, ret;

No point in initializing ret.

> +	intc_ic = kzalloc(sizeof(*intc_ic), GFP_KERNEL);
> +	if (!intc_ic)
> +		return -ENOMEM;
> +
> +	intc_ic->base = of_iomap(node, 0);
> +	if (!intc_ic->base) {
> +		pr_err("Failed to iomap intc_ic base\n");
> +		ret = -ENOMEM;
> +		goto err_free_ic;
> +	}
> +	writel(0xffffffff, intc_ic->base + INTC_INT_STATUS_REG);
> +	writel(0x0, intc_ic->base + INTC_INT_ENABLE_REG);
> +
> +	irq = irq_of_parse_and_map(node, 0);
> +	if (!irq) {
> +		pr_err("Failed to get irq number\n");
> +		ret = -EINVAL;
> +		goto err_iounmap;
> +	}
> +
> +	intc_ic->irq_domain = irq_domain_add_linear(node, 32,
> +						    &aspeed_intc_ic_irq_domain_ops, intc_ic);
> +	if (!intc_ic->irq_domain) {
> +		ret = -ENOMEM;
> +		goto err_iounmap;
> +	}
> +
> +	raw_spin_lock_init(&intc_ic->gic_lock);
> +	raw_spin_lock_init(&intc_ic->intc_lock);
> +
> +	intc_ic->irq_domain->name = "aspeed-intc-domain";

See above.

> +	irq_set_chained_handler_and_data(irq,
> +					 aspeed_intc_ic_irq_handler, intc_ic);
> +
> +	return 0;
> +
> +err_iounmap:
> +	iounmap(intc_ic->base);
> +err_free_ic:
> +	kfree(intc_ic);
> +	return ret;
> +}
> +
> +static int __init aspeed_intc_ic_of_init_v2(struct device_node *node,
> +					    struct device_node *parent)
> +{
> +	struct aspeed_intc_ic *intc_ic;
> +	int ret = 0;
> +	int irq, i;
> +
> +	intc_ic = kzalloc(sizeof(*intc_ic), GFP_KERNEL);
> +	if (!intc_ic)
> +		return -ENOMEM;
> +
> +	intc_ic->base = of_iomap(node, 0);
> +	if (!intc_ic->base) {
> +		pr_err("Failed to iomap intc_ic base\n");
> +		ret = -ENOMEM;
> +		goto err_free_ic;
> +	}
> +	writel(0xffffffff, intc_ic->base + INTC_INT_STATUS_REG);
> +	writel(0x0, intc_ic->base + INTC_INT_ENABLE_REG);
> +
> +	intc_ic->irq_domain = irq_domain_add_linear(node, 32,
> +						    &aspeed_intc_ic_irq_domain_ops, intc_ic);
> +	if (!intc_ic->irq_domain) {
> +		ret = -ENOMEM;
> +		goto err_iounmap;
> +	}
> +
> +	raw_spin_lock_init(&intc_ic->gic_lock);
> +	raw_spin_lock_init(&intc_ic->intc_lock);
> +
> +	intc_ic->irq_domain->name = "aspeed-intc-domain";

So up to this point aspeed_intc_ic_of_init_v2() is a verbatim copy of
aspeed_intc_ic_of_init(). Why can't you reuse that function? It's not
rocket science to make that work.

> +	for (i = 0; i < of_irq_count(node); i++) {
> +		irq = irq_of_parse_and_map(node, i);
> +		if (!irq) {
> +			pr_err("Failed to get irq number\n");
> +			ret = -EINVAL;
> +			goto err_iounmap;

Assume #0 and #1 succeed. #2 fails and leaves the chained handlers and
the irqdomain around, but then unmaps the base and frees the data which
the handler and the domain code needs. Seriously?

> +		} else {

Pointless else as the if clause terminates with a goto.

> +			irq_set_chained_handler_and_data(irq, aspeed_intc_ic_irq_handler, intc_ic);

So if I understand the code correctly then the hardware coalesces the
pending bits into a single status register, but depending on which part
of the SoC raised the interrupt one of the demultiplex interrupts is
raised in the GIC.

Any of those demultiplex interrupt handles _all_ pending bits and
therefore you need gic_lock to serialize them, right?

Thanks,

        tglx
