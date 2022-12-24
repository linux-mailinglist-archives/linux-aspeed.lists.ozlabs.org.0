Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B246558AB
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Dec 2022 07:37:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NfDrF10Fnz3bfD
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Dec 2022 17:37:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=e/xs47Nr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=e/xs47Nr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NfDr545TFz30Bp
	for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Dec 2022 17:37:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 15F166006F;
	Sat, 24 Dec 2022 06:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A653BC433D2;
	Sat, 24 Dec 2022 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671863856;
	bh=/38IVuA7PEniyulc/5p3MH83Z0S0l/GkZGr7fxcOHlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/xs47NrvMxbZrOcspCL/f131I/YtyPzR+JHr+exRnFQOLDCy3RH30sVbJvJUQ/X5
	 AUoKWGqQubnv5O4Nbjwoid1bx+c2taE7D7KNKgLFAKE9j7JtXN3cS4aKzXX4XvNxEb
	 bOfWEIWXSLwgIA9fZLyZBh6mHnagkn1EMNXa36Us=
Date: Sat, 24 Dec 2022 07:37:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v3] usb: gadget: aspeed_udc: Add check for
 dma_alloc_coherent
Message-ID: <Y6aeLMAu+XCYTxt6@kroah.com>
References: <20221224025001.24503-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221224025001.24503-1-jiasheng@iscas.ac.cn>
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

On Sat, Dec 24, 2022 at 10:50:01AM +0800, Jiasheng Jiang wrote:
> Yes, it is the same as mine.
> As the previous patch had not been merged into the Linux kernel,
> my tool found the same error and report it.
> And both of us chose the most concise way to fix the error.
> That is why the patches are the same.

I have no context at all here, what does this refer to?

confused,

greg k-h
