Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 058B9698CC0
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 07:21:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHPw05kNcz3bfs
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 17:21:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=agUizBGE;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=agUizBGE;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHPvv3zfwz3bfs
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 17:20:58 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 76B4620075; Thu, 16 Feb 2023 14:20:55 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676528455;
	bh=tfLU2O8BolaYqby7LqUzhVc2It6YjDKfhjRkS/0T9/I=;
	h=From:To:Cc:Subject:Date;
	b=agUizBGEUsoIxA3E1LePUDkIE4bQ+11wDDLcYr2klhUuZ+2MfpwILbojt4GqudrqX
	 V/5H5KJ2TrGeyBus1xaBgRKOlAngsl2m/ekjxZNlTXsVhsJv5icxkzTQQk/5g/MFZs
	 WbVmf+HAqlUGU3ovGz4cwQdopIgQ+lrwTEKfMj4OO6gLddhT1vCe2X36VrMT/IHjwp
	 EoFQ6EExnItu7LHK3ZxsSXvSrA3GgSouFHyXB9DBkny5rUgsC7oWPCJ9d97n61RC56
	 W4ziPEj1YJlHc7+yts+CgBER5oTz5zUjKJoKOYumAtPj9SXBoW8OcwVX27iNzb5yE+
	 1tn/f195ymcng==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: dw: Use configured rate and bus mode for clock configuration
Date: Thu, 16 Feb 2023 14:20:40 +0800
Message-Id: <20230216062040.497815-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
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
Cc: Vitor Soares <ivitro@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

We may have a non-typical i3c rate configured; use this (instead of
the fixed I3C_BUS_TYP_I3C_SCL_RATE) when calculating timing
characteristics. We can also expand the SCL high time based on the
presence/absence of i2c devices.

Also, since we now have bus->mode, use it to determine whether we se up
the BUS_FREE_TIMING register; rather than re-reading
DEV_CTRL_I2C_SLAVE_PRESENT from hardware.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 44 ++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 51a8608203de..d73d57362b3b 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -515,7 +515,8 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 	dw_i3c_master_start_xfer_locked(master);
 }
 
-static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
+static int dw_i3c_clk_cfg(struct dw_i3c_master *master, unsigned long i3c_rate,
+			  bool pure)
 {
 	unsigned long core_rate, core_period;
 	u32 scl_timing;
@@ -527,31 +528,45 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 
 	core_period = DIV_ROUND_UP(1000000000, core_rate);
 
-	hcnt = DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period) - 1;
-	if (hcnt < SCL_I3C_TIMING_CNT_MIN)
-		hcnt = SCL_I3C_TIMING_CNT_MIN;
+	/* 50% duty cycle */
+	hcnt = DIV_ROUND_UP(core_rate, i3c_rate * 2);
 
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_TYP_I3C_SCL_RATE) - hcnt;
-	if (lcnt < SCL_I3C_TIMING_CNT_MIN)
-		lcnt = SCL_I3C_TIMING_CNT_MIN;
+	/* In shared mode, we limit t_high, so that i3c SCL signalling is
+	 * rejected by the i2c devices' spike filter */
+	if (!pure)
+		hcnt = min_t(u8, hcnt,
+			     DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period)) - 1;
+
+	hcnt = max_t(u8, hcnt, SCL_I3C_TIMING_CNT_MIN);
+
+	lcnt = DIV_ROUND_UP(core_rate, i3c_rate) - hcnt;
+	lcnt = max_t(u8, lcnt, SCL_I3C_TIMING_CNT_MIN);
 
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_PP_TIMING);
 
-	if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
+	if (pure)
 		writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
 
-	lcnt = DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period);
+	/* open drain mode requires a minimum of OD_MIN_NS */
+	lcnt = max_t(u8, lcnt, DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period));
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
 
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
+	/* Timings for lower SDRx rates where specified by device MXDS values;
+	 * we limit these to the global max rate provided, which also prevents
+	 * weird duty cycles */
+	lcnt = max_t(u8, lcnt,
+		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt);
 	scl_timing = SCL_EXT_LCNT_1(lcnt);
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR2_SCL_RATE) - hcnt;
+	lcnt = max_t(u8, lcnt,
+		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR2_SCL_RATE) - hcnt);
 	scl_timing |= SCL_EXT_LCNT_2(lcnt);
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR3_SCL_RATE) - hcnt;
+	lcnt = max_t(u8, lcnt,
+		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR3_SCL_RATE) - hcnt);
 	scl_timing |= SCL_EXT_LCNT_3(lcnt);
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt;
+	lcnt = max_t(u8, lcnt,
+		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt);
 	scl_timing |= SCL_EXT_LCNT_4(lcnt);
 	writel(scl_timing, master->regs + SCL_EXT_LCNT_TIMING);
 
@@ -605,7 +620,8 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 			return ret;
 		fallthrough;
 	case I3C_BUS_MODE_PURE:
-		ret = dw_i3c_clk_cfg(master);
+		ret = dw_i3c_clk_cfg(master, bus->scl_rate.i3c,
+				     bus->mode == I3C_BUS_MODE_PURE);
 		if (ret)
 			return ret;
 		break;
-- 
2.39.1

