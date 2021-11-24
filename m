Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB52E45B437
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 07:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzVyn48XKz2yms
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 17:12:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=dylan_hung@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzVyf4mSSz2xvy
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Nov 2021 17:11:53 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1AO5klpJ059581;
 Wed, 24 Nov 2021 13:46:47 +0800 (GMT-8)
 (envelope-from dylan_hung@aspeedtech.com)
Received: from DylanHung-PC.aspeed.com (192.168.2.216) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 24 Nov
 2021 14:10:54 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <linux-kernel@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <kuba@kernel.org>,
 <davem@davemloft.net>, <linux@armlinux.org.uk>, <hkallweit1@gmail.com>,
 <andrew@lunn.ch>
Subject: [PATCH] net:phy: Fix "Link is Down" issue
Date: Wed, 24 Nov 2021 14:10:57 +0800
Message-ID: <20211124061057.12555-1-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.216]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AO5klpJ059581
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

The issue happened randomly in runtime.  The message "Link is Down" is
popped but soon it recovered to "Link is Up".

The "Link is Down" results from the incorrect read data for reading the
PHY register via MDIO bus.  The correct sequence for reading the data
shall be:
1. fire the command
2. wait for command done (this step was missing)
3. wait for data idle
4. read data from data register

Fixes: a9770eac511a ("net: mdio: Move MDIO drivers into a new subdirectory")
Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 drivers/net/mdio/mdio-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
index cad820568f75..966c3b4ad59d 100644
--- a/drivers/net/mdio/mdio-aspeed.c
+++ b/drivers/net/mdio/mdio-aspeed.c
@@ -61,6 +61,13 @@ static int aspeed_mdio_read(struct mii_bus *bus, int addr, int regnum)
 
 	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
 
+	rc = readl_poll_timeout(ctx->base + ASPEED_MDIO_CTRL, ctrl,
+				!(ctrl & ASPEED_MDIO_CTRL_FIRE),
+				ASPEED_MDIO_INTERVAL_US,
+				ASPEED_MDIO_TIMEOUT_US);
+	if (rc < 0)
+		return rc;
+
 	rc = readl_poll_timeout(ctx->base + ASPEED_MDIO_DATA, data,
 				data & ASPEED_MDIO_DATA_IDLE,
 				ASPEED_MDIO_INTERVAL_US,
-- 
2.25.1

