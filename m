Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76832886D38
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Mar 2024 14:35:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=VQWMi+Nx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1NcX1TZ5z3vsM
	for <lists+linux-aspeed@lfdr.de>; Sat, 23 Mar 2024 00:35:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=VQWMi+Nx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1NcQ15Kpz3cPR
	for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Mar 2024 00:35:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1fuavoM1tsxpg+sffePeG5Oq2+/3E0Rj2cjqhiCzSao=; b=VQWMi+
	Nxn8XW8Est4ionNwmGyCHOI4xrIV2OqLZlWhldTv8QMzXNBKLriYUHzfXMwQwpRm
	QI8+xYK8L9+XmjcruKkkvEyTmUtwYhK69yJC/5GBC5q4V/+u99GKN/DTAlQC+Ec+
	8WFS8NVRbDjfJS0DY7Lcx02PsJu5BB/XPEvhOwDuCp5+KUlQ7+++YVIwmMODpmGu
	Zx2/rsbpR9eON1AoLMXV1vbx8fKX5ikpFFL2dVh9qx00iayrWw4BHsZEgLwWkYVA
	RRBrRP3k4wj0T1ti4fNMjOd/C5zA/HI9nFz8O6ddH6Iw6FNKg/ySu37jJmWQM+Vc
	yhPeZScCs+KP0Tfw==
Received: (qmail 3870173 invoked from network); 22 Mar 2024 14:26:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:25 +0100
X-UD-Smtp-Session: l3s3148p1@fm86xT8UYpNehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 05/64] i2c: aspeed: reword according to newest specification
Date: Fri, 22 Mar 2024 14:24:58 +0100
Message-ID: <20240322132619.6389-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-aspeed@lists.ozlabs.org, Brendan Higgins <brendan.higgins@linux.dev>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index ce8c4846b7fa..4e6ea4a5cab9 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -159,7 +159,7 @@ struct aspeed_i2c_bus {
 	bool				send_stop;
 	int				cmd_err;
 	/* Protected only by i2c_lock_bus */
-	int				master_xfer_result;
+	int				xfer_result;
 	/* Multi-master */
 	bool				multi_master;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
@@ -608,9 +608,9 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 out_complete:
 	bus->msgs = NULL;
 	if (bus->cmd_err)
-		bus->master_xfer_result = bus->cmd_err;
+		bus->xfer_result = bus->cmd_err;
 	else
-		bus->master_xfer_result = bus->msgs_index + 1;
+		bus->xfer_result = bus->msgs_index + 1;
 	complete(&bus->cmd_complete);
 out_no_complete:
 	return irq_handled;
@@ -679,7 +679,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
 }
 
-static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
+static int aspeed_i2c_xfer(struct i2c_adapter *adap,
 				  struct i2c_msg *msgs, int num)
 {
 	struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);
@@ -738,7 +738,7 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 		return -ETIMEDOUT;
 	}
 
-	return bus->master_xfer_result;
+	return bus->xfer_result;
 }
 
 static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
@@ -748,7 +748,7 @@ static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 /* precondition: bus.lock has been acquired. */
-static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
+static void __aspeed_i2c_reg_target(struct aspeed_i2c_bus *bus, u16 slave_addr)
 {
 	u32 addr_reg_val, func_ctrl_reg_val;
 
@@ -770,7 +770,7 @@ static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
 	bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
 }
 
-static int aspeed_i2c_reg_slave(struct i2c_client *client)
+static int aspeed_i2c_reg_target(struct i2c_client *client)
 {
 	struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
 	unsigned long flags;
@@ -781,7 +781,7 @@ static int aspeed_i2c_reg_slave(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	__aspeed_i2c_reg_slave(bus, client->addr);
+	__aspeed_i2c_reg_target(bus, client->addr);
 
 	bus->slave = client;
 	spin_unlock_irqrestore(&bus->lock, flags);
@@ -789,7 +789,7 @@ static int aspeed_i2c_reg_slave(struct i2c_client *client)
 	return 0;
 }
 
-static int aspeed_i2c_unreg_slave(struct i2c_client *client)
+static int aspeed_i2c_unreg_target(struct i2c_client *client)
 {
 	struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
 	u32 func_ctrl_reg_val;
@@ -814,11 +814,11 @@ static int aspeed_i2c_unreg_slave(struct i2c_client *client)
 #endif /* CONFIG_I2C_SLAVE */
 
 static const struct i2c_algorithm aspeed_i2c_algo = {
-	.master_xfer	= aspeed_i2c_master_xfer,
+	.xfer	= aspeed_i2c_xfer,
 	.functionality	= aspeed_i2c_functionality,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	.reg_slave	= aspeed_i2c_reg_slave,
-	.unreg_slave	= aspeed_i2c_unreg_slave,
+	.reg_target	= aspeed_i2c_reg_target,
+	.unreg_target	= aspeed_i2c_unreg_target,
 #endif /* CONFIG_I2C_SLAVE */
 };
 
@@ -950,7 +950,7 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	/* If slave has already been registered, re-enable it. */
 	if (bus->slave)
-		__aspeed_i2c_reg_slave(bus, bus->slave->addr);
+		__aspeed_i2c_reg_target(bus, bus->slave->addr);
 #endif /* CONFIG_I2C_SLAVE */
 
 	/* Set interrupt generation of I2C controller */
-- 
2.43.0

