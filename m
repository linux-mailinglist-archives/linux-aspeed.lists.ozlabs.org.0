Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4D11106
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 03:57:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vdgN3bp6zDqNy
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 11:57:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oZkf6TJG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DRFqc7bU"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vdg737r9zDqN0
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 11:57:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 798A2230B4;
 Wed,  1 May 2019 21:57:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 01 May 2019 21:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=OGsSs2KlqnlLozHMQ4NHosgwgiN5NbP
 45XyUriKwyFE=; b=oZkf6TJGGPX/gPVOT1NArMFL8yWDDdfl9Ae5HUUJ9D36DZ8
 xWUo2/TRo5o5oHGToNidDhyIex7sPbCQfs0tjT1vusG+Nl3JR0F/tzdK7onFtYvx
 UkqsfCmFqcicjlpbmVpQVCnpJI/KqteBMikXTJLDSma5tjyC02hmZTYO+V2vuyyO
 RuYylPqGohF7QQ2NA5vPhI5jkcTS0h0FmzgFHQEFIs7qTofeyi67liiLFd30VCGS
 8h1NaUU1euvafsqNGgt3jjq/9LPiwt0SlHTyeHsIjJZ3YUz88VVvyPw4E7ER16qp
 iwj8bus951f6NApGyoCGsuthZw/0fX9eAyYFWxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OGsSs2
 KlqnlLozHMQ4NHosgwgiN5NbP45XyUriKwyFE=; b=DRFqc7bUgT+LvVx86/hLqE
 YfNX8MMbGMf9iZkWpw1mKcQNfsf2JjHVn1ZIMWDlmTVq8qMlEDk3o8ADOwNjGN1N
 23/iq2JcAHRF4rC1uoj4bHEy32NiAiD4jkY9M9fPdtgEzONbd86lqWFMYwpcgw5v
 EBSfS3M+2jPiiTBUdz4ff+Sth861w1BfmhjWWmI58KGI8huAOCSDjbizgUOXvS5T
 jakWkTc2kXIG/PdRVE5xGhwCE0Ks+opJT2+vlfHdjTZWbg0MYFufaf9hxXsMmy9j
 XZnyTtE2R/aTImJgHdIVEI7UrDhn0c67Rmgx1ZUuuV4hA+q0rb87ZUtsToyQyMXg
 ==
X-ME-Sender: <xms:b07KXBbo6K51Zr-_Edz-P1FPJxbGMzJ2Wii_bMRTwdD9g0LWFi1HNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:b07KXBDZRLnsRBFc1qqggYcwkuN1HMA3seOFPUUj1n2wCM2LfsVYUA>
 <xmx:b07KXLae-a6tYMmvzCDn2JJ_bD4xQYMGejDqCeHfGNG9UhAKWLX60g>
 <xmx:b07KXJkyc7hDbwqWcIeInQAERQG0_Ua2n2JImQdLLbYr8bUlX81IPQ>
 <xmx:b07KXENFq-Tt4aooMXJLnfi7zmP38XpqaSGxBW6cWX6tcyj-CqSm2Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 111AC7C7F9; Wed,  1 May 2019 21:57:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <a39f9067-740c-4177-bb20-b55778ccaf7b@www.fastmail.com>
In-Reply-To: <1681003008.3393892.1556750962226.JavaMail.zimbra@raptorengineeringinc.com>
References: <1681003008.3393892.1556750962226.JavaMail.zimbra@raptorengineeringinc.com>
Date: Wed, 01 May 2019 21:57:02 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Timothy Pearson" <tpearson@raptorengineering.com>,
 linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_1/3]_drm/aspeed:_Preserve_DVO_configuration_bits_du?=
 =?UTF-8?Q?ring_initialization?=
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 2 May 2019, at 08:19, Timothy Pearson wrote:
> GFX064 contains DVO enable and mode bits.  These are hardware specific, 
> configured
> via the pinmux from the DT, and should not be cleared during startup.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c 
> b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 713a3975852b..1a7a9a000e2e 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -98,6 +98,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
>  	struct aspeed_gfx *priv;
>  	struct resource *res;
>  	int ret;
> +	u32 reg;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -146,7 +147,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
>  
>  	/* Sanitize control registers */
>  	writel(0, priv->base + CRT_CTRL1);
> -	writel(0, priv->base + CRT_CTRL2);
> +	/* Preserve CRT_CTRL2[7:6] (DVO configuration) */
> +	reg = readl(priv->base + CRT_CTRL2) & 0xc0;

I'd prefer we go the route of adding #defines for each bit, then OR'ing them
to create an appropriate mask. This seems a little opaque, even if we have
the comment.

> +	writel(reg, priv->base + CRT_CTRL2);
>  
>  	aspeed_gfx_setup_mode_config(drm);
>  
> -- 
> 2.11.0
> 
>
