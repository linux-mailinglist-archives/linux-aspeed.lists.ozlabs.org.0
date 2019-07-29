Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3729A7843A
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 06:40:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xn6Y3gl3zDqHm
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 14:40:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NySZzJ1I"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GMRpQ/in"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xn5x2qnyzDqGv
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 14:39:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E3BA31CAE;
 Mon, 29 Jul 2019 00:39:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 29 Jul 2019 00:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=G6hgEco4soyYy
 jXTRVgtKMFuWO/Dyh09lmRyo+FCylI=; b=NySZzJ1IIzpYTm2JJ93bX5Y/jGlyH
 GzR7WFf0SH5xEEdWQWgkUll+lQWJgivGR2KRTzuwlg7IBql3bFRbV9lbxM1RSGf0
 18aF9UAwcASKHHa5CIgjmPbmk05Zl1uZlVf1zGzvGo7BnSBYwRaSoaOPK5Qqc6xL
 028HADhPPFWHhn+spYs6boGL5Tw9mPgRuqNWFFkSc7X4IELTPIT85fmQthJGw8iz
 xpqoeJJulorNUsP2lRRDaXChQyRMqVnVGtaifGejXgbvVFJQqdf4OjVry4ENGg6r
 WsQW5amz9bUvIXir+uUX/ovQ4HOWJ5fwQ5BnVBkplAozOzShXFbMfRHUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=G6hgEco4soyYyjXTRVgtKMFuWO/Dyh09lmRyo+FCylI=; b=GMRpQ/in
 RgOA/DW0V7rJoVVnfIFbgsRMnskWSYLDSwf1Zb8/B/gfLGfnbxqa4flTKm8QnR7A
 M1T3iCLPQ/VS43Us2OpCKHoEvj30op26kWYoQ53s3+kd5//ehLc1XtOInXn9quJP
 QsINYH6pkF2CCmLAKM7m44GStn8vbHfWLffL32K4H77nMa+Tly6Vz0pjrqWP0f65
 JDttAawZ2I1M5ELpDQvc/lwck7lr8eeT0Klap2nqj8ByztfMSP4XSKx1XJVQdoHy
 MyhluNnYaQXnuXLlLgDMLV8FSjXle/xxwHXmtfWoMPtVLuKuQyXEmmtgL5KpfQhm
 73u6e0NTo75OPA==
X-ME-Sender: <xms:f3g-XbGAJ66EgNly2M4negyUNqSgPde7mTy_02gh9X1DYDpyZMa12g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledtgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppe
 dvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgif
 segrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:f3g-Xdsur2Dms6tlAFVWCcIdqyImbvqllCXsgqT6xFqGV_IbjGzpCw>
 <xmx:f3g-XZm3t30zCqtHSGO5m6jMY9vfBf_AV0vfXJ9wY4OTyYlni7AmVw>
 <xmx:f3g-XeMzeanFH3PvXTrUqerr2n1uuhhpPAoGuKvAsCFo5qTo4wE7ww>
 <xmx:gHg-XVjSEb67ucZAdm4zi7fb7gQ0uPHoGdh4mkooh-cmOEP7JSXFEw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id E282E8005A;
 Mon, 29 Jul 2019 00:39:23 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: netdev@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: net: Add aspeed,ast2600-mdio binding
Date: Mon, 29 Jul 2019 14:09:23 +0930
Message-Id: <20190729043926.32679-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729043926.32679-1-andrew@aj.id.au>
References: <20190729043926.32679-1-andrew@aj.id.au>
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
 .../bindings/net/aspeed,ast2600-mdio.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
new file mode 100644
index 000000000000..fa86f6438473
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
@@ -0,0 +1,61 @@
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
+properties:
+  compatible:
+    const: aspeed,ast2600-mdio
+  reg:
+    maxItems: 1
+    description: The register range of the MDIO controller instance
+  "#address-cells":
+    const: 1
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^ethernet-phy@[a-f0-9]$":
+    properties:
+      reg:
+        description:
+          The MDIO bus index of the PHY
+      compatible:
+        enum:
+          - ethernet-phy-ieee802.3-c22
+          - ethernet-phy-ieee802.3-c45
+    required:
+      - reg
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
+            status = "okay";
+
+            ethphy0: ethernet-phy@0 {
+                    compatible = "ethernet-phy-ieee802.3-c22";
+                    reg = <0>;
+            };
+    };
-- 
2.20.1

