Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1A8A1952
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Apr 2024 18:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFl0R4VZHz3vrb
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 02:05:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFkxB06D9z3vZx
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:02:35 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruwsI-0004zD-Ph; Thu, 11 Apr 2024 18:02:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruwsF-00Bid0-Bp; Thu, 11 Apr 2024 18:02:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruwsF-000gE1-0s;
	Thu, 11 Apr 2024 18:02:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH] hwmon: (aspeed-g6-pwm-tacho): Drop cpp define only used once
Date: Thu, 11 Apr 2024 18:01:36 +0200
Message-ID: <20240411160136.247138-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/vF4zARYuqqbDhTcjAm8UsZUNA5qZUsN0fu/StnCQWU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmGAlgXwk656AgEYUnUaDxpizHFTADWVOyf8hGP CR3wgvRxq2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhgJYAAKCRCPgPtYfRL+ Ti9UB/0djClWTX8zt9z0cf0OzRiWlLj+0C/40DKe0qcTYTcEWyl8D6prcyKRMOr4dqnB7NlqVBs 6M4bBcwsiGLtl3Ght7jvlhr+ECswtPKKNEw1e0CQYW36hNEmWa/hnXfPedWH5xqBtDSW0su6H2q /Jbwd1y8cd+7cMufUOYUurSN4+ftvdgrCQy+20X0f8xKoTHrvT8Pnt+c/HWLCuycCP1ssKQCFEl Yv+o/+E5ffgPy2hXbU5g2oJZ9gMA10kF+TLojJ9GaGFhZnwa0juodBF6u1ww5nTfI4PaeN7E6iU zsfugocSo4jvBnTVcu0F9lzWF8pQvFLZXNv8HUlt/RONjwR4
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

The macro PWM_ASPEED_NR_PWMS is only used once, just use it's value in
this single code line.

Having the number of PWM lines explictly in the call to
devm_pwmchip_alloc() also has the advantage to be easily greppable.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

note this patch depends on commit 2c56fedef8c9 (hwmon: (aspeed-g6-pwm-tacho):
Make use of devm_pwmchip_alloc() function) that currently sits in pwm/for-next.

Best regards
Uwe

 drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 08a2ded95e45..706c344b181b 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -59,8 +59,6 @@
 #include <linux/reset.h>
 #include <linux/sysfs.h>
 
-/* The channel number of Aspeed pwm controller */
-#define PWM_ASPEED_NR_PWMS			16
 /* PWM Control Register */
 #define PWM_ASPEED_CTRL(ch)			((ch) * 0x10 + 0x00)
 #define PWM_ASPEED_CTRL_LOAD_SEL_RISING_AS_WDT	BIT(19)
@@ -487,7 +485,7 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	chip = devm_pwmchip_alloc(dev, PWM_ASPEED_NR_PWMS, 0);
+	chip = devm_pwmchip_alloc(dev, 16, 0);
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 
base-commit: 4118d9533ff3a5d16efb476a0d00afceecd92cf5
-- 
2.43.0

