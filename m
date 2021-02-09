Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4B4314F07
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Feb 2021 13:38:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZj9V2PnBzDsjr
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Feb 2021 23:38:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UA7qw6pC; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZj8x5hL8zDqPT
 for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Feb 2021 23:37:53 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id x136so5252877pfc.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Feb 2021 04:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEWcLvUvYkWYLO51rzp4RR+x1aKBWP/abPyEZI4rYFM=;
 b=UA7qw6pCaOdf/yqq69etxef0untkhUFXSI+O9aCuyR/lOYzzPCRtWaHB6KbMDFaObh
 maH0YiX2IcjeEONLLi2m+Sk+3PTzs33BzrB2mJ0HcLcjRk2r9l8yFR3/KfrkL6EkdZzb
 i8Cave62QyllrlcUMYo1mEwijF+bfDhpgxDWkcnziTD6OcT6DxjwzJyWMEFdZWboC3uY
 cbIO+ZB5NSD6J70UHw1gRakG/afPMQiZ5Hd6tPMcqAv+xikSyDJDq/u4w5z8EMpDP8T2
 Lg8Z3VO2gx3ssY95EEyC5FYR7D6991/PEqnpomJXo/ZUGeBHxea1UuMcYEtJj3Cc0wko
 9Lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HEWcLvUvYkWYLO51rzp4RR+x1aKBWP/abPyEZI4rYFM=;
 b=qSw4TEg/34CVwPlzeKsxC4qFX+AJ0DfNNXcIP+zPfiaRsMeYTKZ6314LJiLDioODUN
 LThchRSxSMuAiC+zNyojnd2x+HJNn1xMWy89BwMlMsejYOPcBAO9QlSZc4ZBI6T8DIce
 EHLvkPIAy3S4ol2vq1+20p9fhLFtFVFSGiVUoBgYN/02pMZU1F0sk5SuDibDwm+ytrQV
 y+urBcQVnDdgA+EwVtSrR5eAI9Z3KdGIHgKIIDETuiCxKE0QkgXUcCrCNRWItTbOBKK5
 cgbwwlHB7u3kV2nXktmM4xpUuKXXtIRdxohC5QAf8X/YGmebnj4oKKDw9/IFbxrlRm2W
 8OCg==
X-Gm-Message-State: AOAM533mW0Q6MoAiYDP1LNZL2lYSSvhGL93LMy5EBhkLQVJSM8xoWo7C
 5ILwHfQdGarHV8ccSdKhsBw=
X-Google-Smtp-Source: ABdhPJyzzNoV3ORY6H1uJ0CJ3FGX0Y0Hbb6/83hFpXTlUvZfQQ4ZzNnS2ckv5IYMwgAECs49OLy6zg==
X-Received: by 2002:a63:c70c:: with SMTP id n12mr22157570pgg.347.1612874269194; 
 Tue, 09 Feb 2021 04:37:49 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i7sm22584395pfc.50.2021.02.09.04.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 04:37:48 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v3 1/2] drm/aspeed: Look up syscon by phandle
Date: Tue,  9 Feb 2021 23:07:33 +1030
Message-Id: <20210209123734.130483-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209123734.130483-1-joel@jms.id.au>
References: <20210209123734.130483-1-joel@jms.id.au>
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

