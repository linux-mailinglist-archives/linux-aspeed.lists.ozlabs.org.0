Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A39312498
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 May 2019 00:35:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w97P1wsSzDqRn
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 May 2019 08:34:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WSg6OpOL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ituBuaIj"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w97J5d4XzDqPG
 for <linux-aspeed@lists.ozlabs.org>; Fri,  3 May 2019 08:34:52 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 10C578E8;
 Thu,  2 May 2019 18:34:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 02 May 2019 18:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=/q13aJIQ9mTOKCqXMXint6reH3JWEaW
 9DkRsfVp0DQ8=; b=WSg6OpOL1EhY/FEYyopx6RiMYml6Cj1tqRsGstvZO88QRTp
 MV+f0cFqvjtnPHY3zyVlqAVaKWHXULnNGhefnKSawee/hAw5hzl3sxXuD+slr6t4
 bmpVJAR02zy0uoIAA4aaUJt7XdZgF/D8qfFdkeiCP/XyoShuYUAHT3flb0udrbDD
 hGRWiUHZWrPn6s80zKNK+NTGQpTSIKsjtnv745O24pIRAwvQQPWVWgpDD/GWrVbj
 zT9U5iEEhlO+QRiaYBfE3gIJDrpvuTbT4tbDIZeVrfZ0k2vkf9PytmC/vMHOJK+a
 UxufCGCLDXmJ+qP/yTiooP1+GAZoBxTOgl759+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/q13aJ
 IQ9mTOKCqXMXint6reH3JWEaW9DkRsfVp0DQ8=; b=ituBuaIjJ1egLzOESKsROC
 7Q0kDA5JzafQGTLQDdZTY3w8UJDwSYZiwPojI56nMG+Lza96mRX6HoLarGXPnKhu
 QM58TJwgKErD9CDMe+af9fK8HKB1NcTA3q60gTZGK6yrx0K+4dXOGPTGuFQdgN6U
 pWJHfRl22Wd3kTDJSpC42IBIN+L4I2zgV5L0bu0ZulDywzOtH/LX+d1GQXSXHDLv
 UNUrdYN7M98JoqRNnwngmU50Vy0MQqtnf2cOa112ZuckaNNmpXPksZa7NI1Scbb4
 3vEcG5ZUKsAi9z19acXOp5sDzoqgjn0kQlxgRoaxO7sDFxQVAktpA8eYmqwwPp4Q
 ==
X-ME-Sender: <xms:iXDLXHACGQXuglYZlRjXxIaAJbxai4w4d2NBQXjy0K7EoSkMRTYp8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedtgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:iXDLXDquRZ70z2ToCBt05kjZcyjSMdd_1sBZZNV6nHurWAmPWeZMWQ>
 <xmx:iXDLXILyZpJ8gV1dFOJKZgbIsMHP4EG1nUgYhgKWovV_dZFeCqHpPA>
 <xmx:iXDLXNKqs2W2_piLW1b0DuC1kxHon4ARCoCoMUZ3lwUmoCcCp47kbg>
 <xmx:iXDLXAkBaXOa29y82HKmURUa72SzCEURUJhHgI4lcN3bKQQiiqSfaA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id ED0B77C6D9; Thu,  2 May 2019 18:34:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <c41d689b-74e5-4689-a12a-70ecb0aad9d0@www.fastmail.com>
In-Reply-To: <671575004.3553124.1556833901812.JavaMail.zimbra@raptorengineeringinc.com>
References: <671575004.3553124.1556833901812.JavaMail.zimbra@raptorengineeringinc.com>
Date: Thu, 02 May 2019 18:34:48 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Timothy Pearson" <tpearson@raptorengineering.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] drm/aspeed: Add DVO output option to GFX driver
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



On Fri, 3 May 2019, at 07:21, Timothy Pearson wrote:
> The AST2500 offers an alternate GFX output mode over DVO.
> Enable DVO or VGA output mode conditionally based on two new
> device tree properties, output-vga and output-dvo.

You can't add properties without updating the bindings documentation.
Please fix this, and make sure to Cc the devicetree maintainers
(./scripts/get_maintainer.pl).

> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx.h      |  6 ++++++
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 29 +++++++++++++++++++++++------
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 17 ++++++++++++++++-
>  3 files changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h 
> b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> index b34c97613aaf..6f9bc01191c0 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> @@ -14,6 +14,8 @@ struct aspeed_gfx {
>  	struct drm_simple_display_pipe	pipe;
>  	struct drm_connector		connector;
>  	struct drm_fbdev_cma		*fbdev;
> +
> +	u8				output_mode;
>  };
>  
>  int aspeed_gfx_create_pipe(struct drm_device *drm);
> @@ -105,3 +107,7 @@ int aspeed_gfx_create_output(struct drm_device *drm);
>  
>  /* Default Threshold Seting */
>  #define G5_CRT_THROD_VAL	(CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3C))
> +
> +/* Output mode */
> +#define OUTPUT_VGA	0x1
> +#define OUTPUT_DVO	0x2
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c 
> b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> index 15db9e426ec4..ee16f9011d70 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  // Copyright 2018 IBM Corporation
> +// Copyright 2019 Raptor Engineering, LLC
>  
>  #include <linux/clk.h>
>  #include <linux/reset.h>
> @@ -59,11 +60,21 @@ static void aspeed_gfx_enable_controller(struct 
> aspeed_gfx *priv)
>  	u32 ctrl1 = readl(priv->base + CRT_CTRL1);
>  	u32 ctrl2 = readl(priv->base + CRT_CTRL2);
>  
> -	/* SCU2C: set DAC source for display output to Graphics CRT (GFX) */
> -	regmap_update_bits(priv->scu, 0x2c, BIT(16), BIT(16));
> +	if (priv->output_mode & OUTPUT_VGA) {
> +		/* SCU2C: set DAC source for display output to Graphics CRT (GFX) */
> +		regmap_update_bits(priv->scu, 0x2c, BIT(16), BIT(16));
> +	}
> +	if (priv->output_mode & OUTPUT_DVO) {
> +		/* SCU2C: set DVO source for display output to Graphics CRT (GFX) */
> +		regmap_update_bits(priv->scu, 0x2c, BIT(18), BIT(18));
> +	}
>  
>  	writel(ctrl1 | CRT_CTRL_EN, priv->base + CRT_CTRL1);
> -	writel(ctrl2 | CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
> +
> +	if (priv->output_mode & OUTPUT_VGA)
> +		writel(ctrl2 | CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
> +	if (priv->output_mode & OUTPUT_DVO)
> +		writel(ctrl2 | CRT_CTRL_DVO_EN, priv->base + CRT_CTRL2);

I'm mildly concerned about the use of writel() given that the GFX MMIO region
is covered by a regmap to assist pinmux.

Joel, can you expand on this? I know you're not a fan of regmap, but IMO we
should be consistent.

$ git grep CRT_CTRL2 -- drivers/gpu/drm/aspeed/
drivers/gpu/drm/aspeed/aspeed_gfx.h:#define CRT_CTRL2           0x64 /* CRT Control II */
drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c:       u32 ctrl2 = readl(priv->base + CRT_CTRL2);
drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c:       writel(ctrl2 | CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c:       u32 ctrl2 = readl(priv->base + CRT_CTRL2);
drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c:       writel(ctrl2 & ~CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
drivers/gpu/drm/aspeed/aspeed_gfx_drv.c:        writel(0, priv->base + CRT_CTRL2);

Andrew

>  }
>  
>  static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
> @@ -72,9 +83,15 @@ static void aspeed_gfx_disable_controller(struct 
> aspeed_gfx *priv)
>  	u32 ctrl2 = readl(priv->base + CRT_CTRL2);
>  
>  	writel(ctrl1 & ~CRT_CTRL_EN, priv->base + CRT_CTRL1);
> -	writel(ctrl2 & ~CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
> -
> -	regmap_update_bits(priv->scu, 0x2c, BIT(16), 0);
> +	if (priv->output_mode & OUTPUT_VGA)
> +		writel(ctrl2 & ~CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
> +	if (priv->output_mode & OUTPUT_DVO)
> +		writel(ctrl2 & ~CRT_CTRL_DVO_EN, priv->base + CRT_CTRL2);
> +
> +	if (priv->output_mode & OUTPUT_VGA)
> +		regmap_update_bits(priv->scu, 0x2c, BIT(16), 0);
> +	if (priv->output_mode & OUTPUT_DVO)
> +		regmap_update_bits(priv->scu, 0x2c, BIT(18), 0);
>  }
>  
>  static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c 
> b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 7e9072fd0ef0..17a22dd0922a 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  // Copyright 2018 IBM Corporation
> +// Copyright 2019 Raptor Engineering, LLC
>  
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
> @@ -50,7 +51,8 @@
>   * is the ARM's internal display controller.
>   *
>   * The driver only supports a simple configuration consisting of a 40MHz
> - * pixel clock, fixed by hardware limitations, and the VGA output path.
> + * pixel clock, fixed by hardware limitations.  It supports DVO output
> + * mode as well based on device tree configuration.
>   *
>   * The driver was written with the 'AST2500 Software Programming Guide' v17,
>   * which is available under NDA from ASPEED.
> @@ -95,6 +97,7 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
>  static int aspeed_gfx_load(struct drm_device *drm)
>  {
>  	struct platform_device *pdev = to_platform_device(drm->dev);
> +	struct device_node *nc = drm->dev->of_node;
>  	struct aspeed_gfx *priv;
>  	struct resource *res;
>  	int ret;
> @@ -145,6 +148,18 @@ static int aspeed_gfx_load(struct drm_device *drm)
>  	}
>  	clk_prepare_enable(priv->clk);
>  
> +	if (of_property_read_bool(nc, "output-vga"))
> +		priv->output_mode |= OUTPUT_VGA;
> +	else if (of_property_read_bool(nc, "output-dvo"))
> +		priv->output_mode |= OUTPUT_DVO;
> +	else
> +		priv->output_mode = OUTPUT_VGA;
> +
> +	if (priv->output_mode & OUTPUT_VGA)
> +		DRM_INFO("Enabling VGA output\n");
> +	if (priv->output_mode & OUTPUT_DVO)
> +		DRM_INFO("Enabling DVO output\n");
> +
>  	/* Sanitize control registers */
>  	writel(0, priv->base + CRT_CTRL1);
>  	/* Preserve CRT_CTRL2[7:6] (DVO configuration) */
> -- 
> 2.11.0
>
