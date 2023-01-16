Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B34C67104F
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 02:42:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxT6R1s33z3c9r
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 12:42:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=rth6PUzu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=159.69.201.130; helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=rth6PUzu;
	dkim-atps=neutral
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwX7d70nRz3c7K
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Jan 2023 23:55:41 +1100 (AEDT)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 047F016AE;
	Mon, 16 Jan 2023 13:55:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673873737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mOdDk7qwM6KUEnwMOgYHBFHa54fOPcgwCfCBJX4vAW4=;
	b=rth6PUzujx7tCIfgztgrsh2zQJqux1ncT1wDPw36a1KamHLyr8BHG6ACVmZUhn6afvUi35
	L5b9RYITB+ctJL9lojjnvvEAJgiA9QtzZdxwy2R3ZlnEPh0kZPtUIVhSzF3wHVB/JP7UL4
	xbGumpX0EArRziQAVyjxeuRgEU24zZpy0xc0l4AAjc0cu5VeMXljYv7qhwkcDbbSYEOdq9
	FrD6pXadv+kz6oEaJCLtVB1z2UuwVvf8UJ/U1jJWUF/5J2VmXCK/RAp7xnQ+EIzwM0uvyq
	8yvj17bZn37bpi5CX7/xT5mbl5Tq8dNvaTcpcObt36w/m+fkrAc/1m1Geu1s1w==
From: Michael Walle <michael@walle.cc>
Date: Mon, 16 Jan 2023 13:55:15 +0100
Subject: [PATCH net-next 3/6] net: mdio: Add workaround for Micrel PHYs which
 are not C45 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230116-net-next-remove-probe-capabilities-v1-3-5aa29738a023@walle.cc>
References:  <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
In-Reply-To:  <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
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
X-Mailman-Approved-At: Wed, 18 Jan 2023 12:41:55 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>, linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Andrew Lunn <andrew@lunn.ch>

After scanning the bus for C22 devices, check if any Micrel PHYs have
been found.  They are known to do bad things if there are C45
transactions on the bus. Prevent the scanning of the bus using C45 if
such a PHY has been detected.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/phy/mdio_bus.c | 36 +++++++++++++++++++++++++++++++++---
 include/linux/micrel_phy.h |  2 ++
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 25a964b98bc6..f173c91842e0 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -19,6 +19,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/micrel_phy.h>
 #include <linux/mii.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -600,6 +601,31 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
 	return 0;
 }
 
+/* There are some C22 PHYs which do bad things when where is a C45
+ * transaction on the bus, like accepting a read themselves, and
+ * stomping over the true devices reply, to performing a write to
+ * themselves which was intended for another device. Now that C22
+ * devices have been found, see if any of them are bad for C45, and if we
+ * should skip the C45 scan.
+ */
+static bool mdiobus_prevent_c45_scan(struct mii_bus *bus)
+{
+	struct phy_device *phydev;
+	u32 oui;
+	int i;
+
+	for (i = 0; i < PHY_MAX_ADDR; i++) {
+		phydev = mdiobus_get_phy(bus, i);
+		if (!phydev)
+			continue;
+		oui = phydev->phy_id >> 10;
+
+		if (oui == MICREL_OUI)
+			return true;
+	}
+	return false;
+}
+
 /**
  * __mdiobus_register - bring up all the PHYs on a given bus and attach them to bus
  * @bus: target mii_bus
@@ -617,8 +643,9 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
 int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 {
 	struct mdio_device *mdiodev;
-	int i, err;
 	struct gpio_desc *gpiod;
+	bool prevent_c45_scan;
+	int i, err;
 
 	if (!bus || !bus->name)
 		return -EINVAL;
@@ -691,8 +718,11 @@ int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 			goto error;
 	}
 
-	if (bus->probe_capabilities == MDIOBUS_C45 ||
-	    bus->probe_capabilities == MDIOBUS_C22_C45) {
+	prevent_c45_scan = mdiobus_prevent_c45_scan(bus);
+
+	if (!prevent_c45_scan &&
+	    (bus->probe_capabilities == MDIOBUS_C45 ||
+	     bus->probe_capabilities == MDIOBUS_C22_C45)) {
 		err = mdiobus_scan_bus_c45(bus);
 		if (err)
 			goto error;
diff --git a/include/linux/micrel_phy.h b/include/linux/micrel_phy.h
index 1f7c33b2f5a3..771e050883db 100644
--- a/include/linux/micrel_phy.h
+++ b/include/linux/micrel_phy.h
@@ -8,6 +8,8 @@
 #ifndef _MICREL_PHY_H
 #define _MICREL_PHY_H
 
+#define MICREL_OUI		0x0885
+
 #define MICREL_PHY_ID_MASK	0x00fffff0
 
 #define PHY_ID_KSZ8873MLL	0x000e7237

-- 
2.30.2
