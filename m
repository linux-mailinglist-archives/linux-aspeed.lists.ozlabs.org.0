Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E562D9655CB
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 05:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3qB1JzXz30W0
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 13:41:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989298;
	cv=none; b=C9m9WiRBXLclwboEeQrpMXaLQPMbvZIA2NkoWmpZV/w6HdbzwhV+ywxOzYbbK/xJSkkxrI12BSK0PECWtGtpewSlyDzAYSUvQbZGP/ObnNDTlf4PpCImDMaQUB8op2Pq0ev3bZOJnxt0ApgbqrKGDuHuDgh/L4sfiWYcJMpRDOzJgPzL5JI0+cMgUq9eW5ADCvce3WmruYP0u8nA6tv6bOfBii8NJf1Xq7047PtG+wv9eVUVFQr5ttGQpqeHuE5jIHz5+hOiPvfBRPbrWIh4VeCWCqJm0ozHizRMrHmtqfTm+aAIS7ZQTHY3c02RUbZ5ib/eGgyRIJ+zpuAP/ZKqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989298; c=relaxed/relaxed;
	bh=dfSalnUkx2431Uo8bQXWvVlNAZmxyxw8Aat/ocgZo4E=;
	h=Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=KRyTlhgBf4oqud6AEhBlB2tLPuWxOCIckyF37A08ew5eeI7GF7MwpxdJPXWPls4/U8bbXjPUVTdC1V9coDZNiQ/PFvRW2t6PxHVRE4hPC6tLtKz167iO/ExETZA1ooM1KIbOHDdsUiimfvGSWsYjKAutKrCVOg4Ep1qovTT0A7Dxk45aglfT7Ee4ginntNJSNTeg4kPNFD9gWKTYzjawhNstwvznrU6PB+eslK/h+bgK3Y/35KuQpZvDYxe8G+hOsrFIYEIkfO0/vD9UZgM77fjkI2Nui1w0pp0uGlyNDaDRHFD8Mgy6CCqnvY2kW8+OKX5L3UV9E3NvbQrbh+a2HQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3q56VcXz2yvw
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2024 13:41:37 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 30 Aug
 2024 11:40:48 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 30 Aug 2024 11:40:48 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 4/4] gpio: aspeed: Support G7 Aspeed gpio controller
Date: Fri, 30 Aug 2024 11:40:47 +0800
Message-ID: <20240830034047.2251482-5-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
References: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
has its own 32-bit register, allowing for individual control of the pin’s
value, direction, interrupt type, and other settings. The permission for
coprocessor access is supported by the hardware but hasn’t been
implemented in the current patch.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 116 +++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 74c4e80958bf..24f9c7312351 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -30,6 +30,23 @@
 #include <linux/gpio/consumer.h>
 #include "gpiolib.h"
 
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
@@ -95,6 +112,7 @@ struct aspeed_gpio_bank {
  */
 
 static const int debounce_timers[4] = { 0x00, 0x50, 0x54, 0x58 };
+static const int g7_debounce_timers[4] = { 0x00, 0x04, 0x00, 0x08 };
 
 static const struct aspeed_gpio_copro_ops *copro_ops;
 static void *copro_data;
@@ -246,6 +264,39 @@ static inline void __iomem *bank_reg(struct aspeed_gpio *gpio,
 	BUG();
 }
 
+static inline u32 reg_mask(const enum aspeed_gpio_reg reg)
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
@@ -930,6 +981,9 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 
+	if (gpio->config->version == 7)
+		return -EOPNOTSUPP;
+
 	if (!gpio->cf_copro_bankmap)
 		gpio->cf_copro_bankmap = kzalloc(gpio->chip.ngpio >> 3, GFP_KERNEL);
 	if (!gpio->cf_copro_bankmap)
@@ -975,6 +1029,9 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 	int rc = 0, bindex, offset = gpio_chip_hwgpio(desc);
 	unsigned long flags;
 
+	if (gpio->config->version == 7)
+		return -EOPNOTSUPP;
+
 	if (!gpio->cf_copro_bankmap)
 		return -ENXIO;
 
@@ -1069,10 +1126,27 @@ static const struct aspeed_gpio_config ast2600_config =
 	 */
 	{ .nr_gpios = 208, .props = ast2600_bank_props, .version = 4};
 
+static const struct aspeed_bank_props ast2700_bank_props[] = {
+	/*     input	  output   */
+	{ 1, 0x0fffffff, 0x0fffffff }, /* E/F/G/H, 4-GPIO hole */
+	{ 6, 0x00ffffff, 0x00ffffff }, /* Y/Z/AA */
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
+	{ .nr_gpios = 216, .props = ast2700_bank_props, .version = 7 };
+
 static const struct of_device_id aspeed_gpio_of_table[] = {
 	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
 	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config, },
 	{ .compatible = "aspeed,ast2600-gpio", .data = &ast2600_config, },
+	{ .compatible = "aspeed,ast2700-gpio", .data = &ast2700_config, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
@@ -1111,6 +1185,40 @@ struct aspeed_gpio_llops aspeed_g4_llops = {
 	.reg_bits_read = aspeed_g4_reg_bits_read,
 };
 
+static void aspeed_g7_reg_bits_set(struct aspeed_gpio *gpio, unsigned int offset,
+				   const enum aspeed_gpio_reg reg, u32 val)
+{
+	u32 mask = reg_mask(reg);
+	void __iomem *addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	u32 write_val = (ioread32(addr) & ~(mask)) | (((val) << (ffs(mask) - 1)) & (mask));
+
+	iowrite32(write_val, addr);
+}
+
+static u32 aspeed_g7_reg_bits_read(struct aspeed_gpio *gpio, unsigned int offset,
+				   const enum aspeed_gpio_reg reg)
+{
+	u32 mask = reg_mask(reg);
+	void __iomem *addr;
+
+	if (reg == reg_irq_status) {
+		addr = gpio->base + GPIO_G7_IRQ_STS_OFFSET(offset);
+		return ioread32(addr);
+	}
+	addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	if (reg == reg_val)
+		mask = GPIO_G7_CTRL_IN_DATA;
+
+	return (((ioread32(addr)) & (mask)) >> (ffs(mask) - 1));
+}
+
+struct aspeed_gpio_llops aspeed_g7_llops = {
+	.copro_request = NULL,
+	.copro_release = NULL,
+	.reg_bits_set = aspeed_g7_reg_bits_set,
+	.reg_bits_read = aspeed_g7_reg_bits_read,
+};
+
 static int __init aspeed_gpio_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *gpio_id;
@@ -1152,6 +1260,14 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 			gpio->debounce_timers_array = debounce_timers;
 			gpio->debounce_timers_num = ARRAY_SIZE(debounce_timers);
 		}
+	} else if (gpio->config->version == 7) {
+		if (!gpio->llops)
+			gpio->llops = &aspeed_g7_llops;
+
+		if (!gpio->debounce_timers_array) {
+			gpio->debounce_timers_array = g7_debounce_timers;
+			gpio->debounce_timers_num = ARRAY_SIZE(g7_debounce_timers);
+		}
 	} else {
 		return -EOPNOTSUPP;
 	}
-- 
2.25.1

