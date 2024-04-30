Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 186BB8B7E61
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2024 19:25:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZW2zi9aw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTRtH4KNdz3cTg
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 03:25:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZW2zi9aw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTRt73ZQ8z3cQs
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 03:25:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C91286113A;
	Tue, 30 Apr 2024 17:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304B4C2BBFC;
	Tue, 30 Apr 2024 17:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714497932;
	bh=IX6Uu6LbP/xYgPUGwU4+kdor5cBr2FpREH4Pqv5Bpt8=;
	h=From:To:Cc:Subject:Date:From;
	b=ZW2zi9aw/QFN/U+x4XF2jMEe6uLT0E4Fk03Ot4pNgUejZgr2BsmK5bbp+jD7dGeJ0
	 qwb4yKTp2sXK5FHSe5iMzhKyDQSAW9kP9Zu+rqUNW3FQPh080dT8abyYoYzWHhHa2E
	 loBnWXU6yUmGXrpTWvYuY94JrGBoa6SIAwkFuxf86HQ1F8s+58rsmaLopt4j0VPGcH
	 2A/TVosB6SSIuDB+SYEYcz1c3xXDJla3Ne53yXtNpQDDS0RHJfhaDFBsPrzuwhEeW3
	 GMAFw9zn6LdZjjv6g/MNnUUEGr5de7tD4ypT7pGMHrI7eaVKv0FtMoqwZWWyvF6FKX
	 6q2uhnzckCxlw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH] dt-bindings: mfd: aspeed: Drop 'oneOf' for pinctrl node
Date: Tue, 30 Apr 2024 12:25:19 -0500
Message-ID: <20240430172520.535179-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The use of 'oneOf' to include 1 of 3 possible child node schemas results
in error messages containing the actual error message(s) for the correct
SoC buried in the tons of error messages from the 2 schemas that don't
apply. It also causes the pinctrl schema to be applied twice as it will
be applied when the compatible matches.

All that's really needed in the parent schema is to ensure one of the
possible compatible strings is present in the pinctrl node so that its
schema will be applied separately.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/aspeed,ast2x00-scu.yaml         | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index 1689b986f441..86ee69c0f45b 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -47,10 +47,18 @@ patternProperties:
     type: object
 
   '^pinctrl(@[0-9a-f]+)?$':
-    oneOf:
-      - $ref: /schemas/pinctrl/aspeed,ast2400-pinctrl.yaml
-      - $ref: /schemas/pinctrl/aspeed,ast2500-pinctrl.yaml
-      - $ref: /schemas/pinctrl/aspeed,ast2600-pinctrl.yaml
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          enum:
+            - aspeed,ast2400-pinctrl
+            - aspeed,ast2500-pinctrl
+            - aspeed,ast2600-pinctrl
+
+    required:
+      - compatible
 
   '^interrupt-controller@[0-9a-f]+$':
     description: See Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
-- 
2.43.0

