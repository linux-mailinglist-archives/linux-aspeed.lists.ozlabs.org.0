Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AE028CBCF
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Oct 2020 12:35:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9X481yxszDqfG
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Oct 2020 21:35:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=billy_tsai@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9X3p0Lh4zDqcY
 for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Oct 2020 21:34:45 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 09DAUguY010592;
 Tue, 13 Oct 2020 18:30:42 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Oct
 2020 18:32:57 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <knaack.h@gmx.de>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <robh+dt@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <p.zabel@pengutronix.de>,
 <billy_tsai@aspeedtech.com>, <alexandru.ardelean@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] iio: adc: aspeed: Orgnaize and add the define of adc
Date: Tue, 13 Oct 2020 18:32:43 +0800
Message-ID: <20201013103245.16723-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013103245.16723-1-billy_tsai@aspeedtech.com>
References: <20201013103245.16723-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09DAUguY010592
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch organizes the define of adc to multiple partitions
and adds the new bit field define for ast2600 driver.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 42 ++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 1e5375235cfe..ae400c4d6d40 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -21,23 +21,57 @@
 #include <linux/iio/driver.h>
 #include <linux/iopoll.h>
 
+/**********************************************************
+ * ADC feature define
+ *********************************************************/
 #define ASPEED_RESOLUTION_BITS		10
 #define ASPEED_CLOCKS_PER_SAMPLE	12
 
+/**********************************************************
+ * ADC HW register offset define
+ *********************************************************/
 #define ASPEED_REG_ENGINE_CONTROL	0x00
 #define ASPEED_REG_INTERRUPT_CONTROL	0x04
 #define ASPEED_REG_VGA_DETECT_CONTROL	0x08
 #define ASPEED_REG_CLOCK_CONTROL	0x0C
+#define ASPEED_REG_COMPENSATION_TRIM	0xC4
 #define ASPEED_REG_MAX			0xC0
 
+/**********************************************************
+ * ADC register Bit field
+ *********************************************************/
+/*ENGINE_CONTROL */
+/* [0] */
+#define ASPEED_ENGINE_ENABLE		BIT(0)
+/* [3:1] */
 #define ASPEED_OPERATION_MODE_POWER_DOWN	(0x0 << 1)
 #define ASPEED_OPERATION_MODE_STANDBY		(0x1 << 1)
 #define ASPEED_OPERATION_MODE_NORMAL		(0x7 << 1)
-
-#define ASPEED_ENGINE_ENABLE		BIT(0)
-
+/* [4] */
+#define ASPEED_CTRL_COMPENSATION	BIT(4)
+/* [5] */
+#define ASPEED_AUTOPENSATING		BIT(5)
+/* [7:6] */
+#define ASPEED_REF_VOLTAGE_2500mV	(0 << 6)
+#define ASPEED_REF_VOLTAGE_1200mV	(1 << 6)
+#define ASPEED_REF_VOLTAGE_EXT_HIGH	(2 << 6)
+#define ASPEED_REF_VOLTAGE_EXT_LOW	(3 << 6)
+#define ASPEED_BATTERY_SENSING_VOL_DIVIDE_2_3	(0 << 6)
+#define ASPEED_BATTERY_SENSING_VOL_DIVIDE_1_3	(1 << 6)
+/* [8] */
 #define ASPEED_ADC_CTRL_INIT_RDY	BIT(8)
-
+/* [12] */
+#define ASPEED_ADC_CH7_VOLTAGE_NORMAL	(0 << 12)
+#define ASPEED_ADC_CH7_VOLTAGE_BATTERY	(1 << 12)
+/* [13] */
+#define ASPEED_ADC_EN_BATTERY_SENSING	BIT(13)
+/* [31:16] */
+#define ASPEED_ADC_CTRL_CH_EN(n)	(1 << (16 + n))
+#define ASPEED_ADC_CTRL_CH_EN_ALL	GENMASK(31, 16)
+
+/**********************************************************
+ * Software setting
+ *********************************************************/
 #define ASPEED_ADC_INIT_POLLING_TIME	500
 #define ASPEED_ADC_INIT_TIMEOUT		500000
 
-- 
2.17.1

