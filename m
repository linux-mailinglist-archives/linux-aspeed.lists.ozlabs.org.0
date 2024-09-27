Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0483E988312
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 13:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFSdG4lJkz3cSL
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 21:18:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727435902;
	cv=none; b=TFoRH9KiszxXkNa+w7HgIvppOgnWe8/Xn3mDGc+sRTobH6N0co/GjHzsW3Pu6+oxYf6k5OSYGDcSGOv6G3GvcEzhgd5a3EjTF0eXU3njNH+tRFoGkzFJvLSjD7mg8DmR0B+piqyXZTvvioyBnP5vGW07J4fprY1WoPE2q1Ma3P53qEpQqf3tPxH4v/5isELYfYyPqt/p5JCmVlElA5t4+kHjkwyPiuw7kALupw9Ji5IqhyZa0vQoNoRmWubG0jsstwNKUcE4AslIpTrrerh61DLAUsYpXCubvFK+fQ/TA3/ylxdUbVTWmSBq0VhWVLJjVYE9rP1bP3hcHHtyDXxelw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727435902; c=relaxed/relaxed;
	bh=Dadp29YvSobeBz2IlmCY1PFSEi7xJ4XWIk6Tmp0FE9w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O+oAbI9cHBV3icWhLaaCv8/ARKzYKS6ECvuvt3rU3L+k+CJh4fuYw3mdze/r5o7ZmLy+K5xS1cNQEvJUD52z63pHG6kPnY9Sdw0T1J+sMQbTxf0Z9pWqdeZWdf0rN0+q+gKPNEY5J3+CQlHDbCl0aDWSp4m4X+xA/uk1/95Y/6baVVvk3T2eGEVWImbYQAHPtApN53rY9+9cPk0crnGg46wrXQ1TlWFMQhU9Bz1o0fUYh3V3Mo7HSfIg3ddkFjsMi15UnRfzqsyRSfJ1JQCTBmco365db6GWLDXf6HZKLo/AXkijZKLc2ncl3fzjSv/u01wVcYo/kMi2/EVfHJP10Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFSd96KVwz3btT
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 21:18:21 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 19:17:45 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 19:17:45 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v6 4/7] gpio: aspeed: Support G7 Aspeed gpio controller
Date: Fri, 27 Sep 2024 19:17:41 +0800
Message-ID: <20240927111744.3511373-5-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

In the 7th generation of the SoC from Aspeed, the control logic of the
GPIO controller has been updated to support per-pin control. Each pin now
has its own 32-bit register, allowing for individual control of the pin's
value, direction, interrupt type, and other settings. The permission for
coprocessor access is supported by the hardware but hasn't been
implemented in the current patch.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 132 +++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 3ed58289a4a8..1be9a7aa9e8b 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -30,6 +30,27 @@
 #include <linux/gpio/consumer.h>
 #include "gpiolib.h"
 
