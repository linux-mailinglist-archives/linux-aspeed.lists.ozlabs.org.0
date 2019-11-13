Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3FFBB10
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 22:47:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cyrz3dtYzF7F1
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Nov 2019 08:47:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZGE1sAI1"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cyrs0DwxzF7Cx
 for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Nov 2019 08:47:38 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id n14so3233012oie.13
 for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Nov 2019 13:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Pc7cQHv8eKuylt4BamVYue24j7XUatjlDeaalEngXsI=;
 b=ZGE1sAI1FX/0817aF8CL0cOgRiiuy79SHphe7PDD6X619//0CimbipWKjj9OxHourt
 50kArF0uxa5fpyvxkc7WSr6sgRAODjMcvNMOAoCeVLbMZUQvjA4GmU+c9FTN91MOve7e
 dfpVyrSTAsxtcaR1FNfGB6y2ddpHtRJ3dX9vjiAJWsq9t+8ENSgITp2CjoiSwaR/0ufJ
 JXLcyy+F82/xbdX/0jIYxHWwlQLk3rIp6iYkbtVh/SX0PgsjBK6k/WdopKnyLdBcQ3te
 k3jGg57bcdeHlAe+A3cTEQkbBsxlpqFxyEjzr2mMw7kjDO7j6wvQ9IBysUlBBEhsvwMm
 ICFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Pc7cQHv8eKuylt4BamVYue24j7XUatjlDeaalEngXsI=;
 b=EekXOIdK1LKhxFx7SaG56IIKubilNdTiS3uPGkN3JHJ9U7kEK0UYsLLT4JRVyO1eE6
 kcj5GaRrjoKZyOXnPKCtmnQRvFhTyKO8UG1XmeO9UzOGVxWy+Ou4gstvWovIf2Cr5mhw
 HIbrS4uQw05l836Q9Uf4NlDMwgizHxNOd0EgD/OURDsEq83/jgCJAMJ29gFgp2cJJ63o
 LL8l5g2kKOSYNg7rNje+hgry9rTRfG+ODJQBpaApXum88jFuqyoyzCFTtm/dvXbObgOf
 IceLkQdhxZtYWABmLDWW9gKSpUbwsnBlu2VmLKJAknlZnjdlFkNwIonD1WQltkrxATPy
 pAtQ==
X-Gm-Message-State: APjAAAUdsHXAikge/wxmw68fF2qnGFR/PPt4l521YNM4EOutvjCwKARL
 ebwHNNEW6NngflShM0xVyg==
X-Google-Smtp-Source: APXvYqx/I0MG+m8QXEYTbGrRDCwsZsePNxEluLbGTyay3HgyRFUDS13Sfo9kWINqSu4vuRC9aHbZvA==
X-Received: by 2002:aca:da02:: with SMTP id r2mr740190oig.172.1573681655999;
 Wed, 13 Nov 2019 13:47:35 -0800 (PST)
Received: from serve.minyard.net ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id d205sm1122028oig.28.2019.11.13.13.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 13:47:35 -0800 (PST)
Received: from minyard.net (unknown [192.168.27.180])
 by serve.minyard.net (Postfix) with ESMTPSA id 9C9C1180046;
 Wed, 13 Nov 2019 21:47:34 +0000 (UTC)
