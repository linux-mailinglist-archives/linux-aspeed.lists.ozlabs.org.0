Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B831DF8FBD
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 13:36:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C6gD1HfkzF4pk
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 23:36:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ap5qQJLC"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C6fx0BcFzF4pD
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 23:36:08 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id 22so14616754oip.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 04:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VyuE9R1Zt8unWqsQYiOdffXM+EG4glnnIjYggC8eTEU=;
 b=Ap5qQJLCwOnu9WaClYB8g/Q1afEqOIjnsLLeX4YKaPAHPvdg06LmhwoD/t+F7c6a7A
 kUbQbSq3g99S+2xvZjizsMXAbY8rWjRAHWA/dlIAA1tqcRTdkPA2Zi8z0ZIIji/G0aDb
 Yv7GenVSZ3COOocISD214Gglk7dxKnU75NmyPmBbZ8nJktJehxBgEJzVQ2bJ12WPfBfl
 d59xGFIDSVOcHaDMAak2raOsnWT7LXtTA19FmxIovxUeO7yQoe5pRxz50We+Rp27L/Ux
 zY7AJG3vN7Dta7oh3DUK3itcAVfRL3FuOvBSQuDZz8CNGf1hbQnhlva6q87SDrCIGy+L
 TqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=VyuE9R1Zt8unWqsQYiOdffXM+EG4glnnIjYggC8eTEU=;
 b=K8oZ5vJHXfXQ0xqCoVrTFk43Tpuc/7acSv/Drmuhj9dfdcCWKp4kJGcXE6QvwXzZN2
 89mdiIy4b35A0L9ypr9qz7vU6S7z4EJwnvqV2GMI+5s4xGx8bK3/9ErQRSN73Iml5rGA
 JP5XdtC9V1k83KGEc/ccjLWirB2L54q+9hyw0Ha5ujPpzNS3VxlZHrOgx/cHTxmzawcU
 83M+dxacsv5zOYAoQuaDfKASo1Mg+1CGF6lo0sV/1FYj1C7A07KdY5rxTJrPGUmrcAUh
 ljlgSYVMFawV/LBlJh1IoLO9NrOdNE6Y5P2gv0lcNKG201kIa2dwM9uU736chKdO2sU5
 3lUw==
X-Gm-Message-State: APjAAAVgTlfKqQLFmq0fzaYHhDvBtNcISEjumNBSMGxI9Dkpt/xo2+M7
 0xVyYPX2E1LeVSms5TkrBg==
X-Google-Smtp-Source: APXvYqwvHqp0DJEHcQBsvLeHESCHlfxJvRpyP9XdBImq8kFvgUt0egV647ozlcxYXSXHzNjp4tOoFw==
X-Received: by 2002:a05:6808:ab1:: with SMTP id
 r17mr3574728oij.111.1573562164874; 
 Tue, 12 Nov 2019 04:36:04 -0800 (PST)
Received: from serve.minyard.net ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id 18sm3921292oip.57.2019.11.12.04.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 04:36:04 -0800 (PST)
Received: from minyard.net (unknown [192.168.27.180])
 by serve.minyard.net (Postfix) with ESMTPSA id 85168180046;
 Tue, 12 Nov 2019 12:36:03 +0000 (UTC)
Date: Tue, 12 Nov 2019 06:36:02 -0600
From: Corey Minyard <minyard@acm.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH 1/2] drivers: ipmi: Support raw i2c packet in IPMB
Message-ID: <20191112123602.GD2882@minyard.net>
References: <20191112023610.3644314-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112023610.3644314-1-vijaykhemka@fb.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: minyard@acm.org
Cc: cminyard@mvista.com, sdasari@fb.com, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 06:36:09PM -0800, Vijay Khemka wrote:
> Many IPMB devices doesn't support smbus protocol and current driver
> support only smbus devices. So added support for raw i2c packets.

I haven't reviewed this, really, because I have a more general
concern...

Is it possible to not do this with a config item?  Can you add something
to the device tree and/or via an ioctl to make this dynamically
configurable?  That's more flexible (it can support mixed devices) and
is friendlier to users (don't have to get the config right).

Config items for adding new functionality are generally ok.  Config
items for choosing between two mutually exclusive choices are
generally not.

-corey

> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  drivers/char/ipmi/Kconfig        |  6 ++++++
>  drivers/char/ipmi/ipmb_dev_int.c | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index a9cfe4c05e64..e5268443b478 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -139,3 +139,9 @@ config IPMB_DEVICE_INTERFACE
>  	  Provides a driver for a device (Satellite MC) to
>  	  receive requests and send responses back to the BMC via
>  	  the IPMB interface. This module requires I2C support.
> +
> +config IPMB_SMBUS_DISABLE
> +	bool 'Disable SMBUS protocol for sending packet to IPMB device'
> +	depends on IPMB_DEVICE_INTERFACE
> +	help
> +	  provides functionality of sending raw i2c packets to IPMB device.
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index ae3bfba27526..2419b9a928b2 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -118,6 +118,10 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
>  	struct ipmb_dev *ipmb_dev = to_ipmb_dev(file);
>  	u8 rq_sa, netf_rq_lun, msg_len;
>  	union i2c_smbus_data data;
> +#ifdef CONFIG_IPMB_SMBUS_DISABLE
> +	unsigned char *i2c_buf;
> +	struct i2c_msg i2c_msg;
> +#endif
>  	u8 msg[MAX_MSG_LEN];
>  	ssize_t ret;
>  
> @@ -133,6 +137,31 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
>  	rq_sa = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
>  	netf_rq_lun = msg[NETFN_LUN_IDX];
>  
> +#ifdef CONFIG_IPMB_SMBUS_DISABLE
> +	/*
> +	 * subtract 1 byte (rq_sa) from the length of the msg passed to
> +	 * raw i2c_transfer
> +	 */
> +	msg_len = msg[IPMB_MSG_LEN_IDX] - 1;
> +
> +	i2c_buf = kzalloc(msg_len, GFP_KERNEL);
> +	if (!i2c_buf)
> +		return -EFAULT;
> +
> +	/* Copy message to buffer except first 2 bytes (length and address) */
> +	memcpy(i2c_buf, msg+2, msg_len);
> +
> +	i2c_msg.addr = rq_sa;
> +	i2c_msg.flags = ipmb_dev->client->flags &
> +			(I2C_M_TEN | I2C_CLIENT_PEC | I2C_CLIENT_SCCB);
> +	i2c_msg.len = msg_len;
> +	i2c_msg.buf = i2c_buf;
> +
> +	ret = i2c_transfer(ipmb_dev->client->adapter, &i2c_msg, 1);
> +	kfree(i2c_buf);
> +
> +	return (ret == 1) ? count : ret;
> +#else
>  	/*
>  	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
>  	 * i2c_smbus_xfer
> @@ -149,6 +178,7 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
>  			     I2C_SMBUS_BLOCK_DATA, &data);
>  
>  	return ret ? : count;
> +#endif
>  }
>  
>  static unsigned int ipmb_poll(struct file *file, poll_table *wait)
> -- 
> 2.17.1
> 
