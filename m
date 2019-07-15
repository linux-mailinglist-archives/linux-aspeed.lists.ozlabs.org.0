Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A118B69F26
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jul 2019 00:48:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ndxJ04JpzDqRP
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jul 2019 08:48:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.166.66; helo=mail-io1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ndxB2MQWzDqQ5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Jul 2019 08:48:45 +1000 (AEST)
Received: by mail-io1-f66.google.com with SMTP id f4so36833154ioh.6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Jul 2019 15:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xDVgMC3pgMI66Qfbn4dKj97wxKc85WWhYTVyq+wpXho=;
 b=A3n4HMzNpMMmeeXQBo616oMZKMe8qfoAJuWcZyGUjDPPGT7XYLll8pq5PGNDQDWg0v
 QEca8sovL9qBIDgihUtGUnDfQ62SG1C8IiJIcRF4oA9Yij348A7ooP6OH29gXmE8h+6N
 7EukPm+KYye3iNJg04MNmjYBgHF8r7JY4NDwn/a4UN35WMFxOxMtBpeHT2sIPjwU0gtW
 ywDcRsTL3SOwlydnkXG+8QKIBcbuJFQ0vtfaECTDcCTN42/j9hRHHZ8cO+xookLWqQVl
 yiLW8ZGFEGq+/JQOgnwXmgwKV7pjfmUI60kibCWxKS3bAWEcTX860Rs+S+oxSLzt4YRZ
 OXEg==
X-Gm-Message-State: APjAAAW9WiEs/ygeoQ1mKuPEL1pO5g7xTw/mTUAjmH099P+6U4nMXFRa
 55cNfI3KV4eZBf1QpivI+w==
X-Google-Smtp-Source: APXvYqzgHu4vzbb6DbWm2vals8wB1vp8H0ICorDGecZ9nvzGessLbPgiUZ0qbKixMnW6J9/fMT2+xg==
X-Received: by 2002:a05:6602:219a:: with SMTP id
 b26mr4773812iob.55.1563230923181; 
 Mon, 15 Jul 2019 15:48:43 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id t14sm17185778ioi.60.2019.07.15.15.48.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 15:48:42 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] dt-bindings: pinctrl: aspeed: Fix AST2500 example errors
Date: Mon, 15 Jul 2019 16:48:41 -0600
Message-Id: <20190715224841.6771-1-robh@kernel.org>
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

The schema examples are now validated against the schema itself. The
AST2500 pinctrl schema has a couple of errors:

Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.example.dt.yaml: \
example-0: $nodename:0: 'example-0' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.example.dt.yaml: \
pinctrl: aspeed,external-nodes: [[1, 2]] is too short

Fixes: 0a617de16730 ("dt-bindings: pinctrl: aspeed: Convert AST2500 bindings to json-schema")
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml  | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index a464cfa0cba3..3e6d85318577 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -76,9 +76,6 @@ required:
 
 examples:
   - |
-    compatible = "simple-bus";
-    ranges;
-
     apb {
         compatible = "simple-bus";
         #address-cells = <1>;
@@ -91,7 +88,7 @@ examples:
 
             pinctrl: pinctrl {
                 compatible = "aspeed,g5-pinctrl";
-                aspeed,external-nodes = <&gfx &lhc>;
+                aspeed,external-nodes = <&gfx>, <&lhc>;
 
                 pinctrl_i2c3_default: i2c3_default {
                     function = "I2C3";
-- 
2.20.1