+/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
+#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
+#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
+
+#define GPIO_G7_IRQ_STS_BASE 0x100
+#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)
+#define GPIO_G7_CTRL_REG_BASE 0x180
+#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x) * 0x4)
+#define GPIO_G7_CTRL_OUT_DATA BIT(0)
+#define GPIO_G7_CTRL_DIR BIT(1)
+#define GPIO_G7_CTRL_IRQ_EN BIT(2)
+#define GPIO_G7_CTRL_IRQ_TYPE0 BIT(3)
+#define GPIO_G7_CTRL_IRQ_TYPE1 BIT(4)
+#define GPIO_G7_CTRL_IRQ_TYPE2 BIT(5)
+#define GPIO_G7_CTRL_RST_TOLERANCE BIT(6)
+#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(7)
+#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(8)
+#define GPIO_G7_CTRL_INPUT_MASK BIT(9)
+#define GPIO_G7_CTRL_IRQ_STS BIT(12)
+#define GPIO_G7_CTRL_IN_DATA BIT(13)
+
 struct aspeed_bank_props {
 	unsigned int bank;
 	u32 input;
@@ -95,6 +116,7 @@ struct aspeed_gpio_bank {
  */
 
 static const int debounce_timers[4] = { 0x00, 0x50, 0x54, 0x58 };
+static const int g7_debounce_timers[4] = { 0x00, 0x04, 0x00, 0x08 };
 
 static const struct aspeed_gpio_copro_ops *copro_ops;
 static void *copro_data;
@@ -250,6 +272,39 @@ static void __iomem *aspeed_gpio_g4_bank_reg(struct aspeed_gpio *gpio,
 	BUG();
 }
 
+static u32 aspeed_gpio_g7_reg_mask(const enum aspeed_gpio_reg reg)
+{
+	switch (reg) {
+	case reg_val:
+		return GPIO_G7_CTRL_OUT_DATA;
+	case reg_dir:
+		return GPIO_G7_CTRL_DIR;
+	case reg_irq_enable:
+		return GPIO_G7_CTRL_IRQ_EN;
+	case reg_irq_type0:
+		return GPIO_G7_CTRL_IRQ_TYPE0;
+	case reg_irq_type1:
+		return GPIO_G7_CTRL_IRQ_TYPE1;
+	case reg_irq_type2:
+		return GPIO_G7_CTRL_IRQ_TYPE2;
+	case reg_tolerance:
+		return GPIO_G7_CTRL_RST_TOLERANCE;
+	case reg_debounce_sel1:
+		return GPIO_G7_CTRL_DEBOUNCE_SEL1;
+	case reg_debounce_sel2:
+		return GPIO_G7_CTRL_DEBOUNCE_SEL2;
+	case reg_rdata:
+		return GPIO_G7_CTRL_OUT_DATA;
+	case reg_irq_status:
+		return GPIO_G7_CTRL_IRQ_STS;
+	case reg_cmdsrc0:
+	case reg_cmdsrc1:
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
 #define GPIO_BANK(x)	((x) >> 5)
 #define GPIO_OFFSET(x)	((x) & 0x1f)
 #define GPIO_BIT(x)	BIT(GPIO_OFFSET(x))
@@ -1106,6 +1161,59 @@ static const struct aspeed_gpio_llops aspeed_g4_llops = {
 	.privilege_ctrl = aspeed_g4_privilege_ctrl,
 	.privilege_init = aspeed_g4_privilege_init,
 };
+
+static void aspeed_g7_reg_bit_set(struct aspeed_gpio *gpio, unsigned int offset,
+				  const enum aspeed_gpio_reg reg, bool val)
+{
+	u32 mask = aspeed_gpio_g7_reg_mask(reg);
+	void __iomem *addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	u32 write_val;
+
+	if (mask) {
+		write_val = (ioread32(addr) & ~(mask)) | field_prep(mask, val);
+		iowrite32(write_val, addr);
+	}
+}
+
+static bool aspeed_g7_reg_bit_get(struct aspeed_gpio *gpio, unsigned int offset,
+				  const enum aspeed_gpio_reg reg)
+{
+	u32 mask = aspeed_gpio_g7_reg_mask(reg);
+	void __iomem *addr;
+
+	addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	if (reg == reg_val)
+		mask = GPIO_G7_CTRL_IN_DATA;
+
+	if (mask)
+		return field_get(mask, ioread32(addr));
+	else
+		return 0;
+}
+
+static int aspeed_g7_reg_bank_get(struct aspeed_gpio *gpio, unsigned int offset,
+				  const enum aspeed_gpio_reg reg)
+{
+	void __iomem *addr;
+
+	if (reg == reg_irq_status) {
+		addr = gpio->base + GPIO_G7_IRQ_STS_OFFSET(offset >> 5);
+		return ioread32(addr);
+	} else {
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct aspeed_gpio_llops aspeed_g7_llops = {
+	.copro_request = NULL,
+	.copro_release = NULL,
+	.reg_bit_set = aspeed_g7_reg_bit_set,
+	.reg_bit_get = aspeed_g7_reg_bit_get,
+	.reg_bank_get = aspeed_g7_reg_bank_get,
+	.privilege_ctrl = NULL,
+	.privilege_init = NULL,
+};
+
 /*
  * Any banks not specified in a struct aspeed_bank_props array are assumed to
  * have the properties:
@@ -1173,10 +1281,34 @@ static const struct aspeed_gpio_config ast2600_config =
 		.require_dcache = true,
 	};
 
+static const struct aspeed_bank_props ast2700_bank_props[] = {
+	/*     input	  output   */
+	{ 1, 0x0fffffff, 0x0fffffff }, /* E/F/G/H, 4-GPIO hole */
+	{ 6, 0x00ffffff, 0x00ff0000 }, /* Y/Z/AA */
+	{},
+};
+
+static const struct aspeed_gpio_config ast2700_config =
+	/*
+	 * ast2700 has two controllers one with 212 GPIOs and one with 16 GPIOs.
+	 * 216 for simplicity, actual number is 212 (4-GPIO hole in GPIOH)
+	 * We expect ngpio being set in the device tree and this is a fallback
+	 * option.
+	 */
+	{
+		.nr_gpios = 216,
+		.props = ast2700_bank_props,
+		.llops = &aspeed_g7_llops,
+		.debounce_timers_array = g7_debounce_timers,
+		.debounce_timers_num = ARRAY_SIZE(g7_debounce_timers),
+		.require_dcache = false,
+	};
+
 static const struct of_device_id aspeed_gpio_of_table[] = {
 	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
 	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config, },
 	{ .compatible = "aspeed,ast2600-gpio", .data = &ast2600_config, },
+	{ .compatible = "aspeed,ast2700-gpio", .data = &ast2700_config, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
-- 
2.25.1

