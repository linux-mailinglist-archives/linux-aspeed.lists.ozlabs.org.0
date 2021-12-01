Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D146471B
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 07:18:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3pn34KtMz304w
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 17:18:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nSnSqYGT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=nSnSqYGT; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3pmw2Qrhz2x9P
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Dec 2021 17:18:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B75EB81DCD;
 Wed,  1 Dec 2021 06:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E73C53FAD;
 Wed,  1 Dec 2021 06:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638339496;
 bh=VPRDQ89SUILlUjx+vs2IsxZqXAW8pekN6ey9IeNPVhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nSnSqYGTJBmMTILji3ZZ9WCzHTPvzncE0mHBd0oXUTBKJJEoBaSP7585NBjF2+18N
 jFahLiglhNv4/FLygY44ADbwGRfAo8mT0ogwIkNnXXB4V8+q/a5ep18PUXn2RFpMHp
 oaq1IijLXR4DdCzWUgP6e+cEbNtuLkwcGc+oFoQM=
Date: Wed, 1 Dec 2021 07:18:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v2 1/4] usb: aspeed-vhub: add qualifier descriptor
Message-ID: <YacTpI7k5gTDQ4Ki@kroah.com>
References: <20211130104256.3106797-1-neal_liu@aspeedtech.com>
 <20211130104256.3106797-2-neal_liu@aspeedtech.com>
 <YaYOvgCaO4FJ8r+z@kroah.com>
 <HK0PR06MB3202436CA49363FD3F60212380689@HK0PR06MB3202.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB3202436CA49363FD3F60212380689@HK0PR06MB3202.apcprd06.prod.outlook.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 kernel test robot <lkp@intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>, Cai Huoqing <caihuoqing@baidu.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 01, 2021 at 05:43:16AM +0000, Neal Liu wrote:
> > -----Original Message-----
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Tuesday, November 30, 2021 7:45 PM
> > To: Neal Liu <neal_liu@aspeedtech.com>
> > Cc: Felipe Balbi <balbi@kernel.org>; Joel Stanley <joel@jms.id.au>; Andrew
> > Jeffery <andrew@aj.id.au>; Cai Huoqing <caihuoqing@baidu.com>; Tao Ren
> > <rentao.bupt@gmail.com>; Julia Lawall <julia.lawall@inria.fr>; kernel test
> > robot <lkp@intel.com>; Sasha Levin <sashal@kernel.org>;
> > linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org; BMC-SW
> > <BMC-SW@aspeedtech.com>
> > Subject: Re: [PATCH v2 1/4] usb: aspeed-vhub: add qualifier descriptor
> > 
> > On Tue, Nov 30, 2021 at 06:42:53PM +0800, Neal Liu wrote:
> > > Support qualifier descriptor to pass USB30CV compliance test.
> > 
> > Please provide more information here in this description.  This does not
> > explain what is happening here very well.
> > 
> > Also, what is "USB30CV"?
> > 
> 
> USB 3 Command Verifier (USB3CV) is the official tool for USB 3 Hub and Device Framework testing.
> The USB3CV tool includes the xHCI Compliance Drivers for use with the USB3CV.

Please put that information in the changelog text.

> We would like to pass USB3CV - Chapter 9 Test [USB 2 devices] - Device Qualifier Tests.
> A high-speed capable device that has different device information for full-speed and high-speed
> must have a Device Qualifier Descriptor.
> This patch is to support device qualifier, and the host will retrieve it through Get Descriptor request.

Again, this type of information needs to go into the changelog text.

thanks,

greg k-h
