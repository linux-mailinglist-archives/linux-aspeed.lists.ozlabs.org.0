Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B58DBBA
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 19:27:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467xP15cSDzDqtm
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Aug 2019 03:27:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ffwll.ch header.i=@ffwll.ch header.b="S4LZ0ZhI"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467xNq2qF4zDqgd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2019 03:27:34 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id h13so7737186edq.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 10:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+2YJRbop7obhJvx6M/oXULPH/J+nom3HFlj8fZHLgck=;
 b=S4LZ0ZhIFTLmy+dmmZbaLaOg0YS4AVm25WTeqTC5q04TLFmuKXix6ea6GroX69AccQ
 TVsyDYKimeexBM+zMbTI7uThBz1wKxoZ2LA/DsPjtLnCxTpInBlf253wnioU/rbc30kx
 lxmEzhEsWTICGjuh7wAQdG5twlk69J1nGF1g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=+2YJRbop7obhJvx6M/oXULPH/J+nom3HFlj8fZHLgck=;
 b=m3EPKFRxoHZhs8P0Jvker1uDMPcSMmObPa9r39rcarh3WW0DnqAELXj3bBO5DCUa+c
 iU50Ewx3JmKLfgH/+Tx9bkt/XuGSg9DbWqpl5C3/5ZaY6iB1VMJfk3ZnK4hh9HAn6qyf
 nmtaRXdDoHwgKcrH0ZDofiQzoY1f6Ty+8S/trK4YqN9ycLp8z2a3o2DabURV0dt+oMaX
 ixMwy2vNFNkDGe8wXoNCBB28Sy3jnYfpG2XXz38XLicSzVS7PvWk/8zuf/aXNrMVobDE
 TEKpvZ8n4YT9z9uhZAFt91sweKrOZMyANrT4C/JEakLPjmmwZ/gUmcc6++zLblVTG5IT
 cJGQ==
X-Gm-Message-State: APjAAAWT47xDnJs/C0fyPcWDNj0sBPUNMwy3Uk/3/CwA6PVJtu02W7Dt
 dVSubl2mqTgVo4w5x/t3dIXGBg==
X-Google-Smtp-Source: APXvYqxDenh8FqJ/E7jAQeR7LkcaMiSGhd2axDUeDfcgpFNQ91SfeEo1ZCMhZXrO8haciNGMe7XFWQ==
X-Received: by 2002:a50:ed94:: with SMTP id h20mr814730edr.59.1565803650087;
 Wed, 14 Aug 2019 10:27:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f6sm72806edk.79.2019.08.14.10.27.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:27:29 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:27:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH] drm/aspeed: gfc_crtc: Make structure aspeed_gfx_funcs
 constant
Message-ID: <20190814172727.GQ7444@phenom.ffwll.local>
References: <20190813063355.25549-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813063355.25549-1-nishkadg.linux@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-aspeed@lists.ozlabs.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Aug 13, 2019 at 12:03:55PM +0530, Nishka Dasgupta wrote:
> The static structure aspeed_gfx_funcs, of type
> drm_simple_display_pipe_funcs, is used only as an argument to
> drm_simple_display_pipe_init(), which does not modify it. Hence make it
> constant to protect it from unintended modification.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Applied, thanks for your patch.
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> index 15db9e426ec4..2184b8be6fd4 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> @@ -215,7 +215,7 @@ static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
>  	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
>  }
>  
> -static struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
> +static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
>  	.enable		= aspeed_gfx_pipe_enable,
>  	.disable	= aspeed_gfx_pipe_disable,
>  	.update		= aspeed_gfx_pipe_update,
> -- 
> 2.19.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
