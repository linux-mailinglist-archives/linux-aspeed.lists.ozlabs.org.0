Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 353FFFC872
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Nov 2019 15:10:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DNgG5fSCzF83F
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Nov 2019 01:10:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NkriC5pv"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DNg76mPDzF82n
 for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Nov 2019 01:10:43 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id n14so5318161oie.13
 for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Nov 2019 06:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v1je3uNJ00f2WkFNv22rLfEFKIfE+md5iLEXtfYLkWk=;
 b=NkriC5pv5OxJLKQlQfa7bt4z31mrVgV8b2bbwrx8NPt0xKnp03rJM5z5HQiBYS/pcb
 pUICmEXJrG/jOttWU/h8kggoBUrl7EfAmPy3xIH5yiv2/RlW0YltsTat4HgyK5q4EONy
 BEHtmL6+9RP3E34ZHS984e34hMxrFO6/zQk4PMJI/nA6n2Ubd3NDobGmEXOSELpGoU7+
 Ta23OBoHQb4hvg9kESOJVZtQa+gaaz7c8VraLmkiC0Md+cmeLzwRACguNsC4Nqp7i6jG
 BvZy7ZDaXsqkb/IKiM3hSOGLV5OQYdjLNJFXfWnuuoDlYB81rKcbWaT+vaA9X5Pm1sWy
 VLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=v1je3uNJ00f2WkFNv22rLfEFKIfE+md5iLEXtfYLkWk=;
 b=D5lB312F3XtxhJQ86Y1SHBIO5gs+MSMWtJBulMvechQVoIrZzaIkNUJhg6RStm6KrB
 cc2Wq6kJo5NvmokPgmv2CrqE/YYpmef1xNM5PylqiS0P4BC6ThaTy5bEUMR5takMLweT
 COOtjMjXNRhZPjbsdM2ElLOQawXGw8hFkApbkFzablmJRXnETdvWdeEKlllVG6q4SNa9
 tt+GgtewIJZL+yck7nRh5g9Mrrx6XBrx3NBoWqLNR2X+zVRNgEojEqMq2PzJaGel4NZh
 dX6dI3hj6UMMyjtyO15Gv+WvPAHvs4zn3Imv/KsetStQeK3/+CRRYhXrKXni+rwSL7Ok
 Uufw==
X-Gm-Message-State: APjAAAVFqLSYdGBFRQOJfDdKwvn65hqDVIZfLmsU8BnDlS+cYYR2WXdC
 1NI6XYIT9au7cId7n6d5OQ==
X-Google-Smtp-Source: APXvYqwwdPFg9kbfOu8MlVF4OmpC/NFAxBtjdVdCziMJOnb/GeNAiULm5YmBziTFP16OKCKo0TXNkA==
X-Received: by 2002:a05:6808:20f:: with SMTP id
 l15mr3778616oie.39.1573740639585; 
 Thu, 14 Nov 2019 06:10:39 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id i195sm1812611oib.55.2019.11.14.06.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 06:10:39 -0800 (PST)
Received: from minyard.net (unknown [192.168.27.180])
 by serve.minyard.net (Postfix) with ESMTPSA id 8514C180044;
 Thu, 14 Nov 2019 14:10:38 +0000 (UTC)
Date: Thu, 14 Nov 2019 08:10:37 -0600
From: Corey Minyard <minyard@acm.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH v4] drivers: ipmi: Support raw i2c packet in IPMB
Message-ID: <20191114141037.GP2882@minyard.net>
References: <20191113234133.3790374-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113234133.3790374-1-vijaykhemka@fb.com>
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

On Wed, Nov 13, 2019 at 03:41:33PM -0800, Vijay Khemka wrote:
> Many IPMB devices doesn't support smbus protocol and current driver
> support only smbus devices. Added support for raw i2c packets.
> 
> User can define i2c-protocol in device tree to use i2c raw transfer.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

With Aasma's response, I am ok with this.

One thing, though.  This is the slave device on the I2C, not the master
device that has the issue, right?  So it's at least theoretically
possible to have one SMBus and one I2C IPMB device on the same master,
right?

For normal I2C, devices are in the device tree and get added to the
kernel device handling.  It looks like that is not being done in your
case.  But really, the "right" way to do this is to have the IPMB slaves
added as Linux devices and address them that way.  I'm not sure this
will ever be a real issue, but if it is, there will be some work to do
to fix it.

-corey

> ---
>  drivers/char/ipmi/ipmb_dev_int.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index ae3bfba27526..10904bec1de0 100644
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
> +static int ipmb_i2c_write(struct i2c_client *client, u8 *msg)
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
> +	i2c_msg.addr = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
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
> +		ret = ipmb_i2c_write(ipmb_dev->client, msg);
> +		return (ret == 1) ? count : ret;
> +	}
> +
>  	/*
>  	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
>  	 * i2c_smbus_xfer
> @@ -277,6 +303,7 @@ static int ipmb_probe(struct i2c_client *client,
>  			const struct i2c_device_id *id)
>  {
>  	struct ipmb_dev *ipmb_dev;
> +	struct device_node *np;
>  	int ret;
>  
>  	ipmb_dev = devm_kzalloc(&client->dev, sizeof(*ipmb_dev),
> @@ -302,6 +329,11 @@ static int ipmb_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> +	/* Check if i2c block xmit needs to use instead of smbus */
> +	np = client->dev.of_node;
> +	if (np && of_get_property(np, "i2c-protocol", NULL))
> +		ipmb_dev->is_i2c_protocol = true;
> +
>  	ipmb_dev->client = client;
>  	i2c_set_clientdata(client, ipmb_dev);
>  	ret = i2c_slave_register(client, ipmb_slave_cb);
> -- 
> 2.17.1
> 
