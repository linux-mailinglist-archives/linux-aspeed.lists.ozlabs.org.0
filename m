Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 709EB39807E
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Jun 2021 06:54:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvxX45lq2z2yxS
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Jun 2021 14:54:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=matt@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvxPr25jlz2yWn
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Jun 2021 14:49:03 +1000 (AEST)
Received: by codeconstruct.com.au (Postfix, from userid 10001)
 id 23F15219E8; Wed,  2 Jun 2021 12:42:03 +0800 (AWST)
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i2c@vger.kernel.org,
	matt@codeconstruct.com.au
Subject: [RFC PATCH 3/3] i2c: aspeed: allow 255 byte block transfers
Date: Wed,  2 Jun 2021 12:41:13 +0800
Message-Id: <20210602044113.1581347-4-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602044113.1581347-1-matt@codeconstruct.com.au>
References: <20210602044113.1581347-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Jun 2021 14:54:26 +1000
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
Cc: jk@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 drivers/i2c/busses/i2c-aspeed.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 724bf30600d6..04cb5d08daf5 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -533,7 +533,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		msg->buf[bus->buf_index++] = recv_byte;
 
 		if (msg->flags & I2C_M_RECV_LEN) {
-			if (unlikely(recv_byte > I2C_SMBUS_BLOCK_MAX)) {
+			if (unlikely(recv_byte > I2C_SMBUS_V3_BLOCK_MAX)) {
 				bus->cmd_err = -EPROTO;
 				aspeed_i2c_do_stop(bus);
 				goto out_no_complete;
@@ -718,7 +718,8 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 
 static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
+		I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_V3_BLOCK;
 }
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-- 
2.30.2

