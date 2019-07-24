Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7B3729A7
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2019 10:13:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tp5L5GMKzDqKZ
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2019 18:13:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Q82/EoOG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nET6tHWd"; dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tp5055hRzDqKq
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2019 18:13:24 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 26E371315;
 Wed, 24 Jul 2019 04:13:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 24 Jul 2019 04:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=DN2+Lj8I7jFnN
 IMUgDd2QFBVg48TKo12C1rBwKfbzK4=; b=Q82/EoOGrisOx1VaTEyTN4D24J9MV
 tjZq/hIz1OnnTwifcqwuT1bz23TkKgZTy9kFDunatTy4ydSsPzGQ25ZQPBoAqxXH
 1xMxI6DCz/cXJlB98BHs6G5X/UN8ml4VR8lk8q5GoZTZdbpzUNJW2U/O3/YNQe1P
 A++Y6wym4Uj2+IZP8/eGyidNZHcPjLrjgA6PSdc8OgdQkJKJ8gkOOBUma7IRxziA
 S12PuTJr5JzIJ8zilGvJJNf214XrAvFJ5iZZV+ukc48ykw9iXJcx6aEJ1PlT+sbL
 qabn/ioVgIMze6JIGvwP1k/KyzqKBsYtDU37J4nuXCHdObWeFGTRCyjjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=DN2+Lj8I7jFnNIMUgDd2QFBVg48TKo12C1rBwKfbzK4=; b=nET6tHWd
 JJ96qY49c4Za0UAt5MieK0yfLHxga23nXgtOjq2zcHTfeWUy2g2iXisRNa56DtVT
 QRaccRzIveH3Rm9NgMSQO8f/dlhsoN2KhlDcg5pfQouSbDAxwvDuGNptP1I7v2X2
 H9EQIU4S6R/m7P8nxW58k9sgx6Se7GkRr2L0LM9XHrfXspvujomH4qEd22/wtvko
 bUo5saJ+DSm1ZSuqZFvYaq0OJKGbh6vfzl1P6hj1xJDN2A1BDvt0zQBGyzACtXLh
 KLaUFiO+lT//88ql8SU1HcvK2dsFXS1kElJru/anvTVvbHSsVqYF49HU+HJ8aHeC
 elVDEa7+FKUveg==
X-ME-Sender: <xms:IRM4XfRui1gp9DZ0fTXg2AcK9atTVynS1ByzllgFP4tl756yashxUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeelgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedu
X-ME-Proxy: <xmx:IRM4XZUom8hNEXdsDaO_Pl0qrubtZCQ2uD4ROZrk6eMgH_u9rXu2dg>
 <xmx:IRM4XcnhiaevzQ-p6Kt2uYSDafesBSnp2jzbrADrBn-8OvY7Cr7xhQ>
 <xmx:IRM4XX8dtMO-jIft6q_Qjsu2EmlWsbmS0SfdooGG5djvIEtWYP6b6A>
 <xmx:IhM4XYLdsVgbWmJdVA2xzX5CefS3r9d7WaciF8TjGNXSdHWzTFavUg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A32680059;
 Wed, 24 Jul 2019 04:13:18 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 3/3] dt-bindings: aspeed: Remove mention of deprecated
 compatibles
Date: Wed, 24 Jul 2019 17:43:13 +0930
Message-Id: <20190724081313.12934-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724081313.12934-1-andrew@aj.id.au>
References: <20190724081313.12934-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Guide readers away from using the aspeed,g[45].* compatible patterns.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/mfd/aspeed-scu.txt         | 2 --
 Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt   | 2 --
 .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml  | 5 +----
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml  | 4 +---
 4 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
index ce8cf0ec6279..4d92c0bb6687 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
@@ -4,9 +4,7 @@ configuring elements such as clocks, pinmux, and reset.
 Required properties:
 - compatible:	One of:
 		"aspeed,ast2400-scu", "syscon", "simple-mfd"
-		"aspeed,g4-scu", "syscon", "simple-mfd"
 		"aspeed,ast2500-scu", "syscon", "simple-mfd"
-		"aspeed,g5-scu", "syscon", "simple-mfd"
 
 - reg:		contains the offset and length of the SCU memory region
 - #clock-cells: should be set to <1> - the system controller is also a
diff --git a/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt b/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
index 854bd67ffec6..0e1fa5bc6a30 100644
--- a/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
+++ b/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
@@ -26,9 +26,7 @@ property:
 
 - compatible : Should be one of the following:
 		"aspeed,ast2400-scu", "syscon", "simple-mfd"
-		"aspeed,g4-scu", "syscon", "simple-mfd"
 		"aspeed,ast2500-scu", "syscon", "simple-mfd"
-		"aspeed,g5-scu", "syscon", "simple-mfd"
 
 Example
 ===================
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 125599a2dc5e..9368e4b6d4d0 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -15,16 +15,13 @@ description: |+
 
   - compatible:     Should be one of the following:
                     "aspeed,ast2400-scu", "syscon", "simple-mfd"
-                    "aspeed,g4-scu", "syscon", "simple-mfd"
 
   Refer to the the bindings described in
   Documentation/devicetree/bindings/mfd/syscon.txt
 
 properties:
   compatible:
-    enum:
-      - aspeed,ast2400-pinctrl
-      - aspeed,g4-pinctrl
+    const: aspeed,ast2400-pinctrl
 
 patternProperties:
   '^.*$':
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index 3e6d85318577..939fb755a6db 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -22,9 +22,7 @@ description: |+
 
 properties:
   compatible:
-    enum:
-      - aspeed,ast2500-pinctrl
-      - aspeed,g5-pinctrl
+    const: aspeed,ast2500-pinctrl
   aspeed,external-nodes:
     minItems: 2
     maxItems: 2
-- 
2.20.1

