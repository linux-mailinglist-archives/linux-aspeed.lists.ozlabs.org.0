Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1624A463360
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 12:52:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3LDW717kz3bgl
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 22:52:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DlZaxwYu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=DlZaxwYu; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3LDR4jx6z308J
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 22:52:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E8AFCB817C8;
 Tue, 30 Nov 2021 11:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F9CC53FC1;
 Tue, 30 Nov 2021 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638272576;
 bh=Rrp25mW+TaaRYcxIJ0GGqapkNzwTLiEGrd01+DD2wRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DlZaxwYuKaP0xOCgKVNx8SmY3HoUV/3GnPREXrU1JS4KKOIS2CBQD6Xz2gCpzFxbQ
 bp/phpSRnw48/2ep7W0xZ5JJWEIDd2u6wCw9DPPNgUnJiTVmn1A++xVrOwmXD1rb63
 YJnrQmyYVNf8FCmhPXye/Xre4p0FZEl1rOaDonXk=
Date: Tue, 30 Nov 2021 12:42:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v2 1/4] usb: aspeed-vhub: add qualifier descriptor
Message-ID: <YaYOPgzv6hGyXLYg@kroah.com>
References: <20211130113847.1405873-1-neal_liu@aspeedtech.com>
 <20211130113847.1405873-2-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130113847.1405873-2-neal_liu@aspeedtech.com>
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
 kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, Cai Huoqing <caihuoqing@baidu.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 30, 2021 at 07:38:44PM +0800, Neal Liu wrote:
> +Ben.
> ---
> 
> Support qualifier descriptor to pass USB30CV compliance test.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---

The way you wrote this means that everything below the first --- line
will be cut off if it were to be applied.

That is not what you want.

Please fix.

thanks,

greg k-h
