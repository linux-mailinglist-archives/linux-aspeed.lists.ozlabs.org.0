Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68009539BFE
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 06:18:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCbTx52w5z3bhs
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 14:17:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cz3+YUGh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cz3+YUGh;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCbTp42h1z2ywV
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Jun 2022 14:17:50 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id 187so821885pfu.9
        for <linux-aspeed@lists.ozlabs.org>; Tue, 31 May 2022 21:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DQ+FCy1HGI3Ies4LEu7xbJ8vvBaBXxmKzVnykcfWgYc=;
        b=cz3+YUGhugwCO8sy3yMoeG9UKTe6cXoNB5HsquXRcM1x8kO4l2SB2p5lA3nEn7WHWa
         vR2BzibqnYCojzjoHn+4fh4xjPWlRVY+rwgWhDLd7ZnQmBsP69280m3iSRgGt+9jutJv
         G9Llp2q7NwZL/JNUf2bMttPSk+928J91kB9mWKKvkUK57YIozSOy84Laj8iLBbTzixp1
         ydZx6tkcdIeO49cwUT6epL0z5+oxO0+UFwZtffi9aras6j6qIvE9QEPVOm8OvxW2DxTY
         ErKdgi+a1t90qzQlL5P5BwJ4oYrjaFEMectidaqmmDN1fWzDcCcbm3RViAZr7/yUncms
         XUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DQ+FCy1HGI3Ies4LEu7xbJ8vvBaBXxmKzVnykcfWgYc=;
        b=RlJX/Tq7IXBEa96vN14qIWTk1YX1+how/lj4Ga3MImqUxMpzmdPe97JNF597MdCKzf
         epB6W8J7OPZ/hghcvU6iKtxgtcI9x8uFcpkjEPVDcJiCjLZcGNIXsGXSTsMaAhiXfrEA
         3twiYNUppTAwxVpTHgchrEWvKmUFqlRl8lnr8TYMikhCC20+svs0xOX3I3QJRTROqHSs
         j5AARLM93ufzzgdYWaoUh2DVElKsXvTxG6LJEqNZjfgJC6tENfqrmz29efce46rtpvhg
         29vwhsCCdinytqUDUf0i0+D+Df5Y/pUm8XXFHE+lDJWUl3Wyhm0KuKjRVFHt+p1S6Nmf
         oZ7A==
X-Gm-Message-State: AOAM530KEdnX2Q8wVlzT1YAVJhBohrnDFYggmrRi9RrmNB8yJrjUYteF
	QmE7OyR7533W0NnyEh3ppxM=
X-Google-Smtp-Source: ABdhPJxuABQQ5nnDs9x6ucPra80+mc4j7aUfsFQDxn8DBnNB6maVVyCDmZ2Lamz55ogHhWOIjy1jkw==
X-Received: by 2002:a63:a0f:0:b0:3fa:95b9:8c70 with SMTP id 15-20020a630a0f000000b003fa95b98c70mr36216628pgk.385.1654057068274;
        Tue, 31 May 2022 21:17:48 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id u11-20020a63d34b000000b003c14af505f6sm290749pgi.14.2022.05.31.21.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 21:17:47 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh+dt@kernel.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>
Subject: [PATCH v2 2/2] dt-bindings: aspeed-i2c: add properties for manual clock setting
Date: Wed,  1 Jun 2022 12:15:12 +0800
Message-Id: <20220601041512.21484-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601041512.21484-1-potin.lai.pt@gmail.com>
References: <20220601041512.21484-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add following properties for manual tuning clock divisor and cycle of
hign/low pulse witdh.

* aspeed,i2c-manual-clk: Enable aspeed i2c clock manual setting
* aspeed,i2c-base-clk-div: Base Clock divisor (tBaseClk)
* aspeed,i2c-clk-high-cycle: Cycles of clock-high pulse (tClkHigh)
* aspeed,i2c-clk-low-cycle: Cycles of clock-low pulse (tClkLow)

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index ea643e6c3ef5..e2f67fe2aa0c 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -12,6 +12,28 @@ maintainers:
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: st,stm32-uart
+
+    then:
+      properties:
+        aspeed,i2c-clk-high-cycle:
+          maximum: 8
+        aspeed,i2c-clk-low-cycle:
+          maximum: 8
+
+  - if:
+      required:
+        - aspeed,i2c-manual-clk
+
+    then:
+      required:
+        - aspeed,i2c-base-clk-div
+        - aspeed,i2c-clk-high-cycle
+        - aspeed,i2c-clk-low-cycle
+
 properties:
   compatible:
     enum:
@@ -49,6 +71,28 @@ properties:
     description:
       states that there is another master active on this bus
 
+  aspeed,i2c-manual-clk:
+    type: boolean
+    description: enable manual clock setting
+
+  aspeed,i2c-base-clk-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192,
+           16384, 32768]
+    description: base clock divisor
+
+  aspeed,i2c-clk-high-cycle:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 16
+    description: cycles of master clock-high pulse width
+
+  aspeed,i2c-clk-low-cycle:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 16
+    description: cycles of master clock-low pulse width
+
 required:
   - reg
   - compatible
-- 
2.17.1

