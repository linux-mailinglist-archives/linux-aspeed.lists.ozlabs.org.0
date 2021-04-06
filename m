Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7DC354C47
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Apr 2021 07:26:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDwxW0trsz309W
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Apr 2021 15:26:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TXS6ap2H;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=TXS6ap2H; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDwxR64H6z3023
 for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Apr 2021 15:26:34 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B57561246;
 Tue,  6 Apr 2021 05:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617686788;
 bh=SmVeK0AzoGvnM/oVSClhxdFpdRkFXOYQtTI6gWclCvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXS6ap2HESrw9shecjMTxGQh5jxSPKvPO+smESiwctRKnpV6WpvNKWmq9PTc+mk/h
 nbGKTFYFDGNzK54Ul6+wmLHt3nq4UiWnJhtHAThCjhM6hbXgJtGy1kl149R1GHRDeq
 jqf9KKj1Hn0ZsLFZbObhdvHkgNv85iVxQGuQ4gU4=
Date: Tue, 6 Apr 2021 07:26:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] usb: gadget: aspeed: Remove unnecessary version.h includes
Message-ID: <YGvxAmHIgnRMcyuq@kroah.com>
References: <1617681598-28165-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617681598-28165-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Apr 06, 2021 at 11:59:58AM +0800, Jiapeng Chong wrote:
> "make versioncheck" shows:
> 
> ./drivers/usb/gadget/udc/aspeed-vhub/hub.c: 33 linux/version.h not
> needed.

Then you need to fix the tool, and always test-build patches before you
send them out, as this is obviously wrong :(

