Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D4B1A9496
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Apr 2020 09:41:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492Dnr138qzDr3S
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Apr 2020 17:41:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=daniel.vetter@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=kOJrWw/4; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492Dnd6s0jzDr3D
 for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Apr 2020 17:41:39 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id j2so17883712wrs.9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Apr 2020 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRatY+F67aXqhaX4hT+qBcw2kGGTk2t0/Bm3puPQZCA=;
 b=kOJrWw/4js1cp1aXjXSVPq3jgc+DbH4EXbhaff5AgL+jJGpOa0STmRLuvLn2TK6H0u
 tsw6nsBDQxqgGIki/S29PP83YlrJ8FluNeFuVCIXb8Lmc5Y02dh312JTxILtNkuHTjEa
 XJ9oxyUQ2oMRFO0TxvdZVWizykYiSOhcF8jbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRatY+F67aXqhaX4hT+qBcw2kGGTk2t0/Bm3puPQZCA=;
 b=djzyYHp7PVAc3hLMj8jmqHgsHt7tYhS+BDRZQJVW3Tm6U3eEDV2z4ZL3FIoxadY6Ur
 UDBGlmiitB1ne1GIPOPhLhxeoqYAlLcDXHH/H0Dcbe401z3rDodgE35lxyuWdztKv4MO
 eyDjMd02mq+i021I0ykIuKMk9nyRqbYcoXpf0ur69zayqbT134+pDn7y6kdk3CbdTf4X
 oT4OkwE6s8z3ZvCV+14Hmvt7aSBRLSLTZkPV+KBhSi4MfY1IM12DWgtCAvgAoRF+ubaS
 d08ecu2eaeRlqNFt1v6+yVVy7WmDMxeV2P59dg1uP380M0nofz/ndWTkH0C+CCOJfyNf
 3iTg==
X-Gm-Message-State: AGi0PuZxLdhJX5se8teQ4m88vJjPzcZwY2hdU/VJGJpZXsxMrgcnOhlc
 vvnBGaovxMCEHRAjmluHSbW+WzXcwQU=
X-Google-Smtp-Source: APiQypKbcmyrepnoF8CDc2wkeZUMxmBWJgmUdz65RQKSdQwaEZ9GASFGOe6TNrSvJnxSk/VexO+Zgw==
X-Received: by 2002:adf:b344:: with SMTP id k4mr17735067wrd.76.1586936496578; 
 Wed, 15 Apr 2020 00:41:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:36 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 55/59] drm/aspeed: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:40:30 +0200
Message-Id: <20200415074034.175360-56-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

As usual, we can drop the drm_dev_put() and need to embed the
drm_device. Since it's so few, also go right ahead and leave
drm_device->dev_private set to NULL, so that we always use the
container_of() upcast, which is faster anyway.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  2 ++
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 31 +++++++++---------------
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c  |  2 +-
 4 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index adc02940de6f..e7ca95827ae8 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -5,6 +5,7 @@
 #include <drm/drm_simple_kms_helper.h>
 
 struct aspeed_gfx {
+	struct drm_device		drm;
 	void __iomem			*base;
 	struct clk			*clk;
 	struct reset_control		*rst;
@@ -13,6 +14,7 @@ struct aspeed_gfx {
 	struct drm_simple_display_pipe	pipe;
 	struct drm_connector		connector;
 };
+#define to_aspeed_gfx(x) container_of(x, struct aspeed_gfx, drm)
 
 int aspeed_gfx_create_pipe(struct drm_device *drm);
 int aspeed_gfx_create_output(struct drm_device *drm);
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 2184b8be6fd4..e54686c31a90 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -231,7 +231,7 @@ static const uint32_t aspeed_gfx_formats[] = {
 
 int aspeed_gfx_create_pipe(struct drm_device *drm)
 {
-	struct aspeed_gfx *priv = drm->dev_private;
+	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 
 	return drm_simple_display_pipe_init(drm, &priv->pipe, &aspeed_gfx_funcs,
 					    aspeed_gfx_formats,
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index ada2f6aca906..6b27242b9ee3 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -77,7 +77,7 @@ static void aspeed_gfx_setup_mode_config(struct drm_device *drm)
 static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 {
 	struct drm_device *drm = data;
-	struct aspeed_gfx *priv = drm->dev_private;
+	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	u32 reg;
 
 	reg = readl(priv->base + CRT_CTRL1);
@@ -96,15 +96,10 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 static int aspeed_gfx_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
-	struct aspeed_gfx *priv;
+	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	struct resource *res;
 	int ret;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-	drm->dev_private = priv;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->base = devm_ioremap_resource(drm->dev, res);
 	if (IS_ERR(priv->base))
@@ -187,8 +182,6 @@ static void aspeed_gfx_unload(struct drm_device *drm)
 {
 	drm_kms_helper_poll_fini(drm);
 	drm_mode_config_cleanup(drm);
-
-	drm->dev_private = NULL;
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
@@ -216,27 +209,26 @@ static const struct of_device_id aspeed_gfx_match[] = {
 
 static int aspeed_gfx_probe(struct platform_device *pdev)
 {
-	struct drm_device *drm;
+	struct aspeed_gfx *priv;
 	int ret;
 
-	drm = drm_dev_alloc(&aspeed_gfx_driver, &pdev->dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	priv = devm_drm_dev_alloc(&pdev->dev, &aspeed_gfx_driver,
+				  struct aspeed_gfx, drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
-	ret = aspeed_gfx_load(drm);
+	ret = aspeed_gfx_load(&priv->drm);
 	if (ret)
-		goto err_free;
+		return ret;
 
-	ret = drm_dev_register(drm, 0);
+	ret = drm_dev_register(&priv->drm, 0);
 	if (ret)
 		goto err_unload;
 
 	return 0;
 
 err_unload:
-	aspeed_gfx_unload(drm);
-err_free:
-	drm_dev_put(drm);
+	aspeed_gfx_unload(&priv->drm);
 
 	return ret;
 }
@@ -247,7 +239,6 @@ static int aspeed_gfx_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(drm);
 	aspeed_gfx_unload(drm);
-	drm_dev_put(drm);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
index 67ee5fa10055..6759cb88415a 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
@@ -28,7 +28,7 @@ static const struct drm_connector_funcs aspeed_gfx_connector_funcs = {
 
 int aspeed_gfx_create_output(struct drm_device *drm)
 {
-	struct aspeed_gfx *priv = drm->dev_private;
+	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	int ret;
 
 	priv->connector.dpms = DRM_MODE_DPMS_OFF;
-- 
2.25.1

