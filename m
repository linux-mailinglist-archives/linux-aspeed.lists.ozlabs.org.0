Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 464312237BF
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jul 2020 11:05:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7QFD6HhvzDqpR
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jul 2020 19:05:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=daniel.vetter@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=kge1RFcN; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7QDx4wPnzDqbX
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Jul 2020 19:04:57 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id a6so10213533wrm.4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Jul 2020 02:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+PgYCTE9+86LL8hmpo3wNDvQ3MAJhOxmPWFQosNnkp0=;
 b=kge1RFcNb3MA3gqeJzyuV24hUc8Wuu5d52T2gwyiKPKlVVFuua5swyDy6DIhvkNK5V
 O7aHOHvHI2g+W6rPUxi9EK/wSmgHDfpELQi/FWldTxF4LA5hKnx2XUn/hJYTg+GvKjKs
 0ppARKzGJPOZVBBk6nxakp5DLfoTkaBi9D+gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+PgYCTE9+86LL8hmpo3wNDvQ3MAJhOxmPWFQosNnkp0=;
 b=CDe64R/GiUxxMA2p8yPwnNk3TziDoQ9e6xWfRabpg2sw9eKicHtpKScUmVnXG5X9zC
 /A1bCipj0WTUg1JtJ4cBKc0692cz5j5uqFdVY5caBqFsPWLvXObALlrFg31RwPvrMUfa
 XHdrqY4oV7SP7ZVhipz+UExxQ5QIIwjjBTU1v3wajgFowUyHCRKuSPTvhlMGIhX4cv9O
 HSW4YiIQw+a9GVR2j6b+wkY7Mv9/Hyd+zNixA9fBVl4RDHMv28LxrgfYeAKiNT/VfEX9
 l7sTMUT7oGEHPlJVtmCgvSqwRkCrf5iBjN1d+i36vHhwsLCrZCVdJ3+xn9KBkgdSie6X
 qHPw==
X-Gm-Message-State: AOAM530bXHVpldbh6V9+RLd7LdN9l8b5SCEf1KfGahb0gFNBtWaOOSyJ
 tDYeFZuOC5qYYwcmm80dUkRXEg==
X-Google-Smtp-Source: ABdhPJy+91Soji71zWg4yMwSROun4xr6l/lazz9FI4nvDy4dRbGGruyC/WVVdgCNY4lq5iOhkRtW/w==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr9095443wrs.36.1594976692331; 
 Fri, 17 Jul 2020 02:04:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/18] drm/aspeed: Use managed drmm_mode_config_cleanup
Date: Fri, 17 Jul 2020 11:04:30 +0200
Message-Id: <20200717090430.1146256-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since aspeed doesn't use devm_kzalloc anymore we can use the managed
mode config cleanup.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 903f4f304647..0e19523f2a06 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -63,15 +63,15 @@ static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
-static void aspeed_gfx_setup_mode_config(struct drm_device *drm)
+static int aspeed_gfx_setup_mode_config(struct drm_device *drm)
 {
-	drm_mode_config_init(drm);
-
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
 	drm->mode_config.max_width = 800;
 	drm->mode_config.max_height = 600;
 	drm->mode_config.funcs = &aspeed_gfx_mode_config_funcs;
+
+	return drmm_mode_config_init(drm);
 }
 
 static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
@@ -144,7 +144,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	writel(0, priv->base + CRT_CTRL1);
 	writel(0, priv->base + CRT_CTRL2);
 
-	aspeed_gfx_setup_mode_config(drm);
+	ret = aspeed_gfx_setup_mode_config(drm);
+	if (ret < 0)
+		return ret;
 
 	ret = drm_vblank_init(drm, 1);
 	if (ret < 0) {
@@ -179,7 +181,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
 static void aspeed_gfx_unload(struct drm_device *drm)
 {
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
-- 
2.27.0

