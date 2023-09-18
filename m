Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE59D7A537C
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 22:09:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqG9N32lGz3c89
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Sep 2023 06:09:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1073 seconds by postgrey-1.37 at boromir; Tue, 19 Sep 2023 06:09:36 AEST
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqG9D5Ds7z3byh
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Sep 2023 06:09:36 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKHA-0003kM-8w; Mon, 18 Sep 2023 21:51:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKH7-007I8Q-Ei; Mon, 18 Sep 2023 21:51:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKH7-002mC2-4v; Mon, 18 Sep 2023 21:51:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 01/19] net: mdio: aspeed: Convert to platform remove callback returning void
Date: Mon, 18 Sep 2023 21:50:44 +0200
Message-Id: <20230918195102.1302746-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
References: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+rLYLOsUpr8kyy+QFlBR3XWIcdLjwnZ/LnhP5xUSMTQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCKoAeA+IS0yQi6cSoY2pH7ok+WjtIDnAYn1k9 fgK9LXFin6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQiqAAAKCRCPgPtYfRL+ Tg6MB/9RzPdhExQILy67IDnTq81/pUsM2T6QgTRxzoOE6vIqMyoKjvG5Ep1oj4jtvqjXcSom28W La0nOZIorIudcmyTU81CVvJt/2uzvLIUbY2DySyTfpVCg6VXUrrvFme+raLXLLm7UVlwBfgwYhr IYhRPmDLyIyamGf02ZQ6D+GvY5cgIj308E4nC7TZpGebXQugLlQAcATzjBG52rnt4kJs+xiOYVy M5KKEELd2Fr1PUJeE2xWJl721EU7OOE8jcR/fp/Mds9v0KaY9X8+qJExQvhwPr8+shvEjYxvP84 adrN5A/M+Bg7wuoCPU36gwxA5XHm8oC8d6QlBrm8aMil5+QA
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
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/mdio/mdio-aspeed.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
index c727103c8b05..70edeeb7771e 100644
--- a/drivers/net/mdio/mdio-aspeed.c
+++ b/drivers/net/mdio/mdio-aspeed.c
@@ -177,15 +177,13 @@ static int aspeed_mdio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int aspeed_mdio_remove(struct platform_device *pdev)
+static void aspeed_mdio_remove(struct platform_device *pdev)
 {
 	struct mii_bus *bus = (struct mii_bus *)platform_get_drvdata(pdev);
 	struct aspeed_mdio *ctx = bus->priv;
 
 	reset_control_assert(ctx->reset);
 	mdiobus_unregister(bus);
-
-	return 0;
 }
 
 static const struct of_device_id aspeed_mdio_of_match[] = {
@@ -200,7 +198,7 @@ static struct platform_driver aspeed_mdio_driver = {
 		.of_match_table = aspeed_mdio_of_match,
 	},
 	.probe = aspeed_mdio_probe,
-	.remove = aspeed_mdio_remove,
+	.remove_new = aspeed_mdio_remove,
 };
 
 module_platform_driver(aspeed_mdio_driver);
-- 
2.40.1

