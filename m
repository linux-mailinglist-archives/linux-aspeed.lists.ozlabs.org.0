Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DE410F58
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 00:49:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vYVg22vmzDqPP
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 08:49:31 +1000 (AEST)
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
 header.b="vpYQlr6W"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vYVZ36XJzDqNR
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 08:49:26 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6336DDE3E31
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2019 17:49:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LMTZIidnkqRr for <linux-aspeed@lists.ozlabs.org>;
 Wed,  1 May 2019 17:49:23 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CDE5CDE3E85
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2019 17:49:23 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CDE5CDE3E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1556750963; bh=wqB5YrM6I5KeLOE5J5SyBX9MbyIKFcaASYxVJFyzSzs=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=vpYQlr6WkoQGFifh7inqKwY0uE1aRse1uGLj9bj6GiJqB3CFGSH8+3F2QHllw4+mg
 2aycPlkB3S4TLL0PiGCJWddRKS1zBLDwCJzvrFuonzOMpp3RzkuRsWombm+JAErtUe
 uaMUeTW0Dtl6dnW8SYurJlYhr5gj0g0e80UAdOxU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8--SheV7cL4R for <linux-aspeed@lists.ozlabs.org>;
 Wed,  1 May 2019 17:49:23 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id B2FD0DE3E31
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2019 17:49:23 -0500 (CDT)
Date: Wed, 1 May 2019 17:49:22 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linux-aspeed@lists.ozlabs.org
Message-ID: <1681003008.3393892.1556750962226.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 1/3] drm/aspeed: Preserve DVO configuration bits during
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF65 (Linux)/8.5.0_GA_3042)
Thread-Index: HxwnlELZO91f08hi6hYY/AQBZDoDfg==
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
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 713a3975852b..1a7a9a000e2e 100644
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
+	reg = readl(priv->base + CRT_CTRL2) & 0xc0;
+	writel(reg, priv->base + CRT_CTRL2);
 
 	aspeed_gfx_setup_mode_config(drm);
 
-- 
2.11.0

