Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 906E6387202
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 May 2021 08:38:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkmXn4BWDz2ymV
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 May 2021 16:38:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=on/bfYxo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=on/bfYxo; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkmXj2W18z2xg5;
 Tue, 18 May 2021 16:38:13 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62CD9611B0;
 Tue, 18 May 2021 06:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621319890;
 bh=A/cflykcOTYV4DtVK9ADdAYseWeD5YVtDHXFY/y2UVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=on/bfYxol0bSNMXWXbOrxdMvGc2OTG+ePP/gS1AvrvWNTnzMwI0G53tjQ8emREgZr
 KfYSWtnrkbk2MQVjeuAb3c2pZJGWbHdBJRVwYRzDleDGVfJr9pkuoZeD3fSUwrG3kF
 mieEvmVd9DhafQ1WIAFdy44feYWFiNqyrNpOQUA0=
Date: Tue, 18 May 2021 08:38:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] tty: 8250: Add UART_BUG_TXRACE workaround for Aspeed VUART
Message-ID: <YKNgziMXms4zWRoY@kroah.com>
References: <20210517124105.3565860-1-andrew@aj.id.au>
 <YKJ6aP/xqAe1hW6A@kroah.com>
 <d7918dcf-b938-498c-a012-3d93a748431b@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7918dcf-b938-498c-a012-3d93a748431b@www.fastmail.com>
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
Cc: Milton Miller II <miltonm@us.ibm.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, jenmin_yuan@aspeedtech.com,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, May 18, 2021 at 11:00:39AM +0930, Andrew Jeffery wrote:
> 
> 
> On Mon, 17 May 2021, at 23:45, Greg KH wrote:
> > On Mon, May 17, 2021 at 10:11:05PM +0930, Andrew Jeffery wrote:
> > > Aspeed Virtual UARTs directly bridge e.g. the system console UART on the
> > > LPC bus to the UART interface on the BMC's internal APB. As such there's
> > > no RS-232 signalling involved - the UART interfaces on each bus are
> > > directly connected as the producers and consumers of the one set of
> > > FIFOs.
> > > 
> > > The APB in the AST2600 generally runs at 100MHz while the LPC bus peaks
> > > at 33MHz. The difference in clock speeds exposes a race in the VUART
> > > design where a Tx data burst on the APB interface can result in a byte
> > > lost on the LPC interface. The symptom is LSR[DR] remains clear on the
> > > LPC interface despite data being present in its Rx FIFO, while LSR[THRE]
> > > remains clear on the APB interface as the host has not consumed the data
> > > the BMC has transmitted. In this state, the UART has stalled and no
> > > further data can be transmitted without manual intervention (e.g.
> > > resetting the FIFOs, resulting in loss of data).
> > > 
> > > The recommended work-around is to insert a read cycle on the APB
> > > interface between writes to THR.
> > > 
> > > Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  drivers/tty/serial/8250/8250.h              | 1 +
> > >  drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
> > >  drivers/tty/serial/8250/8250_port.c         | 2 ++
> > >  3 files changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> > > index 52bb21205bb6..4d6f5e0ecd4c 100644
> > > --- a/drivers/tty/serial/8250/8250.h
> > > +++ b/drivers/tty/serial/8250/8250.h
> > > @@ -88,6 +88,7 @@ struct serial8250_config {
> > >  #define UART_BUG_NOMSR	(1 << 2)	/* UART has buggy MSR status bits (Au1x00) */
> > >  #define UART_BUG_THRE	(1 << 3)	/* UART has buggy THRE reassertion */
> > >  #define UART_BUG_PARITY	(1 << 4)	/* UART mishandles parity if FIFO enabled */
> > > +#define UART_BUG_TXRACE (1 << 5)	/* UART Tx fails to set remote DR */
> > 
> > BUG()?
> 
> Can you please expand on what you mean here? I don't follow.
> 
> At least, I think there might be a formatting issue (spaces vs tabs).

Ick, my fault, I meant "BIT()"?  To perhaps use that macro instead of the <<
symbol.

And yes, tabs would be good as well :)

thanks,

greg k-h


