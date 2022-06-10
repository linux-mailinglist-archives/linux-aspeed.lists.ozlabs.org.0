Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EED545BDB
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jun 2022 07:50:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LK96N212Rz3bvZ
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jun 2022 15:50:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Dy7x+Mrh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Dy7x+Mrh;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LK96D6LWbz3bnS
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jun 2022 15:50:12 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id cx11so23202057pjb.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jun 2022 22:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FsxwkmAiX9UAmWoJprZmYggp6OfzZ6sym7rcjKDnHow=;
        b=Dy7x+MrhC3qVgR/CcoXvKPeaR/ZT6U7pd0AfpLUpUimkKmz3z+Xy6V1umdTqy+EIry
         XWmflE+/IhBzVBOLALvB3ZWuKsV+9LQDwWB8//zKPumdL9YDrnsIdzT+rt8Ov85SzHeX
         HR6Pt/adqBy3plpERCyp1742A81QS32S1QdYypx5X7QAk+RWUo9dYfYrY8UvjRGDqcLE
         9Bog11j610/0cB+6aeppFcTgieftGkZo5pVc6+knNeaVwGxyncHJu8E93DVfFFd5vf3z
         Y7EIh7cdUlELU/m4ZRQKq0n4Mv9mdOZfj9J17uCptIESDKknYh0vav4FNUI7Gf9rmZcz
         9uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FsxwkmAiX9UAmWoJprZmYggp6OfzZ6sym7rcjKDnHow=;
        b=KueWZ7AZLW2zGSVj68l/SerDhD4x3EnRg8QmD2f127oPKL34TjlwUbvtd2a9TdaSSh
         o6F6kugRdTPpWIiI4/FZDcm+BRJxuDu8NRFl1pQimn3/qegv/4yA3mHmmtYYqx6V4h++
         p1Y3MDm3D5DgNeCx0eU4KzPMRe73NyaNiVu0dqO2QqyaEJbVdoOcyKwSg2+pH1secM4Y
         4Yox5k1i1rDWmL0fLs+b0PI7F+hv7SjJPyhLEixTIHwzIKNHj/dS0XBT0dOpRo1lyYWa
         CB0pWMgCnL7mH2ft6f0sGj8w5E7l9GeohkQ9iH5H9/cYFZpOYN3ex/xkFaQqq+jReLhS
         NWPQ==
X-Gm-Message-State: AOAM533M53eq7phWh8vLL6f/YAQ0cGf/RbQSFHoiXGTirQreMfSQArvS
	b/5SuR54+vC8xgr9BzHPsdE=
X-Google-Smtp-Source: ABdhPJzK5bJmaY3FoQqLtm0jZvM4MYDjYTt02MmiwOXG/qS0ntmjMF8/32kDrgMROsAz+Gq/51ZIAA==
X-Received: by 2002:a17:903:25d6:b0:168:a88f:44ea with SMTP id jc22-20020a17090325d600b00168a88f44eamr6937158plb.28.1654840209951;
        Thu, 09 Jun 2022 22:50:09 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id f11-20020aa7968b000000b0051b90ac6c15sm18553977pfk.125.2022.06.09.22.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 22:50:09 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh+dt@kernel.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>
Subject: [PATCH v4 1/2] aspeed: i2c: add clock duty cycle property
Date: Fri, 10 Jun 2022 13:47:21 +0800
Message-Id: <20220610054722.32229-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220610054722.32229-1-potin.lai.pt@gmail.com>
References: <20220610054722.32229-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Introduce i2c-clk-high-min-percent property for setting a minimum clock
high percentage.

This driver calculate clk_high and clk_low with giving duty cycle. If it
could not find a suit clk_high and clk_low, it apply default duty cycle
50%.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 56 ++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 67e8b97c0c95..9715dc4f933f 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -19,6 +19,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
@@ -27,6 +28,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#define DEFAULT_I2C_CLK_DUTY_CYCLE			50
+
 /* I2C Register */
 #define ASPEED_I2C_FUN_CTRL_REG				0x00
 #define ASPEED_I2C_AC_TIMING_REG1			0x04
@@ -149,9 +152,11 @@ struct aspeed_i2c_bus {
 	spinlock_t			lock;
 	struct completion		cmd_complete;
 	u32				(*get_clk_reg_val)(struct device *dev,
-							   u32 divisor);
+							   u32 divisor,
+							   u32 duty_cycle);
 	unsigned long			parent_clk_frequency;
 	u32				bus_frequency;
+	u32				duty_cycle;
 	/* Transaction state. */
 	enum aspeed_i2c_master_state	master_state;
 	struct i2c_msg			*msgs;
