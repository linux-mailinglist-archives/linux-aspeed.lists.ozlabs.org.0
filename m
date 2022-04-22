Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1B50B7CD
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Apr 2022 15:00:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlDyv3JNfz3bbj
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Apr 2022 23:00:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JecLKEyg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=JecLKEyg; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlDyp6FYxz2xm2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 23:00:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D5482B82D1F;
 Fri, 22 Apr 2022 12:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038CFC385A8;
 Fri, 22 Apr 2022 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1650632397;
 bh=EuI02HnZPhPPNa3QKg88JZRW0CEqpWBj8AMo5mHer+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JecLKEygMG9ILc1dRzuK3b4RNTdFfnvWcZF9hCg/xrhiaMRzPmi4nkX9j9cttsj+E
 Q+DPYQlCUr90BGFxlMdtbFcEpV5ooPCAfjY2FUR2uGa9CDuPrgk1BzJu7WO7zv3E0i
 ac2V+8AmGIU96/YneETnRD7wZbHagqEmeSD3vPOU=
Date: Fri, 22 Apr 2022 14:59:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Subject: Re: [PATCH] aspeed-vhub: epn: fix an incorrect member check on list
 iterator
Message-ID: <YmKmysEfb9GY5ng4@kroah.com>
References: <20220327062431.5847-1-xiam0nd.tong@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220327062431.5847-1-xiam0nd.tong@gmail.com>
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
Cc: balbi@kernel.org, linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, caihuoqing@baidu.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Mar 27, 2022 at 02:24:31PM +0800, Xiaomeng Tong wrote:
> The bug is here:
> 	if (&req->req == u_req) {
> 
> The list iterator 'req' will point to a bogus position containing
> HEAD if the list is empty or no element is found. This case must
> be checked before any use of the iterator, otherwise it may bypass
> the 'if (&req->req == u_req) {' check in theory, if '*u_req' obj is
> just allocated in the same addr with '&req->req'.
> 
> To fix this bug, just mova all thing inside the loop and return 0,
> otherwise return error.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7ecca2a4080cb ("usb/gadget: Add driver for Aspeed SoC virtual hub")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/epn.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)

Does not apply anymore :(
