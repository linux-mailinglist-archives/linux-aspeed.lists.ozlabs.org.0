Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A2C7B934
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2019 07:43:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z2R645WgzDqSR
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2019 15:43:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TIiZbS4z"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SzvYdEQr"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45z2Ln54YKzDqRn
 for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jul 2019 15:40:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B66BC2D52;
 Wed, 31 Jul 2019 01:39:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 31 Jul 2019 01:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=gzCwHI80UKMbA
 e03aKRbEI+0U6moZg+RRW+kG2jIiTc=; b=TIiZbS4zZNCx0TJkxaouR2jrPaQg0
 aSaWMyz8IOhi8gEMOjKM7jtNvn/SCqFNxCVIl21hNPtl/vcN9aNADcdUpdi96b6K
 cClhaUiOoqI4aIO+5VKV7nsudyfHBeE0rq0kymesRbbvjvUUoxffdfJzZ+8vmsrE
 zQbbKRcPNLaf8odDqdRs3u4VcOf/yVZlDq+wSc/wi+MoJnKKumBAyJZEmki/CO/f
 i3Ne40g7mblcmiKRdOkt7p1zRBNjIXDqT2ONhVRKxL6WzRwoHdafA1uXbC9tolvI
 IKSZS3f/K0sD4PALzGA4sg1wuUqxHU3UpefvuJUG7P3TFS/GTiW9lcEIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gzCwHI80UKMbAe03aKRbEI+0U6moZg+RRW+kG2jIiTc=; b=SzvYdEQr
 DdO9hzcugcpWDGtKehyAZKfsfc6wmKnVhyiG07U+EO22Oz9upZJwTivWhnpE6pO3
 fGvmHMFMU7Ybbc3vtjTxbD2Ayl3ZHeSFhbtzHOBdZJsi9x616z045P9oMHsUU4Vh
 80ryEKMvgxo9h/e6amrd0IgWgZ74GyoB+XAfDFkMWcXFZnNWTF9HzSySxX/OB+F3
 0fHXuQTJislvqOQHXeDbvir2ve1GwZAghw1j2vfwhQ2IVpkfyEulNyccdO3UT4qU
 2U8X+44MrXOg6KTaDqBJsFAqhePUcLMSc6S5k0qGlWGEHt6+byI/HniUuVFysmUM
 SBsjlAV0DQqs3Q==
X-ME-Sender: <xms:rClBXZuvRNfpG6M1luPTw8vLz11Zm9kcj8o1E27WzLawTupVpn3mlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleeggdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppe
 dvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgif
 segrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:rClBXQZQwtIvoaDmdF8gUzY4Ti5BcQ21j-z1dG6zLIFDtF_Z0pVjZA>
 <xmx:rClBXUX07zP0L5TMNASHIyENDCpZtliRMy5miC0Pf81boQNj8sBjvA>
 <xmx:rClBXc7q1FUua0ZvSS1gKnkC18NVPOAyKfa0n467ics4IzFa9l5TcQ>
 <xmx:rClBXe0BSoOSNc-SAi16YnYhmIXh6jpd2xaLsewMUtheIArCuXtasQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 915FE80060;
 Wed, 31 Jul 2019 01:39:52 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v2 1/4] dt-bindings: net: Add aspeed,
 ast2600-mdio binding
Date: Wed, 31 Jul 2019 15:09:56 +0930
Message-Id: <20190731053959.16293-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731053959.16293-1-andrew@aj.id.au>
References: <20190731053959.16293-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 splits out the MDIO bus controller from the MAC into its own
IP block and rearranges the register layout. Add a new binding to
describe the new hardware.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

---
v2:
* aspeed: Utilise mdio.yaml
* aspeed: Drop status from example
---
 .../bindings/net/aspeed,ast2600-mdio.yaml     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
new file mode 100644
index 000000000000..71808e78a495
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/aspeed,ast2600-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2600 MDIO Controller
+
+maintainers:
+  - Andrew Jeffery <andrew@aj.id.au>
+
+description: |+
+  The ASPEED AST2600 MDIO controller is the third iteration of ASPEED's MDIO
+  bus register interface, this time also separating out the controller from the
+  MAC.
+
+allOf:
+  - $ref: "mdio.yaml#"
+
+properties:
+  compatible:
+    const: aspeed,ast2600-mdio
+  reg:
+    maxItems: 1
+    description: The register range of the MDIO controller instance
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    mdio0: mdio@1e650000 {
+            compatible = "aspeed,ast2600-mdio";
+            reg = <0x1e650000 0x8>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ethphy0: ethernet-phy@0 {
+                    compatible = "ethernet-phy-ieee802.3-c22";
+                    reg = <0>;
+            };
+    };
-- 
2.20.1

