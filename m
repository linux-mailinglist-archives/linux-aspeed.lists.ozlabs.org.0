Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2FE1248D
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 May 2019 00:25:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w8vx18kJzDqRs
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 May 2019 08:25:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fCfozx0X"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Md41Su2k"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w8vg6v9qzDqPP
 for <linux-aspeed@lists.ozlabs.org>; Fri,  3 May 2019 08:24:47 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 570A48D8;
 Thu,  2 May 2019 18:24:43 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 02 May 2019 18:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=+XxdpJIvbOtDkjxjdjm54nl9jlp2P4m
 Iv1D0QjO3Jjw=; b=fCfozx0XDJuiCcQmav+Zf6dmqdpjQu5jntWmLwxTpmHMa3D
 w6GERyAE3KPNY4FdeKJREPsmy6WWqCzkHcFVKejKz3d7SXHwFDqVb24CVkiPfboh
 +W3f7u1R8AY6pI9NlVrblKug9s64Ty+3UVJxrVaxVRUJYvAIs5bQyTF6zEDd/u+q
 iakHSHsgNkDFQ/PV9wVEjH7odwB6/VyIaNGiRLAXe+6YhjOrWgpwsoYtuvqiTId1
 3q4dtpgLSTsanDlXBgrVU0bsr1ryzge7mDmS2/udH47nrbI42/YKMJt3wtDM0C1B
 SS9gB9LGqnJOntyU1m2aznworlqcW5K8scpAL/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+XxdpJ
 IvbOtDkjxjdjm54nl9jlp2P4mIv1D0QjO3Jjw=; b=Md41Su2k9jgIVMaZuslpCl
 DQBDNy/cmWPE8nctEMv92ptaZ9BAdJtmZMhSQcbJZytpTOaaYKjJdHWxywPiP5i6
 Op99+h/l0lr1a/B921c/yMXCt4VPlDMvRVxGFk9KjdzBT6EgYaj4HlENvtP5sTKh
 6NoLLCGxBed5S0aXL4nnUbNp4nWcj8ox/AwbrXYhgWF1OpfD8fLhBBWkd5mrk494
 mGgatfbvbLWDm2k/WZwEbvaWhy55tvU0YLQ/8ej3sI/0v7iLIYo117NtQ8eSxAF6
 hgAj+1eh8yhD8XCMqPGtZSNDKl+0dimh0S5t47V5BOeCPo73byQxob4bMulBpTfw
 ==
X-ME-Sender: <xms:Km7LXGgojmPmDy47WOnxWtVfeF1G7E76o5LaSGIBxl6vDaIgHss5NA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedtgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:Km7LXM2A1w_gMgNlUlKwkd-Aqzs-dunC7fGPUchJ1jEk4o62EM9yOA>
 <xmx:Km7LXDIYi-GykmiOSvJx--RqkoS4D10z8E2SY4k5h405RAPV4j8YkQ>
 <xmx:Km7LXOQ_q9cvhwYaooJfpFLMbwvx3WlkZvhz9AGdGGm4ZahfirCMTQ>
 <xmx:Km7LXFAn13kyq-p-zDsVXU8cghk51LZ_1vUmn2UcSwbWs8P-e2A-xg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7598D7C6D9; Thu,  2 May 2019 18:24:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <e7bf0b26-ca0a-4694-b150-21be7f5bf661@www.fastmail.com>
In-Reply-To: <1731023470.3553122.1556833875705.JavaMail.zimbra@raptorengineeringinc.com>
References: <1731023470.3553122.1556833875705.JavaMail.zimbra@raptorengineeringinc.com>
Date: Thu, 02 May 2019 18:24:02 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Timothy Pearson" <tpearson@raptorengineering.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH_1/2]_[v2]_drm/aspeed:_Preserve_DVO_configuration_bi?=
 =?UTF-8?Q?ts_during_initialization?=
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

Hi Timothy,

A few of things:

1. Please run ./scripts/checkpatch.pl over your patches before sending
2. Version your series coherently - having [v2] of one patch in the series threw
     me out. Please use `git format-patch -vX`, it will handle this for you
     automatically.
3. For multi-patch series I suggest using a cover letter - this helps thread them
     in a sane manner. It's also a great place to describe what you're trying to
     achieve with the series
4. Please use ./scripts/get_maintainer.pl to find the right people and lists to
     which to send patches.

In this case Joel will pick the patch up, but it's better if you have him either
in To: or Cc: as you're more likely to get his attention this way.

Generally, a lot of this is covered in the kernel's documentation - dig around
under Documentation/process.

Aside from that, some minor style points below:

On Fri, 3 May 2019, at 07:21, Timothy Pearson wrote:
> GFX064 contains DVO enable and mode bits.  These are hardware specific, 
> configured

This should be wrapped at 75 chars

> via the pinmux from the DT, and should not be cleared during startup.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx.h     | 3 +++
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 5 ++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h 
> b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> index b7a986e49177..b34c97613aaf 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  // Copyright 2018 IBM Corporation
> +// Copyright 2019 Raptor Engineering, LLC
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -73,6 +74,8 @@ int aspeed_gfx_create_output(struct drm_device *drm);
>  
>  /* CTRL2 */
>  #define CRT_CTRL_DAC_EN			BIT(0)
> +#define CRT_CTRL_DVO_MODE		BIT(6)
> +#define CRT_CTRL_DVO_EN			BIT(7)
>  #define CRT_CTRL_VBLANK_LINE(x)		(((x) << 20) & CRT_CTRL_VBLANK_LINE_MASK)
>  #define CRT_CTRL_VBLANK_LINE_MASK	GENMASK(20, 31)
>  
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c 
> b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 713a3975852b..7e9072fd0ef0 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -98,6 +98,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
>  	struct aspeed_gfx *priv;
>  	struct resource *res;
>  	int ret;
> +	u32 reg;

This breaks the reverse-christmas-tree ordering, but that's getting quite pedantic.
 
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -146,7 +147,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
>  
>  	/* Sanitize control registers */
>  	writel(0, priv->base + CRT_CTRL1);
> -	writel(0, priv->base + CRT_CTRL2);
> +	/* Preserve CRT_CTRL2[7:6] (DVO configuration) */
> +	reg = readl(priv->base + CRT_CTRL2) & (CRT_CTRL_DVO_MODE | CRT_CTRL_DVO_EN);

Should be wrapped at 80 chars.

Other than that,

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +	writel(reg, priv->base + CRT_CTRL2);
>  
>  	aspeed_gfx_setup_mode_config(drm);
>  
> -- 
> 2.11.0
>
