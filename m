Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29329605D87
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Oct 2022 12:39:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtPHQ0Qxqz3drP
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Oct 2022 21:39:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=N/8J0ZK8;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R0s5ULDx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=N/8J0ZK8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R0s5ULDx;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtPFf6v59z3drn
	for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Oct 2022 21:38:14 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6426222B4D;
	Thu, 20 Oct 2022 10:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666262286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIcpJgbeqPNRftPv7Q4iDJZ6HW36+TLeNbJLj/Rhtmc=;
	b=N/8J0ZK8TlQrP5MuDUFT352ZqaEtcH54y/j5pTXt7N3TgI2w7bd+xrImKYdts233ORrkL5
	96bET5hbW0jJYocJOqg4OzXHlCJPGxknEB/FVdDBHax7Y/eSp5Z4DXiaSbNfQsUqhKhOdj
	J2Jx0pUIYCEZPKgNcvZIeR4EGI3eKRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666262286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIcpJgbeqPNRftPv7Q4iDJZ6HW36+TLeNbJLj/Rhtmc=;
	b=R0s5ULDxkJmC55xxZ8WO3j2KQleS938cWUVKLDjw3qyEeAZZSyml7D/dHNB+DzxT2LycZH
	zPCX9qzygK8x75DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF56E13B72;
	Thu, 20 Oct 2022 10:38:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gCa6NQ0lUWPPYwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 10:38:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH 18/21] drm/fb_helper: Minimize damage-helper overhead
Date: Thu, 20 Oct 2022 12:37:52 +0200
Message-Id: <20221020103755.24058-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221020103755.24058-1-tzimmermann@suse.de>
References: <20221020103755.24058-1-tzimmermann@suse.de>
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

Pull the test for fb_dirty into the caller to avoid extra work
if no callback has been set. In this case no damage handling is
required and no damage area needs to be computed. Print a warning
if the damage worker runs without getting an fb_dirty callback.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 90 ++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 836523aef6a27..fbc5c5445fdb0 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -449,12 +449,13 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 static void drm_fb_helper_damage_work(struct work_struct *work)
 {
 	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
+	struct drm_device *dev = helper->dev;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
 	int ret;
 
-	if (!helper->funcs->fb_dirty)
+	if (drm_WARN_ON_ONCE(dev, !helper->funcs->fb_dirty))
 		return;
 
 	spin_lock_irqsave(&helper->damage_lock, flags);
@@ -659,16 +660,12 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 }
 EXPORT_SYMBOL(drm_fb_helper_fini);
 
-static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
+static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
 				 u32 width, u32 height)
 {
-	struct drm_fb_helper *helper = info->par;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	unsigned long flags;
 
-	if (!helper->funcs->fb_dirty)
-		return;
-
 	spin_lock_irqsave(&helper->damage_lock, flags);
 	clip->x1 = min_t(u32, clip->x1, x);
 	clip->y1 = min_t(u32, clip->y1, y);
@@ -718,6 +715,7 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
  */
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
+	struct drm_fb_helper *helper = info->par;
 	unsigned long start, end, min_off, max_off;
 	struct fb_deferred_io_pageref *pageref;
 	struct drm_rect damage_area;
@@ -733,17 +731,19 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 	if (min_off >= max_off)
 		return;
 
-	/*
-	 * As we can only track pages, we might reach beyond the end
-	 * of the screen and account for non-existing scanlines. Hence,
-	 * keep the covered memory area within the screen buffer.
-	 */
-	max_off = min(max_off, info->screen_size);
+	if (helper->funcs->fb_dirty) {
+		/*
+		 * As we can only track pages, we might reach beyond the end
+		 * of the screen and account for non-existing scanlines. Hence,
+		 * keep the covered memory area within the screen buffer.
+		 */
+		max_off = min(max_off, info->screen_size);
 
-	drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+		drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
+		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
+				     drm_rect_width(&damage_area),
+				     drm_rect_height(&damage_area));
+	}
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
@@ -877,6 +877,7 @@ static ssize_t drm_fb_helper_write_screen_buffer(struct fb_info *info, const cha
 ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct drm_fb_helper *helper = info->par;
 	loff_t pos = *ppos;
 	ssize_t ret;
 	struct drm_rect damage_area;
@@ -885,10 +886,12 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 	if (ret <= 0)
 		return ret;
 
-	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
+		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
+				     drm_rect_width(&damage_area),
+				     drm_rect_height(&damage_area));
+	}
 
 	return ret;
 }
@@ -904,8 +907,12 @@ EXPORT_SYMBOL(drm_fb_helper_sys_write);
 void drm_fb_helper_sys_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	sys_fillrect(info, rect);
-	drm_fb_helper_damage(info, rect->dx, rect->dy, rect->width, rect->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
 
@@ -919,8 +926,12 @@ EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
 void drm_fb_helper_sys_copyarea(struct fb_info *info,
 				const struct fb_copyarea *area)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	sys_copyarea(info, area);
-	drm_fb_helper_damage(info, area->dx, area->dy, area->width, area->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
 
@@ -934,8 +945,12 @@ EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
 void drm_fb_helper_sys_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	sys_imageblit(info, image);
-	drm_fb_helper_damage(info, image->dx, image->dy, image->width, image->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
@@ -1035,6 +1050,7 @@ static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf
 ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct drm_fb_helper *helper = info->par;
 	loff_t pos = *ppos;
 	ssize_t ret;
 	struct drm_rect damage_area;
@@ -1043,10 +1059,12 @@ ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
 	if (ret <= 0)
 		return ret;
 
-	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
+		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
+				     drm_rect_width(&damage_area),
+				     drm_rect_height(&damage_area));
+	}
 
 	return ret;
 }
@@ -1062,8 +1080,12 @@ EXPORT_SYMBOL(drm_fb_helper_cfb_write);
 void drm_fb_helper_cfb_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	cfb_fillrect(info, rect);
-	drm_fb_helper_damage(info, rect->dx, rect->dy, rect->width, rect->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
 
@@ -1077,8 +1099,12 @@ EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
 void drm_fb_helper_cfb_copyarea(struct fb_info *info,
 				const struct fb_copyarea *area)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	cfb_copyarea(info, area);
-	drm_fb_helper_damage(info, area->dx, area->dy, area->width, area->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
 
@@ -1092,8 +1118,12 @@ EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
 void drm_fb_helper_cfb_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	cfb_imageblit(info, image);
-	drm_fb_helper_damage(info, image->dx, image->dy, image->width, image->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
 
-- 
2.38.0

