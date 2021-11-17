Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBE3453F24
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 04:51:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv89r3pPxz2yYl
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 14:51:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RmBFqPTI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RmBFqPTI; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv89m53Dpz2yPN
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 14:51:24 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id h24so1200196pjq.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 19:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tIhZG+CbbMmgzuL06GZqXJZNzmxGG5DYaNDz94CFpeY=;
 b=RmBFqPTIMkFmrsaBO+0iCxe94FYp5PQsfcdYHGedbuSIithhbmP8MeUQ8nKHXBye1Q
 hHS6QUzwtBLvjNwgPywRNR4JzDISdb38yBokfzlP4Izsc4DzDA3RPLNSM2mQt7p6xKff
 2CaOI4x882fDDE5uxOxJsKqHZwwMHOW9Le9rHDTSmwSf19s0sXj53cayzuFFC2fsqyAw
 imYMl2m+He/T4/gxK09SsTxAvhu/SZ9C2wRGV8dM+ZWA83GmpEIMbsy5lhAsjVjrjNw9
 MjJ3pf1KwY5m7nX5Cz1DPzVcDqnjiafBpNdY/4YWUvsY5iUKLsODCiFn+ONSK60sHCyr
 MH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tIhZG+CbbMmgzuL06GZqXJZNzmxGG5DYaNDz94CFpeY=;
 b=iBGkRnyttxBjsIcxYf10MsAnOXCKlJ96AcU61s87EUjw2arlDB/d02qt2F/PSgGh2I
 kxBUiRlYFwrzjX9dlBphc3Sj9qQZFyIhS1hgivO0gnTt2MUHJuH9Q5QKtkWzna42zHNs
 6zM9reOUkzH9G+B9DXbp44YNQmV9Tw1JqC0PGQrIFBf2KMio9ZUvPpjqDTaeIkrJq6Y9
 JFDJhQLcwvEnyaHgzEkqrRuQ1jRgMnoCepuj2GLA2a5N+XX/mdhOa7xUPcnyXF5BI+dW
 LyDluxAcrEUdFFEpYdZkdgYF007aMR5jrQxNSATdO76SruuvjMNK8nowrpEX2BQUP+te
 0RYg==
X-Gm-Message-State: AOAM530D2BwcMtceHCIIS0I1GKkUTkbQTgytk/kN0EqoQb9GVap7xVAN
 GqBviYAapbzCAZk9pdFgurM=
X-Google-Smtp-Source: ABdhPJzEbj9ggqVmPebbmGB6+qsREhi30XIsiNVa2iPnIOqFNcysnM/GBHI7tl2kQnNqYPUCMNll2Q==
X-Received: by 2002:a17:90a:690d:: with SMTP id
 r13mr5509019pjj.40.1637121082351; 
 Tue, 16 Nov 2021 19:51:22 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id c15sm3671339pjg.53.2021.11.16.19.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 19:51:21 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.u>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: aspeed: Add Secure Boot Controller bindings
Date: Wed, 17 Nov 2021 11:51:04 +0800
Message-Id: <20211117035106.321454-2-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117035106.321454-1-joel@jms.id.au>
References: <20211117035106.321454-1-joel@jms.id.au>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The secure boot controller was first introduced in the AST2600.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../bindings/arm/aspeed/aspeed,sbc.yaml       | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
new file mode 100644
index 000000000000..c72aab706484
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+# Copyright 2021 Joel Stanley, IBM Corp.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/aspeed/aspeed,sbc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: ASPEED Secure Boot Controller
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+  - Andrew Jeffery <andrew@aj.id.au>
+
+description: |
+  The ASPEED SoCs have a register bank for interacting with the secure boot
+  controller.
+
+properties:
+  compatible:
+    items:
+      - const: aspeed,ast2600-sbc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    sbc: secure-boot-controller@1e6f2000 {
+            compatible = "aspeed,ast2600-sbc";
+            reg = <0x1e6f2000 0x1000>;
+    };
-- 
2.33.0

