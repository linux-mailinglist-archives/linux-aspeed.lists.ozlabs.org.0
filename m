Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D1C1A0E7D
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Apr 2020 15:36:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xT2c75PGzDr74
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Apr 2020 23:36:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UmDATtsu; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xT2R5GRXzDqhS
 for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Apr 2020 23:36:15 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id k18so1496396oib.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Apr 2020 06:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ClJDfDshHqm3MPtsNHmyOS+UtbN5Rqwu+2iZ2hmJ8yk=;
 b=UmDATtsuZ9SMhlDT/Q4m+RFE0Biuk8WvIoFf35BNr/RouG6e28nWAzsTPNlSQZFlIX
 zbMcd9Fe+4QkJx0sY866zBGGyGGTOnVzpyEd6Gz8QYePrMQS408Y8+Vk9bbWJ5E4je/X
 ok7avbg/Eq+cC5k0QVqF6sOtoBob3/dZOtGS+vUG9jqs9Oejz7rcu8z7yEUwhe3osOfU
 mcD8bdoxS3Ks95yaOUzCd/Ba9+Awz6u0zCyiDzB6VOg6ZAKrJXeFoHqVFReQ0hfZRKBi
 czon2Gj4A3GD+L8ufLkYMPszx0KWeFXoDR73d/QrwnTMZGBn/6x7EccxDF9d2QgnDnBw
 WKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=ClJDfDshHqm3MPtsNHmyOS+UtbN5Rqwu+2iZ2hmJ8yk=;
 b=mZzUbJ+DwLNjXi4FA8bRE0vlSh22M7mzEa6QvyUNk+4Cz909gJ0mHIZz4/n0ua4p0t
 g2WzNIhM5AQ+iOR5oJwlM91DKCS1Q5TYRtS8SpLqYB9X+wwYC/4M2Rsc7+mOXtyuQtYi
 rnOAfv1DmDP3SkxwZJZ5UbsCqtFGQj2UflUxFrjP4XVdgcW0RGbv01o/gox8yd6WF0GO
 TzHEXdzhYl/pt8DC2Ed4b8uibndnFkY56/aRg+cQC2hvp1SylCR+olsJvZjgJtqSNkiO
 cnrcKRqUO7b8xnluTh8DlabVLEhjymbLwfhY1u+RJW/yIXarD/HlLVrScedE4gL85GmD
 iRUA==
X-Gm-Message-State: AGi0PuaiueOGyDoovmKjULTOAKhdq4L2ZxNhK1OjYx+vLGstIbEPeDw0
 aaoPeeExTIbPBaS8IhvZRth8lXM=
X-Google-Smtp-Source: APiQypKN+V/kz+KJ9Qb1ZTSEPTawPqR52LDU41+Bdwlc4cfOfdJfnKMuaHj8E3XxCRC5UzvX7C6cGQ==
X-Received: by 2002:aca:b803:: with SMTP id i3mr1676178oif.92.1586266571593;
 Tue, 07 Apr 2020 06:36:11 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id f45sm5335104otf.30.2020.04.07.06.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 06:36:10 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
 by serve.minyard.net (Postfix) with ESMTPSA id 69562180053;
 Tue,  7 Apr 2020 13:36:09 +0000 (UTC)
Date: Tue, 7 Apr 2020 08:36:08 -0500
From: Corey Minyard <minyard@acm.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ipmi: kcs: Fix aspeed_kcs_probe_of_v1()
Message-ID: <20200407133608.GB6130@minyard.net>
References: <20200407122149.GA100026@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407122149.GA100026@mwanda>
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
Cc: linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Apr 07, 2020 at 03:21:49PM +0300, Dan Carpenter wrote:
> This needs to return the newly allocated struct but instead it returns
> zero which leads to an immediate Oops in the caller.

Thanks, this is applied.

-corey

> 
> Fixes: 09f5f680707e ("ipmi: kcs: aspeed: Implement v2 bindings")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 9422d55a0476..a140203c079b 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -271,7 +271,7 @@ static struct kcs_bmc *aspeed_kcs_probe_of_v1(struct platform_device *pdev)
>  	kcs->ioreg = ast_kcs_bmc_ioregs[channel - 1];
>  	aspeed_kcs_set_address(kcs, slave);
>  
> -	return 0;
> +	return kcs;
>  }
>  
>  static int aspeed_kcs_calculate_channel(const struct kcs_ioreg *regs)
> -- 
> 2.25.1
> 
