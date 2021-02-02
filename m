Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB830B754
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 06:46:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVDMZ5mj5zDqyq
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 16:46:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HpuuWare; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVDMD3SLvzDqT3
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Feb 2021 16:46:16 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id s24so1562976pjp.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Feb 2021 21:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEWcLvUvYkWYLO51rzp4RR+x1aKBWP/abPyEZI4rYFM=;
 b=HpuuWareLWeEAeZr0X/SrjJLr0wnhOLwG79M8rRveb8GLZtjklgyYM5/AViq8HXOPV
 r93GdrYThzkoxsupajVRFYMXjF7miGvNdwJk0cbw0V6KJOl9cdm/IKavMiYT/2L1TKhE
 kKQO8V7Orn3mDF43Uv0qmSRcxfrSGGdzeRZf/d8U2aGxP6m8QgqHACDIQ0QtyYr92S/x
 pm2VyY1D+E4Rc+UPJX9HsvIvG1/bDLPxA2Wm2fiRO93ix6mS6Gm8evIniBFlWVk1CHUD
 Wsog2C71CyWnq6cr2IpeJ5JJ319LpKm/6EqO8ZeFM4lVXp1p3qpTFOOK4361R3LB3Ywj
 /vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HEWcLvUvYkWYLO51rzp4RR+x1aKBWP/abPyEZI4rYFM=;
 b=nSpNw1aB3njbZ0qyRlyiYbJPzEhF4MoJhuuWiNVJfoH9F9BoevsOCFoyifMbnvSqjD
 YFGDpJmmZcYYBiD8T2q5dQ0ttdUvIrLFs28vp/xuYGGI7+J1+p+rtQt2DNAnV51YD3Ct
 sWL/CvS/lykWbYFuI9nGHvCO2yh+zfxEj/Y3oYArM9bTTfEXH03I7B5gK8CypWF6PGH8
 1SOq25wjqnOJOgvHsHF/X3khgLqWZb6mPHMEJpeDZ2e6QeLXSh0xxGjKVNy7VPxhrlNp
 HGpEf5EMFGO0qbvMRoIKx/qie4NQ/AQVmYKo3yILGqdLsNTBmjo4DcY2RUcfks7W0qHF
 B/sg==
X-Gm-Message-State: AOAM533lUCjxu9nJ3fG8VUZBWHRHauu5M6YvOaknoX0P1AKHOZAztk7r
 dTIPPh0y/+ULC8+JOK9shK4/BKiy+/c=
X-Google-Smtp-Source: ABdhPJxPeeH4oyjGqsX3X7lT6vCX3Rb+QCe2L6JRHf+w/TIboBW6dcl4JXfKpl+jeR3ISoJ1Pgb3sg==
X-Received: by 2002:a17:90a:6342:: with SMTP id
 v2mr2497324pjs.150.1612244773488; 
 Mon, 01 Feb 2021 21:46:13 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id h23sm20707603pgh.64.2021.02.01.21.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 21:46:12 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 1/2] drm/aspeed: Look up syscon by phandle
Date: Tue,  2 Feb 2021 16:15:57 +1030
Message-Id: <20210202054558.344451-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202054558.344451-1-joel@jms.id.au>
References: <20210202054558.344451-1-joel@jms.id.au>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This scales better to multiple families of SoC. The lookup by compatible
can be removed in a future change.

The fallback path is for the ast2500 platform only. Other platforms will
be added with the new style, so they won't need fallback paths.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix fallback path to still find ast2500-scu. Thanks jk for the
review
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 457ec04950f7..54a6bda03c0e 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -103,6 +103,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
+	struct device_node *np = pdev->dev.of_node;
 	struct resource *res;
 	int ret;
 
@@ -111,10 +112,13 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	priv->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
+	priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
 	if (IS_ERR(priv->scu)) {
-		dev_err(&pdev->dev, "failed to find SCU regmap\n");
-		return PTR_ERR(priv->scu);
+		priv->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
+		if (IS_ERR(priv->scu)) {
+			dev_err(&pdev->dev, "failed to find SCU regmap\n");
+			return PTR_ERR(priv->scu);
+		}
 	}
 
 	ret = of_reserved_mem_device_init(drm->dev);
-- 
2.30.0

