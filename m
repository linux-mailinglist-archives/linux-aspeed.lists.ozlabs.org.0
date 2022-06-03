Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2249F53D319
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Jun 2022 23:08:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFFqH1Kqdz3bdj
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 Jun 2022 07:08:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LFFqB25bPz2xBk
	for <linux-aspeed@lists.ozlabs.org>; Sat,  4 Jun 2022 07:08:35 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWf-0003qn-EN; Fri, 03 Jun 2022 23:08:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-006Hps-RF; Fri, 03 Jun 2022 23:08:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWZ-00E1HB-In; Fri, 03 Jun 2022 23:08:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 02/14] mtd: spi-nor: aspeed-smc: Make aspeed_smc_unregister() return void
Date: Fri,  3 Jun 2022 23:07:46 +0200
Message-Id: <20220603210758.148493-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403; i=uwe@kleine-koenig.org; h=from:subject; bh=eWtWx/epQpLlsoTlHHCWvKtyg2OjpSVS7ZvDdS6QM84=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfLxu7k0eweeB8bzbAH+71WvKfW1QPZQ8Z1ONZ2 fKNE8veJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp3ywAKCRDB/BR4rcrsCRl5CA CR6wsaStLWrD1HN5wBjAgJ4orKtfVKq/JMqleHRmO5CwekrODLEi7LLqyUuDLTXqc/pfwOu6mp4a0H 2z4hW0+UDSiJsQFrasKIBTfS6ObBt4Pm6vcUnwyMsTJJ0qDmBazUzsO1k2eSEpoDv1L7Qpp7TbCKqx kNL97YVzqcoJyDJcSzUH72DEPcL6huEQyLW8tepFf0AzAc/VgFrvwj9oKczL9QeCvN84LCkQYO/PjF Pk4UZJKlttaHaCgjUPTC286I7DTmyFNrT/E08O/Z77L9t8orRkRkOEZ13veOxp9Uwcz77Wnj0y5aWQ UcZ9qUZT8TIsYoxgyOUeVWolF5F1Y9
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
Cc: linux-aspeed@lists.ozlabs.org, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The function returns zero unconditionally, so simplify to make it
obvious there is no error to handle in the callers.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index acfe010f9dd7..bd149104533a 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -399,7 +399,7 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
 	return len;
 }
 
-static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
+static void aspeed_smc_unregister(struct aspeed_smc_controller *controller)
 {
 	struct aspeed_smc_chip *chip;
 	int n;
@@ -409,13 +409,13 @@ static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
 		if (chip)
 			mtd_device_unregister(&chip->nor.mtd);
 	}
-
-	return 0;
 }
 
 static int aspeed_smc_remove(struct platform_device *dev)
 {
-	return aspeed_smc_unregister(platform_get_drvdata(dev));
+	aspeed_smc_unregister(platform_get_drvdata(dev));
+
+	return 0;
 }
 
 static const struct of_device_id aspeed_smc_matches[] = {
-- 
2.36.1

