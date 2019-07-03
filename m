Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 617EC5EF7F
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jul 2019 01:05:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fGtD3q9MzDqZH
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jul 2019 09:05:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fGt26B23zDqQ5
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Jul 2019 09:05:28 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x63N4tut012603;
 Wed, 3 Jul 2019 18:04:56 -0500
Message-ID: <c8b5e295c34aaf8b3d8b03aeaa980c88d870443a.camel@kernel.crashing.org>
Subject: Re: [patch v3 1/5] AST2500 DMA UART driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg KH <gregkh@linuxfoundation.org>, "sudheer.v" <open.sudheer@gmail.com>
Date: Thu, 04 Jul 2019 09:04:55 +1000
In-Reply-To: <20190703174926.GA12813@kroah.com>
References: <1561459476-14268-1-git-send-email-open.sudheer@gmail.com>
 <1561459476-14268-2-git-send-email-open.sudheer@gmail.com>
 <20190703174926.GA12813@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 sudheer.veliseti@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 shivahshankar@gmail.com, linux-kernel@vger.kernel.org,
 shivahshankar.shankarnarayanrao@aspeedtech.com, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, jslaby@suse.com,
 sudheer veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2019-07-03 at 19:49 +0200, Greg KH wrote:
> > +
> > +     if (tx_sts & UART_SDMA0_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA0_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[0]));
> > +     } else if (tx_sts & UART_SDMA1_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA1_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[1]));
> > +     } else if (tx_sts & UART_SDMA2_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA2_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[2]));
> > +     } else if (tx_sts & UART_SDMA3_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA3_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[3]));
> > +     } else if (tx_sts & UART_SDMA4_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA4_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[4]));
> > +     } else if (tx_sts & UART_SDMA5_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA5_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[5]));
> > +     } else if (tx_sts & UART_SDMA6_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA6_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[6]));
> > +     } else if (tx_sts & UART_SDMA7_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA7_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[7]));
> > +     } else if (tx_sts & UART_SDMA8_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA8_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[8]));
> > +     } else if (tx_sts & UART_SDMA9_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA9_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[9]));
> > +     } else if (tx_sts & UART_SDMA10_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA10_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[10]));
> > +     } else if (tx_sts & UART_SDMA11_INT) {
> > +             ast_uart_sdma_write(sdma, UART_SDMA11_INT, UART_TX_SDMA_ISR);
> > +             ast_sdma_bufffdone(&(sdma->dma_ch->tx_dma_info[11]));
> > +     } else {
> > +     }

Also this should be a for () loop...

Cheers,
Ben.


