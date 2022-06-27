Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 653BC55B4F1
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Jun 2022 03:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWVbK3vKyz3bsW
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Jun 2022 11:32:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWVbF3pNXz2yJL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Jun 2022 11:32:39 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25R1UGbi027657;
	Sun, 26 Jun 2022 20:30:18 -0500
Message-ID: <c960c2e02ddeacd527442e0b3b0db532c9017e1b.camel@kernel.crashing.org>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Neal Liu <neal_liu@aspeedtech.com>,
        Dan Carpenter
 <dan.carpenter@oracle.com>
Date: Mon, 27 Jun 2022 11:30:15 +1000
In-Reply-To: <HK0PR06MB32024B6C49E2C958185E005280B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <YrMsU9HvdBm5YrRH@kili>
	 <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
	 <20220623064320.GN16517@kadam>
	 <e0b1c201bec2ccb68d1779ea8e9cfdf27563dd73.camel@amazon.com>
	 <20220624063457.GG11460@kadam>
	 <46f88070d8f6f47f55310e964a4576cadbc810f4.camel@kernel.crashing.org>
	 <HK0PR06MB32024B6C49E2C958185E005280B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "balbi@kernel.org" <balbi@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2022-06-24 at 07:46 +0000, Neal Liu wrote:
> > 
> Hi Ben, This UDC is the independent IP. The ast2600 board can run
> aspeed-vhub & aspeed_udc simultaneously with different USB port.
> I think it's no need to restruct the code in vhub.

But is it a copy of the same base IP block ? IE, is the fundamental HW
interface of the independent UDC operating the same way with the same
register layout as one of the ports of the vHUB ?

I don't like having multiple drivers for the same hardware... if it's
different enough, then let's keep it separate, but if not, we should
definitely split the udc from the existing vhub code so that the same
driver can operate standalone or beneath a vhub. 

Cheers,
Ben.

