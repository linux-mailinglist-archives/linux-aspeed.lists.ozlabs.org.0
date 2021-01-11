Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2EE2F0BE8
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Jan 2021 05:47:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDh5M6cllzDqTR
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Jan 2021 15:47:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dw5F35aw; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDh4z6nXqzDqPy
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Jan 2021 15:46:59 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id x18so8862217pln.6
 for <linux-aspeed@lists.ozlabs.org>; Sun, 10 Jan 2021 20:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MTf0t/g0yj3eP5J//Lhcit/5I+gGR9P17fx+loKYd/M=;
 b=dw5F35awsAORBgdcbHHhKYguLZM0wNpcAaLrWiMxPHQ4tVm1cEZ3v74VLibe/czHdO
 pwQ99HhRgX0FOyRYJqxbtB/L1y1De2JhaK4naHS4s5akLQbPjXTSfN1i0DUgeb5Kqx7H
 FzQcDvVn71rvwYON67M6KQ/mqbMTWBdV7dOXg+Wxllpp9qpOs7sln5VPaFRhvyPZlQtD
 M++05rDMjs2LTTBELMhAsq6J7QkN3V8myu3QrIDmNvd9d5wTfuLCPPoElPo/izspnJk/
 jcY5XjteZxRrgdhmGmnTmQPqsPlEsXcSqoED50FZPgqVdlBcI7d/DQE1zXgl8+rA2HOO
 yNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MTf0t/g0yj3eP5J//Lhcit/5I+gGR9P17fx+loKYd/M=;
 b=qfmaWwbiXHtkC75GtL4YhhaEp51bOP333PZCo6pnXhxtiapaxxYcUmKFiNSG1y7IGy
 YXFRyeB2VfT8S9Hrsa6iInJT982z9iFc35d4I4ab5hgNpX8Y4AHyOa7sBBEIVv2v1KdZ
 hopdyPzQ/Q+hOImNTWBzxFxxjpW93dkR63+o85HYH37ueA4J3lyplKEm5W3uVjFyw9ku
 PW7D8KKh3xFdjPwhro9Lc7Yciyjo7FXZslOjS7WpacdE7wbyMTSxzE4pfBUtBmpl3zdx
 uwU2WicSLlTpcSvT9mmJPq26fsq94WC4BcIKuwKgALrE4tTXuXM8fvGhmc8rAFMXEi46
 yM5A==
X-Gm-Message-State: AOAM531leqRyZKRwlJxURtr+ZOs8KJdZsa+4/cdlw3zcvTiYjbzD2rbw
 HNoWOp3GTJbUCfR2Nbh9lQs=
X-Google-Smtp-Source: ABdhPJxBCkl3x3enJELsSBqm0G69v1s8CkiXkSccBZx3mbk8e2hUMZjKOIW2OVFq2LoTLGhJe3UxIQ==
X-Received: by 2002:a17:90a:2e84:: with SMTP id
 r4mr15948077pjd.147.1610340415961; 
 Sun, 10 Jan 2021 20:46:55 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id z6sm17442303pfj.22.2021.01.10.20.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 20:46:54 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/2] drm/aspeed: Look up syscon by phandle
Date: Mon, 11 Jan 2021 15:16:37 +1030
Message-Id: <20210111044638.290909-2-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111044638.290909-1-joel@jms.id.au>
References: <20210111044638.290909-1-joel@jms.id.au>
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

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 457ec04950f7..8ada7e944147 100644
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
+		priv->scu = syscon_regmap_lookup_by_compatible("aspeed,aspeed-scu");
+		if (IS_ERR(priv->scu)) {
+			dev_err(&pdev->dev, "failed to find SCU regmap\n");
+			return PTR_ERR(priv->scu);
+		}
 	}
 
 	ret = of_reserved_mem_device_init(drm->dev);
-- 
2.29.2

