Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734EC671869
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 11:02:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxhBb1v1cz3cg0
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 21:02:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=eunLPQUh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=2a01:4f8:c0c:9d57::1; helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=eunLPQUh;
	dkim-atps=neutral
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxhB85W2Gz3bk8
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Jan 2023 21:01:52 +1100 (AEDT)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 85C6E166A;
	Wed, 18 Jan 2023 11:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1674036104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bi1ar46rbvnQqsoEQKKLvDAlQMVa/GezJoHRqvFBwes=;
	b=eunLPQUhQUsgOOtPbRzh/TpQxbKy0JOosphj29cyRTBxnl6WE7bNZULm9T+Srkk9rU8D9H
	K3k3teRsI1UZVX5yYZorFutpISPpQtaZ5A4DPUsP98OOkkg7G91YWjAARV3h2/74N9PqaE
	z3fGgZdORDa9knPUzYEnC9Z8YWtv+9pHYVB/qoQLfD9KgeLJ74bqFDsxVooJTSjPo+lI46
	Supkfn+7YEmUW/9PZDkuDikNcJVWMo7NEAADbm5kIZpdA/E/0soeHhzmqncD0pTQlri6R6
	160v7ljE5BjiWNEAvL6r8xe3GoH3Ypl069kmSIzMT9zldCNYJzZJxTPhfpLwSw==
From: Michael Walle <michael@walle.cc>
Date: Wed, 18 Jan 2023 11:01:35 +0100
Subject: [PATCH net-next v2 1/6] net: mdio: Move mdiobus_scan() within file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230116-net-next-remove-probe-capabilities-v2-1-15513b05e1f4@walle.cc>
References:  <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
In-Reply-To:  <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
X-Mailer: b4 0.11.1
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Brandeburg <jesse.brandeburg@intel.com>, Michael Walle <michael@walle.cc>, linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Andrew Lunn <andrew@lunn.ch>

No functional change, just place it earlier in preparation for some
refactoring.

While at it, correct the comment format and one typo.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
---
 drivers/net/phy/mdio_bus.c | 101 ++++++++++++++++++++++-----------------------
 1 file changed, 50 insertions(+), 51 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 902e1c88ef58..61c33c6098a1 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -506,6 +506,56 @@ static int mdiobus_create_device(struct mii_bus *bus,
 	return ret;
 }
 
+/**
+ * mdiobus_scan - scan a bus for MDIO devices.
+ * @bus: mii_bus to scan
+ * @addr: address on bus to scan
+ *
+ * This function scans the MDIO bus, looking for devices which can be
+ * identified using a vendor/product ID in registers 2 and 3. Not all
+ * MDIO devices have such registers, but PHY devices typically
+ * do. Hence this function assumes anything found is a PHY, or can be
+ * treated as a PHY. Other MDIO devices, such as switches, will
+ * probably not be found during the scan.
+ */
+struct phy_device *mdiobus_scan(struct mii_bus *bus, int addr)
+{
+	struct phy_device *phydev = ERR_PTR(-ENODEV);
+	int err;
+
+	switch (bus->probe_capabilities) {
+	case MDIOBUS_NO_CAP:
+	case MDIOBUS_C22:
+		phydev = get_phy_device(bus, addr, false);
+		break;
+	case MDIOBUS_C45:
+		phydev = get_phy_device(bus, addr, true);
+		break;
+	case MDIOBUS_C22_C45:
+		phydev = get_phy_device(bus, addr, false);
+		if (IS_ERR(phydev))
+			phydev = get_phy_device(bus, addr, true);
+		break;
+	}
+
+	if (IS_ERR(phydev))
+		return phydev;
+
+	/* For DT, see if the auto-probed phy has a corresponding child
+	 * in the bus node, and set the of_node pointer in this case.
+	 */
+	of_mdiobus_link_mdiodev(bus, &phydev->mdio);
+
+	err = phy_device_register(phydev);
+	if (err) {
+		phy_device_free(phydev);
+		return ERR_PTR(-ENODEV);
+	}
+
+	return phydev;
+}
+EXPORT_SYMBOL(mdiobus_scan);
+
 /**
  * __mdiobus_register - bring up all the PHYs on a given bus and attach them to bus
  * @bus: target mii_bus
@@ -679,57 +729,6 @@ void mdiobus_free(struct mii_bus *bus)
 }
 EXPORT_SYMBOL(mdiobus_free);
 
-/**
- * mdiobus_scan - scan a bus for MDIO devices.
- * @bus: mii_bus to scan
- * @addr: address on bus to scan
- *
- * This function scans the MDIO bus, looking for devices which can be
- * identified using a vendor/product ID in registers 2 and 3. Not all
- * MDIO devices have such registers, but PHY devices typically
- * do. Hence this function assumes anything found is a PHY, or can be
- * treated as a PHY. Other MDIO devices, such as switches, will
- * probably not be found during the scan.
- */
-struct phy_device *mdiobus_scan(struct mii_bus *bus, int addr)
-{
-	struct phy_device *phydev = ERR_PTR(-ENODEV);
-	int err;
-
-	switch (bus->probe_capabilities) {
-	case MDIOBUS_NO_CAP:
-	case MDIOBUS_C22:
-		phydev = get_phy_device(bus, addr, false);
-		break;
-	case MDIOBUS_C45:
-		phydev = get_phy_device(bus, addr, true);
-		break;
-	case MDIOBUS_C22_C45:
-		phydev = get_phy_device(bus, addr, false);
-		if (IS_ERR(phydev))
-			phydev = get_phy_device(bus, addr, true);
-		break;
-	}
-
-	if (IS_ERR(phydev))
-		return phydev;
-
-	/*
-	 * For DT, see if the auto-probed phy has a correspoding child
-	 * in the bus node, and set the of_node pointer in this case.
-	 */
-	of_mdiobus_link_mdiodev(bus, &phydev->mdio);
-
-	err = phy_device_register(phydev);
-	if (err) {
-		phy_device_free(phydev);
-		return ERR_PTR(-ENODEV);
-	}
-
-	return phydev;
-}
-EXPORT_SYMBOL(mdiobus_scan);
-
 static void mdiobus_stats_acct(struct mdio_bus_stats *stats, bool op, int ret)
 {
 	preempt_disable();

-- 
2.30.2
