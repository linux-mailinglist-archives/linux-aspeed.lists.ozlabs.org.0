Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8641D49DA8B
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jan 2022 07:21:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkr7k33pbz30QB
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jan 2022 17:21:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=14.98.235.2; helo=imsva.in.megatrends.com;
 envelope-from=krishnar@ami.com; receiver=<UNKNOWN>)
Received: from IMSVA.IN.MEGATRENDS.COM (webmail.amiindia.co.in [14.98.235.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jkqnv2fXLz2yPV
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jan 2022 17:05:38 +1100 (AEDT)
Received: from IMSVA.IN.MEGATRENDS.COM (IMSVA.IN.MEGATRENDS.COM [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6952082047;
 Thu, 27 Jan 2022 11:46:15 +0530 (IST)
Received: from IMSVA.IN.MEGATRENDS.COM (IMSVA.IN.MEGATRENDS.COM [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D13B82046;
 Thu, 27 Jan 2022 11:46:15 +0530 (IST)
Received: from webmail.amiindia.co.in (venus1.in.megatrends.com [10.0.0.5])
 by IMSVA.IN.MEGATRENDS.COM (Postfix) with ESMTPS;
 Thu, 27 Jan 2022 11:46:15 +0530 (IST)
Received: from msgubuntu-OptiPlex-5060.in.megatrends.com (10.0.124.83) by
 VENUS1.in.megatrends.com (10.0.0.5) with Microsoft SMTP Server id 14.3.468.0; 
 Thu, 27 Jan 2022 11:35:02 +0530
From: krishnar4 <krishnar@ami.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Linus Walleij
 <linus.walleij@linaro.org>
Subject: [PATCH linux dev-5.15] hwmon: (pmbus) modify PSU fan_target convert
 value to false
Date: Thu, 27 Jan 2022 11:34:59 +0530
Message-ID: <20220127060459.17310-1-krishnar@ami.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <git-send-email-krishnar@ami.com>
References: <git-send-email-krishnar@ami.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1817-8.6.0.1013-26114.002
X-TM-AS-Result: No--1.662-5.0-31-10
X-imss-scan-details: No--1.662-5.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1817-8.6.1013-26114.002
X-TMASE-Result: 10--1.662300-10.000000
X-TMASE-MatchedRID: 8muszqLoCjtHoOzJ1oF1dqiUivh0j2Pvljgw/8s6b3cHZBaLwEXlKGlF
 7OhYLlctcwePA9FSeTz9k6grZ0shf9zmfZUrwTrUngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
 Wy9W70AEnRE+fI6etkituBDgcniIfegbcIIrT/+G8mBZdhaNLqDiyY/5MU8oBTzs4VfHSjec5fl
 oBUgk06Ga7J9YRB75owdF1Ue2Jr/JPZRTsEKEvt4pebMSk1UmKlmXPgyQocYp5E1G2nFNyeETBf
 0diyKhk7DIVgUu7mCo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Mailman-Approved-At: Thu, 27 Jan 2022 17:20:58 +1100
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
 Pravinash Jeyapaul <pravinashj@ami.com>, linux-kernel@vger.kernel.org,
 Vinodhini J <vinodhinij@ami.com>, Deepak Kodihalli <dkodihalli@nvidia.com>,
 Shakeeb Pasha <spasha@nvidia.com>, Krishna Raj <krishnar@ami.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Description: PSU can't use sysfs fan_target to control PSU fan duty.

Signed-off-by: krishnar4 <krishnar@ami.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 776ee2237be2..a56c2e1c4079 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1889,7 +1889,7 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
 
 	sensor = pmbus_add_sensor(data, "fan", "target", index, page,
 				  0xff, PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
-				  false, false, true);
+				  false, false, false);
 
 	if (!sensor)
 		return -ENOMEM;
-- 
2.17.1

