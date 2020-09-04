Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFBC25DC32
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Sep 2020 16:49:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjgY96pgkzDqsC
	for <lists+linux-aspeed@lfdr.de>; Sat,  5 Sep 2020 00:49:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=daniel.vetter@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=OOfQuuEj; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjgXs14lRzDqTZ
 for <linux-aspeed@lists.ozlabs.org>; Sat,  5 Sep 2020 00:48:43 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id z9so6359322wmk.1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 04 Sep 2020 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jVoidh4eK5SMWwvVdGvcbPkxD3QsnFfymSXNjak7xmE=;
 b=OOfQuuEjKv7K7JE/iEfPadM7YeVbvi5x5/nRiuZ6Tiu4JjvAjZGDTsrz58t4W/Q186
 sia+cMjtDK6YHVoR3S9fGguTewDkrDaHcwW/icau3G6FNw5SWLBqlNWPg0qLRt7QOOCF
 J3VwzJUi2cBNzOJF6tXyipqqGGXF3Xs0YBwA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jVoidh4eK5SMWwvVdGvcbPkxD3QsnFfymSXNjak7xmE=;
 b=Q+uChX1EtuHXrZyHsAoGD8asysZy38jzbT1ZeFzInlOmhpJ+k93jzsun7nxvSAcBo3
 5Np7VL8+OKc0egI+ySHpDPfZu+u+EkAxefAtaEi5uHPamscO3ESdrC1rJRQvB1TEBU4/
 In59Il8Pq7Srred8VGIcuML6HoIgE01p99F91V5bzjEUAtmtyXiw8JV9PTQuBheRLUZW
 qgkZ1lYVo96tFzGAxpVeIi8d/GXQXmy/V23pmJ036gALsy0fJLWjavE1kJwnZ1MZvwf2
 koLcwG6tsyiIC0rdJ1hgqwcxWes93zFsv/7wSTPEM5FN2hk6iXE17NFlRXzvgKV883Vz
 5/RA==
X-Gm-Message-State: AOAM531V+sMlXKjjU23hPH6J1uLsDj1C5FeBoQkuCG5NWqn2j8I8896F
 hsJd1yx13X1/ASKhHkL5ojr4WvAqcDZWUE+u
X-Google-Smtp-Source: ABdhPJwXq6NOrlxpVN3brn1Ux/H7QK48bMhmZeY6MRyKCSG1l5Ra/JAtR0LL2xfsumSS1k1GSsxlxg==
X-Received: by 2002:a1c:2d95:: with SMTP id t143mr7665997wmt.44.1599230393790; 
 Fri, 04 Sep 2020 07:39:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:39:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/24] drm/aspeed: Use managed drmm_mode_config_cleanup
Date: Fri,  4 Sep 2020 16:39:20 +0200
Message-Id: <20200904143941.110665-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since aspeed doesn't use devm_kzalloc anymore we can use the managed
mode config cleanup.

v2: Keep call order as suggested by Sam.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 903f4f304647..2b424b2b85cc 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -63,15 +63,21 @@ static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
-static void aspeed_gfx_setup_mode_config(struct drm_device *drm)
+static int aspeed_gfx_setup_mode_config(struct drm_device *drm)
 {
-	drm_mode_config_init(drm);
+	int ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
 
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
 	drm->mode_config.max_width = 800;
 	drm->mode_config.max_height = 600;
 	drm->mode_config.funcs = &aspeed_gfx_mode_config_funcs;
+
+	return ret;
 }
 
 static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
@@ -144,7 +150,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	writel(0, priv->base + CRT_CTRL1);
 	writel(0, priv->base + CRT_CTRL2);
 
-	aspeed_gfx_setup_mode_config(drm);
+	ret = aspeed_gfx_setup_mode_config(drm);
+	if (ret < 0)
+		return ret;
 
 	ret = drm_vblank_init(drm, 1);
 	if (ret < 0) {
@@ -179,7 +187,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
 static void aspeed_gfx_unload(struct drm_device *drm)
 {
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
-- 
2.28.0

