Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FF595ACC7
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 07:14:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqBGL72JPz2yQG
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 15:14:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.73.55
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bvmPV9NX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqBGJ46txz2xZK
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 15:14:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C88D0CE0FAA;
	Thu, 22 Aug 2024 05:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A4FC4AF0C;
	Thu, 22 Aug 2024 05:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724303684;
	bh=ngDz7AVNJAUvMqiSy4yLF8BEcn3Ug63o03RV0QSI7As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvmPV9NXqdombM0PixL1Rz1L8hnVmLhM/nT7uN//JOYsQ4ikNMF4yIjWioKyAHi7U
	 i1IPgzSne267LhLUlNoDVXZKlNvHax8kXpgU9jOIBr4GZP6TvgTZNiVgQkETYXemrQ
	 oWf4eUnU3vvEMu6Tf16e32MKRtt5lGZ+5sHH+XHo=
Date: Thu, 22 Aug 2024 13:14:41 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lei Liu <liulei.rjpt@vivo.com>
Subject: Re: [PATCH v1 0/5] usb drivers use devm_clk_get_enabled() helpers
Message-ID: <2024082227-sports-resource-9c65@gregkh>
References: <20240822040734.29412-1-liulei.rjpt@vivo.com>
 <2024082210-stadium-sly-cf06@gregkh>
 <b356bdb2-fc17-44ef-b0e5-3868b452a8c2@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b356bdb2-fc17-44ef-b0e5-3868b452a8c2@vivo.com>
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

On Thu, Aug 22, 2024 at 12:46:10PM +0800, Lei Liu wrote:
> 
> on 2024/8/22 12:27, Greg Kroah-Hartman wrote:
> > On Thu, Aug 22, 2024 at 12:07:25PM +0800, Lei Liu wrote:
> > > The devm_clk_get_enabled() helpers:
> > >      - call devm_clk_get()
> > >      - call clk_prepare_enable() and register what is needed in order to
> > >       call clk_disable_unprepare() when needed, as a managed resource.
> > > 
> > > This simplifies the code and avoids calls to clk_disable_unprepare().
> > > 
> > > ---
> > > The files ux500.c, mpfs.c, and pxa27x_udc.c have incorrect usage of
> > > certain interfaces due to the lack of synchronization during the
> > > commit updates. These issues have been corrected in the v1 version.
> > > 
> > > version 1 changes
> > > 1.ux500: Incorrect usage of clk_prepare_enable() should be corrected to
> > >    devm_clk_get_enabled().
> > > 2.mpfs: Incorrect usage of devm_clk_get_enable() should be corrected to
> > >    devm_clk_get_enabled().
> > > 3.pxa27x_udc: Incorrect usage of clk_prepare_enable() should be
> > >    corrected to devm_clk_get_enabled().
> > Patch versions start at 1, this should be 2, right?
> 
> Hi，Do I need to update the patch from v1 to v2 again?

Yes please, otherwise our tools will get confused.

greg k-h
