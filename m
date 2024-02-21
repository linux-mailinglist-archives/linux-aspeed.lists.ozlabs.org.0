Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1839578DB
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHY642Qz3cLV
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.a=rsa-sha256 header.s=x header.b=lO+1jSA2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hugovil.com (client-ip=162.243.120.170; helo=mail.hugovil.com; envelope-from=hugo@hugovil.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1843 seconds by postgrey-1.37 at boromir; Thu, 22 Feb 2024 06:25:47 AEDT
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg5pg66bkz3cGg
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Feb 2024 06:25:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=Gx8Pfqp+y6ASQB8ZhO8FSQgg3ZRRiF9AlxCIvFk4iFE=; b=lO+1jSA2jFreXwBbqs36SCeJq5
	epTNSwwEakid+hzaoMpthjve+aKKe6/WwxDVL1s1np9EJpLPBvgD4DrOUzXPKaxkPx5Wk1Ln2AuNq
	s1tDXxdDTajNp0TJya8yXa9ylkrr9v2kVOC5SSntYWQOyZyAbb9BtTcO2mq+muLcyZis=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:56330 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1rcrk5-0000ah-NF; Wed, 21 Feb 2024 13:54:53 -0500
Date: Wed, 21 Feb 2024 13:54:52 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-Id: <20240221135452.6fdeb71e60509cca1be016c3@hugovil.com>
In-Reply-To: <20240221183442.4124354-2-andriy.shevchenko@linux.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
	<20240221183442.4124354-2-andriy.shevchenko@linux.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: 	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.0 T_SCC_BODY_TEXT_LINE No description available.
	* -3.3 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A,
	T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v1 01/14] serial: core: Move struct uart_port::quirks
 closer to possible values
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Andi Shyti <andi.shyti@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 21 Feb 2024 20:31:17 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Currently it's not crystal clear what UPIO_* and UPQ_* definitions
> belong two. Reindent the code, so it will be easy to read and understand.

two -> to.

Hugo V.


> No functional changes intended.
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/serial_core.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> index 55b1f3ba48ac..2d2ec99eca93 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -467,8 +467,8 @@ struct uart_port {
>  	unsigned int		fifosize;		/* tx fifo size */
>  	unsigned char		x_char;			/* xon/xoff char */
>  	unsigned char		regshift;		/* reg offset shift */
> +
>  	unsigned char		iotype;			/* io access style */
> -	unsigned char		quirks;			/* internal quirks */
>  
>  #define UPIO_PORT		(SERIAL_IO_PORT)	/* 8b I/O port access */
>  #define UPIO_HUB6		(SERIAL_IO_HUB6)	/* Hub6 ISA card */
> @@ -479,7 +479,9 @@ struct uart_port {
>  #define UPIO_MEM32BE		(SERIAL_IO_MEM32BE)	/* 32b big endian */
>  #define UPIO_MEM16		(SERIAL_IO_MEM16)	/* 16b little endian */
>  
> -	/* quirks must be updated while holding port mutex */
> +	unsigned char		quirks;			/* internal quirks */
> +
> +	/* internal quirks must be updated while holding port mutex */
>  #define UPQ_NO_TXEN_TEST	BIT(0)
>  
>  	unsigned int		read_status_mask;	/* driver specific */
> -- 
> 2.43.0.rc1.1.gbec44491f096
> 
> 


-- 
Hugo Villeneuve
