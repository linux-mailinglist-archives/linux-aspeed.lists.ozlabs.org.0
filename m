Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05768CE03
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 05:10:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9qRt6xbBz3cGv
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 15:10:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GBmNCuze;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=sunrockers8@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GBmNCuze;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9Vgl40K6z3bTc
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Feb 2023 02:34:58 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id o16-20020a17090ad25000b00230759a8c06so8726105pjw.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Feb 2023 07:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFAbb0Q992diuRUuGb5zzfTb2heUqqslWuNG7BHd+yw=;
        b=GBmNCuzez9ViTbo5c31j8U7hoafrS4Hf2kTye8ahc4Abeoj1Ee3GASHIhmJK7w9gyn
         GHvLHWsI59WKRaYUwL31G2QDgNtXBMMq0EXqvwbO4uD+n4oo/r+1RPGIW79HHm+qi2dX
         BO3VV1RbFijXSmd/E+AWs9Q5Ev6WrCC+biMYhsUK4CgOyHpfZJ35NMrKjSVbAKYKrR2D
         fKz1EHQ2H1xUIfwz+tUXrFa+u4D8K4tAUvMo6M7anvaIWEaiU+IZYKty3nBxPYeT6C9y
         cGzVGOUKfaqav04heydFDtYjFz1fOFvl1tDikQeYaW6vwGaYdMc9SDb0BBKyoPkoNkYN
         1mGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFAbb0Q992diuRUuGb5zzfTb2heUqqslWuNG7BHd+yw=;
        b=G2lLYSQf4R1YmOvZC4uRX0HNnl/NQtp+QbbbLR4UiWhqV/07p4GlGjZNI5MXNRmdjS
         LaQSeQtQEPj8B/UcWcQhJuQ9dLK5C+L2Mq4Vwas78/bQG9RQ15cAvAqR+enryqIe0eww
         psDbFFLv8Yp08MevlsadN48ych8YUqwZyKnf/EnMmWQn2tG2EiWQlZEEWQFwpbWRG0J+
         n0QXa99LwzAub/27y7ALB2hP1qxwgtBj6Q770fbgpE4nSwe2v0tjIUC9wZcnisKpN9RK
         EB0OehD5bw2rSaQjiSl/EWeZVi2nu2lNFNnfyrtcRJBSXjrf2lQ4A7h/mtmCyuXujduR
         WxyA==
X-Gm-Message-State: AO0yUKWkNv1qkBa7NbK+akLZr7d61vSGkpZdJ19wpyWd8UldqpIr56uY
	J8gaIKUlPZSfzEkKedUAlpg=
X-Google-Smtp-Source: AK7set+Qq712Bfv+AuekZLeLJcQT4YU4H9ICuPwDYw37RtiqHrDF/vgnFMZzQe8TkU4x2JeeSMtlwQ==
X-Received: by 2002:a17:90b:4b8a:b0:22c:afa2:4783 with SMTP id lr10-20020a17090b4b8a00b0022cafa24783mr21747537pjb.39.1675697696308;
        Mon, 06 Feb 2023 07:34:56 -0800 (PST)
Received: from localhost.localdomain ([14.139.38.195])
        by smtp.googlemail.com with ESMTPSA id p11-20020a17090a4f0b00b00230c425adbcsm1696091pjh.20.2023.02.06.07.34.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Feb 2023 07:34:55 -0800 (PST)
From: Vijaya Anand <sunrockers8@gmail.com>
To: 
Subject: [PATCH] dt-bindings : misc : aspeed,cvic interrupt controller : convert the binding document to yaml
Date: Mon,  6 Feb 2023 21:03:09 +0530
Message-Id: <20230206153325.43692-1-sunrockers8@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Feb 2023 15:09:45 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, sunrockers8@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

    Convert the binding document for ASPEED AST2400 and AST2500 coprocessor interrupt controller
    from txt to yaml so one could validate dt-entries correctly and any future additions can go
    into yaml format. The options for compatability described according to the example given.
