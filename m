Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C957B8071
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Oct 2023 15:14:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0wBZ6l6mz3cgJ
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Oct 2023 00:14:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0w9s2GVgz2ygZ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Oct 2023 00:13:35 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qo1gW-0006oK-PP; Wed, 04 Oct 2023 15:13:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qo1gV-00B2h5-SV; Wed, 04 Oct 2023 15:13:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qo1gV-008zCC-J2; Wed, 04 Oct 2023 15:13:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH 03/21] EDAC/aspeed: Convert to platform remove callback returning void
Date: Wed,  4 Oct 2023 15:12:36 +0200
Message-Id: <20231004131254.2673842-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
References: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ZIFXoJp34XhUaOmwr7EiRfSpR5K5sF36mP6Xs3mQ+WQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlHWSQJEe2NPiTtc7wNXKUmjqpmvXoVn9dqEQkJ Smd3Xb76DKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZR1kkAAKCRCPgPtYfRL+ Tr58B/9uFt+itrf+KEGigNR8Uybiz/Jw9pAO9f9gW6/b1FVUuT9n3RJRmeyEGFCH00vS3ZUMiSb HhrFmrvCaKVdGeCoPOQoye6mSN6oMR1/dCfGWgcGwCsUx/G3KNXJbM04NWY4/Yt3GRz9DzZMJ7C qJUSrwW8o2SZuBZ90wkDgAn80e8GQahpkEPgLe0nX4qXjLvffoKFVxvwQX886HBse4RlDe+SUyK SSGop2D0RWRMLgsN0Lamq1u8TwWLjyH1UKSvgTv0Fqau5wtgJ7YU7NqMySdd6ln0GVYN+0C6DVZ qfpYU8OE3pQCnD/Z8xZRxDlJkxmQw5cni0CJ9imvEe0CNgR2
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
Cc: Robert Richter <rric@kernel.org>, linux-aspeed@lists.ozlabs.org, James Morse <james.morse@arm.com>, kernel@pengutronix.de, Stefan Schaeckeler <sschaeck@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
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
 drivers/edac/aspeed_edac.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 6bd5f8815919..157a480eb761 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -357,7 +357,7 @@ static int aspeed_probe(struct platform_device *pdev)
 }
 
 
-static int aspeed_remove(struct platform_device *pdev)
+static void aspeed_remove(struct platform_device *pdev)
 {
 	struct mem_ctl_info *mci;
 
@@ -369,8 +369,6 @@ static int aspeed_remove(struct platform_device *pdev)
 	mci = edac_mc_del_mc(&pdev->dev);
 	if (mci)
 		edac_mc_free(mci);
-
-	return 0;
 }
 
 
@@ -389,7 +387,7 @@ static struct platform_driver aspeed_driver = {
 		.of_match_table = aspeed_of_match
 	},
 	.probe		= aspeed_probe,
-	.remove		= aspeed_remove
+	.remove_new	= aspeed_remove
 };
 module_platform_driver(aspeed_driver);
 
-- 
2.40.1

