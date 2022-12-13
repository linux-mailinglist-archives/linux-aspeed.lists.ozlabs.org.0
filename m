Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 473E464B76A
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Dec 2022 15:32:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWgtl1D2kz3bXC
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Dec 2022 01:32:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jlmq5QBy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jlmq5QBy;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWgtG2Y8Pz3cJg
	for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Dec 2022 01:31:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61E5A6155B;
	Tue, 13 Dec 2022 14:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FC1C433D2;
	Tue, 13 Dec 2022 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670941908;
	bh=BP2D20qqRsIgeqfE7Stzv2DTidQHJtwB4teSCmQKVj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlmq5QByNg1QkkSq1g5C/mXAcKM4f6kMEiusL6jQY3OvCgdwnRbntw2b+Rl6mLtl0
	 iZo1H/SzhFO1b4iYIDXzsVtWcp/stnRzk8YOTP9FGJm8+0cN3iu5IVPVjnj3wVZUjp
	 vs1dU1UTxlp+eGO4d/UtDwpX0kA7RV7jDZnJKBTg=
Date: Tue, 13 Dec 2022 15:31:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: Add check for dma_alloc_coherent
Message-ID: <Y5iM0LG2V5zN2D9u@kroah.com>
References: <20221213121520.18088-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213121520.18088-1-jiasheng@iscas.ac.cn>
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

On Tue, Dec 13, 2022 at 08:15:20PM +0800, Jiasheng Jiang wrote:
> Thanks, I found my mistake and I will submit a v2.
> 
> > And how did you find this potential problem?  What tool did you use and
> > why did you not follow the documentation for properly describing the
> > tool?
> 
> I used a tool I wrote myself to find it, which is unpublished.
> Therefore, I think it is okay to submit patches without description of the
> tools.

Nope!  Please read:
	Documentation/process/researcher-guidelines.rst
for what you must do.

thanks,

greg k-h
