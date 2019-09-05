Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E04A9902
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 05:47:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P6861zT5zDqxk
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 13:47:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="b4epihcJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RSh87SEs"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P67z62XlzDqvV
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 13:47:10 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A30C21391;
 Wed,  4 Sep 2019 23:47:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 04 Sep 2019 23:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=iz5b5ME3PsMsS8QeBujZtb3JCi3nja+
 Hla+LmculZwk=; b=b4epihcJys2LL8YoCM/nc8qGbEazvW2vWIO1hIVaP9napuP
 AgLUK/SA4LCbYT07PHOJ76rcWRjJwmhK+SpzqL7QUuBCTXcnnP/NuS/jUcSWKWzR
 AY8hwGjvJfCsQg7OOdgu5uDvLXf2aR/h1d69gfjGE1RPPjYZLKdfY419TQ1VBZHE
 LEj5vLwO/Y31rQ//yYbd4S5Hj8fp7R3T9M8tHJmJxXAgwOVFF6bJwPJ8wjnx2N88
 oKI2W8VJ1Y8Yi/Usv0DAICA8Rs6J/to+LLrz+l2sQWGppJSjp3qsGRg/r6Cv3zGH
 hQI2yfJdSUzasOhqLIEuQ6yOrP/u1ng0xIZuiXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iz5b5M
 E3PsMsS8QeBujZtb3JCi3nja+Hla+LmculZwk=; b=RSh87SEs4Y5wMEQGhMF4TS
 cTeVYM8QeCyqZt+S3kg5/alKN3LfJRrDYbL4QebKdEuKDXl/WvhnqtRC/LIH9ufS
 YH2RPnAIdDbVRv7NWv0/3BVCF4BB6uzAB0BN7X+Q3aoTaYgUL6OBuKR2I/B+szBf
 CBWcbyXTo06rhy1TceChRX0UlnEP362/efTMCe4Ho+iPbaW/2ZwQwA4sCte2oHj3
 PbkeQV+WaA7MuB63+2wybuenW63wBIt2Q+4LAgcHVm41dBadp3X8dFHqtRwJSvwb
 5rooHlU2LFk+U6icJyVPkgFmKUf/GAGABGAoCC1uMsEyrj9ga+YlfSGpxXXIiy4g
 ==
X-ME-Sender: <xms:O4VwXXAJe39Xm9VrYIewsp4nenufMiJTMOMxHoALQG_Zr48RAi2MZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejiedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:O4VwXSE4mYfTEweu3O6KFE0pGmhNb_HFsgwDUiQVeh0YpIveJSvaKg>
 <xmx:O4VwXfsL9wGoQ0JxDaAo2kBs1kK7vFeAGvk_WynV2YxxmiBwhsJyzA>
 <xmx:O4VwXQktE8PQEzKDSfzOWBM1NB6cjn_43xm_-mJXRwKx2Gl7msm2rg>
 <xmx:PIVwXXgFkxGGf64YPijCZE9v8cbsk3HfIs7FmFcR8-D7RIG-x8YgbA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 77709E00A3; Wed,  4 Sep 2019 23:47:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-186-gf4cb3c3-fmstable-20190904v1
Mime-Version: 1.0
Message-Id: <5f3ec58f-d83b-41f9-80ed-35a5434bb985@www.fastmail.com>
In-Reply-To: <20190905011635.15902-1-rashmica.g@gmail.com>
References: <20190905011635.15902-1-rashmica.g@gmail.com>
Date: Thu, 05 Sep 2019 13:17:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Rashmica Gupta" <rashmica.g@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] gpio/aspeed: Fix incorrect number of banks
Content-Type: text/plain
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 5 Sep 2019, at 10:46, Rashmica Gupta wrote:
> The current calculation for the number of GPIO banks is only correct if
> the number of GPIOs is a multiple of 32 (if there were 31 GPIOs we would
> currently say there are 0 banks, which is incorrect).
> 
> Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
> 
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/gpio/gpio-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 9defe25d4721..b83e23aecd18 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct 
> platform_device *pdev)
>  	gpio->chip.base = -1;
>  
>  	/* Allocate a cache of the output registers */
> -	banks = gpio->config->nr_gpios >> 5;
> +	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
>  	gpio->dcache = devm_kcalloc(&pdev->dev,
>  				    banks, sizeof(u32), GFP_KERNEL);
>  	if (!gpio->dcache)
> -- 
> 2.20.1
> 
>
