Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 314FF64038
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 07:04:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k6Ys2FXWzDqLG
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 15:04:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.55; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0055.hostedemail.com
 [216.40.44.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k6Yk5vDczDqD3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jul 2019 15:04:42 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 25A6A18224D98;
 Wed, 10 Jul 2019 05:04:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::::,
 RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1345:1359:1437:1534:1539:1568:1711:1714:1730:1747:1777:1792:2198:2199:2393:2559:2562:3138:3139:3140:3141:3142:3867:4321:5007:6261:6642:10004:10848:11026:11473:11657:11658:11914:12043:12296:12297:12438:12555:12895:12986:13069:13311:13357:14096:14181:14384:14394:14721:21080:21451:21627:30054,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:23,
 LUA_SUMMARY:none
X-HE-Tag: low85_b4e0cac78b5d
X-Filterd-Recvd-Size: 1713
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 05:04:37 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 03/12] drm: aspeed_gfx: Fix misuse of GENMASK macro
Date: Tue,  9 Jul 2019 22:04:16 -0700
Message-Id: <cddd7ad7e9f81dec1e86c106f04229d21fc21920.1562734889.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1562734889.git.joe@perches.com>
References: <cover.1562734889.git.joe@perches.com>
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Arguments are supposed to be ordered high then low.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index a10358bb61ec..095ea03e5833 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -74,7 +74,7 @@ int aspeed_gfx_create_output(struct drm_device *drm);
 /* CTRL2 */
 #define CRT_CTRL_DAC_EN			BIT(0)
 #define CRT_CTRL_VBLANK_LINE(x)		(((x) << 20) & CRT_CTRL_VBLANK_LINE_MASK)
-#define CRT_CTRL_VBLANK_LINE_MASK	GENMASK(20, 31)
+#define CRT_CTRL_VBLANK_LINE_MASK	GENMASK(31, 20)
 
 /* CRT_HORIZ0 */
 #define CRT_H_TOTAL(x)			(x)
-- 
2.15.0

