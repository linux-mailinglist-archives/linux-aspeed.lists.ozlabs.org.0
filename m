Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5DE5598BD
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 13:45:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTwKP1p8Wz3c8Z
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 21:45:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lGpUqG7M;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lGpUqG7M;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTwKK4MrKz3bq2
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jun 2022 21:45:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4AC89B82843;
	Fri, 24 Jun 2022 11:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627FBC34114;
	Fri, 24 Jun 2022 11:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656071105;
	bh=/2OHaS3MR1kb2k5L74fvco5RgmKK7foP/ilWbPMO+Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lGpUqG7MHtWZJ87v8qMZ8ChuH6aRq0Gij61Z4bVzYhrhQQ75WsPx7c69tzhoaYEa/
	 aE7zP6Dl4KJISHZSD46fhRnKFzXrLYqEaopQSxpqsXrgsHRUcnpFJ70meLA4RJo6rq
	 9ak1wnwEgWOwgHNYSlzSXlnmIkBDzsReYMuNiYRs=
Date: Fri, 24 Jun 2022 13:42:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] usb: gadget: Fix unsigned comparison with less than zero
Message-ID: <YrWjCnNJohij691b@kroah.com>
References: <20220623084347.38207-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623084347.38207-1-jiapeng.chong@linux.alibaba.com>
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
Cc: balbi@kernel.org, linux-aspeed@lists.ozlabs.org, neal_liu@aspeedtech.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org, christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 23, 2022 at 04:43:47PM +0800, Jiapeng Chong wrote:
> This was found by coccicheck:
> 
> ./drivers/usb/gadget/udc/aspeed_udc.c:496:8-13: WARNING: Unsigned expression compared with zero: chunk >= 0.

What does this mean?  Where is the error?

Please explain the reason for changes, not just the output of a random
tool that you ran on the code.

> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

What commit does this fix?

thanks,

greg k-h
