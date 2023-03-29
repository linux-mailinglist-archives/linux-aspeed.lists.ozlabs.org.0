Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 631ED6CD74F
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Mar 2023 12:08:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmj0w4ggBz3cjT
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Mar 2023 21:08:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rcFrOTMN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rcFrOTMN;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmj0m18Ggz2xH6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Mar 2023 21:07:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 258B5B82212;
	Wed, 29 Mar 2023 10:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5C4C433EF;
	Wed, 29 Mar 2023 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680084464;
	bh=jxsrRCmaqY1PZygl7A7OWDWEQs91XASFaSIP4jc/LyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcFrOTMN0AG2eJC7VzghJ8ZwGIZcMLBSZvPeWvL+7Cjb9gFOKi/pYTguQ83mPS4Fj
	 vqMKcF9EJ0mZotczB/I6jW1VZR0hQnQxOExV88C0f/i4P5sX4O6i65CDNPkCcx/Ven
	 LAhEhg0cWQ9+iB3T3QP58PSAnsPPJjqoaXGeCxXk=
Date: Wed, 29 Mar 2023 12:07:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v3 1/4] eeprom: ee1004: Enable devices on multiple busses
Message-ID: <ZCQN7uq7Y3xFY1od@kroah.com>
References: <20230322140348.569397-1-eajames@linux.ibm.com>
 <20230322140348.569397-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322140348.569397-2-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 22, 2023 at 09:03:45AM -0500, Eddie James wrote:
> The driver previously prevented probing devices on more than one
> bus due to locking constraints with the special page addresses. This
> constraint can be removed by allocating a reference-counted bus
> structure containing the lock, rather than using global variables.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v2:
>  - Remove of_device.h include
> 
>  drivers/misc/eeprom/ee1004.c | 174 +++++++++++++++++++++--------------
>  1 file changed, 105 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
> index c8c6deb7ed89..0aed5760e370 100644
> --- a/drivers/misc/eeprom/ee1004.c
> +++ b/drivers/misc/eeprom/ee1004.c
> @@ -9,9 +9,11 @@
>   * Copyright (C) 2008 Wolfram Sang, Pengutronix
>   */
>  
> +#include <linux/err.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -31,20 +33,24 @@
>   * over performance.
>   */
>  
> -#define EE1004_ADDR_SET_PAGE		0x36
> +#define EE1004_ADDR_SET_PAGE0		0x36
> +#define EE1004_ADDR_SET_PAGE1		0x37
>  #define EE1004_NUM_PAGES		2
>  #define EE1004_PAGE_SIZE		256
>  #define EE1004_PAGE_SHIFT		8
>  #define EE1004_EEPROM_SIZE		(EE1004_PAGE_SIZE * EE1004_NUM_PAGES)
>  
> -/*
> - * Mutex protects ee1004_set_page and ee1004_dev_count, and must be held
> - * from page selection to end of read.
> - */
> -static DEFINE_MUTEX(ee1004_bus_lock);
> -static struct i2c_client *ee1004_set_page[EE1004_NUM_PAGES];
> -static unsigned int ee1004_dev_count;
> -static int ee1004_current_page;
> +struct ee1004_bus {
> +	struct kref kref;
> +	struct list_head list;
> +	struct mutex lock;
> +	struct i2c_adapter *adapter;
> +	struct i2c_client *set_page_clients[EE1004_NUM_PAGES];
> +	int page;
> +};
> +
> +static LIST_HEAD(ee1004_busses);
> +static DEFINE_MUTEX(ee1004_busses_lock);

This really looks like you are just emulating a tiny portion of the
driver core (busses, lists of busses, reference counting, etc.)

Why not just use an aux device instead and get all of that logic "for
free" in a way that will be properly shown to userspace?  Right now it
has no idea what is happening here with individual portions of the
device and the like.

Please look into that instead of this hand-rolled device model.

thanks,

greg k-h
