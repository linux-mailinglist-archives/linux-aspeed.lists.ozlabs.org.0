Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC1970762A
	for <lists+linux-aspeed@lfdr.de>; Thu, 18 May 2023 01:04:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QM7vl2rCJz3fDQ
	for <lists+linux-aspeed@lfdr.de>; Thu, 18 May 2023 09:04:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QM7vC0jgQz3fMN
	for <linux-aspeed@lists.ozlabs.org>; Thu, 18 May 2023 09:03:35 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAX-0007qP-CM; Thu, 18 May 2023 01:02:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAR-000wpU-UF; Thu, 18 May 2023 01:02:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAR-005UWo-3g; Thu, 18 May 2023 01:02:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joel Stanley <joel@jms.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Lei YU <yulei.sh@bytedance.com>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Henry Tian <tianxiaofeng@bytedance.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 25/97] usb: gadget: aspeed: Convert to platform remove callback returning void
Date: Thu, 18 May 2023 01:01:27 +0200
Message-Id: <20230517230239.187727-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=MV0ThmzJUmcovzeeBYch+5BKOdB2tqS68iBUtqxhmXA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwHMxMU+ji6YX4DtbKukTr1obOqsXHNjQN2z w8O6lFzjmyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcBwAKCRCPgPtYfRL+ TvxDB/9MQtYjU8ldqJ1jR0G7lan8lFckbGe+rBHmW6p+mC7W8OxY4P9/PRB8UIMcqoUwy19ZPHq k6g68tYoUisF0+QR+FCOlpOhBcShZd2coljtyvR2/GNgPzP9sQ1skNdJWECZFss15ris3dNOoqw qPJgl7wBBo7vPM0ccOH/uo31B+mqCVCZIW1eUIVkvu3Q0PokcWZCHu7npHSzcv5Ce/nV8IwJnbN b8FV5DU5t5KgMz5B+2+mr8G4VT0iouiMlj9jrtFDOPbIoUA2vOwmg5EmDQGhCwh9HsdonZA6/tc S1rf64nBzQG1F57fNgTnPwTIXeg6AdOpct14FRF9shTlL6DW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
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
Cc: linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart from
emitting a warning) and this typically results in resource leaks. To improve
here there is a quest to make the remove callback return void. In the first
step of this quest all drivers are converted to .remove_new() which already
returns void. Eventually after all drivers are converted, .remove_new() is
renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index 86398a04a012..16f2db8c4a2b 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -253,14 +253,14 @@ void ast_vhub_init_hw(struct ast_vhub *vhub)
 	       vhub->regs + AST_VHUB_IER);
 }
 
-static int ast_vhub_remove(struct platform_device *pdev)
+static void ast_vhub_remove(struct platform_device *pdev)
 {
 	struct ast_vhub *vhub = platform_get_drvdata(pdev);
 	unsigned long flags;
 	int i;
 
 	if (!vhub || !vhub->regs)
-		return 0;
+		return;
 
 	/* Remove devices */
 	for (i = 0; i < vhub->max_ports; i++)
@@ -289,8 +289,6 @@ static int ast_vhub_remove(struct platform_device *pdev)
 				  vhub->ep0_bufs,
 				  vhub->ep0_bufs_dma);
 	vhub->ep0_bufs = NULL;
-
-	return 0;
 }
 
 static int ast_vhub_probe(struct platform_device *pdev)
@@ -431,7 +429,7 @@ MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
 
 static struct platform_driver ast_vhub_driver = {
 	.probe		= ast_vhub_probe,
-	.remove		= ast_vhub_remove,
+	.remove_new	= ast_vhub_remove,
 	.driver		= {
 		.name	= KBUILD_MODNAME,
 		.of_match_table	= ast_vhub_dt_ids,
-- 
2.39.2

