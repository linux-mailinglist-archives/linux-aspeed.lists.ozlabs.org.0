Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C169F05
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jul 2019 00:37:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ndhJ34WzzDqTk
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jul 2019 08:37:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.166.65; helo=mail-io1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ndhC70wrzDqSw
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Jul 2019 08:37:31 +1000 (AEST)
Received: by mail-io1-f65.google.com with SMTP id i10so36714623iol.13
 for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Jul 2019 15:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXbxpjTO0OeI6MuUUKX3Eklg6COj9IISlKB84zUoyLo=;
 b=gowdrakocel7eGbMxUpCesWUiZxFO7g2COLMGHaPxJsRmLwF4aeRahulwxLm/+aeui
 IOpRisG/d6tMo+01XxLj+YTgQSuzew6S73HUe5Y6Fx5R16XAXfB86BYkwHDvqe8RN2LA
 hVx/rTHxUw3/XU4S5IvHoLg+U7l6SUKXdQeN0m+aCfjWiv5lLeNbyc5eIGooitOvOKa9
 TezNdL6sWT0Srh6OJnPyv5vH6FSONPDmC1q1zIoVgk+w/Ai00jI1FgmI+dhPK9ZxiN+/
 z9DjlogJV7S9DCl9s9alw1KCiGzn1DbuEo/MIhahmpsKcqSysL+9kx7dmdnGa8al0K67
 XOPg==
X-Gm-Message-State: APjAAAXWtmcIZ29PFKXfSu2RX3jc/5dKftCPOMrpbBRzL+ULgoNjrxQk
 jUknSn6ZXJQ7xVN+rQqsWg==
X-Google-Smtp-Source: APXvYqxpaPu9UCGLAK8cqFKFRAwnJVxKaxtB+Ov7U8QDlsE1ae268Oy/Kl1oMN//CPx5c9hmTs3slw==
X-Received: by 2002:a5d:9d90:: with SMTP id 16mr27939554ion.132.1563230247894; 
 Mon, 15 Jul 2019 15:37:27 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id e26sm15751180iod.10.2019.07.15.15.37.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 15:37:26 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] dt-bindings: pinctrl: aspeed: Fix 'compatible' schema errors
Date: Mon, 15 Jul 2019 16:37:25 -0600
Message-Id: <20190715223725.12924-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The Aspeed pinctl schema have errors in the 'compatible' schema:

Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 'g4-pinctrl'] has non-unique elements
Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 'g5-pinctrl'] has non-unique elements

Flow style sequences have to be quoted if the vales contain ','. Fix
this by using the more common one line per entry formatting.

Fixes: 0a617de16730 ("dt-bindings: pinctrl: aspeed: Convert AST2500 bindings to json-schema")
Fixes: 07457937bb5c ("dt-bindings: pinctrl: aspeed: Convert AST2400 bindings to json-schema")
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   | 4 +++-
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 61a110a7db8a..125599a2dc5e 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -22,7 +22,9 @@ description: |+
 
 properties:
   compatible:
-    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
+    enum:
+      - aspeed,ast2400-pinctrl
+      - aspeed,g4-pinctrl
 
 patternProperties:
   '^.*$':
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index cf561bd55128..a464cfa0cba3 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -22,7 +22,9 @@ description: |+
 
 properties:
   compatible:
-    enum: [ aspeed,ast2500-pinctrl, aspeed,g5-pinctrl ]
+    enum:
+      - aspeed,ast2500-pinctrl
+      - aspeed,g5-pinctrl
   aspeed,external-nodes:
     minItems: 2
     maxItems: 2
-- 
2.20.1

