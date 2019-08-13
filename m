Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F8A7340
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:12:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGmc58ZvzDqld
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:12:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=nishkadg.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qg+zDHw9"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4672xJ16jnzDqGc
 for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Aug 2019 16:34:11 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id f17so47010941pfn.6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 12 Aug 2019 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GYvMpGNobVf3AqFb3xy5KgnpYbwIyZqHqD10LEnethw=;
 b=Qg+zDHw9r6HZYqflIIV14xf3Uu6U8FtbmN0aBGEn/uk46YC4wb8qwCDmPmzGJV62Z1
 WceSQ6S+tpYamK00BOiIl+8BSOKKbH1L3drOX/2ho7A8kcRVQNICkBRRrUrO0n+Gtbui
 idhYt4DiFtRvwxoT4L5EwB2Zom7HVG2MRXG7XBVjjOy0X686r6oA6m5iAtmhn33Se0/V
 +dTEX4khpmAI4UxF9EeXYccq8z/YDXktgj++QPcTkY/wAp/Gmeq1UD+HZ6F7rBxgfy48
 oZMYoZvo+B1KpvxsYDpaGw0P8nd0PAn347JUf2dYolE9K9Z6FiVBxGLZn4t70QYVAgZ3
 eHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GYvMpGNobVf3AqFb3xy5KgnpYbwIyZqHqD10LEnethw=;
 b=l7aP7vi5nstOnUXrOid2zXMX1Hajg9x0Eewc2z28bHgycLZrW/6GMyeeol+KSuLMcd
 G1uevuPuifN0RMGdSiWaUhV62yhgDqpDthYCDg/0cQnoUBIFtgd+91T3OPmURnhGQq0H
 +lvXZJKRwSgHlZ1xIgFKqwZNVG9rdnD/o7fW3c7c85Pzis7rbWAo0dn7VIcIk3fzO+gE
 /5SsaDSEmxm37MowRX5+IVn8tyVsuyzhsgC6lCLYDhql+f/v175UCF6Rl4HU6Np+sVd8
 gQ1H1Dt4oAkETqnkTi+nb3utMVrkSr9aoi6xTmWjWtcF06u7rP12a7Giseru1zoH7crm
 Yfig==
X-Gm-Message-State: APjAAAW6wpoJooKmua3Q7NI3oiowhiqjSeDQslCZNNtlq7l4gsa+3D64
 zDEkCtMi/l+rTnoUHeTnqRE=
X-Google-Smtp-Source: APXvYqwfms220Vinc5FlyiGQRBQG8JL5P/Qy34knvYhc+hDf7+JQAwz3oRsAYwjQjm6J5gH30+i+ww==
X-Received: by 2002:a62:8648:: with SMTP id x69mr11624925pfd.92.1565678049875; 
 Mon, 12 Aug 2019 23:34:09 -0700 (PDT)
Received: from localhost.localdomain ([122.163.110.75])
 by smtp.gmail.com with ESMTPSA id m34sm624871pje.5.2019.08.12.23.34.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 23:34:09 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: joel@jms.id.au, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, andrew@aj.id.au,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/aspeed: gfc_crtc: Make structure aspeed_gfx_funcs constant
Date: Tue, 13 Aug 2019 12:03:55 +0530
Message-Id: <20190813063355.25549-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Sep 2019 05:12:12 +1000
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The static structure aspeed_gfx_funcs, of type
drm_simple_display_pipe_funcs, is used only as an argument to
drm_simple_display_pipe_init(), which does not modify it. Hence make it
constant to protect it from unintended modification.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 15db9e426ec4..2184b8be6fd4 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -215,7 +215,7 @@ static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
 	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
 }
 
-static struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
+static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
 	.enable		= aspeed_gfx_pipe_enable,
 	.disable	= aspeed_gfx_pipe_disable,
 	.update		= aspeed_gfx_pipe_update,
-- 
2.19.1

