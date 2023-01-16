Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E71C66D329
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Jan 2023 00:32:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwpGP2cG1z3cDh
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Jan 2023 10:32:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=kt2RebpV;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=xE4aoD0t;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay1-1.pub.mailoutpod2-cph3.one.com (client-ip=2a02:2350:5:400::1; helo=mailrelay1-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=kt2RebpV;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=xE4aoD0t;
	dkim-atps=neutral
X-Greylist: delayed 11719 seconds by postgrey-1.36 at boromir; Tue, 17 Jan 2023 10:32:21 AEDT
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwpGF3QxWz30gk
	for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Jan 2023 10:32:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=qWZKxlX4KW/JmPpNe4hoOYISYsciP5gHQlpn+CvfXf8=;
	b=kt2RebpVMaIBssccQkMEgek+nwW85G6J0siMHGZ1qETVQeJlMBKmjG0mlVm3r7ePnu8jfPm81ygq7
	 Mz8rQydCpwnm7+yWjbjNIN/fzDJe5WsKcBoAUsBadcQc0vOYb6T41tQjEeU/05VcOGjEkJnNNqYFDv
	 W6Hs6b61sUUwtJAeXWksNEBFK4Y9hM1amCX4haYovx3yLNNcTv+aB4AWsRcwfANqGXT1LV3gcWRrqV
	 ROUTznYXXwPl8HONFIMoZCbhWD4ezvanZv5cXNNxoJUbsVJ4K/EAnSMi/8BPSb4nuXYYFMXiL4SyAH
	 nCwGrMJpVzOvZphymhAQroedp3D9X1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=qWZKxlX4KW/JmPpNe4hoOYISYsciP5gHQlpn+CvfXf8=;
	b=xE4aoD0tRO5MstpdlKpx4S2jKlZCleYS/37b6LqWjWapIOw44SoqoiaLAWrBeI0WODd2oUSv6O6cJ
	 cNcxfeJCQ==
X-HalOne-ID: 90146bb7-95da-11ed-afa2-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay1 (Halon) with ESMTPSA
	id 90146bb7-95da-11ed-afa2-11abd97b9443;
	Mon, 16 Jan 2023 20:15:49 +0000 (UTC)
Date: Mon, 16 Jan 2023 21:15:47 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/22] drm: Remove unnecessary include statements for
 drm_crtc_helper.h
Message-ID: <Y8Wwcy3LuknhDQz1@ravnborg.org>
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <20230116131235.18917-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116131235.18917-3-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Thomas.

On Mon, Jan 16, 2023 at 02:12:15PM +0100, Thomas Zimmermann wrote:
> Several DRM core and helper source files include drm_crtc_helper.h
> without needing it or only to get its transitive include statements;
> leading to unnecessary compile-time dependencies.
> 
> Directly include required headers and drop drm_crtc_helper.h where
> possible. The header file, drm_fixed.h, includes <linux/kernel.h>
> for lower_32_bits().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_crtc_helper.c  | 1 -
>  drivers/gpu/drm/drm_lease.c        | 2 +-
>  drivers/gpu/drm/drm_plane_helper.c | 1 -
>  include/drm/drm_fixed.h            | 1 +
>  4 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index a209659a996c..e7a23e18140c 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -39,7 +39,6 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_crtc_helper.h>

drm_crtc_helper.c may not require drm/drm_crtc_helper.h, but it should
include it so we get a warning in case there is a mismatch between the
header file and the implementation.
I think sparse would also complain that the function is not declared
or something like that.

With this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  #include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index 08ab75303a00..150fe1555068 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -6,7 +6,7 @@
>  #include <linux/uaccess.h>
>  
>  #include <drm/drm_auth.h>
> -#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_crtc.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_lease.h>
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index ba6a9136a065..c91e454eba09 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -28,7 +28,6 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_atomic_uapi.h>
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 553210c02ee0..255645c1f9a8 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -25,6 +25,7 @@
>  #ifndef DRM_FIXED_H
>  #define DRM_FIXED_H
>  
> +#include <linux/kernel.h>
>  #include <linux/math64.h>
>  
>  typedef union dfixed {
> -- 
> 2.39.0
