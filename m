Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CAE7AD50B
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Sep 2023 11:57:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvJFS1Cl9z3dhN
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Sep 2023 19:57:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvJCm5qfgz3c3r
	for <linux-aspeed@lists.ozlabs.org>; Mon, 25 Sep 2023 19:55:48 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJV-0007m5-FZ; Mon, 25 Sep 2023 11:55:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJU-008pyh-5O; Mon, 25 Sep 2023 11:55:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJT-004dkT-SK; Mon, 25 Sep 2023 11:55:35 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 02/40] soc/aspeed: aspeed-lpc-snoop: Convert to platform remove callback returning void
Date: Mon, 25 Sep 2023 11:54:53 +0200
Message-Id: <20230925095532.1984344-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=s5OXo8IjgAIoOI++baFbct5qYs8LXAKnsMuTokxyM5s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlEVhCYZmwTQwRwpaBlgiWgdCOR1poUdZzdTNfO 289e8PgCMWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRFYQgAKCRCPgPtYfRL+ TiiWCACkZztwtGfEP0fOadeVp7hs+MCNN6d4UUjfO6Zsy8gNVffQtSyDmsLykYeJXelouzQRYYb BV/LFAVygkQaOKh3jf5umpHqgvB/j+1p0WYnHMhgi/EzjsAblt3X7nhl+ehDVrNJiO+X1oe1LY2 yAFJr2tQ4/XNl4TrglNSENIWhYK7QbOeIhJrFyth0VFyPhSKPbI6YJUrMG5xQvQaVJDQzoQk61t Y+v5GPuJXG24/9N7pHC15ECE7JRkBQ7iNgQHlXOm7LKxrz7+HJODd0SeUVh6geBJRZQvFpEiV7X 1/nFgf9ZLG5LPLeKPdfK76vs5hzCWmvhi3ByV3saEVaOrmEu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
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
Cc: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 773dbcbc03a6..888b5840c015 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -331,7 +331,7 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
+static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
 {
 	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
 
@@ -340,8 +340,6 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
 	aspeed_lpc_disable_snoop(lpc_snoop, 1);
 
 	clk_disable_unprepare(lpc_snoop->clk);
-
-	return 0;
 }
 
 static const struct aspeed_lpc_snoop_model_data ast2400_model_data = {
@@ -368,7 +366,7 @@ static struct platform_driver aspeed_lpc_snoop_driver = {
 		.of_match_table = aspeed_lpc_snoop_match,
 	},
 	.probe = aspeed_lpc_snoop_probe,
-	.remove = aspeed_lpc_snoop_remove,
+	.remove_new = aspeed_lpc_snoop_remove,
 };
 
 module_platform_driver(aspeed_lpc_snoop_driver);
-- 
2.40.1

