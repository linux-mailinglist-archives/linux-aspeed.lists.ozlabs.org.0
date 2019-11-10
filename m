Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE03F69B7
	for <lists+linux-aspeed@lfdr.de>; Sun, 10 Nov 2019 16:33:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479yhG1z5dzF36Z
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Nov 2019 02:33:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=213.251.177.50;
 helo=inca-roads.misterjones.org; envelope-from=maz@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
X-Greylist: delayed 2391 seconds by postgrey-1.36 at bilbo;
 Mon, 11 Nov 2019 02:33:11 AEDT
Received: from inca-roads.misterjones.org (inca-roads.misterjones.org
 [213.251.177.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479yh71Qh0zF1SW
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Nov 2019 02:31:51 +1100 (AEDT)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why)
 by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
 (Exim 4.80) (envelope-from <maz@kernel.org>)
 id 1iToaY-0002r6-32; Sun, 10 Nov 2019 15:53:14 +0100
Date: Sun, 10 Nov 2019 14:53:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 02/12] irqchip: Add Aspeed SCU interrupt controller
Message-ID: <20191110145312.3805b25b@why>
In-Reply-To: <1573244313-9190-3-git-send-email-eajames@linux.ibm.com>
References: <1573244313-9190-1-git-send-email-eajames@linux.ibm.com>
 <1573244313-9190-3-git-send-email-eajames@linux.ibm.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, joel@jms.id.au,
 jason@lakedaemon.net, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
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
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri,  8 Nov 2019 14:18:23 -0600
Eddie James <eajames@linux.ibm.com> wrote:

Hi Eddie,

> The Aspeed SOCs provide some interrupts through the System Control
> Unit registers. Add an interrupt controller that provides these
> interrupts to the system.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  MAINTAINERS                         |   1 +
>  drivers/irqchip/Makefile            |   2 +-
>  drivers/irqchip/irq-aspeed-scu-ic.c | 233 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 235 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/irqchip/irq-aspeed-scu-ic.c

[...]

> +static int aspeed_scu_ic_map(struct irq_domain *domain, unsigned int irq,
> +			     irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_and_handler(irq, &aspeed_scu_ic_chip, handle_simple_irq);

handle_simple_irq is usually wrong, and works badly with threaded
interrupts. I suggest you'd change it to handle_level_irq, which
probably matches the behaviour of the controller.

Otherwise, this looks good.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
