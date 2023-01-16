Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E27566D068
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Jan 2023 21:47:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwkcQ3887z3cCY
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Jan 2023 07:47:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=acpUj4kn;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=R3QeKkvU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ravnborg.org (client-ip=46.30.211.180; helo=mailrelay5-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=acpUj4kn;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=R3QeKkvU;
	dkim-atps=neutral
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwkcK5f9gz3bWC
	for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Jan 2023 07:47:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=dxZrgiFiSWE0neC/Zn81efMq20upjy192H3IxuR5/u8=;
	b=acpUj4knulQkBKBaY+52P5qMowzl3CqetGOVLg/297AeK+8Ryp/AKK2Xhs78wcpqAWKMYggzJWDzB
	 biPi7fjApEW+sEGRVKj43UtyH27cyE30zC5xeKBIWLeDxMvBMaWIQ9C2KNsct8BVV/z5Xi2Z9xmXdN
	 iB2Tp6//DgFIal9nwQvjsa5mljq2hOLf4Zl++xLkESSZCEU8Wx7V/M8Yabz6d5rgsJjERIdkci8tJF
	 BzJIC9Ass7ItSJBCwTMvAx3dwBffjSnlLBYYHAB6/KYGwz02LqImL0TBBlVYOqzuWH81uTr8k+kGQw
	 oF52hXCmjcfEX0rspiuM5UBSj5DoeAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=dxZrgiFiSWE0neC/Zn81efMq20upjy192H3IxuR5/u8=;
	b=R3QeKkvU5DTf1usW/irfIsJev9hjfAQvABn1WhWFZnkOGF2yihtMhXjFJCHCSPYm0dh3TEmBVSzY6
	 8ufGRagDA==
X-HalOne-ID: c3e8962f-95dc-11ed-8539-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5 (Halon) with ESMTPSA
	id c3e8962f-95dc-11ed-8539-7703b0afff57;
	Mon, 16 Jan 2023 20:31:35 +0000 (UTC)
Date: Mon, 16 Jan 2023 21:31:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 18/22] drm/sun4i: Remove unnecessary include statements
 for drm_crtc_helper.h
Message-ID: <Y8W0JnmbyQnObFa+@ravnborg.org>
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <20230116131235.18917-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116131235.18917-19-tzimmermann@suse.de>
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

On Mon, Jan 16, 2023 at 02:12:31PM +0100, Thomas Zimmermann wrote:
> Several source files include drm_crtc_helper.h without needing it or
> only to get its transitive include statements; leading to unnecessary
> compile-time dependencies.
> 
> Directly include required headers and drop drm_crtc_helper.h where
> possible.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index 477cb6985b4d..37dc66332bbd 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -8,8 +8,8 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_modeset_helper_vtables.h>

Move one up to maintain sorting.
With that fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  #include <drm/drm_simple_kms_helper.h>
>  
>  #include "sun8i_dw_hdmi.h"
> -- 
> 2.39.0
