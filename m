Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 109472D34E
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2019 03:27:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DCkh4TLSzDqQs
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2019 11:27:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LS3OzXUP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="7qswdVOl"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DCkJ4rqvzDqRM
 for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2019 11:27:20 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 524D02203E;
 Tue, 28 May 2019 21:27:18 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 28 May 2019 21:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=ioeB7zHzuIrWPlycdQWlBGq8mtTxytQ
 LMO5+tIc96Og=; b=LS3OzXUPrbKqiJbL/pQVT1MOVVOLo0+E78YZXJwv1DpXruf
 Y3EncH+L0nN+izLmvqtPA83EWSEX+v2552DeODXpV1erb4L+vkGD3nVEBIBZw9sm
 OuR30rXhiCxmfx+LGZjtoViVbT4/FBfs6JiVkrG+iLsij2gpR+riYxtNa8qpFkc0
 gamh++e/Wa9GJ3wpZobvoTlMsrCwjJ+s1YAKOnruIuS3bmIIOMb2xsBsZ4VW3lJj
 Y02sZb4dCrd68pIeF8BSFcutQwq3qCP/dJbmrid5p0xjuakUlkz/b2dFyF0eSqE5
 jqae/CrC6u2XcaDqB2C6PX91ETJ1hQJxr82/s2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ioeB7z
 HzuIrWPlycdQWlBGq8mtTxytQLMO5+tIc96Og=; b=7qswdVOlE1f9vJrwsJhoSE
 jV3vZHzZk0EoBNB+HKPtenBhp5sGO19cz9qrOBv5JoICgK6IIDVBuVdyEdyreiJt
 8gszj6Hpz+pCnLkUH4x1jW/nJ9gw45WZRi2du9T7OZlV44TrvlK/GSmEe8/nyHDl
 40eNjgftT+ttN2I1C/NojHm6nHQAr6EturFeysDAqTT2qBeUbcN5eDbVEGWysR7X
 SVYCAQmVw+eRli37zjajA+2vrjW659hiWQ4ZTTuupzJSSbJT0sgQpH1/DIamN6FW
 6r/4ATUBTk8RIHXda43qaUIZPK4AaxHl++sSQuKB7xMPif67R+Ehw35XlCUk28ZQ
 ==
X-ME-Sender: <xms:9N_tXLiz0FV_kq6p9HMQVm8b9GwTjYANLQpCEKbfhcbreVLkNG6wdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddviedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:9N_tXLCRm4BGk27OuOe1ur6tyqa-6U06n2BL-N-Z6wL5FEUvaSAuHg>
 <xmx:9N_tXNqMOY8haizNcQXR51DiO96ZyDlZGA7RCousVe5ICapsxn-ebQ>
 <xmx:9N_tXCtIugJuRak_0OyMewJoejHMcP4Ymiu80TXHHI4NBgpy3-x5tw>
 <xmx:9t_tXGV3PMpaR97hvvy9j8WxwcyOGvhcCUp7fC7MjiCi6DXjsFb-pQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C2A78E00A1; Tue, 28 May 2019 21:27:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-555-g49357e1-fmstable-20190528v2
Mime-Version: 1.0
Message-Id: <04f103fb-54b1-4911-8164-44b20bfd1e72@www.fastmail.com>
In-Reply-To: <20190525144153.2028-1-yuehaibing@huawei.com>
References: <20190525144153.2028-1-yuehaibing@huawei.com>
Date: Wed, 29 May 2019 10:57:16 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: YueHaibing <yuehaibing@huawei.com>,
 "Stefan M Schaeckeler" <sschaeck@cisco.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, james.morse@arm.com,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH -next] EDAC: aspeed: Remove set but not used variable 'np'
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sun, 26 May 2019, at 00:12, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/edac/aspeed_edac.c: In function aspeed_probe:
> drivers/edac/aspeed_edac.c:284:22: warning: variable np set but not 
> used [-Wunused-but-set-variable]
> 
> It is never used and can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/edac/aspeed_edac.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
> index 11833c0a5d07..5634437bb39d 100644
> --- a/drivers/edac/aspeed_edac.c
> +++ b/drivers/edac/aspeed_edac.c
> @@ -281,15 +281,11 @@ static int aspeed_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct edac_mc_layer layers[2];
>  	struct mem_ctl_info *mci;
> -	struct device_node *np;
>  	struct resource *res;
>  	void __iomem *regs;
>  	u32 reg04;
>  	int rc;
>  
> -	/* setup regmap */
> -	np = dev->of_node;
> -
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res)
>  		return -ENOENT;
> -- 
> 2.17.1
> 
> 
>
