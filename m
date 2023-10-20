Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 553427D09FD
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Oct 2023 09:57:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBcPC24n6z3cnZ
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Oct 2023 18:57:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBcP42G3lz3cDr
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Oct 2023 18:56:54 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtkN1-0003GE-QF; Fri, 20 Oct 2023 09:56:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtkMy-002yUN-Gw; Fri, 20 Oct 2023 09:56:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtkMy-002OIb-7Y; Fri, 20 Oct 2023 09:56:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH 07/42] crypto: aspeed-hace - Convert to platform remove callback returning void
Date: Fri, 20 Oct 2023 09:55:29 +0200
Message-ID: <20231020075521.2121571-51-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0YO0s5LXreauqMFpfEjyAZpLsQgNKr0gbAnyprV3vAo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMjJy3jnWIJF75wjEniVJf9lztk78hAUfW7ZhN wOsZS/iKt2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTIycgAKCRCPgPtYfRL+ Ttg/CACG4iqbhG0quRs93JEgKLuQwHqCW3hwSPjBvbphXpp5VtHjN27w/YXL5Np2WoPUPNrVgmw hWLzG5LoZss8FnMu+acBo3Oii3QiqUEkSKilvJntZ0/QawkFoila0LMskRLAuP4yR7IdWqwBm4Y oILFwfy3jJOBMv6pHH4aF0H+4DBYRFYehXHwDtL9Z9bHNqn80SCQKYYhNYpH/FS8zqTrMfeIrPz KEQAkkcx7HcdAsnMF7LRMeoHVp2gEoxl0cD4T1+7J+mu6+yuIVgBC0KzFPtUBqqxNIUlWvovSwe HkQCQbp21lnyB0DNzw5OSg5BQ1vlwbBDeVRzsbUABsSTx5Bj
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
Cc: linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/crypto/aspeed/aspeed-hace.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-hace.c b/drivers/crypto/aspeed/aspeed-hace.c
index d9da04fb816e..062f2a66dd23 100644
--- a/drivers/crypto/aspeed/aspeed-hace.c
+++ b/drivers/crypto/aspeed/aspeed-hace.c
@@ -245,7 +245,7 @@ static int aspeed_hace_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int aspeed_hace_remove(struct platform_device *pdev)
+static void aspeed_hace_remove(struct platform_device *pdev)
 {
 	struct aspeed_hace_dev *hace_dev = platform_get_drvdata(pdev);
 	struct aspeed_engine_crypto *crypto_engine = &hace_dev->crypto_engine;
@@ -260,15 +260,13 @@ static int aspeed_hace_remove(struct platform_device *pdev)
 	tasklet_kill(&crypto_engine->done_task);
 
 	clk_disable_unprepare(hace_dev->clk);
-
-	return 0;
 }
 
 MODULE_DEVICE_TABLE(of, aspeed_hace_of_matches);
 
 static struct platform_driver aspeed_hace_driver = {
 	.probe		= aspeed_hace_probe,
-	.remove		= aspeed_hace_remove,
+	.remove_new	= aspeed_hace_remove,
 	.driver         = {
 		.name   = KBUILD_MODNAME,
 		.of_match_table = aspeed_hace_of_matches,
-- 
2.42.0

