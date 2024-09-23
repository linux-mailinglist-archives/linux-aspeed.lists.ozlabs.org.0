Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F10C97E95F
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 12:06:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBzD96PHdz2ytT
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 20:06:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727085991;
	cv=none; b=ZaLPw0ba7OzEi5pLS4dX16vXkYhxRskafRjED8iotyx8WViRnrFbe/UdrMbA3L2Ty/cM23IC3z3fLpVN+AriRyC3WYOUYXlg4+RfUTykHQ7NhYXPfrdaNc7KJkgO6Le8Tzb40XWgrgA3pC6J7W06gV7q+Y3qhxYaGocTlahHb53Gdl8vclSqFQneusS7b2hFk9hcVJ195G5OZs+h+SgEn34DDQIHrsP67IjOWux4ATTN+J3yUjZDVbFLPxkQpLMdyFdaiRH8bgvHVrSi7NIwQkzHrffSoxjEshVubZxlzVd2nNlK+BOJqGYkeh4jiW9339j4MWNaTxndrYiLUukzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727085991; c=relaxed/relaxed;
	bh=8vk/08E4DnMuQOIhV0sR1Q7/xD0qfziG46X3VNP72wI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOiFmQoYWQU0EWyKcjBWi0ZZ6xcaPUVTa41ChhzuITWd05WDKVWbcXjH3lLYLP0PKuRvXGltwrLRBvAFU4lmtILc8EU4NhW5D/lLvz9x3Trsu9I9YVCi+ym9rMAM8CXn72u3daYknBlA94tIgw5v3o3XBZeuwQIALEbm1YjT9fGz3CkljWbkW16rI07jD5wCXS0JM1T7H76XKYNv6z5csJDOd4063eMLjOSkvOVB7h9o8vcXdTsy/liTqy2kGcSOCDZ7Vi6ZQG3spfjV31Px+iNwlEOOl9f5ap2Mn+7w+9vrVlNgklO4Pl3O1035VFvbXPX2uEA4IofKDkuXDUQlpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBzD664H3z2yN4
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Sep 2024 20:06:30 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 23 Sep
 2024 18:06:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 23 Sep 2024 18:06:11 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v5 1/6] dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
Date: Mon, 23 Sep 2024 18:06:06 +0800
Message-ID: <20240923100611.1597113-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923100611.1597113-1-billy_tsai@aspeedtech.com>
References: <20240923100611.1597113-1-billy_tsai@aspeedtech.com>
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
Cc: Conor Dooley <conor.dooley@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO
controllers: one with 12 GPIO pins and another with 216 GPIO pins.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
index cf11aa7ec8c7..b9afd07a9d24 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
@@ -15,6 +15,7 @@ properties:
       - aspeed,ast2400-gpio
       - aspeed,ast2500-gpio
       - aspeed,ast2600-gpio
+      - aspeed,ast2700-gpio
 
   reg:
     maxItems: 1
@@ -25,7 +26,7 @@ properties:
 
   gpio-controller: true
   gpio-line-names:
-    minItems: 36
+    minItems: 12
     maxItems: 232
 
   gpio-ranges: true
@@ -42,7 +43,7 @@ properties:
     const: 2
 
   ngpios:
-    minimum: 36
+    minimum: 12
     maximum: 232
 
 required:
@@ -93,6 +94,20 @@ allOf:
           enum: [ 36, 208 ]
       required:
         - ngpios
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2700-gpio
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 12
+          maxItems: 216
+        ngpios:
+          enum: [ 12, 216 ]
+      required:
+        - ngpios
 
 additionalProperties: false
 
-- 
2.25.1

