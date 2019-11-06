Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A9BF2B3B
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:48:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477z9y0rSMzF3jj
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:48:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lW8QRsc5"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4777MB3FlxzF0dp
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Nov 2019 11:53:39 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id n16so19431049oig.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Nov 2019 16:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P9Pg0JQBq9olWzIox809pWVr9m3m9tTHnVzraba7SzM=;
 b=lW8QRsc5AkkZwfN0feDJmRYBr3aYw7pQal8SFSlGBYYB5pyPFlopEm3/fY102S85OD
 +GWLcgmMtSMJV+7e1b1kHUpvmZQSyGVCJhYvC1KfFxkcd0V7vZKQUjGEzoySz94SNvi+
 QjCHudKIe5fbXdlgnze8ffVrk8Kg/5tpVZuaywZV+uSdPNEHevH78VeZt5lYrEWYCO6U
 cMCH0DjXBXYf8u0XGgjKEbbxEmYRI9JdfUYlkFxuCqFN1pXZ5YxDlvyuZ1mQMg1KY2m4
 hC7Cq+jZvnwOXPVb927XxC86sRxXLQmgAEGEnBbKBhsuvffUUtRe8yEezM5ua+HdcEkZ
 +s+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=P9Pg0JQBq9olWzIox809pWVr9m3m9tTHnVzraba7SzM=;
 b=n6oATsJtnu2a0UGQlHcVnnGJjcd/1Ax6PPmwBNwiBhvzw78wzIziIFt/ZayV5eV5pg
 H6zEG/4z82qJSiyVHJYQi6/QZcpYliMkoxcQTxG4aWLJMPsnHDUuiIJNWjA4umZnX+Nq
 OwPDUzIjBtUG4GmA00QE/awbV4xKCFOA/qkP5tjTPWTI1E6Hw1+rP7F7FtGIW/FXA7sB
 /YDSeaLYc5rl2Zp/Fz6rm7RppP+GfNq6JtffblPlGnLFcbSFwlkpBH6auDHtFvbegxPH
 fK+r98wx2pFi2xqRfyrjnax3aNUEXLxrQoB+riBSwuDSZvHf4Pz//+KSlo4qPMZSg2r+
 5iGg==
X-Gm-Message-State: APjAAAXXVw0Ad5n7I3y342/9Gz1uBYnn+8ma6bO/YrKZcdLe/VNFs2E9
 gi2Rf9hs8DkIkM7TpAQ8jQ==
X-Google-Smtp-Source: APXvYqw5BBxvW9KfjRdTCsJ0Opct2+UrH4BnJ/XsbHqv05DiaZYEZmhjOaQY6LKSrI56LdVdFfjZbg==
X-Received: by 2002:aca:3889:: with SMTP id f131mr124947oia.14.1573001615578; 
 Tue, 05 Nov 2019 16:53:35 -0800 (PST)
Received: from serve.minyard.net ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id v13sm1308951ota.53.2019.11.05.16.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 16:53:34 -0800 (PST)
Received: from minyard.net (unknown [192.168.27.180])
 by serve.minyard.net (Postfix) with ESMTPSA id E48E6180044;
 Wed,  6 Nov 2019 00:53:33 +0000 (UTC)
Date: Tue, 5 Nov 2019 18:53:32 -0600
From: Corey Minyard <minyard@acm.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH] drivers: ipmi: Support for both IPMB Req and Resp
Message-ID: <20191106005332.GA2754@minyard.net>
References: <20191105194732.1521963-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105194732.1521963-1-vijaykhemka@fb.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 07 Nov 2019 20:47:01 +1100
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

On Tue, Nov 05, 2019 at 11:47:31AM -0800, Vijay Khemka wrote:
> Removed check for request or response in IPMB packets coming from
> device as well as from host. Now it supports both way communication
> to device via IPMB. Both request and response will be passed to
> application.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  drivers/char/ipmi/ipmb_dev_int.c | 29 +----------------------------
>  1 file changed, 1 insertion(+), 28 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index 285e0b8f9a97..7201fdb533d8 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -133,9 +133,6 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
>  	rq_sa = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
>  	netf_rq_lun = msg[NETFN_LUN_IDX];
>  
> -	if (!(netf_rq_lun & NETFN_RSP_BIT_MASK))
> -		return -EINVAL;
> -
>  	/*
>  	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
>  	 * i2c_smbus_xfer
> @@ -203,28 +200,6 @@ static u8 ipmb_verify_checksum1(struct ipmb_dev *ipmb_dev, u8 rs_sa)
>  		ipmb_dev->request.checksum1);
>  }
>  
> -static bool is_ipmb_request(struct ipmb_dev *ipmb_dev, u8 rs_sa)
> -{
> -	if (ipmb_dev->msg_idx >= IPMB_REQUEST_LEN_MIN) {
> -		if (ipmb_verify_checksum1(ipmb_dev, rs_sa))
> -			return false;

You still need to check the message length and checksum, you just need
to ignore the req/resp bit.

-corey

> -
> -		/*
> -		 * Check whether this is an IPMB request or
> -		 * response.
> -		 * The 6 MSB of netfn_rs_lun are dedicated to the netfn
> -		 * while the remaining bits are dedicated to the lun.
> -		 * If the LSB of the netfn is cleared, it is associated
> -		 * with an IPMB request.
> -		 * If the LSB of the netfn is set, it is associated with
> -		 * an IPMB response.
> -		 */
> -		if (!(ipmb_dev->request.netfn_rs_lun & NETFN_RSP_BIT_MASK))
> -			return true;
> -	}
> -	return false;
> -}
> -
>  /*
>   * The IPMB protocol only supports I2C Writes so there is no need
>   * to support I2C_SLAVE_READ* events.
> @@ -273,9 +248,7 @@ static int ipmb_slave_cb(struct i2c_client *client,
>  
>  	case I2C_SLAVE_STOP:
>  		ipmb_dev->request.len = ipmb_dev->msg_idx;
> -
> -		if (is_ipmb_request(ipmb_dev, GET_8BIT_ADDR(client->addr)))
> -			ipmb_handle_request(ipmb_dev);
> +		ipmb_handle_request(ipmb_dev);
>  		break;
>  
>  	default:
> -- 
> 2.17.1
> 
