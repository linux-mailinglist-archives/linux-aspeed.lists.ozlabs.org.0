Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2840F60A075
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Oct 2022 13:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwt0T72FYz3bb0
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Oct 2022 22:20:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mdwZe4oC;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hxqccXaI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mdwZe4oC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hxqccXaI;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwt0406MKz2xtt
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Oct 2022 22:20:03 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3791B21DE4;
	Mon, 24 Oct 2022 11:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666610401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDwG/2ZvVtedihuD7tm996Em6sMhLiO4FmD57P041QM=;
	b=mdwZe4oCDl9UJvnRtuXrem4SfiiFBuEbsVuBcem6XZzeWKEvLFgh++5J+F0kFPZh2OwF2c
	8rR6QVpJvrZjvNSwkyboHHN0mwwyZ2/JI1FZUdMFbe0+p5YrXMyI6It+57tRSs7sXcQ/Ma
	OZ806Nd+ViS++4+DGE9xm8GZLyhfO7g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666610401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDwG/2ZvVtedihuD7tm996Em6sMhLiO4FmD57P041QM=;
	b=hxqccXaIzzUM0Q2daluFxMAfY0DJqTJ1PLIzkvZNd4Zm8xifYKdsxU+9OAw1FxBxz2U0YP
	1XAP5XUT21C9REAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C109713A98;
	Mon, 24 Oct 2022 11:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8PxcLuB0VmOYMgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Oct 2022 11:20:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 05/21] drm/imx/dcss: Don't set struct drm_driver.output_poll_changed
Date: Mon, 24 Oct 2022 13:19:37 +0200
Message-Id: <20221024111953.24307-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024111953.24307-1-tzimmermann@suse.de>
References: <20221024111953.24307-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org, spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Don't set struct drm_driver.output_poll_changed. It's used to restore
the fbdev console. But as DCSS uses generic fbdev emulation, the
console is being restored by the DRM client helpers already. See the
functions drm_kms_helper_hotplug_event() and
drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.

v2:
	* fix commit description (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index b4f82ebca5325..1defd6a40f11d 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -21,7 +21,6 @@ DEFINE_DRM_GEM_DMA_FOPS(dcss_cma_fops);
 
 static const struct drm_mode_config_funcs dcss_drm_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.38.0

