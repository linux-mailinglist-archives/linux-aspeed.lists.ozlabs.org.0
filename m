Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEBB217DB0
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jul 2020 05:41:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1lV445BszDr1R
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jul 2020 13:41:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ispras.ru (client-ip=83.149.199.91; helo=smtp.ispras.ru;
 envelope-from=novikov@ispras.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ispras.ru
X-Greylist: delayed 568 seconds by postgrey-1.36 at bilbo;
 Fri, 03 Jul 2020 21:25:11 AEST
Received: from smtp.ispras.ru (winnie.ispras.ru [83.149.199.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 49yt133J2YzDrB5
 for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Jul 2020 21:25:11 +1000 (AEST)
Received: from home.intra.ispras.ru (unknown [10.10.165.12])
 by smtp.ispras.ru (Postfix) with ESMTP id 8A042203C1;
 Fri,  3 Jul 2020 14:15:33 +0300 (MSK)
From: Evgeny Novikov <novikov@ispras.ru>
To: Jean Delvare <jdelvare@suse.com>
Subject: [PATCH] hwmon: (aspeed-pwm-tacho) Avoid possible buffer overflow
Date: Fri,  3 Jul 2020 14:15:18 +0300
Message-Id: <20200703111518.9644-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
X-Mailman-Approved-At: Wed, 08 Jul 2020 13:41:33 +1000
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
Cc: linux-hwmon@vger.kernel.org, ldv-project@linuxtesting.org,
 linux-aspeed@lists.ozlabs.org, Evgeny Novikov <novikov@ispras.ru>,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

aspeed_create_fan() reads a pwm_port value using of_property_read_u32().
If pwm_port will be more than ARRAY_SIZE(pwm_port_params), there will be
a buffer overflow in
aspeed_create_pwm_port()->aspeed_set_pwm_port_enable(). The patch fixes
the potential buffer overflow.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 33fb54845bf6..3d8239fd66ed 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -851,6 +851,8 @@ static int aspeed_create_fan(struct device *dev,
 	ret = of_property_read_u32(child, "reg", &pwm_port);
 	if (ret)
 		return ret;
+	if (pwm_port >= ARRAY_SIZE(pwm_port_params))
+		return -EINVAL;
 	aspeed_create_pwm_port(priv, (u8)pwm_port);
 
 	ret = of_property_count_u8_elems(child, "cooling-levels");
-- 
2.16.4

