Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 061974686D6
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 Dec 2021 18:56:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5y6x6kLJz2yY0
	for <lists+linux-aspeed@lfdr.de>; Sun,  5 Dec 2021 04:56:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rC7Zy9oK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rC7Zy9oK; 
 dkim-atps=neutral
X-Greylist: delayed 562 seconds by postgrey-1.36 at boromir;
 Sun, 05 Dec 2021 04:56:21 AEDT
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5y6s0qW7z2xt0
 for <linux-aspeed@lists.ozlabs.org>; Sun,  5 Dec 2021 04:56:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97E4360ED7;
 Sat,  4 Dec 2021 17:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC333C341C2;
 Sat,  4 Dec 2021 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638640012;
 bh=m53DYrzONUqXySnuyI8Iv8xHXEMmcTWjOknPMtQWpbU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rC7Zy9oKyV5tet0TB29vkn49q0Ijv3HDdkSoK40B0JTRJvQO1WfXJgismeFAJGFRD
 wKn32hfbg+EMbHeOgQ7V3FgZA1aiGIkS2sGYzDlOE6NPJenvuASa5VD7Y8E85+Gp3x
 k4p2Eru1hUBJkF3YD1MOwhSYjJKFqNad0GDEjjlZQIQJ4+gwRPJ6MO3oc+zcWiqPGp
 6YzacJ9jFjVb2s/W0R+wdcaymfnflDIyEu9Kn41L5y7SEVX0+GsHZi8a0vE+Tl4f/0
 9UlQ+KHAOi0XeAWAWX8O209zBA6Si2l9X+RFsnf/mi81NbgeFYbOP+HDcVChZuvGir
 dAv1HFpi7txug==
From: Arnd Bergmann <arnd@kernel.org>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm: aspeed: select CONFIG_DRM_GEM_CMA_HELPER
Date: Sat,  4 Dec 2021 18:46:23 +0100
Message-Id: <20211204174637.1160725-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211204174637.1160725-1-arnd@kernel.org>
References: <20211204174637.1160725-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The aspeed driver uses the gem_cma_helper code, but does
noto enforce enabling this through Kconfig:

x86_64-linux-ld: drivers/gpu/drm/aspeed/aspeed_gfx_drv.o:(.rodata+0x2c8): undefined reference to `drm_gem_cma_prime_import_sg_table'
x86_64-linux-ld: drivers/gpu/drm/aspeed/aspeed_gfx_drv.o:(.rodata+0x2d8): undefined reference to `drm_gem_cma_dumb_create'
x86_64-linux-ld: drivers/gpu/drm/aspeed/aspeed_gfx_crtc.o: in function `aspeed_gfx_pipe_update':
aspeed_gfx_crtc.c:(.text+0xe5): undefined reference to `drm_fb_cma_get_gem_obj'

Add the same 'select' that is used in other such drivers.

Fixes: 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/aspeed/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
index 36c4a7e86981..024ccab14f88 100644
--- a/drivers/gpu/drm/aspeed/Kconfig
+++ b/drivers/gpu/drm/aspeed/Kconfig
@@ -5,6 +5,7 @@ config DRM_ASPEED_GFX
 	depends on (COMPILE_TEST || ARCH_ASPEED)
 	depends on MMU
 	select DRM_KMS_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DMA_CMA if HAVE_DMA_CONTIGUOUS
 	select CMA if HAVE_DMA_CONTIGUOUS
 	select MFD_SYSCON
-- 
2.29.2

