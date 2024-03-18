Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BBC87ED8A
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Mar 2024 17:28:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz0f93bK3z3vlR
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Mar 2024 03:28:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz0dy0MyWz3vhg
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Mar 2024 03:28:20 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmFqA-0007vn-3z; Mon, 18 Mar 2024 17:27:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmFq7-00771N-B1; Mon, 18 Mar 2024 17:27:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmFq7-0084aK-0o;
	Mon, 18 Mar 2024 17:27:55 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/2] hwmon: (aspeed-g6-pwm-tacho): Make use of devm_pwmchip_alloc() function
Date: Mon, 18 Mar 2024 17:09:50 +0100
Message-ID: <e95e41eea5a138ae206c9116ba3cb1d9e0178284.1710777536.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710777536.git.u.kleine-koenig@pengutronix.de>
References: <cover.1710777536.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2016; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=sxjjnfKkYkaoM01hMvDCymVFNJG1Id02ALiMxmvvPbo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl+GdPmc9wc8K9hxy5Ng9vDwdtqZxaBjb9CTpYf Tijn2ND/PWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZfhnTwAKCRCPgPtYfRL+ TsWGB/0VWpThd/3Z7VCJWJhy7lkvW+lLYQQOv3fW/k7u63Rs78a3iRHCeyEQHW5raCK7FTrDPWS zVrJ//f99TxO5qTBQxebilOzDFycu4eouXx2QTcRy+WgdggIAkakj+JQLIg93keGIUeR/NLqb5e niCxliwGuBAfAXa0a/gQH4dH9FVM5l78POWEfrK9Lf+LXG7EgalDaLnZGSGYjboZ2XKEyXaFfI5 g0L7+UcYO06WP7QN3LGjcft91lea5S9rfeQQWjeZ6Coqy1b6Is2lHKkDBiSatfkunnR6i4finQy 9UoazMLDz5S1r6Bsd2CqwA0h1YS7ausQcattsrUckPU2CmK1
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
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This prepares the aspeed-g6-pwm-tacho driver to further changes of the
pwm core outlined in the commit introducing devm_pwmchip_alloc(). There
is no intended semantical change and the driver should behave as before.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/aspeed-g6-pwm-tach.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 64def5e4cdf6..332c02216668 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -136,7 +136,6 @@ struct aspeed_pwm_tach_data {
 	struct clk *clk;
 	struct reset_control *reset;
 	unsigned long clk_rate;
-	struct pwm_chip chip;
 	bool tach_present[TACH_ASPEED_NR_TACHS];
 	u32 tach_divisor;
 };
@@ -144,7 +143,7 @@ struct aspeed_pwm_tach_data {
 static inline struct aspeed_pwm_tach_data *
 aspeed_pwm_chip_to_data(struct pwm_chip *chip)
 {
-	return container_of(chip, struct aspeed_pwm_tach_data, chip);
+	return pwmchip_get_drvdata(chip);
 }
 
 static int aspeed_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -459,6 +458,7 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	int ret;
 	struct device_node *child;
 	struct aspeed_pwm_tach_data *priv;
+	struct pwm_chip *chip;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -487,11 +487,14 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	priv->chip.dev = dev;
-	priv->chip.ops = &aspeed_pwm_ops;
-	priv->chip.npwm = PWM_ASPEED_NR_PWMS;
+	chip = devm_pwmchip_alloc(dev, PWM_ASPEED_NR_PWMS, 0);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
 
-	ret = devm_pwmchip_add(dev, &priv->chip);
+	pwmchip_set_drvdata(chip, priv);
+	chip->ops = &aspeed_pwm_ops;
+
+	ret = devm_pwmchip_add(dev, chip);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add PWM chip\n");
 
-- 
2.43.0

