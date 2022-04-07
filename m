Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 780AB4F785D
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Apr 2022 09:57:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYtyL3FNsz2yph
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Apr 2022 17:57:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYtyC55l2z2xsW
 for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Apr 2022 17:57:06 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2377id24045433;
 Thu, 7 Apr 2022 15:44:39 +0800 (GMT-8)
 (envelope-from dylan_hung@aspeedtech.com)
Received: from DylanHung-PC.aspeed.com (192.168.2.216) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 7 Apr
 2022 15:56:00 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
 <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: [PATCH RESEND v3 1/3] dt-bindings: net: add reset property for aspeed,
 ast2600-mdio binding
Date: Thu, 7 Apr 2022 15:57:32 +0800
Message-ID: <20220407075734.19644-2-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407075734.19644-1-dylan_hung@aspeedtech.com>
References: <20220407075734.19644-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.216]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2377id24045433
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
Cc: BMC-SW@aspeedtech.com, Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 MDIO bus controller has a reset control bit and must be
deasserted before manipulating the MDIO controller. By default, the
hardware asserts the reset so the driver only need to deassert it.

Regarding to the old DT blobs which don't have reset property in them,
the reset deassertion is usually done by the bootloader so the reset
property is optional to work with them.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
index 1c88820cbcdf..7f43b4fe86a3 100644
--- a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
@@ -20,10 +20,14 @@ allOf:
 properties:
   compatible:
     const: aspeed,ast2600-mdio
+
   reg:
     maxItems: 1
     description: The register range of the MDIO controller instance
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -39,6 +43,7 @@ examples:
             reg = <0x1e650000 0x8>;
             #address-cells = <1>;
             #size-cells = <0>;
+            resets = <&syscon 35>;
 
             ethphy0: ethernet-phy@0 {
                     compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.25.1

