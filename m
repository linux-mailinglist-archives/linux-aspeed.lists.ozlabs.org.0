Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB1EF2F7C
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 14:34:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4784Bs46bYzF6RW
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Nov 2019 00:34:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GbfG07kS"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4784Bd6b8qzF6RC
 for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Nov 2019 00:34:31 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id r24so1968171otk.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 07 Nov 2019 05:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x+syRc+agoo08pLNzrJjXzWzp/e66MwKC2W+ow4e7bw=;
 b=GbfG07kSp5ixMQ4oonu7FLSf/87Uy4yl6Eiho1GtkM5AKVAv2sZ943At2fCDaBDJT2
 MC31nwMYp8r3iNBjuIHdBKTQUuoO5koaiBvy4wRKxMw3HYaXD6iCcpc+tvDw6ZHQGrhE
 U4UzGO6XTkWpl9D0+A2bVxNF//x9tHk1soaBDw2Yy5Ve6paG+Cirj21kY1zQf36xnnXN
 k2wcFx1K9EY8XEVPZ9i3cGxNtz/8wXqnf4IRh/cmzzKFue7CgK4L28JNaD85kBuwJFaz
 m7ECXnoWR9eHAhtMrQ+ykJLy+IW7yp2bs4DlFbFIsI5kITF14/Tfd3UjV9sWWYqiukwr
 2mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=x+syRc+agoo08pLNzrJjXzWzp/e66MwKC2W+ow4e7bw=;
 b=lFabZ8LnjKhDhc72B/G5C49i1gbQMdcNTyFQ5iTQC6W7mSd/e13H3y1nHRTTVtrM4e
 QJOuEQveVVJArmHler5VQiZVxZjCa81ZX5eESwKytwxKVvhXFNMQ2ocu5+UKMfliXQnb
 XQ3l36v2TxWg0pU5lmOxdG69pMItd6BX0MqdFZRGeJD+qVKg+Jqsx2y+Rtok5vQNgRQ7
 Oza0X0/vdbrCJyUWeLNF2FsKjSHpPyKvjXFFTUH1YkyzgxgdfCtQQeSA6rHoXhbftqkt
 9Xw9BwNKvdroDiNPnbZqdozt8LEq+gt5JqqqWhzOcyUlJj8djyVBn4d2oUy1eMwwL93+
 PNlA==
X-Gm-Message-State: APjAAAUnNsDqp8LtgMGm/GxbIUpcx4sdxfCjmvF0UIY2xHMiKNfESyK4
 WCS0Z+G/LKKYVHMDSWiwaw==
X-Google-Smtp-Source: APXvYqx78JdRY1/hVtPOwuo/shXRgmMvkCD+fJAlFhVerBdkFmI/xeERxi3QZg0O16tnBmjg70TbYA==
X-Received: by 2002:a9d:365:: with SMTP id 92mr3243984otv.9.1573133667411;
 Thu, 07 Nov 2019 05:34:27 -0800 (PST)
Received: from serve.minyard.net ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id 9sm620925ois.16.2019.11.07.05.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 05:34:26 -0800 (PST)
Received: from minyard.net (unknown [192.168.27.180])
 by serve.minyard.net (Postfix) with ESMTPSA id 32E62180046;
 Thu,  7 Nov 2019 13:34:26 +0000 (UTC)
Date: Thu, 7 Nov 2019 07:34:25 -0600
From: Corey Minyard <minyard@acm.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH v2] drivers: ipmi: Support for both IPMB Req and Resp
Message-ID: <20191107133425.GA10276@minyard.net>
References: <20191106182921.1086795-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106182921.1086795-1-vijaykhemka@fb.com>
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

On Wed, Nov 06, 2019 at 10:29:21AM -0800, Vijay Khemka wrote:
> Removed check for request or response in IPMB packets coming from
> device as well as from host. Now it supports both way communication
> to device via IPMB. Both request and response will be passed to
> application.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Thanks, this is in my for-next tree now.  Asnaam, I took your previous
comments as a "Reviewed-by", if that is ok.

-corey

> ---
>  drivers/char/ipmi/ipmb_dev_int.c | 31 +++++++++----------------------
>  1 file changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index 285e0b8f9a97..ae3bfba27526 100644
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
> @@ -203,25 +200,16 @@ static u8 ipmb_verify_checksum1(struct ipmb_dev *ipmb_dev, u8 rs_sa)
>  		ipmb_dev->request.checksum1);
>  }
>  
> -static bool is_ipmb_request(struct ipmb_dev *ipmb_dev, u8 rs_sa)
> +/*
> + * Verify if message has proper ipmb header with minimum length
> + * and correct checksum byte.
> + */
> +static bool is_ipmb_msg(struct ipmb_dev *ipmb_dev, u8 rs_sa)
>  {
> -	if (ipmb_dev->msg_idx >= IPMB_REQUEST_LEN_MIN) {
> -		if (ipmb_verify_checksum1(ipmb_dev, rs_sa))
> -			return false;
> +	if ((ipmb_dev->msg_idx >= IPMB_REQUEST_LEN_MIN) &&
> +	   (!ipmb_verify_checksum1(ipmb_dev, rs_sa)))
> +		return true;
>  
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
>  	return false;
>  }
>  
> @@ -273,8 +261,7 @@ static int ipmb_slave_cb(struct i2c_client *client,
>  
>  	case I2C_SLAVE_STOP:
>  		ipmb_dev->request.len = ipmb_dev->msg_idx;
> -
> -		if (is_ipmb_request(ipmb_dev, GET_8BIT_ADDR(client->addr)))
> +		if (is_ipmb_msg(ipmb_dev, GET_8BIT_ADDR(client->addr)))
>  			ipmb_handle_request(ipmb_dev);
>  		break;
>  
> -- 
> 2.17.1
> 
