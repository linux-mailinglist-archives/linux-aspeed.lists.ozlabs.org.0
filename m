Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B385A29B9A
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2019 17:59:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459WK54flSzDqVn
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 May 2019 01:59:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="EfwTNWoZ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459WJw3chGzDqVL
 for <linux-aspeed@lists.ozlabs.org>; Sat, 25 May 2019 01:59:28 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47EF7217D7;
 Fri, 24 May 2019 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558713565;
 bh=XwMa7CMpcjz1efQfql4HvlYteg+X/F8oDV04BG5m2lU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EfwTNWoZxrjTEpikuOMzZzSdLcBW0Q45u6aLFm63O9BL4fdlM3YznYNCjrSvvxjuM
 g53Pp/wOU1odo/9ZnClUVpXHomhiofos7M2Q6i453KiMRhg5l3KCFwsWPs7maFOG3/
 KbQPrvSM/tT0G7XRuCsON9nTEkFy9ikhpi8rbSk4=
Date: Fri, 24 May 2019 17:59:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH] misc: aspeed-lpc-ctrl: make parameter optional
Message-ID: <20190524155923.GA7516@kroah.com>
References: <20190501223411.1655854-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501223411.1655854-1-vijaykhemka@fb.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: sdasari@fb.com, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 01, 2019 at 03:34:11PM -0700, Vijay Khemka wrote:
> Makiing memory-region and flash as optional parameter in device
> tree if user needs to use these parameter through ioctl then
> need to define in devicetree.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  drivers/misc/aspeed-lpc-ctrl.c | 58 +++++++++++++++++++++-------------
>  1 file changed, 36 insertions(+), 22 deletions(-)

File is no longer at this location :(
