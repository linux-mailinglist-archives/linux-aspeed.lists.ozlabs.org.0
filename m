Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9C295AC9F
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 06:36:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq9QQ6HV2z2yQG
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 14:36:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lrR6V68Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 583 seconds by postgrey-1.37 at boromir; Thu, 22 Aug 2024 14:36:44 AEST
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq9QN1K8Xz2xYk
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 14:36:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7748A4212E;
	Thu, 22 Aug 2024 04:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CC6C4AF09;
	Thu, 22 Aug 2024 04:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724300815;
	bh=vH1hkgrRUpB1Fxi+zqhCcwdl2caWcSsBMzt+Av44d8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrR6V68Z8TGghTu18GVdIYBnnYJuF6Y4AgCuC5UHChF2yXmeUGeckuea7LW+e9rkS
	 ta7WlFoiZcX5QOndp2e16UjCVE4V9AEf/2+5ieqxWTtogySnjD3/vcBlSmZDmjXdro
	 BggdDNNagVnfEf0Ix+s1pFWhf6lABC9rktij+kLc=
Date: Thu, 22 Aug 2024 12:26:51 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lei Liu <liulei.rjpt@vivo.com>
Subject: Re: [PATCH 2/5] usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
Message-ID: <2024082240-gallery-stinger-5901@gregkh>
References: <20240821121048.31566-1-liulei.rjpt@vivo.com>
 <20240821121048.31566-3-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821121048.31566-3-liulei.rjpt@vivo.com>
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
Cc: linux-arm-kernel@lists.infradead.org, opensource.kernel@vivo.com, linux-aspeed@lists.ozlabs.org, Daire McNamara <daire.mcnamara@microchip.com>, Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, Andrew Jeffery <andrew@codeconstruct.com.au>, Robert Jarzmik <robert.jarzmik@free.fr>, Bin Liu <b-liu@ti.com>, Daniel Mack <daniel@zonque.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2024 at 08:10:40PM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().
> 
> Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
> ---
>  drivers/usb/gadget/udc/pxa27x_udc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
> index 1a6317e4b2a3..6e99e75f1acb 100644
> --- a/drivers/usb/gadget/udc/pxa27x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -2398,14 +2398,10 @@ static int pxa_udc_probe(struct platform_device *pdev)
>  	if (udc->gpiod)
>  		gpiod_direction_output(udc->gpiod, 0);
>  
> -	udc->clk = devm_clk_get(&pdev->dev, NULL);
> +	udc->clk = clk_prepare_enable(&pdev->dev, NULL);

You didn't test build this code :(

