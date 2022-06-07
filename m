Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B368F5403ED
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 18:39:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHbg92bJNz3bpg
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jun 2022 02:39:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cjrZ07iw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cjrZ07iw;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHbfz1D5mz3bkk
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Jun 2022 02:39:38 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so21375037pjo.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Jun 2022 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mnuX2XuAZH2+4k0j70brZ2CKznHIP3JRJnTSoZMTWkg=;
        b=cjrZ07iwc2EALTYW1XrWSK/VzNuGI2H/RL1mBuzHM2OYSp3yL3HqqgekI3npRRr+7Q
         vh6T5/5vsGE3XklV73vEFl+Yqm4KMfU5sSygWTGupnJvL1YzsOi0Bq3VCiDVFdtplgcW
         AI74ppgBbW5fTiK8WHAIdVdKWpk7N7QCocGSxXZ4/4rDJKYuPXrG7UHKALDk1HXEdJWR
         XMBUq1XJQs0CcXXsXDfA7klOA16ZqfiRnyF1PlGq/BiSZ5QRcOnNm57AB/yRzIB6zMxi
         Lm0Qg72j2yiX7s+hUQPYyVM1WKucepwbLF/4L6bc/eurH7xYn9sbduzcD7b3bzCoET+S
         XugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mnuX2XuAZH2+4k0j70brZ2CKznHIP3JRJnTSoZMTWkg=;
        b=o65MDWEHPMHHB2NV2VuzipHTGLptMdooiKJWLYKJ3FrXLvpg0zXPLQG7+UYDZXtjRN
         uvTZ6Z71tYVxTCOxDCfP87mMhTu2bht9SZNQ/7PIWmOKYmTNLySiSVNKGzntQqVCRqq8
         PSQ+Xp9CKpRGbSrvBpqHLJmvCsAD6XvdYv7PufsQ8GHc747VuCEV8XHGfvfMdQMlptyK
         TDwIWBR5igmz0oC4RDkz7OdoPUpFFosJ/Xxn+2YdgmxghORio2oG/1zaXPQsojtPJwEe
         WHsdyvflcDpPfA9PD2dQAQEnYidAlZ3WnZervWQhVeQdwOvN2nPrhUoaEYOLZku6t96e
         BRIA==
X-Gm-Message-State: AOAM533NcZhtQqN3w3L9Ae6w5t1/FNSsQ2JSP4JYhp+KUBxf/XvP0cef
	IHcg/LARo5+l2qGrmrJNfR0=
X-Google-Smtp-Source: ABdhPJww6wXD/7mS2SvdH5jDFtcbiEE6U8bBZ8OHhGKV6nDUwaPh058LyFjaR41wIulAkCXHnCPLKA==
X-Received: by 2002:a17:90a:a096:b0:1df:58d7:5b20 with SMTP id r22-20020a17090aa09600b001df58d75b20mr32805835pjp.212.1654619976713;
        Tue, 07 Jun 2022 09:39:36 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id d15-20020aa797af000000b0051bbc198f3fsm12560272pfq.13.2022.06.07.09.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 09:39:36 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh+dt@kernel.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>
Subject: [PATCH v3 1/2] aspeed: i2c: add clock duty cycle property
Date: Wed,  8 Jun 2022 00:37:02 +0800
Message-Id: <20220607163703.26355-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220607163703.26355-1-potin.lai.pt@gmail.com>
References: <20220607163703.26355-1-potin.lai.pt@gmail.com>
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

Introduce i2c-clk-duty-cycle property for setting a minimum clock high
percentage.

This driver calculate clk_high and clk_low with giving duty cycle. If it
could not find a suit clk_high and clk_low, it apply default duty cycle
50%.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 56 ++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 67e8b97c0c95..825d23f79be7 100644
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
+				   "i2c-clk-duty-cycle-min", &bus->duty_cycle);
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

