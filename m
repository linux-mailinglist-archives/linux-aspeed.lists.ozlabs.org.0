Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB711BCD2
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 20:25:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y6Mx25yGzDqsh
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 06:25:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mvista.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=cminyard@mvista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mvista.com
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y6KX0w1DzDqvW
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 06:23:19 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id x195so14308687oix.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 11:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T2LuqKQq3LbYsaS2fUFvN9eUdXWWgYnpTycPxg8blv0=;
 b=QkqipQ4TcrAQQSkhq/c1tBfycxm3nuTe1F9+A3BNhddu19Rrx4Y/EZTPctB3OgMdjm
 0skYwa3Vwq6F1Y2hHhNHujNNknHKzygtyzfp5Xwh9RYbqJxV2z5HVkcjaRRVNdzHxC2N
 DlxksRE77JsmMVFzE42FvC+YXTUE7WlZZ6Wh6Qt/SXB5iMZEuS6OlhveI51uElDTSn3q
 KOIYzmfzr5CTinwc9umxB6fKoa6MxGkF5s8rGaRQA/iwcgpKlez4MuiX0NV+VIKW4RPI
 wB/oQfr9aIT8L6xJiTvAtdv5Uuf4srw+YbxYSYl5vk3PhdM7i9MOd0kWseDXURdv+2cD
 t3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=T2LuqKQq3LbYsaS2fUFvN9eUdXWWgYnpTycPxg8blv0=;
 b=NvUvGUi9zTSnKIaYYUAHRoa2d5LPvh1ehWR4hDRRIdNWYBlRZqNcvOKK4bgH8u2ft3
 FZ4nsjY567MFSoqRG5y2WI2YncOj3jtydUessfZJJJOLpbaQel5oFPvHXqLcKlWX3R6z
 vlwVR6Fw2hngDA77AmuFg0CXImfJV1w+anUaW/NQvjoX13bi8GEQSzDLklfCy+yqtyLS
 Mm+VNt4tcP2OIusJnz4ck/vzH3iOsm5mR5kB+v4issYGJQiPQj5eGZvTCl9Eveg+pa0I
 xwoTXnv4Kmzn/Jf9/SF7KL3/mMTgCzsioFlasOLAdC0iO0LzkeZX16IxNZPggY13dugo
 Emjg==
X-Gm-Message-State: APjAAAVKHmmpYgylSE+eQbVAGG9sDk7GXj8MTWLKQsvPcVtlkQ/aM2bP
 B3fVC5xXvlnzTty7WL/DyAeaDw==
X-Google-Smtp-Source: APXvYqzIqfltdL8aHUEE3zkc+zuKCA9gA4nHHzbExTrz1m1u4UvWL6GPWWpZT+q4kmyruelAS/DDaA==
X-Received: by 2002:aca:4d0f:: with SMTP id a15mr4122235oib.21.1576092191078; 
 Wed, 11 Dec 2019 11:23:11 -0800 (PST)
Received: from minyard.net ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id f1sm1206913otq.4.2019.12.11.11.23.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Dec 2019 11:23:10 -0800 (PST)
Date: Wed, 11 Dec 2019 13:23:08 -0600
From: Corey Minyard <cminyard@mvista.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH v6] drivers: ipmi: Support raw i2c packet in IPMB
Message-ID: <20191211192308.GC3585@minyard.net>
References: <20191211185604.1266063-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211185604.1266063-1-vijaykhemka@fb.com>
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
Reply-To: cminyard@mvista.com
Cc: sdasari@fb.com, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 11, 2019 at 10:56:04AM -0800, Vijay Khemka wrote:
> Many IPMB devices don't support smbus protocol and this driver
> only supports the smbus protocol at the moment.

Ok, I have this in.  Documentation/IPMB.txt had moved, I had to adjust
for that.

-corey

> 
> Added support for the i2c protocol as well. There will be a variable
> "i2c-protocol" passed by the device tree or ACPI table which determines
> whether the protocol is i2c or smbus.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> Reviewed-by: Asmaa Mnebhi <asmaa@mellanox.com>
> ---
>  Documentation/IPMB.txt           |  4 ++++
>  drivers/char/ipmi/ipmb_dev_int.c | 29 +++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/Documentation/IPMB.txt b/Documentation/IPMB.txt
> index a6ed8b68bd0f..7a023beff976 100644
> --- a/Documentation/IPMB.txt
> +++ b/Documentation/IPMB.txt
> @@ -71,9 +71,13 @@ b) Example for device tree:
>           ipmb@10 {
>                   compatible = "ipmb-dev";
>                   reg = <0x10>;
> +                 i2c-protocol;
>           };
>  };
>  
> +If xmit of data to be done using raw i2c block vs smbus
> +then "i2c-protocol" needs to be defined as above.
> +
>  2) Manually from Linux:
>  modprobe ipmb-dev-int
>  
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index ae3bfba27526..68a254c0dd92 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -63,6 +63,7 @@ struct ipmb_dev {
>  	spinlock_t lock;
>  	wait_queue_head_t wait_queue;
>  	struct mutex file_mutex;
> +	bool is_i2c_protocol;
>  };
>  
>  static inline struct ipmb_dev *to_ipmb_dev(struct file *file)
> @@ -112,6 +113,25 @@ static ssize_t ipmb_read(struct file *file, char __user *buf, size_t count,
>  	return ret < 0 ? ret : count;
>  }
>  
> +static int ipmb_i2c_write(struct i2c_client *client, u8 *msg, u8 addr)
> +{
> +	struct i2c_msg i2c_msg;
> +
> +	/*
> +	 * subtract 1 byte (rq_sa) from the length of the msg passed to
> +	 * raw i2c_transfer
> +	 */
> +	i2c_msg.len = msg[IPMB_MSG_LEN_IDX] - 1;
> +
> +	/* Assign message to buffer except first 2 bytes (length and address) */
> +	i2c_msg.buf = msg + 2;
> +
> +	i2c_msg.addr = addr;
> +	i2c_msg.flags = client->flags & I2C_CLIENT_PEC;
> +
> +	return i2c_transfer(client->adapter, &i2c_msg, 1);
> +}
> +
>  static ssize_t ipmb_write(struct file *file, const char __user *buf,
>  			size_t count, loff_t *ppos)
>  {
> @@ -133,6 +153,12 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
>  	rq_sa = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
>  	netf_rq_lun = msg[NETFN_LUN_IDX];
>  
> +	/* Check i2c block transfer vs smbus */
> +	if (ipmb_dev->is_i2c_protocol) {
> +		ret = ipmb_i2c_write(ipmb_dev->client, msg, rq_sa);
> +		return (ret == 1) ? count : ret;
> +	}
> +
>  	/*
>  	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
>  	 * i2c_smbus_xfer
> @@ -302,6 +328,9 @@ static int ipmb_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> +	ipmb_dev->is_i2c_protocol
> +		= device_property_read_bool(&client->dev, "i2c-protocol");
> +
>  	ipmb_dev->client = client;
>  	i2c_set_clientdata(client, ipmb_dev);
>  	ret = i2c_slave_register(client, ipmb_slave_cb);
> -- 
> 2.17.1
> 
