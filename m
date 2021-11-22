Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F66459695
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Nov 2021 22:28:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HygP40k0Hz2ywv
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Nov 2021 08:28:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.132.45; helo=newton.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 70 seconds by postgrey-1.36 at boromir;
 Tue, 23 Nov 2021 02:56:20 AEDT
Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyX1w6pqzz2yZd
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Nov 2021 02:56:19 +1100 (AEDT)
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 4HyX1r67NnzMrZ5F
 for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Nov 2021 16:56:16 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id MTvb260044C55Sk06Tvb5d; Mon, 22 Nov 2021 16:56:16 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe6-00EL3k-Le; Mon, 22 Nov 2021 16:54:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe5-00HH0g-SI; Mon, 22 Nov 2021 16:54:17 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rajendra Nayak <rnayak@codeaurora.org>, Paul Walmsley <paul@pwsan.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tero Kristo <kristo@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH/RFC 14/17] regulator: ti-abb: Use bitfield helpers
Date: Mon, 22 Nov 2021 16:54:07 +0100
Message-Id: <c8508cae36c52c750dbb12493dd44d92fcf51ad4.1637592133.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637592133.git.geert+renesas@glider.be>
References: <cover.1637592133.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 08:28:20 +1100
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
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use the field_{get,prep}() helpers, instead of open-coding the same
operations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
Marked RFC, as this depends on [PATCH 01/17], but follows a different
path to upstream.
---
 drivers/regulator/ti-abb-regulator.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/ti-abb-regulator.c b/drivers/regulator/ti-abb-regulator.c
index 2931a0b89bffbf7a..3bc6ca5c382a4273 100644
--- a/drivers/regulator/ti-abb-regulator.c
+++ b/drivers/regulator/ti-abb-regulator.c
@@ -17,6 +17,7 @@
  * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  */
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -132,7 +133,7 @@ static inline u32 ti_abb_rmw(u32 mask, u32 value, void __iomem *reg)
 
 	val = readl(reg);
 	val &= ~mask;
-	val |= (value << __ffs(mask)) & mask;
+	val |= field_prep(mask, value);
 	writel(val, reg);
 
 	return val;
@@ -229,7 +230,7 @@ static void ti_abb_program_ldovbb(struct device *dev, const struct ti_abb *abb,
 	case TI_ABB_SLOW_OPP:
 	case TI_ABB_FAST_OPP:
 		val |= abb->ldovbb_override_mask;
-		val |= info->vset << __ffs(abb->ldovbb_vset_mask);
+		val |= field_prep(abb->ldovbb_vset_mask, info->vset);
 		break;
 	}
 
@@ -606,7 +607,7 @@ static int ti_abb_init_table(struct device *dev, struct ti_abb *abb,
 					pname, *volt_table, vset_mask);
 			continue;
 		}
-		info->vset = (efuse_val & vset_mask) >> __ffs(vset_mask);
+		info->vset = field_get(vset_mask, efuse_val);
 		dev_dbg(dev, "[%d]v=%d vset=%x\n", i, *volt_table, info->vset);
 check_abb:
 		switch (info->opp_sel) {
-- 
2.25.1

