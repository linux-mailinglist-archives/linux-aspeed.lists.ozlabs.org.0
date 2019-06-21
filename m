Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41C4E8CD
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 15:21:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VfTc18QZzDqbs
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 23:21:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="ErxUbrVJ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VfPD2C5SzDqbs
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 23:17:36 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E1AC20673;
 Fri, 21 Jun 2019 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561123052;
 bh=261r6uVQZqRD/KvN8ivfHajwNi38MxHfYzJVQIpaJ00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ErxUbrVJ0CFz+sPx1YEPlxAoOcxPV1cnoDhjVL8PR1ri1bmH1Hzci34eIO6NZzMR1
 3IL9M03DQ5BtnrkeGR65h/GkDz1+rGrS9ixjOff7xHSSdg9pGEsCotobJrN/DyUDru
 vffTZDIL7EjHoRIMGcz7ZhAPgMeCRLiJqJB4xMKg=
Date: Fri, 21 Jun 2019 15:17:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "sudheer.v" <open.sudheer@gmail.com>
Subject: Re: [patch 0/5] *** DMA based UART driver for AST2500 ***
Message-ID: <20190621131729.GA9997@kroah.com>
References: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 sudheer.veliseti@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 shivahshankar@gmail.com, linux-kernel@vger.kernel.org,
 shivahshankar.shankarnarayanrao@aspeedtech.com, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, jslaby@suse.com,
 sudheer veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2019 at 04:47:30PM +0530, sudheer.v wrote:
> From: sudheer veliseti <sudheer.open@gmail.com>
> 
> Hi,
> AST2500 has dedicated Uart DMA controller which has 12 sets of
> Tx and RX channels connected to UART controller directly.
> Since the DMA controller have dedicated buffers and registers,
> there would be little benifit in adding DMA framework overhead.
> So the software for DMA controller is included within the UART driver itself.
> 
> Thanks and Regards
> Sudheer.V

Is this a v2 of this patch series?

You always have to version your patches and say what changed from the
previous one, like the documentation says to do.

Please fix this up and resend.

thanks,

greg k-h
