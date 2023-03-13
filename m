Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FFE6B7CCF
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 16:53:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb1RL4FRbz3c46
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Mar 2023 02:53:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TtLkiSgb;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zdpwQmo8;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TtLkiSgb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zdpwQmo8;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1P64NBNz3cK8
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Mar 2023 02:51:54 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 911591FE20;
	Mon, 13 Mar 2023 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678722706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2pZK9hJVZsRtkuXk4C1IP2Gtl5RKfKzAeU/AIX4IAqY=;
	b=TtLkiSgbd5/M8hmaMjQW6VQqbIH46B6pho2w6vL7NVtzMoJU1+j/k/CmU4utAkQvglfr6n
	1A/mfq5E1J0gD6D8/ozCwk99+gmIE1j4tzw1KqwO8D3dRxtLsrQdvPLaOOJplMtV3H8KQa
	f/3riqT83ipCpeSMcv/R7mnQRPhxwbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678722706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2pZK9hJVZsRtkuXk4C1IP2Gtl5RKfKzAeU/AIX4IAqY=;
	b=zdpwQmo8klnYhpkZZMI6/wOcJRQ4rK/nZO0q0kfFEkb+mBwa3slhkRewisiWrJhPy4eBzd
	psA0Khfyx9J737BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5521E13517;
	Mon, 13 Mar 2023 15:51:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SPDbE5JGD2RhegAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:51:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	linus.walleij@linaro.org
Subject: [PATCH v2 24/25] drm/mcde: Use GEM DMA fbdev emulation
Date: Mon, 13 Mar 2023 16:51:37 +0100
Message-Id: <20230313155138.20584-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
References: <20230313155138.20584-1-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use the fbdev emulation that is optimized for DMA helpers. Avoids
possible shadow buffering and makes the code simpler.

Reported-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/dri-devel/CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index a592ad0d7886..a8cd86c06c14 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -69,7 +69,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -237,7 +237,7 @@ static int mcde_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto unbind;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_dma_setup(drm, 32);
 
 	return 0;
 
-- 
2.39.2

