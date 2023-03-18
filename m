Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E0D6C5C48
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 02:49:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhpDb2HhPz3chv
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Mar 2023 12:49:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sina.com (client-ip=202.108.3.19; helo=r3-19.sinamail.sina.com.cn; envelope-from=hdanton@sina.com; receiver=<UNKNOWN>)
X-Greylist: delayed 136 seconds by postgrey-1.36 at boromir; Sat, 18 Mar 2023 14:03:52 AEDT
Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pdm6c3ZHnz3cMT
	for <linux-aspeed@lists.ozlabs.org>; Sat, 18 Mar 2023 14:03:50 +1100 (AEDT)
Received: from unknown (HELO localhost.localdomain)([114.249.61.130])
	by sina.com (172.16.97.35) with ESMTP
	id 641529610001DA0C; Sat, 18 Mar 2023 11:00:50 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 98080415073823
From: Hillf Danton <hdanton@sina.com>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v2 3/5] dmaengine: aspeed: Add AST2600 UART DMA driver
Date: Sat, 18 Mar 2023 11:01:13 +0800
Message-Id: <20230318030113.2024-1-hdanton@sina.com>
In-Reply-To: <20230314021817.30446-4-chiawei_wang@aspeedtech.com>
References: <20230314021817.30446-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Mar 2023 12:49:28 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 14 Mar 2023 10:18:15 +0800 Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> +static irqreturn_t ast2600_udma_isr(int irq, void *arg)
> +{

[...]

> +	/* handle RX interrupt */
> +	sts = readl(udma->regs + UDMA_RX_INT_STS);
> +	for_each_set_bit(ch_bit, (unsigned long *)&sts, udma->n_ucs / 2) {
> +		ch_id = (ch_bit << 1) + 1;
> +		wptr = readl(udma->regs + UDMA_CH_WPTR(ch_id));
> +
> +		uc = &udma->ucs[ch_id];
> +		ud = &uc->ud;
> +		tx = &ud->tx;
> +
> +		uc->residue = (ud->size & ~UDMA_CH_CTRL_BUFSZ) - wptr;
> +
> +		/* handle non-4B-aligned case */
> +		if (ud->addr & 0x3) {
> +			p = phys_to_virt(dma_to_phys(uc->chan.device->dev, ud->addr));

This does not work if the dma address has no corresponding struct page.

> +			memcpy(p, uc->buf, wptr);
> +		}
> +
> +		ast2600_udma_terminate(&uc->chan);
> +
> +		dma_cookie_complete(tx);
> +		dma_descriptor_unmap(tx);
> +		dmaengine_desc_get_callback_invoke(tx, NULL);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
