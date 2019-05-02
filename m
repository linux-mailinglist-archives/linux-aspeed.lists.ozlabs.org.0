Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FD712455
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 23:51:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w89T5wWCzDqTm
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 May 2019 07:51:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="QXIHb+bv"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w8944TH1zDqQ0
 for <linux-aspeed@lists.ozlabs.org>; Fri,  3 May 2019 07:51:19 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B14E4E029BD
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 16:51:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id i5G2nJSHIhY4 for <linux-aspeed@lists.ozlabs.org>;
 Thu,  2 May 2019 16:51:15 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D2609E03770
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 16:51:15 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D2609E03770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1556833875; bh=dNkPRDxufFnmf5O4y9m8pnOStAP2j66mHPMj97eY40o=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=QXIHb+bve3z0Vu6Ti/VvyxOgKh9bA3JdBIvEHpVwPzmR0NzDcJ+QiJi89wfloz5ft
 6HgH/lm6ZNm3ZxmbVUYiwqHDakVjk2aSn3/I/KISgj/hvFmNOZJDGkMwEhdlJkEx8W
 QF6us4N1fZvNsxyxa32afSt6mluK+64ajoVb2jHg=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WsKr6Qmmaznw for <linux-aspeed@lists.ozlabs.org>;
 Thu,  2 May 2019 16:51:15 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id B4D4EE029BD
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 16:51:15 -0500 (CDT)
Date: Thu, 2 May 2019 16:51:15 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Message-ID: <1731023470.3553122.1556833875705.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 1/2] [v2] drm/aspeed: Preserve DVO configuration bits during
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF65 (Linux)/8.5.0_GA_3042)
Thread-Index: oVfKjU5R+jtzD5i8Jhf4CaQfi1lQAA==
Thread-Topic: drm/aspeed: Preserve DVO configuration bits during initialization
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

GFX064 contains DVO enable and mode bits.  These are hardware specific, configured
via the pinmux from the DT, and should not be cleared during startup.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h     | 3 +++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index b7a986e49177..b34c97613aaf 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright 2018 IBM Corporation
+// Copyright 2019 Raptor Engineering, LLC
 
 #include <drm/drm_device.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -73,6 +74,8 @@ int aspeed_gfx_create_output(struct drm_device *drm);
 
 /* CTRL2 */
 #define CRT_CTRL_DAC_EN			BIT(0)
+#define CRT_CTRL_DVO_MODE		BIT(6)
+#define CRT_CTRL_DVO_EN			BIT(7)
 #define CRT_CTRL_VBLANK_LINE(x)		(((x) << 20) & CRT_CTRL_VBLANK_LINE_MASK)
 #define CRT_CTRL_VBLANK_LINE_MASK	GENMASK(20, 31)
 
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 713a3975852b..7e9072fd0ef0 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -98,6 +98,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	struct aspeed_gfx *priv;
 	struct resource *res;
 	int ret;
+	u32 reg;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -146,7 +147,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
 
 	/* Sanitize control registers */
 	writel(0, priv->base + CRT_CTRL1);
-	writel(0, priv->base + CRT_CTRL2);
+	/* Preserve CRT_CTRL2[7:6] (DVO configuration) */
+	reg = readl(priv->base + CRT_CTRL2) & (CRT_CTRL_DVO_MODE | CRT_CTRL_DVO_EN);
+	writel(reg, priv->base + CRT_CTRL2);
 
 	aspeed_gfx_setup_mode_config(drm);
 
-- 
2.11.0
