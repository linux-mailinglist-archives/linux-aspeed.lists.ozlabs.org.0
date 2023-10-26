Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4067D8B8D
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Oct 2023 00:17:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGgCN6B4jz3cM7
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Oct 2023 09:17:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGgCH6NJpz2yQ8
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Oct 2023 09:17:29 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qw8fC-0003bR-JJ; Fri, 27 Oct 2023 00:17:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qw8f7-004VM6-V6; Fri, 27 Oct 2023 00:17:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qw8f7-006suW-LB; Fri, 27 Oct 2023 00:17:09 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: gadget: aspeed_udc: Convert to platform remove callback returning void
Date: Fri, 27 Oct 2023 00:17:02 +0200
Message-ID: <20231026221701.2521483-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3353; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kjYgi1tNDpEkZXYfPpv9I42yC3H7lSh6O/o/Lny0Nk0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlOuVd9j1oolGO0ajvDjH/3NT7YvVEdY7WC+IZp Om2+o9OsWOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTrlXQAKCRCPgPtYfRL+ TivmB/9F6ixFlAlLk+THbeGCiXxeqQ1ecBD4q89Fho0DoLLO+CdDTZm+j37YZpc75Ga7KFe+OOP zG+Z+2bOe/QkIVvjz/2u67ZDYAcu32pBEWHz3ZHgy+nRg9SF2HIi5yCq2GHin0H5+8ouGcxQF9j qgSbAcg4k3uKByFpDR73vqPv4G/WEPmCibvlXzmUQS4c+ntnjcSKgRLiMDhXRXBygamuPZv+owf sA06bxGTyVQmeaV/v4TP+jNoL8O4JwbJmejXp0XgV8Y5VnAFC5h2WHOXRmJZFMGSiV08mjlxgYs mUBRpUR21dGT5bdSw7IDs5EgRkXU0hSyrFVxXQmTWeHeylo/
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Vladimir Zapolskiy <vz@mleia.com>, kernel@pengutronix.de, Zhu Wang <wangzhu9@huawei.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

ast_udc_remove() is one of these functions that return an error code
after doing only a partial cleanup. Replace the core's error message by
a more drastic one and still convert the driver to .remove_new().
Note the only semantic change here is the changed error message.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this driver is one of those that got the remove function wrong. This is
a general problem of the udc drivers and also affects

 drivers/usb/gadget/udc/at91_udc.c
 drivers/usb/gadget/udc/fsl_udc_core.c
 drivers/usb/gadget/udc/gr_udc.c
 drivers/usb/gadget/udc/lpc32xx_udc.c
 drivers/usb/gadget/udc/pxa25x_udc.c

. For now I only converted the aspeed driver, but once this patch is in
an acceptable state, I'd convert all these drivers in the same way.

Fixing the resource leak and the oops is something I'll not address.
This should be done by someone who cares for these drivers and has the
actual hardware.

Best regards
Uwe

 drivers/usb/gadget/udc/aspeed_udc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 2ef89a442f50..3916c8e2ba01 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1432,15 +1432,24 @@ static void ast_udc_init_hw(struct ast_udc_dev *udc)
 	ast_udc_write(udc, 0, AST_UDC_EP0_CTRL);
 }
 
-static int ast_udc_remove(struct platform_device *pdev)
+static void ast_udc_remove(struct platform_device *pdev)
 {
 	struct ast_udc_dev *udc = platform_get_drvdata(pdev);
 	unsigned long flags;
 	u32 ctrl;
 
 	usb_del_gadget_udc(&udc->gadget);
-	if (udc->driver)
-		return -EBUSY;
+	if (udc->driver) {
+		/*
+		 * This is broken as only some cleanup is skipped, *udev is
+		 * freed and the register mapping goes away. Any further usage
+		 * probably crashes. Also the device is unbound, so the skipped
+		 * cleanup is never catched up later.
+		 */
+		dev_alert(&pdev->dev,
+			  "Driver is busy and still going away. Fasten your seat belts!\n");
+		return;
+	}
 
 	spin_lock_irqsave(&udc->lock, flags);
 
@@ -1459,8 +1468,6 @@ static int ast_udc_remove(struct platform_device *pdev)
 				  udc->ep0_buf_dma);
 
 	udc->ep0_buf = NULL;
-
-	return 0;
 }
 
 static int ast_udc_probe(struct platform_device *pdev)
@@ -1581,7 +1588,7 @@ MODULE_DEVICE_TABLE(of, ast_udc_of_dt_ids);
 
 static struct platform_driver ast_udc_driver = {
 	.probe			= ast_udc_probe,
-	.remove			= ast_udc_remove,
+	.remove_new		= ast_udc_remove,
 	.driver			= {
 		.name			= KBUILD_MODNAME,
 		.of_match_table		= ast_udc_of_dt_ids,

base-commit: 2ef7141596eed0b4b45ef18b3626f428a6b0a822
-- 
2.42.0

