Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E18872498
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Mar 2024 17:44:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq1cm6ZySz3vXZ
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Mar 2024 03:44:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq1cg1124z3dTr
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Mar 2024 03:44:35 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXde-0003Tc-DX; Tue, 05 Mar 2024 17:27:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXdc-004aQM-4U; Tue, 05 Mar 2024 17:27:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXdc-000BLn-0A;
	Tue, 05 Mar 2024 17:27:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Corey Minyard <minyard@acm.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 5/6] ipmi: kcs_bmc_aspeed: Convert to platform remove callback returning void
Date: Tue,  5 Mar 2024 17:27:02 +0100
Message-ID: <d125e83788ddc27fc52a3f11b2c329b40cbdd6f9.1709655755.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1952; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=cQSTkvN0Jy5VD1YUAtbSWuP1fWTL3JuKHCTDHuLZJJg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl50fXPuLKdTXmE+BXOgA9dIA30b5KFjtiIciDx b+i5br1uiSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZedH1wAKCRCPgPtYfRL+ Ts6bB/9txuPhZrGm/DMvNwP0Qx1oMm+pFrBAHixgtqY+mImxKJZ+IlyxuFi6OXvc0bnE9Y4aj1I C0dGPLQKsyemV7eL9A5P9bEdaTYGGNSd8NXp+RM3XtwOEo5nlqlPAM8LO3nnJIbiwbtFF4sxCcB gw7wD4fORaKLivqujGWHShxZJQOtT0AiqPwd9M4SNbsmKfdGF0d5SIgrVTCmKci5exR0OqWe6f7 OUyL9Eya0lk5ZrTZ/GsbMA6stjeCr3iEoUa9A0bLTddKQb7sXy9RQb6LFfNvLTJAwn83RefooK7 wt4ro9o5G8d5sbCdH04Tds5EkI/ncAymD+MKMpXMdcirftg1
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
Cc: kernel@pengutronix.de, openipmi-developer@lists.sourceforge.net, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
 drivers/char/ipmi/kcs_bmc_aspeed.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 72640da55380..227bf06c7ca4 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -641,7 +641,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int aspeed_kcs_remove(struct platform_device *pdev)
+static void aspeed_kcs_remove(struct platform_device *pdev)
 {
 	struct aspeed_kcs_bmc *priv = platform_get_drvdata(pdev);
 	struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
@@ -656,8 +656,6 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
 	priv->obe.remove = true;
 	spin_unlock_irq(&priv->obe.lock);
 	del_timer_sync(&priv->obe.timer);
-
-	return 0;
 }
 
 static const struct of_device_id ast_kcs_bmc_match[] = {
@@ -674,7 +672,7 @@ static struct platform_driver ast_kcs_bmc_driver = {
 		.of_match_table = ast_kcs_bmc_match,
 	},
 	.probe  = aspeed_kcs_probe,
-	.remove = aspeed_kcs_remove,
+	.remove_new = aspeed_kcs_remove,
 };
 module_platform_driver(ast_kcs_bmc_driver);
 
-- 
2.43.0

