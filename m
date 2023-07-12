Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D7750391
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jul 2023 11:47:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1CZn1p1Vz3bx8
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jul 2023 19:47:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1CZj3Gw8z309V
	for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Jul 2023 19:47:24 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWRC-0001HF-NI; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWRA-00Dr3w-Kg; Wed, 12 Jul 2023 11:47:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWR8-004GSJ-87; Wed, 12 Jul 2023 11:47:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Joel Stanley <joel@jms.id.au>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 06/52] drm/aspeed: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:16 +0200
Message-Id: <20230712094702.1770121-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Buy9ZaNV5aTHRTQQUblFLBcEg34anUd5bdNc5ukDz58=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZdfAL67nyWn+5yK/o9tX12HlpyRrmJYYyJi 7MskvHAzGKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52XQAKCRCPgPtYfRL+ TvzuCACFathGt9jh4QDmaBSrOuCTln8lSBURqAyzYpiTo2q+26MreYG6KP36UEmecg2sISbuSz2 I9Re7Sg3mLwqtuHhIo/+4S9Zoy4VDz8a7Yx+ibKR7OrEheUUzjDMSvHvNJbJqtOSzqnaJyZUiJQ qt2R0opTRttXPqPlt228ODz8+VTI3iuX+Uq1Llc2uH36wYmVxohWGZsdEZHT4fLgrtDLQvYFkd3 ZXcuj/UOPJdrN5oUzdmWTKY4DTNcyvH0ld7U6iPJHLl2TE6MctZ+XzO1dQ3Bb/w4ybkQ3hauhGx mW6KQ4cqC2KjCLCxbYFgeMqYrsXGPznTCK6iAZqM6yPLZswq
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 7877a57b8e26..84c4b28e7c9c 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -26,7 +26,7 @@ drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
 static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
 {
 	struct drm_crtc *crtc = &priv->pipe.crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	const u32 format = crtc->primary->state->fb->format->format;
 	u32 ctrl1;
 
@@ -169,7 +169,7 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_pending_vblank_event *event;
 	struct drm_gem_dma_object *gem;
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm_dev->event_lock);
 	event = crtc->state->event;
 	if (event) {
 		crtc->state->event = NULL;
@@ -179,7 +179,7 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 		else
 			drm_crtc_send_vblank_event(crtc, event);
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 	if (!fb)
 		return;
-- 
2.39.2

