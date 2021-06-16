Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB93AA3BC
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Jun 2021 21:02:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4vhN219Gz30JY
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Jun 2021 05:02:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QKlM7nFU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QKlM7nFU; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4vhJ1sTtz2yyl
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Jun 2021 05:02:38 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id q10so3609526oij.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Jun 2021 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=UOqLQQmsoCxqiYwODGOxvwScag2+ijPfJja63uXJkvM=;
 b=QKlM7nFUoB6J9K6LCVtW4wLxrfvSkz/9/nDxNyxDziZoJE7UBptRchMsuVPPsv/Hh6
 0hoMsU+kE/siiKIoEARnj+zwFE8PmjgdODBmhLSDyKIQnUHb5mT7rlhid2dRz4RZKI/1
 vm4AD/ORdZWtQjEHXa03hMC9KsTCZM+Vu+kDID2Vzbbo1Zy1tCzn9xoJLK9bGpIWQ0M3
 X/Hvi9oD4cMfRkNHQ7PZvIQb4wcnbP5lJsan/SoaGrXV6dn7us3t/odsNRmWZL50gXrH
 tXos9ISMyX0/UUW/opRzLItk0oDWUNvFsoT4dfNaFMLJ19g29AeyElaIe2MR1hrrlcVG
 VX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=UOqLQQmsoCxqiYwODGOxvwScag2+ijPfJja63uXJkvM=;
 b=UZLzKg284qHv5+nTh9RfkJhVuLbQkqPrYHkKE3WSNTfdq98rT4zw/TDFIllCer6M8n
 NRlBKuuurhO5rU5w7Hhyfbi6BLRS1Db1UpAeCLg1zMDhSuzoGDXGaoeMO02OQaxooeF3
 fpWfU5ODonRU7loq5Wn0FcXfiUpfROw3M9o3/57Zaj5ljbo34NLaWD22Fk3wYJQuNH8N
 YwecDxA9s30xxmCwcwawTSgOfUt2kcb16P1X2h70BZF5paYDCHnhzQC53I/Pe5Xg7Ptb
 Qt6JBmuIEmX4gSriNq8pZ1IVQ535zGfVuukXHxCAguvxKh/AE1Lp5HlkeZNYvQH4N39l
 71dg==
X-Gm-Message-State: AOAM532LISPiVxNL+yJp1ajgWZ2RJ4ZbOJwYQQFw3kTBesmRlm4zv9bo
 n2nSLJNLKOe/xue788UG9w==
X-Google-Smtp-Source: ABdhPJzogjBWC3Po3+HvkfTYzT7IZOBBIi2tfx6vpj5GURwwDUR39OAgLN+pokD5M0qf1LT+kBQ+bQ==
X-Received: by 2002:aca:281a:: with SMTP id 26mr8138043oix.142.1623870152808; 
 Wed, 16 Jun 2021 12:02:32 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id p9sm694118otl.64.2021.06.16.12.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 12:02:31 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:742a:6ad4:30ea:e332])
 by serve.minyard.net (Postfix) with ESMTPSA id B2FF61800E7;
 Wed, 16 Jun 2021 19:02:30 +0000 (UTC)
Date: Wed, 16 Jun 2021 14:02:29 -0500
From: Corey Minyard <minyard@acm.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] ipmi: kcs_bmc_aspeed: Fix less than zero
 comparison of a unsigned int
Message-ID: <20210616190229.GG2921206@minyard.net>
References: <20210616162913.15259-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616162913.15259-1-colin.king@canonical.com>
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
Cc: linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 16, 2021 at 05:29:13PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The comparisons of the unsigned int hw_type to less than zero always
> false because it is unsigned. Fix this by using an int for the
> assignment and less than zero check.

Thanks, I added this to my tree.

-corey

> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 9d2df9a0ad80 ("ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ configuration")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 0401089f8895..92a37b33494c 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -301,13 +301,15 @@ static inline int aspeed_kcs_map_serirq_type(u32 dt_type)
>  static int aspeed_kcs_config_upstream_irq(struct aspeed_kcs_bmc *priv, u32 id, u32 dt_type)
>  {
>  	unsigned int mask, val, hw_type;
> +	int ret;
>  
>  	if (id > 15)
>  		return -EINVAL;
>  
> -	hw_type = aspeed_kcs_map_serirq_type(dt_type);
> -	if (hw_type < 0)
> -		return hw_type;
> +	ret = aspeed_kcs_map_serirq_type(dt_type);
> +	if (ret < 0)
> +		return ret;
> +	hw_type = ret;
>  
>  	priv->upstream_irq.mode = aspeed_kcs_irq_serirq;
>  	priv->upstream_irq.id = id;
> -- 
> 2.31.1
> 
