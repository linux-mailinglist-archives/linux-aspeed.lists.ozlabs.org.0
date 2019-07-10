Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A776482F
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 16:22:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLxC70PHzDqHr
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 00:22:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Cn8s7vnO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QUdWDuc5"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLpW5y0lzDqbG
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 00:16:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4CD322048;
 Wed, 10 Jul 2019 10:16:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Jul 2019 10:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=CBeW1SM8dSoW3
 ktDhW+oE7jtf7GnEkh6/PWRVmDK+6s=; b=Cn8s7vnOdu0YjIPm4d72tCp4zAfE8
 y/LfnMURL2MsJ62Yq+BTslBUTR4ThJVoUQwmPvg+78mLXjalS07fb1t3cgZ0AsHa
 e5somIEVhTW6IQeGllVoP0kd97tqf95fYFxIrqi8eTocWaEaXh02rj8yZl4m1xgP
 JdnAQaL8mzSayJBXpVJsg3SxezFwNp1v+pkrdSSfLnpKGquwKhQ4O7Va1NTmWIZi
 Ra8moqJXmEibwCCzIqb0wsKIXVm7YNFUf1jW+j0Int0ipOlpSdGTfumgr0sDwZ0W
 s8xtuuP2d2358fAspLn0Kl2vtW921wkNm1Knf3KT+WifBzNllRdrMdOgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=CBeW1SM8dSoW3ktDhW+oE7jtf7GnEkh6/PWRVmDK+6s=; b=QUdWDuc5
 mMAuXaMY57205v8/YMjmu6iONoU1S2MpZByNmSdhS7We6A/d6OiminZghRlxnfKC
 ftjCsqP2IM3jU1JyoIhUctKaSryyq07DGlLIV8jzMEf0q2XwPmLqIN2sSHgKFt0P
 sfllNACeDPQ/spVL1Y/lhIHIOpirHVEIAitr9FIqHyViSS9bRm9ClsWOjItbzZkK
 kcGK3nwqC5h5ookgJJj54wsvOwKDpD0F2Z0Ucd9gkwU+MzttDm8RNBCFPXbYyvYx
 RlpDE5EKlN+xQjPfqvsiCjXCZ7uEPTF9G/aSN7778OfTDSxOE0x0PdCdqxWIYZUt
 0kFgNDZZd+s7nw==
X-ME-Sender: <xms:QfMlXRJhr-Wl4uLIuEFfVEX6kVJ8U9w8tACCmNjzd8KhQ9mY5zoMRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeigdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppe
 dugedrvddrkeehrddvvdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:QfMlXZOJv6C-XE2gSSMs96i8JAEbchrrg0orYJaZq3XeqS3KU8m1Zw>
 <xmx:QfMlXfpfSmuCRSqqPZPxOLhvahJGnj1PluC_8F912NR4x7I1AtfytA>
 <xmx:QfMlXTWHr70jtcPBeQTeQMEudyJDoYqFHHwFTEFsqP_QkGeEib4E-g>
 <xmx:QfMlXXxqSmQJp8hnBCGxohFIOb4DYElQPV_yfxoURzP70OVQhWpmjQ>
Received: from localhost.localdomain
 (ppp14-2-85-22.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id 72530380075;
 Wed, 10 Jul 2019 10:16:27 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: mmc: Document Aspeed SD controller
Date: Wed, 10 Jul 2019 23:46:10 +0930
Message-Id: <20190710141611.21159-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710141611.21159-1-andrew@aj.id.au>
References: <20190710141611.21159-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-aspeed@lists.ozlabs.org, ryanchen.aspeed@gmail.com,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The ASPEED SD/SDIO/eMMC controller exposes two slots implementing the
SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
data bus if only a single slot is enabled.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../bindings/mmc/sdhci-of-aspeed.yaml         | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml b/Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml
new file mode 100644
index 000000000000..e98a2ac4d46d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/sdhci-of-aspeed.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED SD/SDIO/eMMC Controller
+
+maintainers:
+  - Andrew Jeffery <andrew@aj.id.au>
+  - Ryan Chen <ryanchen.aspeed@gmail.com>
+
+description: |+
+  The ASPEED SD/SDIO/eMMC controller exposes two slots implementing the SDIO
+  Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit data bus if
+  only a single slot is enabled.
+
+  The two slots are supported by a common configuration area. As the SDHCIs for
+  the slots are dependent on the common configuration area, they are described
+  as child nodes.
+
+properties:
+  compatible:
+    enum: [ aspeed,ast2400-sdc, aspeed,ast2500-sdc ]
+  reg:
+    description: Common configuration registers
+  ranges: true
+  clocks:
+    maxItems: 1
+    description: The SD/SDIO controller clock gate
+  sdhci:
+    type: object
+    properties:
+      compatible:
+        allOf:
+          - enum: [ aspeed,ast2400-sdhci, aspeed,ast2500-sdhci ]
+          - const: sdhci
+      reg:
+        description: The SDHCI registers
+      clocks:
+        maxItems: 1
+        description: The SD bus clock
+      slot:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1]
+      interrupts:
+        maxItems: 1
+        description: The SD interrupt shared between both slots
+    required:
+      - compatible
+      - reg
+      - clocks
+      - slot
+      - interrupts
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    sdc@1e740000 {
+            compatible = "aspeed,ast2500-sdc";
+            reg = <0x1e740000 0x100>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+            clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
+
+            sdhci0: sdhci@1e740100 {
+                    compatible = "aspeed,ast2500-sdhci", "sdhci";
+                    reg = <0x1e740100 0x100>;
+                    slot = <0>;
+                    interrupts = <26>;
+                    sdhci,auto-cmd12;
+                    clocks = <&syscon ASPEED_CLK_SDIO>;
+            };
+
+            sdhci1: sdhci@1e740200 {
+                    compatible = "aspeed,ast2500-sdhci", "sdhci";
+                    reg = <0x1e740200 0x100>;
+                    slot = <1>;
+                    interrupts = <26>;
+                    sdhci,auto-cmd12;
+                    clocks = <&syscon ASPEED_CLK_SDIO>;
+            };
+    };
-- 
2.20.1

