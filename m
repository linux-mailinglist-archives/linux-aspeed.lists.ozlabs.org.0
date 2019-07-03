Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F565EADA
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Jul 2019 19:51:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f7vB1WRdzDqV6
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jul 2019 03:51:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="TPsSfCEu"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f7v25ChtzDqP8
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Jul 2019 03:50:54 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CBFCB21881;
 Wed,  3 Jul 2019 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562176252;
 bh=LhdcBhsnrhraeLgizT0jLEoW9JPQnXumK31uO9etz2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TPsSfCEuB2yof7PvwE2sRSg8fdm206cTwyGUd4Pnto3QAqzL8T7Mgk4fDOdXBOlLL
 VW0187SOa7Ukt81KdD3vDld1JyT1X9Qc9F/T2SzDLgOh2a7+OIUA7eSF96dclar4R5
 xhsiy6PPUeezDFQSJ2ACKxXVxKO3ez2LVpp29HV8=
Date: Wed, 3 Jul 2019 19:50:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "sudheer.v" <open.sudheer@gmail.com>
Subject: Re: [patch v3 3/5] DT nodes for AST2500 DMA UART driver
Message-ID: <20190703175050.GC12813@kroah.com>
References: <1561459476-14268-1-git-send-email-open.sudheer@gmail.com>
 <1561459476-14268-4-git-send-email-open.sudheer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561459476-14268-4-git-send-email-open.sudheer@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

On Tue, Jun 25, 2019 at 04:14:34PM +0530, sudheer.v wrote:
> From: sudheer veliseti <sudheer.open@gmail.com>
> 
> DT node for DMA controller(ast_uart_sdma) doesn't bind to any DMA controller driver.
> This is because Software for DMA controller is not based on DMA framework,but is dedicated
> and serves only UARTs in AST2500. ast_uart_sdma node is searched by compatible string in the 
> driver software.basic use of this node is to provide register base address of DMA controller and DMA irq number(<50>).
> IRQ of DMA controller is of crucial importance, which does RX and TX of UART data. 

Properly line-wrap your changelog.

thanks,

greg k-h
