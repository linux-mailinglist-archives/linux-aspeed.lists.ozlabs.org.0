Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5796D0762
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:42:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4QY1g3CzDqK9
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 17:42:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=maz@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46d6YG43X0zDqTh
 for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2019 02:47:13 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D508142F;
 Tue, 24 Sep 2019 09:47:09 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 C387A3F694; Tue, 24 Sep 2019 09:47:07 -0700 (PDT)
Subject: Re: [PATCH 2/4] irqchip: Add Aspeed SCU interrupt controller
To: Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <1569341672-27632-1-git-send-email-eajames@linux.ibm.com>
 <1569341672-27632-3-git-send-email-eajames@linux.ibm.com>
From: Marc Zyngier <maz@kernel.org>
Organization: Approximate
Message-ID: <3e866ea1-ee45-8067-09db-422d6c843fca@kernel.org>
Date: Tue, 24 Sep 2019 17:47:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569341672-27632-3-git-send-email-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 09 Oct 2019 17:41:41 +1100
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net,
 linux-aspeed@lists.ozlabs.org, robh+dt@kernel.org, tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Eddie,

On 24/09/2019 17:14, Eddie James wrote:
> The Aspeed SOCs provide some interrupts through the System Control
> Unit registers. Add an interrupt controller that provides these
> interrupts to the system.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  MAINTAINERS                         |   1 +
>  drivers/irqchip/Makefile            |   2 +-
>  drivers/irqchip/irq-aspeed-scu-ic.c | 199 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 201 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/irqchip/irq-aspeed-scu-ic.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a1687b..f3f6c3d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2655,6 +2655,7 @@ M:	Eddie James <eajames@linux.ibm.com>
>  L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
> +F:	drivers/irqchip/irq-aspeed-scu-ic.c
>  F:	include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
>  
>  ASPEED VIDEO ENGINE DRIVER
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index cc7c439..fce6b1d 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -86,7 +86,7 @@ obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
>  obj-$(CONFIG_MVEBU_SEI)			+= irq-mvebu-sei.o
>  obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
>  obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
> -obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
> +obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-scu-ic.o
>  obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
>  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
>  obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+= irq-uniphier-aidet.o
> diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
> new file mode 100644
> index 0000000..a23802d
> --- /dev/null
> +++ b/drivers/irqchip/irq-aspeed-scu-ic.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Aspeed AST24XX, AST25XX, and AST26XX SCU Interrupt Controller
> + * Copyright 2019 IBM Corporation
> + *
> + * Eddie James <eajames@linux.ibm.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/io.h>
> +
> +#define ASPEED_SCU_IC_SHIFT		0
> +#define ASPEED_SCU_IC_ENABLE		GENMASK(6, ASPEED_SCU_IC_SHIFT)
> +#define ASPEED_SCU_IC_NUM_IRQS		7
> +#define ASPEED_SCU_IC_STATUS_SHIFT	16
> +
> +#define ASPEED_AST2600_SCU_IC0_SHIFT	0
> +#define ASPEED_AST2600_SCU_IC0_ENABLE	\
> +	GENMASK(5, ASPEED_AST2600_SCU_IC0_SHIFT)
> +#define ASPEED_AST2600_SCU_IC0_NUM_IRQS	6
> +
> +#define ASPEED_AST2600_SCU_IC1_SHIFT	4
> +#define ASPEED_AST2600_SCU_IC1_ENABLE	\
> +	GENMASK(5, ASPEED_AST2600_SCU_IC1_SHIFT)
> +#define ASPEED_AST2600_SCU_IC1_NUM_IRQS	2
> +
> +struct aspeed_scu_ic {
> +	unsigned long irq_enable;
> +	unsigned long irq_shift;
> +	unsigned int num_irqs;
> +	void __iomem *regs;
> +	struct irq_domain *irq_domain;
> +};
> +
> +static void aspeed_scu_ic_irq_handler(struct irq_desc *desc)
> +{
> +	unsigned int irq;
> +	unsigned long bit;
> +	unsigned long enabled;
> +	unsigned long max;
> +	unsigned long status;
> +	struct aspeed_scu_ic *scu_ic = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +
> +	chained_irq_enter(chip, desc);
> +
> +	status = readl(scu_ic->regs);

You may want to be easy on the interconnect and turn these readl/writel
into their relaxed version. This will remove a number of unnecessary
barriers.

> +	enabled = status & scu_ic->irq_enable;
> +	status = (status >> ASPEED_SCU_IC_STATUS_SHIFT) & enabled;

This masking looks weird. Does it mean that the status register is split
in half, with the two half serving different purposes? This requires
some documentation...

> +
> +	bit = scu_ic->irq_shift;
> +	max = scu_ic->num_irqs + bit;
> +
> +	for_each_set_bit_from(bit, &status, max) {
> +		irq = irq_find_mapping(scu_ic->irq_domain,
> +				       bit - scu_ic->irq_shift);
> +		generic_handle_irq(irq);
> +
> +		writel(enabled | BIT(bit + ASPEED_SCU_IC_STATUS_SHIFT),
> +		       scu_ic->regs);
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static void aspeed_scu_ic_irq_mask(struct irq_data *data)
> +{
> +	struct aspeed_scu_ic *scu_ic = irq_data_get_irq_chip_data(data);
> +	unsigned long bit = BIT(data->hwirq + scu_ic->irq_shift);
> +	unsigned long reg = readl(scu_ic->regs);
> +
> +	writel((reg & ~bit) & scu_ic->irq_enable, scu_ic->regs);

What if you have another CPU masking or unmasking another interrupt at
the same time? These RMW operations need to be protected.

> +}
> +
> +static void aspeed_scu_ic_irq_unmask(struct irq_data *data)
> +{
> +	struct aspeed_scu_ic *scu_ic = irq_data_get_irq_chip_data(data);
> +	unsigned long bit = BIT(data->hwirq + scu_ic->irq_shift);
> +	unsigned long reg = readl(scu_ic->regs);
> +
> +	writel((reg | bit) & scu_ic->irq_enable, scu_ic->regs);
> +}
> +
> +struct irq_chip aspeed_scu_ic_chip = {
> +	.name		= "aspeed-scu-ic",
> +	.irq_mask	= aspeed_scu_ic_irq_mask,
> +	.irq_unmask	= aspeed_scu_ic_irq_unmask,

In an SMP system, you may want to provide an affinity callback returning
-EINVAL.

> +};
> +
> +static int aspeed_scu_ic_map(struct irq_domain *domain, unsigned int irq,
> +			     irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_and_handler(irq, &aspeed_scu_ic_chip, handle_simple_irq);
> +	irq_set_chip_data(irq, domain->host_data);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops aspeed_scu_ic_domain_ops = {
> +	.map = aspeed_scu_ic_map,
> +};
> +
> +static int aspeed_scu_ic_of_init_common(struct aspeed_scu_ic *scu_ic,
> +					struct device_node *node)
> +{
> +	int irq;
> +	int rc = 0;
> +
> +	scu_ic->regs = of_iomap(node, 0);
> +	if (!scu_ic->regs) {
> +		rc = -ENOMEM;
> +		goto err_free;
> +	}
> +
> +	irq = irq_of_parse_and_map(node, 0);
> +	if (irq < 0) {
> +		rc = irq;
> +		goto err_iounmap;
> +	}
> +
> +	scu_ic->irq_domain = irq_domain_add_linear(node, scu_ic->num_irqs,
> +						   &aspeed_scu_ic_domain_ops,
> +						   scu_ic);
> +	if (!scu_ic->irq_domain) {
> +		rc = -ENOMEM;
> +		goto err_iounmap;
> +	}
> +
> +	irq_set_chained_handler_and_data(irq, aspeed_scu_ic_irq_handler,
> +					 scu_ic);
> +
> +	return 0;
> +
> +err_iounmap:
> +	iounmap(scu_ic->regs);
> +
> +err_free:
> +	kfree(scu_ic);
> +
> +	return rc;
> +}
> +
> +static int __init aspeed_scu_ic_of_init(struct device_node *node,
> +					struct device_node *parent)
> +{
> +	struct aspeed_scu_ic *scu_ic = kzalloc(sizeof(*scu_ic), GFP_KERNEL);
> +
> +	if (!scu_ic)
> +		return -ENOMEM;
> +
> +	scu_ic->irq_enable = ASPEED_SCU_IC_ENABLE;
> +	scu_ic->irq_shift = ASPEED_SCU_IC_SHIFT;
> +	scu_ic->num_irqs = ASPEED_SCU_IC_NUM_IRQS;
> +
> +	return aspeed_scu_ic_of_init_common(scu_ic, node);
> +}
> +
> +static int __init aspeed_ast2600_scu_ic0_of_init(struct device_node *node,
> +						 struct device_node *parent)
> +{
> +	struct aspeed_scu_ic *scu_ic = kzalloc(sizeof(*scu_ic), GFP_KERNEL);
> +
> +	if (!scu_ic)
> +		return -ENOMEM;
> +
> +	scu_ic->irq_enable = ASPEED_AST2600_SCU_IC0_ENABLE;
> +	scu_ic->irq_shift = ASPEED_AST2600_SCU_IC0_SHIFT;
> +	scu_ic->num_irqs = ASPEED_AST2600_SCU_IC0_NUM_IRQS;
> +
> +	return aspeed_scu_ic_of_init_common(scu_ic, node);
> +}
> +
> +static int __init aspeed_ast2600_scu_ic1_of_init(struct device_node *node,
> +						 struct device_node *parent)
> +{
> +	struct aspeed_scu_ic *scu_ic = kzalloc(sizeof(*scu_ic), GFP_KERNEL);
> +
> +	if (!scu_ic)
> +		return -ENOMEM;
> +
> +	scu_ic->irq_enable = ASPEED_AST2600_SCU_IC1_ENABLE;
> +	scu_ic->irq_shift = ASPEED_AST2600_SCU_IC1_SHIFT;
> +	scu_ic->num_irqs = ASPEED_AST2600_SCU_IC1_NUM_IRQS;
> +
> +	return aspeed_scu_ic_of_init_common(scu_ic, node);
> +}
> +
> +IRQCHIP_DECLARE(ast2400_scu_ic, "aspeed,ast2400-scu-ic", aspeed_scu_ic_of_init);
> +IRQCHIP_DECLARE(ast2500_scu_ic, "aspeed,ast2500-scu-ic", aspeed_scu_ic_of_init);
> +IRQCHIP_DECLARE(ast2600_scu_ic0, "aspeed,ast2600-scu-ic0",
> +		aspeed_ast2600_scu_ic0_of_init);
> +IRQCHIP_DECLARE(ast2600_scu_ic1, "aspeed,ast2600-scu-ic1",
> +		aspeed_ast2600_scu_ic1_of_init);
> 

This otherwise looks nice and clean.

	M.
-- 
Jazz is not dead, it just smells funny...
