Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7A1B7D76
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Apr 2020 20:03:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49828Q4lqqzDr30
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 Apr 2020 04:03:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ravnborg.org
 (client-ip=109.247.116.14; helo=asavdk3.altibox.net;
 envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ravnborg.org
X-Greylist: delayed 106 seconds by postgrey-1.36 at bilbo;
 Sat, 25 Apr 2020 04:02:50 AEST
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49828B6wZJzDr1D
 for <linux-aspeed@lists.ozlabs.org>; Sat, 25 Apr 2020 04:02:50 +1000 (AEST)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5D9E520038;
 Fri, 24 Apr 2020 20:02:47 +0200 (CEST)
Date: Fri, 24 Apr 2020 20:02:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 55/59] drm/aspeed: Use devm_drm_dev_alloc
Message-ID: <20200424180246.GK7074@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-56-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-56-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=aDkBgARPJ8BQx6vbOWsA:9
 a=CjuIK1q_8ugA:10 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-aspeed@lists.ozlabs.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Apr 15, 2020 at 09:40:30AM +0200, Daniel Vetter wrote:
> As usual, we can drop the drm_dev_put() and need to embed the
> drm_device. Since it's so few, also go right ahead and leave
> drm_device->dev_private set to NULL, so that we always use the
> container_of() upcast, which is faster anyway.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx.h      |  2 ++
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c |  2 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 31 +++++++++---------------
>  drivers/gpu/drm/aspeed/aspeed_gfx_out.c  |  2 +-
>  4 files changed, 15 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> index adc02940de6f..e7ca95827ae8 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> @@ -5,6 +5,7 @@
>  #include <drm/drm_simple_kms_helper.h>
>  
>  struct aspeed_gfx {
> +	struct drm_device		drm;
>  	void __iomem			*base;
>  	struct clk			*clk;
>  	struct reset_control		*rst;
> @@ -13,6 +14,7 @@ struct aspeed_gfx {
>  	struct drm_simple_display_pipe	pipe;
>  	struct drm_connector		connector;
>  };
> +#define to_aspeed_gfx(x) container_of(x, struct aspeed_gfx, drm)
>  
>  int aspeed_gfx_create_pipe(struct drm_device *drm);
>  int aspeed_gfx_create_output(struct drm_device *drm);
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> index 2184b8be6fd4..e54686c31a90 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> @@ -231,7 +231,7 @@ static const uint32_t aspeed_gfx_formats[] = {
>  
>  int aspeed_gfx_create_pipe(struct drm_device *drm)
>  {
> -	struct aspeed_gfx *priv = drm->dev_private;
> +	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
>  
>  	return drm_simple_display_pipe_init(drm, &priv->pipe, &aspeed_gfx_funcs,
>  					    aspeed_gfx_formats,
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index ada2f6aca906..6b27242b9ee3 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -77,7 +77,7 @@ static void aspeed_gfx_setup_mode_config(struct drm_device *drm)
>  static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
>  {
>  	struct drm_device *drm = data;
> -	struct aspeed_gfx *priv = drm->dev_private;
> +	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
>  	u32 reg;
>  
>  	reg = readl(priv->base + CRT_CTRL1);
> @@ -96,15 +96,10 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
>  static int aspeed_gfx_load(struct drm_device *drm)
>  {
>  	struct platform_device *pdev = to_platform_device(drm->dev);
> -	struct aspeed_gfx *priv;
> +	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
>  	struct resource *res;
>  	int ret;
>  
> -	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -	drm->dev_private = priv;
> -
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	priv->base = devm_ioremap_resource(drm->dev, res);
>  	if (IS_ERR(priv->base))
> @@ -187,8 +182,6 @@ static void aspeed_gfx_unload(struct drm_device *drm)
>  {
>  	drm_kms_helper_poll_fini(drm);
>  	drm_mode_config_cleanup(drm);
> -
> -	drm->dev_private = NULL;
>  }
>  
>  DEFINE_DRM_GEM_CMA_FOPS(fops);
> @@ -216,27 +209,26 @@ static const struct of_device_id aspeed_gfx_match[] = {
>  
>  static int aspeed_gfx_probe(struct platform_device *pdev)
>  {
> -	struct drm_device *drm;
> +	struct aspeed_gfx *priv;
>  	int ret;
>  
> -	drm = drm_dev_alloc(&aspeed_gfx_driver, &pdev->dev);
> -	if (IS_ERR(drm))
> -		return PTR_ERR(drm);
> +	priv = devm_drm_dev_alloc(&pdev->dev, &aspeed_gfx_driver,
> +				  struct aspeed_gfx, drm);
> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
>  
> -	ret = aspeed_gfx_load(drm);
> +	ret = aspeed_gfx_load(&priv->drm);
>  	if (ret)
> -		goto err_free;
> +		return ret;
>  
> -	ret = drm_dev_register(drm, 0);
> +	ret = drm_dev_register(&priv->drm, 0);
>  	if (ret)
>  		goto err_unload;
>  
>  	return 0;
>  
>  err_unload:
> -	aspeed_gfx_unload(drm);
> -err_free:
> -	drm_dev_put(drm);
> +	aspeed_gfx_unload(&priv->drm);
>  
>  	return ret;
>  }
> @@ -247,7 +239,6 @@ static int aspeed_gfx_remove(struct platform_device *pdev)
>  
>  	drm_dev_unregister(drm);
>  	aspeed_gfx_unload(drm);
> -	drm_dev_put(drm);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> index 67ee5fa10055..6759cb88415a 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> @@ -28,7 +28,7 @@ static const struct drm_connector_funcs aspeed_gfx_connector_funcs = {
>  
>  int aspeed_gfx_create_output(struct drm_device *drm)
>  {
> -	struct aspeed_gfx *priv = drm->dev_private;
> +	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
>  	int ret;
>  
>  	priv->connector.dpms = DRM_MODE_DPMS_OFF;
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
