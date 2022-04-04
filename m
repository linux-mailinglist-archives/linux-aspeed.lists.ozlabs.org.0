Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB55F4F177E
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Apr 2022 16:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXD9R682sz2yMk
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Apr 2022 00:46:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=F4SvhD9u;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=F4SvhD9u; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXD9M66Hkz2xB1
 for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Apr 2022 00:45:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89CA4B8171F;
 Mon,  4 Apr 2022 14:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A597FC340EE;
 Mon,  4 Apr 2022 14:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649083553;
 bh=k9WAcFBCFfb+3TY2XrOQKaVZhD+Dcxfd/5cZ6RmH+D4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F4SvhD9u8ufJSVbfTnoJX2D4cS2Z0ggUcxa/IR5dnmJ8NSOTR7xfILZAzjGHcr/JW
 e4M47qdBhXdxqmjzbckSKIsTr4tjgA70Q7WU5fIEpfD8ffMjmRhz8SnPZkT5nDtksg
 SsrhO+Iqx038tynbid79VN1Dcu/cAwwcduH2S0nE=
Date: Mon, 4 Apr 2022 16:45:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] serial: 8250_aspeed_vuart: Fix potential NULL
 dereference in aspeed_vuart_probe
Message-ID: <YksEnnyJDoL+fE5d@kroah.com>
References: <20220404143842.16960-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404143842.16960-1-linmq006@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Yang Guang <yang.guang5@zte.com.cn>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Apr 04, 2022 at 02:38:40PM +0000, Miaoqian Lin wrote:
> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference.
> 
> Fixes: 54da3e381c2b ("serial: 8250_aspeed_vuart: use UPF_IOREMAP to set up register mapping")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 93fe10c680fb..9d2a7856784f 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -429,6 +429,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>  	timer_setup(&vuart->unthrottle_timer, aspeed_vuart_unthrottle_exp, 0);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;

How did you test this change was correct?
