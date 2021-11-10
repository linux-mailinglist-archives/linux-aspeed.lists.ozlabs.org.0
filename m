Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0244BC9E
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Nov 2021 09:11:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpyGW26Ddz2yYx
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Nov 2021 19:10:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LUSdi1Xy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=LUSdi1Xy; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpyGN3jxyz2yNG
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Nov 2021 19:10:51 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79C0660FDA;
 Wed, 10 Nov 2021 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636531849;
 bh=u8b5cf1EBSxtufFdQN4PMhOxgUC210Wh/YSOnRXF7Ys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LUSdi1XyLhDhnWPmsceU86FDly+91QHJNd/3k4DSapQq89WuSlWwCiqsP5H4o4UGh
 V66NAEfPp3klHGoHxxIM7tHbiZX0VESNXIOZwNDtTgFYXUcNXvCrQyxrL6KY9vvAgY
 k9yX+YIXp/h34xymLRmPfTIQdP3qeg21CUqz7i2Q=
Date: Wed, 10 Nov 2021 09:10:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: cgel.zte@gmail.com
Subject: Re: [PATCH] serial: 8250_aspeed_vuart: Replace snprintf in show
 functions with  sysfs_emit
Message-ID: <YYt+hmfOPSDg0NVM@kroah.com>
References: <20211110024028.135887-1-yao.jing2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110024028.135887-1-yao.jing2@zte.com.cn>
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
Cc: zev@bewilderbeest.net, yao.jing2@zte.com.cn, Zeal Robot <zealci@zte.com.cn>,
 johan@kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-serial@vger.kernel.org, jirislaby@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Nov 10, 2021 at 02:40:28AM +0000, cgel.zte@gmail.com wrote:
> From: Jing Yao <yao.jing2@zte.com.cn>
> 
> coccicheck complains about the use of snprintf() in sysfs show
> functions:
> WARNING use scnprintf or sprintf
> 
> Use sysfs_emit instead of scnprintf, snprintf or sprintf makes more
> sense.

Same subject and changelog comments as the staging driver change you
sent in :(

