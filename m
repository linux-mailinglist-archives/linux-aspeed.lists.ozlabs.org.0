Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F045A6B7CC6
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 16:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb1Qt6DSkz3cB1
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Mar 2023 02:53:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wi8QMsI5;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VN6Lcutm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wi8QMsI5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VN6Lcutm;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1P45RLjz3cFr
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Mar 2023 02:51:52 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 515C922AE0;
	Mon, 13 Mar 2023 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678722706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RrI2Z623laCpkz5xcMwL8KspUXzsIgPKKjaFMh8wl0U=;
	b=wi8QMsI5aDOplZY/NoEJsVAlSpGSZ7Xb354KfzRV7zXDfr0ZfFfWIl+SF6BRm4XmDo1N2C
	OjA66cNc+VqYhm6p4vLkQO7UiOt9wit/9CNvMhP7tkG55kA/PsqGCHD55zcOylLF6a70Qr
	zXUSfuA1vw4330xlp5Zx5FG0yQFCUwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678722706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RrI2Z623laCpkz5xcMwL8KspUXzsIgPKKjaFMh8wl0U=;
	b=VN6Lcutmcpynay5pIsmC9uuTNoJNS5ExZKUPLPJXIvpdYJInd+iB9OD3R6RMoTScynQ7d/
	XnKdYjSpTRp6nLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12BCB139F9;
	Mon, 13 Mar 2023 15:51:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KCCqA5JGD2RhegAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:51:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	linus.walleij@linaro.org
Subject: [PATCH v2 23/25] drm/mcde: Do not use dirty GEM FB handling
Date: Mon, 13 Mar 2023 16:51:36 +0100
Message-Id: <20230313155138.20584-24-tzimmermann@suse.de>
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

From: Linus Walleij <linus.walleij@linaro.org>

This driver has no way to handle damage, the reason the
drm_gem_fb_create_with_dirty() was used was because I had the
ambition that the driver would only send out updates to DSI
command displays whenever something changed, so as to
minimize traffic.

It turns out this ambition with command mode isn't working
in practice because all the MCDE does is to create a
continuous stream of DSI commands and while it is possible to
send single frame updates with it, it's not been worthwhile.
So we are just setting up continuous updates.

Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 4aedb050d2a5..a592ad0d7886 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -94,7 +94,7 @@
 #define MCDE_PID_MAJOR_VERSION_MASK 0xFF000000
 
 static const struct drm_mode_config_funcs mcde_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create_with_dirty,
+	.fb_create = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.39.2