---
 .../devicetree/bindings/misc/aspeed,cvic.txt  | 35 ----------
 .../devicetree/bindings/misc/aspeed,cvic.yaml | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/misc/aspeed,cvic.txt
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed,cvic.yaml

diff --git a/Documentation/devicetree/bindings/misc/aspeed,cvic.txt b/Documentation/devicetree/bindings/misc/aspeed,cvic.txt
deleted file mode 100644
index d62c783d1d5e..000000000000
--- a/Documentation/devicetree/bindings/misc/aspeed,cvic.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* ASPEED AST2400 and AST2500 coprocessor interrupt controller
-
-This file describes the bindings for the interrupt controller present
-in the AST2400 and AST2500 BMC SoCs which provides interrupt to the
-ColdFire coprocessor.
-
-It is not a normal interrupt controller and it would be rather
-inconvenient to create an interrupt tree for it as it somewhat shares
-some of the same sources as the main ARM interrupt controller but with
-different numbers.
-
-The AST2500 supports a SW generated interrupt
-
-Required properties:
-- reg: address and length of the register for the device.
-- compatible: "aspeed,cvic" and one of:
-		"aspeed,ast2400-cvic"
-	      or
-		"aspeed,ast2500-cvic"
-
-- valid-sources: One cell, bitmap of supported sources for the implementation
-
-Optional properties;
-- copro-sw-interrupts: List of interrupt numbers that can be used as
-		       SW interrupts from the ARM to the coprocessor.
-		       (AST2500 only)
-
-Example:
-
-	cvic: copro-interrupt-controller@1e6c2000 {
-		compatible = "aspeed,ast2500-cvic";
-		valid-sources = <0xffffffff>;
-		copro-sw-interrupts = <1>;
-		reg = <0x1e6c2000 0x80>;
-	};
diff --git a/Documentation/devicetree/bindings/misc/aspeed,cvic.yaml b/Documentation/devicetree/bindings/misc/aspeed,cvic.yaml
new file mode 100644
index 000000000000..bbff0418fa2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed,cvic.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/aspeed,cvic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2400 and AST2500 coprocessor interrupt controller
+
+maintainers: 
+  - Benjamin Herrenschmidt <benh@kernel.crashing.org>
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  This file describes the bindings for the interrupt controller present
+  in the AST2400 and AST2500 BMC SoCs which provides interrupt to the
+  ColdFire coprocessor.
+
+  It is not a normal interrupt controller and it would be rather
+  inconvenient to create an interrupt tree for it as it somewhat shares
+  some of the same sources as the main ARM interrupt controller but with
+  different numbers.
+
+  The AST2500 supports a SW generated interruptThe Soft Decision Forward Error Correction (SDFEC) Engine is a Hard IP block
+  which provides high-throughput LDPC and Turbo Code implementations.
+  The LDPC decode & encode functionality is capable of covering a range of
+  customer specified Quasi-cyclic (QC) codes. The Turbo decode functionality
+  principally covers codes used by LTE. The FEC Engine offers significant
+  power and area savings versus implementations done in the FPGA fabric.
+
+properties:
+
+  compatible:
+    enum: 
+      - aspeed,ast2400-cvic
+      - aspeed,ast2500-cvic
+
+  reg:
+    maxItems: 1
+    description: address and length of the register for the device.
+  
+  valid-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: One cell, bitmap of supported sources for the implementation
+
+  copro-sw-interrupts:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+                  List of interrupt numbers that can be used as
+                  SW interrupts from the ARM to the coprocessor.
+                  (AST2500 only)
+
+required:
+  - compatible
+  - reg
+  - valid-sources
+
+additionalProperties: false
+
+examples:
+  - |
+    cvic: copro-interrupt-controller@1e6c2000 
+    {
+        compatible = "aspeed,ast2500-cvic";
+        valid-sources = <0xffffffff>;
+        copro-sw-interrupts = <1>;
+        reg = <0x1e6c2000 0x80>;
+    };
-- 
2.37.1 (Apple Git-137.1)

