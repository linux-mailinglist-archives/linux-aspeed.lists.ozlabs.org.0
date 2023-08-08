Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F2773B31
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 17:45:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKyF12zfQz30hY
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 01:45:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx02.aspeed.com; envelope-from=dylan_hung@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX02.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKyDj08T6z2ytn
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 01:44:53 +1000 (AEST)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Aug
 2023 23:42:45 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Aug 2023 23:42:45 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <alexandre.belloni@bootlin.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<p.zabel@pengutronix.de>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] dt-bindings: i3c: ast2600: Add resets and reset-names
Date: Tue, 8 Aug 2023 23:42:40 +0800
Message-ID: <20230808154241.749641-3-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of dylan_hung@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
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
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add two reset lines to the AST2600 I3C controller:
- core_rst: the reset line of the controller itself
- global_rst: the reset line of the I3C global register block. Since all
six I3C controllers in AST2600 share this global register block, the
driver needs to handle this carefully. Generally, this reset line should
only need to be de-asserted.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 .../devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
index fcc3dbff9c9a..3166d6f3a39c 100644
--- a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
@@ -23,7 +23,12 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: core_rst
+      - const: global_rst
 
   interrupts:
     maxItems: 1
@@ -48,6 +53,8 @@ required:
   - compatible
   - reg
   - clocks
+  - resets
+  - reset-names
   - interrupts
   - aspeed,global-regs
 
@@ -63,7 +70,8 @@ examples:
         #address-cells = <3>;
         #size-cells = <0>;
         clocks = <&syscon 0>;
-        resets = <&syscon 0>;
+        resets = <&syscon 40>, <&syscon 39>;
+        reset-names = "core_rst", "global_rst";
         aspeed,global-regs = <&i3c_global 0>;
         pinctrl-names = "default";
         pinctrl-0 = <&pinctrl_i3c1_default>;
-- 
2.25.1

