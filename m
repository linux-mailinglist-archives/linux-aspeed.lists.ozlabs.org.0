Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A04BA600A41
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Oct 2022 11:17:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrWcJ3Vzzz3c2h
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Oct 2022 20:17:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrWb02cpMz3c3Z;
	Mon, 17 Oct 2022 20:16:44 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MrWZw6JtGz4xFy;
	Mon, 17 Oct 2022 20:16:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MrWZr4gbFz4xG9;
	Mon, 17 Oct 2022 20:16:36 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org
Subject: [PATCH linux v2 1/3] spi: dt-bindings: aspeed: Add a ranges property
Date: Mon, 17 Oct 2022 11:16:22 +0200
Message-Id: <20221017091624.130227-2-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017091624.130227-1-clg@kaod.org>
References: <20221017091624.130227-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Naresh Solanki <naresh.solanki@9elements.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

"ranges" predefines settings for the decoding ranges of each CS.

Cc: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 .../devicetree/bindings/spi/aspeed,ast2600-fmc.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
index fa8f4ac20985..a11cbc4c4c5c 100644
--- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
+++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
@@ -38,6 +38,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  ranges:
+    minItems: 1
+    maxItems: 5
+    description: |
+      Defines the address mapping for child devices with four integer
+      values for each chip-select line in use:
+      <cs-number> 0 <physical address of mapping> <size>
+
 required:
   - compatible
   - reg
@@ -58,6 +66,7 @@ examples:
         compatible = "aspeed,ast2600-fmc";
         clocks = <&syscon ASPEED_CLK_AHB>;
         interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+        ranges = <0 0 0x20000000 0x2000000>, <1 0 0x22000000 0x2000000>;
 
         flash@0 {
                 reg = < 0 >;
-- 
2.37.3

