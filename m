Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 239A35598BB
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 13:45:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTwKF5rtJz3c8C
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 21:45:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=o8ImJxiB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=o8ImJxiB;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTwKB0L07z3bq2
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jun 2022 21:45:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 29E7EB82843;
	Fri, 24 Jun 2022 11:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA41C34114;
	Fri, 24 Jun 2022 11:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656071096;
	bh=5Tm2xIThPEQH7daxMrKHrQTQlwdPZNy13QOFOTFFjxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8ImJxiBSpFS9U6JzlTgEqOQk3LsuUqcYpoNxz5aADpNrP4+iq7IMH2Dh98xihbRM
	 U5JQ4mL/RE3fTyiyUL7Iq4S9xOrNQnJb9PEZPGw40QJ/yLkq67WP00KQ2jUdypMr5M
	 aJ6TYkUYW3c0h0lP/E2CH1/KViWmYUR3krmM1Luc=
Date: Fri, 24 Jun 2022 13:35:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Message-ID: <YrWhmkqpDuL34rQR@kroah.com>
References: <YrRj38cU1nV4gsUX@kili>
 <HK0PR06MB3202A24ACAA94B6525ECA7DF80B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB3202A24ACAA94B6525ECA7DF80B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jun 24, 2022 at 02:01:18AM +0000, Neal Liu wrote:
> > The bug is that we should still enter this loop if "tx_len" is zero.
> > 
> > Reported-by: Neal Liu <neal_liu@aspeedtech.com>
> > Fixes: c09b1f372e74 ("usb: gadget: aspeed_udc: cleanup loop in
> > ast_dma_descriptor_setup()")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: Remove the unnecessary "chunk >= 0" condition
> 
> I mean v1 looks good to me.
> Sorry if you are misunderstanding.

I have no idea if v1 or v2 is the "correct" one here, sorry.

Dan, can you send a v3 that you all agree on?

thanks,

greg k-h
