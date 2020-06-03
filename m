Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1434F1F2A0D
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:07:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gr6b0p1pzDqKT
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:07:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=tzimmermann@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cMb20WdLzDqJQ
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Jun 2020 18:31:58 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF6C5AEA6;
 Wed,  3 Jun 2020 08:31:56 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: abrodkin@synopsys.com, airlied@linux.ie, daniel@ffwll.ch,
 james.qian.wang@arm.com, liviu.dudau@arm.com, mihail.atanassov@arm.com,
 brian.starkey@arm.com, joel@jms.id.au, andrew@aj.id.au, sam@ravnborg.org,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, xinliang.liu@linaro.org, zourongrong@gmail.com,
 john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, linus.walleij@linaro.org,
 narmstrong@baylibre.com, khilman@baylibre.com, marex@denx.de,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com,
 philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 wens@csie.org, jsarha@ti.com, tomi.valkeinen@ti.com, noralf@tronnes.org
Subject: [PATCH v2 23/23] drm: Remove struct drm_driver.gem_print_info
Date: Wed,  3 Jun 2020 10:31:32 +0200
Message-Id: <20200603083132.4610-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603083132.4610-1-tzimmermann@suse.de>
References: <20200603083132.4610-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:41:53 +1000
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
Cc: linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The .gem_print_info callback in struct drm_driver is obsolete and has
no users left. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_gem.c |  2 --
 include/drm/drm_drv.h     | 17 -----------------
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index efc0367841e2b..08b3fa27ec406 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1191,8 +1191,6 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 
 	if (obj->funcs && obj->funcs->print_info)
 		obj->funcs->print_info(p, indent, obj);
-	else if (obj->dev->driver->gem_print_info)
-		obj->dev->driver->gem_print_info(p, indent, obj);
 }
 
 int drm_gem_pin(struct drm_gem_object *obj)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index bb924cddc09c1..8f110a28b6a23 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -353,23 +353,6 @@ struct drm_driver {
 	 */
 	void (*gem_close_object) (struct drm_gem_object *, struct drm_file *);
 
-	/**
-	 * @gem_print_info:
-	 *
-	 * This callback is deprecated in favour of
-	 * &drm_gem_object_funcs.print_info.
-	 *
-	 * If driver subclasses struct &drm_gem_object, it can implement this
-	 * optional hook for printing additional driver specific info.
-	 *
-	 * drm_printf_indent() should be used in the callback passing it the
-	 * indent argument.
-	 *
-	 * This callback is called from drm_gem_print_info().
-	 */
-	void (*gem_print_info)(struct drm_printer *p, unsigned int indent,
-			       const struct drm_gem_object *obj);
-
 	/**
 	 * @gem_create_object: constructor for gem objects
 	 *
-- 
2.26.2