@@ -798,9 +803,11 @@ static const struct i2c_algorithm aspeed_i2c_algo = {
 
 static u32 aspeed_i2c_get_clk_reg_val(struct device *dev,
 				      u32 clk_high_low_mask,
-				      u32 divisor)
+				      u32 divisor,
+				      u32 duty_cycle)
 {
 	u32 base_clk_divisor, clk_high_low_max, clk_high, clk_low, tmp;
+	u32 tmp_base_clk_divisor;
 
 	/*
 	 * SCL_high and SCL_low represent a value 1 greater than what is stored
@@ -842,10 +849,32 @@ static u32 aspeed_i2c_get_clk_reg_val(struct device *dev,
 			"clamping clock divider: divider requested, %u, is greater than largest possible divider, %u.\n",
 			divisor, (1 << base_clk_divisor) * clk_high_low_max);
 	} else {
-		tmp = (divisor + (1 << base_clk_divisor) - 1)
+		for (tmp_base_clk_divisor = base_clk_divisor;
+		    tmp_base_clk_divisor <= ASPEED_I2CD_TIME_BASE_DIVISOR_MASK;
+		    tmp_base_clk_divisor++) {
+			/* calculate clk_high and clk_low with duty cycle */
+			tmp = (divisor + (1 << tmp_base_clk_divisor) - 1)
+				>> tmp_base_clk_divisor;
+
+			clk_high = DIV_ROUND_UP(tmp * duty_cycle, 100);
+			clk_low = tmp - clk_high;
+
+			if (max(clk_high, clk_low) <= (clk_high_low_mask + 1))
+				break;
+		}
+
+		if (tmp_base_clk_divisor <= ASPEED_I2CD_TIME_BASE_DIVISOR_MASK)
+			base_clk_divisor = tmp_base_clk_divisor;
+		else {
+			dev_err(dev,
+				"could not find clk_high and clk_low with duty cycle %u%%\n, recalculate with base_clk_divisor %u and duty_cycle 50%%",
+				duty_cycle, base_clk_divisor);
+			duty_cycle = 50;
+			tmp = (divisor + (1 << base_clk_divisor) - 1)
 				>> base_clk_divisor;
-		clk_low = tmp / 2;
-		clk_high = tmp - clk_low;
+			clk_high = DIV_ROUND_UP(tmp * duty_cycle, 100);
+			clk_low = tmp - clk_high;
+		}
 
 		if (clk_high)
 			clk_high--;
@@ -863,22 +892,22 @@ static u32 aspeed_i2c_get_clk_reg_val(struct device *dev,
 			   & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
 }
 
-static u32 aspeed_i2c_24xx_get_clk_reg_val(struct device *dev, u32 divisor)
+static u32 aspeed_i2c_24xx_get_clk_reg_val(struct device *dev, u32 divisor, u32 duty_cycle)
 {
 	/*
 	 * clk_high and clk_low are each 3 bits wide, so each can hold a max
 	 * value of 8 giving a clk_high_low_max of 16.
 	 */
-	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(2, 0), divisor);
+	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(2, 0), divisor, duty_cycle);
 }
 
-static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor)
+static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor, u32 duty_cycle)
 {
 	/*
 	 * clk_high and clk_low are each 4 bits wide, so each can hold a max
 	 * value of 16 giving a clk_high_low_max of 32.
 	 */
-	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(3, 0), divisor);
+	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(3, 0), divisor, duty_cycle);
 }
 
 /* precondition: bus.lock has been acquired. */
@@ -891,7 +920,7 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
 	clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
 			ASPEED_I2CD_TIME_THDSTA_MASK |
 			ASPEED_I2CD_TIME_TACST_MASK);
-	clk_reg_val |= bus->get_clk_reg_val(bus->dev, divisor);
+	clk_reg_val |= bus->get_clk_reg_val(bus->dev, divisor, bus->duty_cycle);
 	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
 	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
 
@@ -1009,11 +1038,16 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 		bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
+	ret = of_property_read_u32(pdev->dev.of_node,
+				   "i2c-clk-high-min-percent", &bus->duty_cycle);
+	if (ret < 0 || !bus->duty_cycle || bus->duty_cycle > 100)
+		bus->duty_cycle = DEFAULT_I2C_CLK_DUTY_CYCLE;
+
 	match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
 	if (!match)
 		bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
 	else
-		bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
+		bus->get_clk_reg_val = (u32 (*)(struct device *, u32, u32))
 				match->data;
 
 	/* Initialize the I2C adapter */
-- 
2.17.1

