Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA07E539BFC
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 06:18:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCbTr2xvwz3bkY
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 14:17:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BU4zuxcH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BU4zuxcH;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCbTm1Nk9z305b
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Jun 2022 14:17:47 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id 3-20020a17090a174300b001e426a02ac5so1787460pjm.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 31 May 2022 21:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p/+ntGXUelw5ZDKTegotppZpOKb88sw5s3W1VT60Y9Y=;
        b=BU4zuxcHxh+X+A8rj2aKOosynv9Ke9MJ76UXkz7klHU11GJSFLHzRfLrO6Hf/BrqPF
         3zXbiI0QmoKyPoP+cZ8T/Rvmm+nISUxm6buoXmGvhyR0K3NH++WHSyEQG22ZdCPuw6Tg
         1SQQz+84Xu5ZPs4A62/st5YNzXkEN1K3O8FYxm8CbL9boCVhfeeYOeXROdwzitvUBqrA
         DFH+Ham35Nc3eWm4XF4cOkgyClE2QcUKQOxadEUL7Z+hdzSJtLQzFhQliJrPVx2RsAk4
         77MLz5V0xpX8sbC6i4P2FnftnE4COW4hGeECaHQtafPBsG0frihMYwzq6rYL58kZ/+F+
         dtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p/+ntGXUelw5ZDKTegotppZpOKb88sw5s3W1VT60Y9Y=;
        b=GlD6vClLEu2QE+8ziAsYogu9G3lk7F552+eSJSi3gpbp7DwEebsu5tfj+qjsNThI3O
         kcKResPLoAzxuE2+hvDKInuPnZzhTxjImbmQ3y/6rXTuzNzjFQQ5U0KPRB93qh+P0213
         Q1oVZU70aWF6GKu3Zl14HsMoD+1bdvgi2Odb2wieUsF01qahPNxXlMeRKalU4+dER+2T
         zPY78aSqu+DoFLJKta7btmbgh0JjsRGOt8+f+vUu5115lxVKfhsU0OWa7FH0tw94R6Vr
         Vyd1lBexsx3KVX4GJsbkehrZQV16ta+S94Eb2jYqtoWoKcCR10Rlf/puu33+1f0Hs7yi
         Xtag==
X-Gm-Message-State: AOAM530Dvpzu4MPq6sFnvl1ES7C6rcLtadxwy9k1fPKWipCKvvKk+0eo
	AARX7H9gx7jpcOyYbuQg7l4=
X-Google-Smtp-Source: ABdhPJx+oMC5YHO/HcdO/PczBVYNasPXpb2NZykBAGhnAUC/SLEgp2vTpff2UMHbUmeZMm0e2M4m7A==
X-Received: by 2002:a17:90a:bb17:b0:1e0:ab18:4491 with SMTP id u23-20020a17090abb1700b001e0ab184491mr31807267pjr.120.1654057065640;
        Tue, 31 May 2022 21:17:45 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id u11-20020a63d34b000000b003c14af505f6sm290749pgi.14.2022.05.31.21.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 21:17:45 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh+dt@kernel.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>
Subject: [PATCH v2 1/2] aspeed: i2c: add manual clock setting feature
Date: Wed,  1 Jun 2022 12:15:11 +0800
Message-Id: <20220601041512.21484-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601041512.21484-1-potin.lai.pt@gmail.com>
References: <20220601041512.21484-1-potin.lai.pt@gmail.com>
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

Add manual tuning i2c clock timing register support by reading
following properties.

* aspeed,i2c-manual-clk: Enable aspeed i2c clock manual setting
* aspeed,i2c-base-clk-div: Base Clock divisor (tBaseClk)
* aspeed,i2c-clk-high-cycle: Cycles of clock-high pulse (tClkHigh)
* aspeed,i2c-clk-low-cycle: Cycles of clock-low pulse (tClkLow)

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 57 ++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 67e8b97c0c95..64424f377f27 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -60,6 +60,7 @@
 #define ASPEED_I2CD_TIME_SCL_LOW_MASK			GENMASK(15, 12)
 #define ASPEED_I2CD_TIME_BASE_DIVISOR_MASK		GENMASK(3, 0)
 #define ASPEED_I2CD_TIME_SCL_REG_MAX			GENMASK(3, 0)
+#define ASPEED_I2CD_TIME_BASE_DIVISOR_MAX		32768
 /* 0x08 : I2CD Clock and AC Timing Control Register #2 */
 #define ASPEED_NO_TIMEOUT_CTRL				0
 
@@ -898,6 +899,57 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
 	return 0;
 }
 
+/* precondition: bus.lock has been acquired. */
+static int aspeed_i2c_manual_clk_setup(struct aspeed_i2c_bus *bus)
+{
+	u32 divisor, clk_high, clk_low, clk_reg_val;
+
+	if (device_property_read_u32(bus->dev, "aspeed,i2c-base-clk-div",
+				     &divisor) != 0) {
+		dev_err(bus->dev, "Could not read aspeed,i2c-base-clk-div\n");
+		return -EINVAL;
+	} else if (!divisor || divisor > ASPEED_I2CD_TIME_BASE_DIVISOR_MAX ||
+		   BIT(__fls(divisor)) != divisor) {
+		dev_err(bus->dev, "Invalid aspeed,i2c-base-clk-div: %u\n",
+			divisor);
+		return -EINVAL;
+	}
+
+	if (device_property_read_u32(bus->dev, "aspeed,i2c-clk-high-cycle",
+				     &clk_high) != 0) {
+		dev_err(bus->dev, "Could not read aspeed,i2c-clk-high-cycle\n");
+		return -EINVAL;
+	} else if ((clk_high-1) > ASPEED_I2CD_TIME_SCL_REG_MAX) {
+		dev_err(bus->dev, "Invalid aspeed,i2c-clk-high-cycle: %u\n",
+			clk_high);
+		return -EINVAL;
+	}
+
+	if (device_property_read_u32(bus->dev, "aspeed,i2c-clk-low-cycle",
+				     &clk_low) != 0) {
+		dev_err(bus->dev, "Could not read aspeed,i2c-clk-low-cycle\n");
+		return -EINVAL;
+	} else if ((clk_low-1) > ASPEED_I2CD_TIME_SCL_REG_MAX) {
+		dev_err(bus->dev, "Invalid aspeed,i2c-clk-low-cycle: %u\n",
+			clk_low);
+		return -EINVAL;
+	}
+
+	clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
+	clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
+			ASPEED_I2CD_TIME_THDSTA_MASK |
+			ASPEED_I2CD_TIME_TACST_MASK);
+	clk_reg_val |= (ilog2(divisor) & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK)
+			| (((clk_high-1) << ASPEED_I2CD_TIME_SCL_HIGH_SHIFT)
+			   & ASPEED_I2CD_TIME_SCL_HIGH_MASK)
+			| (((clk_low-1) << ASPEED_I2CD_TIME_SCL_LOW_SHIFT)
+			   & ASPEED_I2CD_TIME_SCL_LOW_MASK);
+	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
+	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
+
+	return 0;
+}
+
 /* precondition: bus.lock has been acquired. */
 static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 			     struct platform_device *pdev)
@@ -908,7 +960,10 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	/* Disable everything. */
 	writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
 
-	ret = aspeed_i2c_init_clk(bus);
+	if (of_property_read_bool(pdev->dev.of_node, "aspeed,i2c-manual-clk"))
+		ret = aspeed_i2c_manual_clk_setup(bus);
+	else
+		ret = aspeed_i2c_init_clk(bus);
 	if (ret < 0)
 		return ret;
 
-- 
2.17.1

