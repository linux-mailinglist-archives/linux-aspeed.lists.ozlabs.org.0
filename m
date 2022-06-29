Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F81A55F5F0
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 07:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXrPs1H1Jz3c81
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 15:59:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QdQzN4m3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QdQzN4m3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXrPk68rzz3bnj
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 15:59:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA1C26182A;
	Wed, 29 Jun 2022 05:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CA2C34114;
	Wed, 29 Jun 2022 05:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656482343;
	bh=XMyoN7X0TYQI0q///T/+MOg3sOWfMhqEPKgAL/Q93To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QdQzN4m3seA5b/RQuleY8oI8TdkSeAOPAoBNHw4Eci1dHSQsKigMoAt3ruVHk0MG0
	 bCXGs8KNUTcrmlstD2Hyhd3NUYXbMVYVLccxfDCjb046oEshOU6ShDu70cJkNQVD/x
	 6pVKLf1LMpJ7X7CEYR/An4LVu3f520VduyvcJ120=
Date: Wed, 29 Jun 2022 07:59:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jiapeng.Chong" <jiapeng.chong@linux.alibaba.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW1BBVENI?= =?utf-8?Q?=5D?= usb: gadget:
 Fix unsigned comparison with less than zero
Message-ID: <YrvqJIsnmlol2etP@kroah.com>
References: <20220623084347.38207-1-jiapeng.chong@linux.alibaba.com>
 <YrWjCnNJohij691b@kroah.com>
 <19ba5da7-3e9d-49e1-aa7f-b0834737fbfe.jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19ba5da7-3e9d-49e1-aa7f-b0834737fbfe.jiapeng.chong@linux.alibaba.com>
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
Cc: balbi <balbi@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, neal_liu <neal_liu@aspeedtech.com>, linux-usb <linux-usb@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "sumit.semwal" <sumit.semwal@linaro.org>, linaro-mm-sig <linaro-mm-sig@lists.linaro.org>, "christian.koenig" <christian.koenig@amd.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-media <linux-media@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 29, 2022 at 01:51:01PM +0800, Jiapeng.Chong wrote:
> Sorry, we didn't see this patch.
> commit c09b1f372e746aeeb61ef8ffe0fea3970fd9273e

I am sorry, I do not understand what you mean here at all.

confused,

greg k-h
