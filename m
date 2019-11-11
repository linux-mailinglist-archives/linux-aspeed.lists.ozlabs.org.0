Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B796F7637
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Nov 2019 15:18:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BXyy0N5pzDrMh
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 01:18:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vgMKb3pN"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BXym5ZdYzDqKH;
 Tue, 12 Nov 2019 01:17:52 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id h13so2491982plr.1;
 Mon, 11 Nov 2019 06:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=93RdXzsIh7XerKQ70G4SgAWwA1RTqVLA4QVQaE+nVeA=;
 b=vgMKb3pNimrdFifDzpVs92F8cm3CtbjmJ2qeSxmnYx+db60ceBU5VEo+4rWeupA3VS
 P7xdTsj6iT6ndJL+tS06LB9fAN+o/r1NRurzphtvYLN/9dhWkWbFTVmMZLPHCOVbtawN
 0hJcB07YNPifUoYxkiNgd1AEyQWdYcIDPo2yfaLCAuIqDMvNS3QodnGfVC5+mLZOUeQz
 yV1hd9jlOfEIJZ/dhknd+GFtb6an6m+dJBpayVm83blb1+GJyTd+hZCZcZT4r5oRn78l
 nNW4qSeLvRm37RIfygsxJ45JQJBDnlD0zoUUI90Tdbc7HeRz0YKbXoFNTEA2KtU/6sZE
 +xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=93RdXzsIh7XerKQ70G4SgAWwA1RTqVLA4QVQaE+nVeA=;
 b=lvzUf7xCPJDhIngUctKOR+0Neq+04wSsj2wkjiYvR5CMRsCX932+U/pfu96j91oKjK
 w0GxssAce3L/+zNoggoFkL3pfIT0WAueu+61BDt9jqJWC1AcinzWuCB7QXncUfQI2ohk
 uffXLa5PTI2qK6JF1Lzd4JoWbRUT9Z8gYywBvOHIqFpCuSVxO+iR4UtXlK/BTWooNqDT
 bugpcGg0AB9DIW6N2mekwqY5X4XrHCYSJDPBzwkmlpPkOdjOfaZFeJ4XPA7XLAxZIciR
 xg9qlaD4yWlckNQh3Gk25UY1joCKmrDE5T12vFt7ePrKrG9BVwUlpSTqov80osmROfV1
 Hi5w==
X-Gm-Message-State: APjAAAWDAy1QXh2rY10GRLFHarpoFw/IG6cokm7FzCEleWk/SN2Smx14
 m0WXqOxneiF5QwgyhNFYq5OdvDYA
X-Google-Smtp-Source: APXvYqyFfD/d/to91cD9Js7V+sQl7S4aV/n6ouG+pxNMxCkhYGyZqnTZZqlJUPWaVA7Ql+w78/EpqQ==
X-Received: by 2002:a17:902:b40b:: with SMTP id
 x11mr24314029plr.252.1573481869532; 
 Mon, 11 Nov 2019 06:17:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n5sm622739pgg.80.2019.11.11.06.17.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Nov 2019 06:17:48 -0800 (PST)
Subject: Re: [PATCH v2 -next] fsi: aspeed: Use devm_kfree in
 aspeed_master_release()
To: YueHaibing <yuehaibing@huawei.com>, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrew@aj.id.au
References: <20191109033209.45244-1-yuehaibing@huawei.com>
 <20191109033634.30544-1-yuehaibing@huawei.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c2b2ca4c-d164-5c16-d518-f9040b81c5ea@roeck-us.net>
Date: Mon, 11 Nov 2019 06:17:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191109033634.30544-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-kernel@lists.infradead.org, alistair@popple.id.au,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/8/19 7:36 PM, YueHaibing wrote:
> 'aspeed' is allocated by devm_kzalloc(), it should not be
> freed by kfree().
> 
> Fixes: 1edac1269c02 ("fsi: Add ast2600 master driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: fix log typos
> ---
>   drivers/fsi/fsi-master-aspeed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 3dd82dd..0f63eec 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -361,7 +361,7 @@ static void aspeed_master_release(struct device *dev)
>   	struct fsi_master_aspeed *aspeed =
>   		to_fsi_master_aspeed(dev_to_fsi_master(dev));
>   
> -	kfree(aspeed);
> +	devm_kfree(dev, aspeed);
>   }
>   
>   /* mmode encoders */
> 
Same question as before: Why is there a release function in the first place ?

Guenter

