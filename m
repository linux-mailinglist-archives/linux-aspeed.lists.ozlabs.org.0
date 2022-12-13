Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C964B76D
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Dec 2022 15:32:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWgv554p3z3bhW
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Dec 2022 01:32:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UeIoSVBu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UeIoSVBu;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWgv12xKcz3bXC
	for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Dec 2022 01:32:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E7156155B;
	Tue, 13 Dec 2022 14:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E684C433D2;
	Tue, 13 Dec 2022 14:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670941946;
	bh=6Las1K6UsElcFFPKMNMg/lxZmRcl29cdsCfhLvP95Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeIoSVBuUB/0IelecfTsfwwOBLOjzk4biEag1yZSGBsgssA16IZz7Zw3OF7b+Vy2V
	 3PH0MIiz/Y5bbJne7eAkOxpYE7wdDgq4SQY81kalO1rwQ0uyOSVFyVMea04l3GBuJV
	 68y42W5AGZiQuabz+FWzGA2XCMnqzGE7ALHC5oO4=
Date: Tue, 13 Dec 2022 15:32:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: Add check for
 dma_alloc_coherent
Message-ID: <Y5iM90xfRT65Invq@kroah.com>
References: <20221213122116.43278-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213122116.43278-1-jiasheng@iscas.ac.cn>
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
Cc: linux-aspeed@lists.ozlabs.org, neal_liu@aspeedtech.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org, christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Dec 13, 2022 at 08:21:16PM +0800, Jiasheng Jiang wrote:
> Add the check for the return value of dma_alloc_coherent
> in order to avoid NULL pointer dereference.
> 
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Again, please prove that you tested this and follow the requirements at:
	Documentation/process/researcher-guidelines.rst
in order for us to be able to accept your changes.

thanks,

greg k-h
