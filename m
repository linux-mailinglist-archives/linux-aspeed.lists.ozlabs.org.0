Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 146E4872951
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Mar 2024 22:21:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq7mN6Fxbz3vfb
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Mar 2024 08:21:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq7mK5l0Mz3dvs
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Mar 2024 08:21:37 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcDl-00031J-IY; Tue, 05 Mar 2024 22:21:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcDj-004cl6-Az; Tue, 05 Mar 2024 22:21:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcDj-000IBp-0m;
	Tue, 05 Mar 2024 22:21:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jeremy Kerr <jk@ozlabs.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/4] fsi: master-aspeed: Convert to platform remove callback returning void
Date: Tue,  5 Mar 2024 22:20:57 +0100
Message-ID: <de0f2d4cb529a433d4620ca0e8fda0dfb1e950db.1709673414.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1709673414.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709673414.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=h/gshAthEPYFi327mVVxiqjfbvykTC4SqshkzvX2uII=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl54y7OVQo3k/ImdRY4QH22KJ+0E7o0XxH1GiRE 9CcG+HmhheJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeeMuwAKCRCPgPtYfRL+ TvX3CACMNkwgH04qJxI1nHhx/KY1c1BJQ8zXqmiTV6h7m/3m0flZ56Ddhl0R+URbLRLXhfHfHim vs27ZTq2RBRtC+0Vkpk8tS9Z/YJRA/UMyiAdXSVJ4z5Xlc65EG6Gxi/FX4lM0xmWWSErBTSa2k1 0jRxDOYi3a6Nmy4V847uybVWzkPrJOsMQFopsuNyBMWWYkwW2PDWB6cttQhyVoizz33d3hYQDyP bDAmOm/pfqhGCpAhMwf+Vs9Ong2fP4EfPUkRSCThhcNtM/kFXXQ7PCAsTFC2eZwzB1kWDmRFF11 GzRoo8fjf4EC9hRT/EBumL6r5aqQW9lQv8HYtFZBPzSfi3aj
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
Cc: linux-aspeed@lists.ozlabs.org, Alistar Popple <alistair@popple.id.au>, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
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
 drivers/fsi/fsi-master-aspeed.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f0a19cd451a0..b0b624c3717b 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -646,14 +646,12 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int fsi_master_aspeed_remove(struct platform_device *pdev)
+static void fsi_master_aspeed_remove(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed = platform_get_drvdata(pdev);
 
 	fsi_master_unregister(&aspeed->master);
 	clk_disable_unprepare(aspeed->clk);
-
-	return 0;
 }
 
 static const struct of_device_id fsi_master_aspeed_match[] = {
@@ -668,7 +666,7 @@ static struct platform_driver fsi_master_aspeed_driver = {
 		.of_match_table	= fsi_master_aspeed_match,
 	},
 	.probe	= fsi_master_aspeed_probe,
-	.remove = fsi_master_aspeed_remove,
+	.remove_new = fsi_master_aspeed_remove,
 };
 
 module_platform_driver(fsi_master_aspeed_driver);
-- 
2.43.0

