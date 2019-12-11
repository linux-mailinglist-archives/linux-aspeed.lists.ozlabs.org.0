Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27D11BCD6
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 20:25:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y6N44D6jzDqt0
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 06:25:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mvista.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=cminyard@mvista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mvista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mvista-com.20150623.gappssmtp.com
 header.i=@mvista-com.20150623.gappssmtp.com header.b="ixucNZnE"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y6Kl1bFfzDqvN
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 06:23:38 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id b8so14288371oiy.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 11:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2tn5b+BnBTkooIY5KE6RLTiIOyZphBmIOhAadFlJ3lQ=;
 b=ixucNZnE6isOryW0a62tOJ1m57Oi89HcQJYJKuyxAleL1uevW6LicQLwRo7QXbaBs6
 f2B8F/YcJb/BLAkaAb4OJvzbkU/aeN/6CeJQuMei7zO+MN7MLUNDRS+hMomWrS4OD+Dl
 n74w8393P2HD4wmdOFWQytVRlP/HzqSiUh45FMqdabau/f51jTa6WYCuwpsUD2ElyTX3
 ZIMsfPn2l8JiFJCC4bGo2S1EjWodPC1sreyNtdilRjCCS+Hu4A5mZjQfuObjn8tHvJP4
 HBBKEPEKv2yaPbv4LU/5bxUyeb0ogzWzQePEu2VqqZtBvD8nq4iXzQAV5d3syuP/W/Ns
 yXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=2tn5b+BnBTkooIY5KE6RLTiIOyZphBmIOhAadFlJ3lQ=;
 b=ZcoC4wJeaskXjoi4V2Df/AzXbL3eCJ0qjJyWmRqpEdwdTXryDSSC7PiuDXCvr79eCH
 B3w7LRZrN90KQzHIWVMoNq2WuH61x1+IdQ7/1nGyVJ5hBFYXIJofAwVu70yDx2yeAwHX
 wd3Hcs6i5IhCisZ2OPWFPvY5NlYmtjAUOKrwwokFEfchbIMwk9Dtl9TQbbL5jpJqjyP+
 mxHkf5qVQdljXk7QX4ooGkEHp5SGcj+YKRBy7NTU8cuYOsvH87uvmAd6gvGaLM5D3AKp
 lVV3TbJFXF7gFM3kq4RlE44D+0HQs+HdEO2B3yGFHRY9ShEHygjjB2HozFUpdvzwGkdO
 6YaQ==
X-Gm-Message-State: APjAAAVQJHz/mXbnKZeJAOQsF+ayReo11NDy4vJg6gUZt1KkQyh4NSLR
 EpLVO7ScFbhELe3UKXUUZEk6zXAlqHA=
X-Google-Smtp-Source: APXvYqzNvcHwygV9zQY4v7lspd4s/D16/tOVDvfxUh12jEkW0EPHd8ArCexWYhQuSn+tA5Ua3+gU+g==
X-Received: by 2002:aca:f484:: with SMTP id s126mr3874339oih.48.1576092207113; 
 Wed, 11 Dec 2019 11:23:27 -0800 (PST)
Received: from minyard.net ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id c7sm1193186otm.63.2019.12.11.11.23.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Dec 2019 11:23:26 -0800 (PST)
Date: Wed, 11 Dec 2019 13:23:25 -0600
From: Corey Minyard <cminyard@mvista.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH] drivers: ipmi: Modify max length of IPMB packet
Message-ID: <20191211192325.GD3585@minyard.net>
References: <20191211190155.1279610-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211190155.1279610-1-vijaykhemka@fb.com>
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

On Wed, Dec 11, 2019 at 11:01:55AM -0800, Vijay Khemka wrote:
> As per IPMB specification, maximum packet size supported is 255,
> modified Max length to 240 from 128 to accommodate more data.

This is in my next tree.

Thanks,

-corey

> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  drivers/char/ipmi/ipmb_dev_int.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index 68a254c0dd92..382e4a1df510 100644
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
