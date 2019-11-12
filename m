Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABDCF9005
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 13:54:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C73f478hzDsP0
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 23:54:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hpotNEY2"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C6xd43bszDrQc
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 23:48:53 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id m193so14658198oig.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 04:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Jzm7986JS/rnjdFEfFSppu8t4BpdNBEDWXZlt0QkzRM=;
 b=hpotNEY2jP9EbNNf1lY01Z4p8VZIHhK5Uf/xk9kM4m5UjiTl2tVwaeqotaFn/MYzSM
 uJ4Mq0BTFkLcY129vsyTy4KaTMfLeqYAmhTOUMsz+471cQqdWkLsqYn13ePb5PP3GQAl
 FIJr/Gs+mx892sKJSAmXY3hBRAXniQmqOLy/dfvlvbfaChxaLoslE362YzCtXxlio1rV
 4Mplt/KjTVhRNHDLvKzPgCRAPXynQi8sS51oPWq6D3eze9ddnVYHt2/DWrYg8aFEhDuU
 +hV6wWmnaSnWGSqbavzyD+Q+DnsFLOzGeACwqjE0oNyz7ptTjDepUQo8AZgkSrhp54sm
 vKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=Jzm7986JS/rnjdFEfFSppu8t4BpdNBEDWXZlt0QkzRM=;
 b=rUNiD2sL7ypgz53tPYxrXZF179kTHoHUP/7CFUx3Nj1p3uizDwYaRCkL/v+2sk0KNV
 CfVUURnK7FzxQHYehun0gxJw8O9tHNCEAyShPodzqof5VQ1XZYjmCAB+HQ5CE8zRELx6
 9zp38ZOQEyiBwOhMpFn8+FG3kGjefK5n40cHpuAscaLDTEDwYWdi0lOSGeI2ZGwyPte0
 qw1kBY6PDivARP9SihhGXbBfdS+DBgGXcqbIRRaYnmvAeqmbYamCIDWvc+XQycKsEyoA
 88UXs+A8zKqr0sFWL8kLl8ckdDKcU8qjK0LY0l8oIxDFJyHGNRIQXIP6mUbSr0+n4CxZ
 k0sQ==
X-Gm-Message-State: APjAAAXpBqcOX2bvy1vKZJWcd7orCKYFYTaXAQYmM+bq8umAxJZ2E5Ku
 ViojbXq4Rd/ZTwCdd7Xvqw==
X-Google-Smtp-Source: APXvYqxtYYaMppT1AsUoDPjRx/kCU171B9mYR9+ekZc1K7T40+2H65m90zVCtGZFXPwcrcaNpUGmew==
X-Received: by 2002:aca:58d6:: with SMTP id m205mr3771826oib.32.1573562927956; 
 Tue, 12 Nov 2019 04:48:47 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id l32sm6193445otl.74.2019.11.12.04.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 04:48:47 -0800 (PST)
Received: from minyard.net (unknown [192.168.27.180])
 by serve.minyard.net (Postfix) with ESMTPSA id B47A6180046;
 Tue, 12 Nov 2019 12:48:46 +0000 (UTC)
Date: Tue, 12 Nov 2019 06:48:45 -0600
From: Corey Minyard <minyard@acm.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH 2/2] drivers: ipmi: Modify max length of IPMB packet
Message-ID: <20191112124845.GE2882@minyard.net>
References: <20191112023610.3644314-1-vijaykhemka@fb.com>
 <20191112023610.3644314-2-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112023610.3644314-2-vijaykhemka@fb.com>
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

On Mon, Nov 11, 2019 at 06:36:10PM -0800, Vijay Khemka wrote:
> As per IPMB specification, maximum packet size supported is 255,
> modified Max length to 240 from 128 to accommodate more data.

I couldn't find this in the IPMB specification.

IIRC, the maximum on I2C is 32 byts, and table 6-9 in the IPMI spec,
under "IPMB Output" states: The IPMB standard message length is
specified as 32 bytes, maximum, including slave address.

I'm not sure where 128 came from, but maybe it should be reduced to 31.

-corey

> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  drivers/char/ipmi/ipmb_dev_int.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index 2419b9a928b2..7f9198bbce96 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -19,7 +19,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/wait.h>
>  
> -#define MAX_MSG_LEN		128
> +#define MAX_MSG_LEN		240
>  #define IPMB_REQUEST_LEN_MIN	7
>  #define NETFN_RSP_BIT_MASK	0x4
>  #define REQUEST_QUEUE_MAX_LEN	256
> -- 
> 2.17.1
> 