Date: Wed, 13 Nov 2019 15:47:33 -0600
From: Corey Minyard <minyard@acm.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH v3] drivers: ipmi: Support raw i2c packet in IPMB
Message-ID: <20191113214733.GO2882@minyard.net>
References: <20191113192325.2821207-1-vijaykhemka@fb.com>
 <DB6PR0501MB2712FAF45EE8CB2D513465A9DA760@DB6PR0501MB2712.eurprd05.prod.outlook.com>
 <AC2A7BB8-52D0-4CAF-9C72-58C9CF5A4F55@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AC2A7BB8-52D0-4CAF-9C72-58C9CF5A4F55@fb.com>
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
Cc: "cminyard@mvista.com" <cminyard@mvista.com>, Sai Dasari <sdasari@fb.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Arnd Bergmann <arnd@arndb.de>, "wsa@the-dreams.de" <wsa@the-dreams.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Nov 13, 2019 at 09:28:10PM +0000, Vijay Khemka wrote:
> 
> 
> ﻿On 11/13/19, 12:33 PM, "Asmaa Mnebhi" <Asmaa@mellanox.com> wrote:
> 
>     Inline response:
>     
>     -----Original Message-----
>     From: Vijay Khemka <vijaykhemka@fb.com> 
>     Sent: Wednesday, November 13, 2019 2:23 PM
>     To: Corey Minyard <minyard@acm.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; openipmi-developer@lists.sourceforge.net; linux-kernel@vger.kernel.org
>     Cc: vijaykhemka@fb.com; cminyard@mvista.com; Asmaa Mnebhi <Asmaa@mellanox.com>; joel@jms.id.au; linux-aspeed@lists.ozlabs.org; sdasari@fb.com
>     Subject: [PATCH v3] drivers: ipmi: Support raw i2c packet in IPMB
>     
>     Many IPMB devices doesn't support smbus protocol and current driver support only smbus devices. Added support for raw i2c packets.
>     
>     User can define use-i2c-block in device tree to use i2c raw transfer.
>     
>     Asmaa>> Fix the description: "The ipmb_dev_int driver only supports the smbus protocol at the moment. Add support for the i2c protocol as well. There will be a variable passed by though the device tree or ACPI table which sets the configures the protocol as either i2c or smbus."
>     
>     Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
>     ---
>      drivers/char/ipmi/ipmb_dev_int.c | 48 ++++++++++++++++++++++++++++++++
>      1 file changed, 48 insertions(+)
>     
>     diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
>     index ae3bfba27526..16d5d4b636a9 100644
>     --- a/drivers/char/ipmi/ipmb_dev_int.c
>     +++ b/drivers/char/ipmi/ipmb_dev_int.c
>     @@ -63,6 +63,7 @@ struct ipmb_dev {
>      	spinlock_t lock;
>      	wait_queue_head_t wait_queue;
>      	struct mutex file_mutex;
>     +	bool use_i2c;
>      };
>      
>     Asmaa>> rename this variable : is_i2c_protocol
> Done.
>     
>      static inline struct ipmb_dev *to_ipmb_dev(struct file *file) @@ -112,6 +113,39 @@ static ssize_t ipmb_read(struct file *file, char __user *buf, size_t count,
>      	return ret < 0 ? ret : count;
>      }
>      
>     +static int ipmb_i2c_write(struct i2c_client *client, u8 *msg) {
>     +	unsigned char *i2c_buf;
>     +	struct i2c_msg i2c_msg;
>     +	ssize_t ret;
>     +	u8 msg_len;
>     +
>     +	/*
>     +	 * subtract 1 byte (rq_sa) from the length of the msg passed to
>     +	 * raw i2c_transfer
>     +	 */
>     +	msg_len = msg[IPMB_MSG_LEN_IDX] - 1;
>     +
>     +	i2c_buf = kzalloc(msg_len, GFP_KERNEL);
>     
>     Asmaa >> We do not want to use kzalloc every time you execute this write function. It would create so much fragmentation.
>     You don't really need to use kzalloc anyways. 
> We need to allocate memory to pass to i2c_transfer. That's what being done in i2c_smbus_xfer function as well.
>     
>     Also, this code chunk is short, so you can call it directly from the write function. I don't think you need a separate function for it.
> I wanted to keep this change as clean as possible.

I'd agree.  Fragmentation is not a big deal here.

However, why not just pass in msg + 2?  That would be cleaner, faster,
and less wasteful.

>     
>     +	if (!i2c_buf)
>     +		return -EFAULT;

-ENOMEM?  (Assuming you keep the malloc)

>     +
>     +	/* Copy message to buffer except first 2 bytes (length and address) */
>     +	memcpy(i2c_buf, msg+2, msg_len);
>     +
>     +	i2c_msg.addr = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
>     +	i2c_msg.flags = client->flags &
>     +			(I2C_M_TEN | I2C_CLIENT_PEC | I2C_CLIENT_SCCB);
>     Asmaa>> I don't think ipmb supports 10 bit addresses. The max number of bits in the IPMB address field is 8.
> Done.
>     
>     +	i2c_msg.len = msg_len;
>     +	i2c_msg.buf = i2c_buf;
>     +
>     +	ret = i2c_transfer(client->adapter, &i2c_msg, 1);
>     +	kfree(i2c_buf);
>     +
>     +	return ret;
>     +
>     +}
>     +
>      static ssize_t ipmb_write(struct file *file, const char __user *buf,
>      			size_t count, loff_t *ppos)
>      {
>     @@ -133,6 +167,12 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
>      	rq_sa = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
>      	netf_rq_lun = msg[NETFN_LUN_IDX];
>      
>     +	/* Check i2c block transfer vs smbus */
>     +	if (ipmb_dev->use_i2c) {
>     +		ret = ipmb_i2c_write(ipmb_dev->client, msg);
>     +		return (ret == 1) ? count : ret;
>     +	}
>     +
>      	/*
>      	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
>      	 * i2c_smbus_xfer
>     @@ -277,6 +317,7 @@ static int ipmb_probe(struct i2c_client *client,
>      			const struct i2c_device_id *id)
>      {
>      	struct ipmb_dev *ipmb_dev;
>     +	struct device_node *np;
>      	int ret;
>      
>      	ipmb_dev = devm_kzalloc(&client->dev, sizeof(*ipmb_dev), @@ -302,6 +343,13 @@ static int ipmb_probe(struct i2c_client *client,
>      	if (ret)
>      		return ret;
>      
>     +	/* Check if i2c block xmit needs to use instead of smbus */
>     +	np = client->dev.of_node;
>     +	if (np && of_get_property(np, "use-i2c-block", NULL))
>     Asmaa>> Rename this variable i2c-protocol. And also, apply this to ACPI as well.
> Done.

I don't think ACPI is that important at the moment.  Rename is good.

>     +		ipmb_dev->use_i2c = true;
>     +	else
>     +		ipmb_dev->use_i2c = false;

The above two lines are unnecessary.

-corey

>     +
>      	ipmb_dev->client = client;
>      	i2c_set_clientdata(client, ipmb_dev);
>      	ret = i2c_slave_register(client, ipmb_slave_cb);
>     --
>     2.17.1
>     
>     
> 
