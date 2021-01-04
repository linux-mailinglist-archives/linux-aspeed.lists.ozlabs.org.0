Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EB22E8F72
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Jan 2021 03:25:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8KH903fzzDqZ2
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Jan 2021 13:25:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hisilicon.com (client-ip=45.249.212.190;
 helo=szxga04-in.huawei.com; envelope-from=tiantao6@hisilicon.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=hisilicon.com
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8KDY4h6bzDqXv
 for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Jan 2021 13:23:21 +1100 (AEDT)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D8Jpx2c0Wzl0nP;
 Mon,  4 Jan 2021 10:04:41 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 4 Jan 2021 10:05:47 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <p.zabel@pengutronix.de>
Subject: [PATCH] hwmon: (aspeed-pwm-tacho): Switch to using the new API
 kobj_to_dev()
Date: Mon, 4 Jan 2021 10:05:45 +0800
Message-ID: <1609725945-13895-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 04 Jan 2021 13:25:36 +1100
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
Cc: linux-hwmon@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

fixed the following coccicheck:
drivers/hwmon/aspeed-pwm-tacho.c:634:60-61: WARNING opportunity for
kobj_to_dev()
drivers/hwmon/aspeed-pwm-tacho.c:623:60-61: WARNING opportunity for
kobj_to_dev()

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 3d8239f..3cb88d6 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -620,7 +620,7 @@ static ssize_t rpm_show(struct device *dev, struct device_attribute *attr,
 static umode_t pwm_is_visible(struct kobject *kobj,
 			      struct attribute *a, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
 
 	if (!priv->pwm_present[index])
@@ -631,7 +631,7 @@ static umode_t pwm_is_visible(struct kobject *kobj,
 static umode_t fan_dev_is_visible(struct kobject *kobj,
 				  struct attribute *a, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
 
 	if (!priv->fan_tach_present[index])
-- 
2.7.4

