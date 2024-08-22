Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2185195AC93
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 06:27:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq9Cm6q7cz2yQl
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 14:27:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=v+ZgCF6e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq9Cl4Mmrz2xfT
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 14:27:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6175160F5A;
	Thu, 22 Aug 2024 04:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABF1C4AF09;
	Thu, 22 Aug 2024 04:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724300849;
	bh=7V+H9aiy6Hmq4hq9uhSZuA59Ro8lxYpKbAXrcA3sXLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v+ZgCF6eGa392JfISoJqCnTuDfcClAdh4ysQ90tWOJT9KwmDps2Ub8yXHB8VBfEt9
	 gNm4EtxXR0XFMPuBd3fS7RWPUvFAoIt55q2o82p/TP/yq2vaQjH7uS3t9fbsq+VMv7
	 CFVcp8RUFyDabTFc+aKR7xr/50PvrmGpZ4Joa0EU=
Date: Thu, 22 Aug 2024 12:27:26 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lei Liu <liulei.rjpt@vivo.com>
Subject: Re: [PATCH v1 0/5] usb drivers use devm_clk_get_enabled() helpers
Message-ID: <2024082210-stadium-sly-cf06@gregkh>
References: <20240822040734.29412-1-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822040734.29412-1-liulei.rjpt@vivo.com>
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

On Thu, Aug 22, 2024 at 12:07:25PM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().
> 
> ---
> The files ux500.c, mpfs.c, and pxa27x_udc.c have incorrect usage of 
> certain interfaces due to the lack of synchronization during the 
> commit updates. These issues have been corrected in the v1 version.
> 
> version 1 changes
> 1.ux500: Incorrect usage of clk_prepare_enable() should be corrected to
>   devm_clk_get_enabled().
> 2.mpfs: Incorrect usage of devm_clk_get_enable() should be corrected to
>   devm_clk_get_enabled().
> 3.pxa27x_udc: Incorrect usage of clk_prepare_enable() should be
>   corrected to devm_clk_get_enabled().

Patch versions start at 1, this should be 2, right?

