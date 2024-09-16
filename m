Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C63979DF8
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 11:11:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6fKP6cKQz308Z
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 19:11:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726477861;
	cv=none; b=GLgbFksLdnpoD3mmHLFse8O8wtDUtBu2YOe3+orzGiF5EeLHsMY1Hz3tn8rcfslV4JymEEeTAJUMnrayW9kIYA26dvCLSgrYg3QDvXz9diJ+9dnVMvRU0nILlLVVYZ0uRdKMmp6SR6UySidN1wYN+4XoZmGQU1Ecd3b7rNtyfVZlif/2v0k8rFPbxkKKQTIb8K0qms/zNEOw3pYXoY1nadgZawpMFaPKYufWwqWQix0JOR4hsk2pGr6wpgkV0b50Xb6DBWSi3Zk1s8X1l3AgganSX74EWd0KaYtT5Aw3eu9ClTMVWJC+SXvdBle6epZB6wzIYxabxOjcaYEeLNP1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726477861; c=relaxed/relaxed;
	bh=T94W+SaUv2vo+V5dtve6LjV8k87Vl8wKG6QJfkhC90s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=chQ/gjlwxuZxecTCFL0LXUz94tstSXwUsc0rqg2rM2LKdoIQ9MrZm3a2VNZKdFprlLjFA5gNLqCZOmSuaj6P7YUtuc2343WzB3eUuX0lHCdR+oVDgNSPVKn15PYom2TNCk3GVDrr6zu9jLKuvvcvang6CWkIKKUcXk4/ctNG8rfTH9CWkkbvkPihCS7DhobEgKaAL2ymnDH/IUD8wcOq0uBY8QmWScD53SsMfqbIjlTvrxImqaEZxky1ch+I813Y8ujbdd3uSL/e5x6ImulhwE2hQ75/atZd3oYjJiJVTbdPejNMJv5oN3637hCgcjnTE99VrNDI3fWFWMHanfeCcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6fKK21MRz2yTs
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Sep 2024 19:11:01 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 16 Sep
 2024 17:10:40 +0800
Received: from twmbx02.aspeed.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 16 Sep 2024 17:10:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v3 1/4] dt-bindings: mfd: aspeed: support for AST2700
Date: Mon, 16 Sep 2024 17:10:36 +0800
Message-ID: <20240916091039.3584505-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916091039.3584505-1-ryan_chen@aspeedtech.com>
References: <20240916091039.3584505-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add compatible support for AST2700 clk, reset, pinctrl, silicon-id for AST2700 scu.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index 86ee69c0f45b..127a357051cd 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -9,6 +9,8 @@ title: Aspeed System Control Unit
 description:
   The Aspeed System Control Unit manages the global behaviour of the SoC,
   configuring elements such as clocks, pinmux, and reset.
+  In AST2700 SOC which has two soc connection, each soc have its own scu
+  register control, ast2700-scu0 for soc0, ast2700-scu1 for soc1.
 
 maintainers:
   - Joel Stanley <joel@jms.id.au>
@@ -21,6 +23,8 @@ properties:
           - aspeed,ast2400-scu
           - aspeed,ast2500-scu
           - aspeed,ast2600-scu
+          - aspeed,ast2700-scu0
+          - aspeed,ast2700-scu1
       - const: syscon
       - const: simple-mfd
 
@@ -30,10 +34,12 @@ properties:
   ranges: true
 
   '#address-cells':
-    const: 1
+    minimum: 1
+    maximum: 2
 
   '#size-cells':
-    const: 1
+    minimum: 1
+    maximum: 2
 
   '#clock-cells':
     const: 1
@@ -56,6 +62,8 @@ patternProperties:
             - aspeed,ast2400-pinctrl
             - aspeed,ast2500-pinctrl
             - aspeed,ast2600-pinctrl
+            - aspeed,ast2700-soc0-pinctrl
+            - aspeed,ast2700-soc1-pinctrl
 
     required:
       - compatible
@@ -76,6 +84,7 @@ patternProperties:
               - aspeed,ast2400-silicon-id
               - aspeed,ast2500-silicon-id
               - aspeed,ast2600-silicon-id
+              - aspeed,ast2700-silicon-id
           - const: aspeed,silicon-id
 
       reg:
-- 
2.34.1

