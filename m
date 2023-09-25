Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DADFF7AD50C
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Sep 2023 11:57:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvJFV5zydz3dhY
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Sep 2023 19:57:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvJCn03PTz3c3r
	for <linux-aspeed@lists.ozlabs.org>; Mon, 25 Sep 2023 19:55:49 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJV-0007m6-FY; Mon, 25 Sep 2023 11:55:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJU-008pyk-BA; Mon, 25 Sep 2023 11:55:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJU-004dkX-1h; Mon, 25 Sep 2023 11:55:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 03/40] soc/aspeed: aspeed-p2a-ctrl: Convert to platform remove callback returning void
Date: Mon, 25 Sep 2023 11:54:54 +0200
Message-Id: <20230925095532.1984344-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=JYd7Sr8gyXvahOZUF55RS3qSTMWxK0yiZV2LoWrIRh4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlEVhDt7MLlPVCMlc5EwxwPfLfsQHi2D7BV9Umr 6ddRvgar6GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRFYQwAKCRCPgPtYfRL+ TgKiCACIh7XmaGJyFy8+QrCBtCeZjIbj+ZtRlu3PhdmHgeaBlv0tcSXFAae4Fbnojl3pzyNZoAJ bgUabIat4hinn9Js07ibum+hfiDMqS1if6TFl59yudRcUkh+CX2clUdaktJeMpaztFi5LPirA/A O9aX0d+hE34DqXN3Ae+BoXI3BYfvy/at5Ac+cFFSIIwqor0YUgTvJEWQFTM2pahmuUItQEAZ57V G6H4lEqjPWCR6WmQTlf8sgO1gWKSIV6rF7nMY1xAgy2R45wNfamUEir65knwrtBrq7PCgUOPC17 6d+yTejyr9HU4fXdv1YmO93SCDLzMlZrdRlp0/+raxHwmiGg
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
 drivers/soc/aspeed/aspeed-p2a-ctrl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-p2a-ctrl.c b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
index 548f44da28a9..8610ddacc7bc 100644
--- a/drivers/soc/aspeed/aspeed-p2a-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
@@ -383,13 +383,11 @@ static int aspeed_p2a_ctrl_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int aspeed_p2a_ctrl_remove(struct platform_device *pdev)
+static void aspeed_p2a_ctrl_remove(struct platform_device *pdev)
 {
 	struct aspeed_p2a_ctrl *p2a_ctrl = dev_get_drvdata(&pdev->dev);
 
 	misc_deregister(&p2a_ctrl->miscdev);
-
-	return 0;
 }
 
 #define SCU2C_DRAM	BIT(25)
@@ -433,7 +431,7 @@ static struct platform_driver aspeed_p2a_ctrl_driver = {
 		.of_match_table = aspeed_p2a_ctrl_match,
 	},
 	.probe = aspeed_p2a_ctrl_probe,
-	.remove = aspeed_p2a_ctrl_remove,
+	.remove_new = aspeed_p2a_ctrl_remove,
 };
 
 module_platform_driver(aspeed_p2a_ctrl_driver);
-- 
2.40.1

