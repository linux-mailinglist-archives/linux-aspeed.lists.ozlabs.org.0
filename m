Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A4410FF45
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 14:51:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S3L556K2zDq8M
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Dec 2019 00:51:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b44;
 helo=mail-yb1-xb44.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C1wT1exz"; 
 dkim-atps=neutral
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S35h0f0tzDqJY
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Dec 2019 00:40:33 +1100 (AEDT)
Received: by mail-yb1-xb44.google.com with SMTP id q7so1515891ybk.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Dec 2019 05:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PWU/7wWJMqFgQOzJgxgiFIVxjVPFwmXizK0TOekZqDg=;
 b=C1wT1exzI2+JnqAQvtk5yzcIapZj8L6gj8q4NmvEZU6boLKk35ngTnivJE6SSaWttN
 thEPw+fkAmaa6Ye7t/7fSQav4HsPD5z+u1qy01HvbBGa7bc7lyCUNgTm4Xh6D8KK2XbG
 eq8GR+xu6toCsxCSrw9fi02f42jNOlCOdJIUnr3qJ5MQrNmpULkuYoUHL5Hfog4ZA7nq
 DEIH3S3pHNNVfS82/mabk7UDpPbdOIPqA8YkiXlWWA7L6g+mhWT+IFpu856wVa4gPQEu
 rAZ3iSXNY2Sm+PVEAO/drBgBFSK5ubZoyANNhnL+FHbH3v/sn6MTRnKR1KPLy/12jJ12
 g5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=PWU/7wWJMqFgQOzJgxgiFIVxjVPFwmXizK0TOekZqDg=;
 b=ab9PV2S3RjFI7uk9yl4RKBf8lyyHt+SEJx0A10AROEUaSj+wlVbQweO3Xll/YW+cKV
 5f7PJy9Gy/YeCQMptNgEyukIODR/lVcDrbRldrt9lZC78/cN8+PG/lTwa9LJu6IY3XQQ
 xzjNyIsZ+qfSXckIlGrnXGrkxz862x+mFEoLHiViRKteXh7LjIaWqxLGLDaw0WQl80qH
 TcPjs3Pk5wvSxECYpJ7Ik13ALKB+HAtL1XS59EqhdTGHASv0WYhaymrg+W1raTx7SL8F
 /JZ0ZnAOmjHLng8ygeAQONuxWRtHc/l6QXo333/qlokRha4ra3JpHRVq/xMppSM8PRAt
 Jn6w==
X-Gm-Message-State: APjAAAVMD18rjRyoJYJ0KgPnfiDp/yKaRuG+eicRC64T7L4g8eBq51Ot
 TfbOWIG8NKEgHr0ctFCjdw==
X-Google-Smtp-Source: APXvYqzlVb+uzUqOoJ7sKz3DGqmH2x4xZFKhoXvP+qn/NpgdBgUv9H8D7Fy3Mg2T7hXTvflhiXmg6A==
X-Received: by 2002:a25:d052:: with SMTP id h79mr4265588ybg.345.1575380429014; 
 Tue, 03 Dec 2019 05:40:29 -0800 (PST)
Received: from serve.minyard.net ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id u2sm1451301ywi.61.2019.12.03.05.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 05:40:28 -0800 (PST)
Received: from minyard.net (unknown [192.168.27.180])
 by serve.minyard.net (Postfix) with ESMTPSA id 95ED9180059;
 Tue,  3 Dec 2019 13:40:27 +0000 (UTC)
Date: Tue, 3 Dec 2019 07:40:26 -0600
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 2/3] ipmi: kcs: Finish configuring ASPEED KCS device
 before enable
Message-ID: <20191203134026.GI18165@minyard.net>
References: <cover.5630f63168ad5cddf02e9796106f8e086c196907.1575376664.git-series.andrew@aj.id.au>
 <84315a29b453068373c096c03433e3a326731988.1575376664.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84315a29b453068373c096c03433e3a326731988.1575376664.git-series.andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Haiyue Wang <haiyue.wang@linux.intel.com>, linux-aspeed@lists.ozlabs.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Dec 03, 2019 at 11:08:24PM +1030, Andrew Jeffery wrote:
> The currently interrupts are configured after the channel was enabled.

How about:

The interrupts were configured after the channel was enabled, configure
them before so they will work.

-corey

> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 3c955946e647..e3dd09022589 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -268,13 +268,14 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>  	kcs_bmc->io_inputb = aspeed_kcs_inb;
>  	kcs_bmc->io_outputb = aspeed_kcs_outb;
>  
> +	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
> +	if (rc)
> +		return rc;
> +
>  	dev_set_drvdata(dev, kcs_bmc);
>  
>  	aspeed_kcs_set_address(kcs_bmc, addr);
>  	aspeed_kcs_enable_channel(kcs_bmc, true);
> -	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
> -	if (rc)
> -		return rc;
>  
>  	rc = misc_register(&kcs_bmc->miscdev);
>  	if (rc) {
> -- 
> git-series 0.9.1
