Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AB25370A0
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 12:51:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9wMj1zbBz3blq
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 20:51:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x6Q6EWzt;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x6Q6EWzt;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9wMJ18txz306J
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 20:51:22 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id g20so10228769edj.10
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JwnhYZYUjycAnfsQ1qpf5ovZ63Tyhe8AegM4ymwHn6U=;
        b=x6Q6EWztSl4cve6WezmNtTarzhXCIS3oCGSvW2fvoPRGJaeFboJQK0TAEp+UhJyNOP
         bLdl9Td81r8XN+aK2m0yf09YNzFQnb1QEYyVyNhN1tXuuLCYeVStqjOVKTZPHxh48Aup
         z3TyRqlXIDyHe63UXW33nfr/RXDLYr1m7Jpo8my9g13cO7LOf8PL3EzE/bnCS+Y5hz8v
         rfqJT4YZHl61yeDIMvZJbGZpQQhpSYzSDrP+wDL7FItHlIPHw0g5mxt294Ucu7lGWIBi
         xGzvW+ZnQGWwFHEWyMdbXlDJffuG/BfxmcJAmNmv2uinVk5ZohFbBUp4pA7DdZEwYNzs
         7IWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JwnhYZYUjycAnfsQ1qpf5ovZ63Tyhe8AegM4ymwHn6U=;
        b=CHnZKJSWty1wqCkZeXZc/DRvlp1ds3vh+vEUwBB7WVCFhBfYZQNmrw0zBoFbWyRQjk
         oa2TXWD5NQ6DiPX9K/pUMIaMFPx2o7dlJL9tBLom3B+AqNoXen+bIeCn6E/8etAsdJKJ
         48hPzOZBxrNwdRbNoIiTuaspmSRFhNP0lC9L8VIE+BuWBrI22fTGDOLiEl0rrG8hRLlz
         QAW35zdovWEpkW/Zrid/6+diPZZNckLw2yXM/IWyzpiAGycG/4F+Jucv2BplUti4QbFJ
         JjtG8u4G3CIFcsG2xCU24CrFaF9XTSfEH3VzcXXbPLFNgwu6sw84bjXsCmM7qUgg2E6S
         0hsA==
X-Gm-Message-State: AOAM530TYoHoqDDlpNN1KeC21vBK6A2E/sBrQisUYgEHzLluXHVD2WdG
	8cu+nGgQze4C/2xAX0emY128rw==
X-Google-Smtp-Source: ABdhPJwPNpC82y/irmX2R/zBK0sGSfYFVR5YbR5U9zvGw8WXhtG7gmRJUqPKZGUqRCTuXeQfx4owyQ==
X-Received: by 2002:a05:6402:c1:b0:42a:b8a5:8d5e with SMTP id i1-20020a05640200c100b0042ab8a58d5emr54048588edu.266.1653821476070;
        Sun, 29 May 2022 03:51:16 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w25-20020a50f119000000b0042b0fcfe966sm4746991edl.37.2022.05.29.03.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 03:51:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Ken Chen <chen.kenyy@inventec.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: arm: aspeed: document board compatibles
Date: Sun, 29 May 2022 12:49:23 +0200
Message-Id: <20220529104928.79636-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, David Wang <David_Wang6097@jabil.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document all compatibles used in existing upstreamed Aspeed AST2400,
AST2500 and AST2600 based boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/arm/aspeed/aspeed.yaml           | 83 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
new file mode 100644
index 000000000000..f214b57d5ae1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed SoC based boards
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: AST2400 based boards
+        items:
+          - enum:
+              - facebook,galaxy100-bmc
+              - facebook,wedge100-bmc
+              - facebook,wedge40-bmc
+              - microsoft,olympus-bmc
+              - quanta,q71l-bmc
+              - tyan,palmetto-bmc
+              - yadro,vesnin-bmc
+          - const: aspeed,ast2400
+
+      - description: AST2500 based boards
+        items:
+          - enum:
+              - amd,ethanolx-bmc
+              - ampere,mtjade-bmc
+              - asrock,e3c246d4i-bmc
+              - asrock,romed8hm3-bmc
+              - bytedance,g220a-bmc
+              - facebook,cmm-bmc
+              - facebook,minipack-bmc
+              - facebook,tiogapass-bmc
+              - facebook,yamp-bmc
+              - facebook,yosemitev2-bmc
+              - facebook,wedge400-bmc
+              - hxt,stardragon4800-rep2-bmc
+              - ibm,mihawk-bmc
+              - ibm,mowgli-bmc
+              - ibm,romulus-bmc
+              - ibm,swift-bmc
+              - ibm,witherspoon-bmc
+              - ingrasys,zaius-bmc
+              - inspur,fp5280g2-bmc
+              - inspur,nf5280m6-bmc
+              - inspur,on5263m5-bmc
+              - intel,s2600wf-bmc
+              - inventec,lanyang-bmc
+              - lenovo,hr630-bmc
+              - lenovo,hr855xg2-bmc
+              - portwell,neptune-bmc
+              - qcom,centriq2400-rep-bmc
+              - supermicro,x11spi-bmc
+              - tyan,s7106-bmc
+              - tyan,s8036-bmc
+              - yadro,nicole-bmc
+              - yadro,vegman-n110-bmc
+              - yadro,vegman-rx20-bmc
+              - yadro,vegman-sx20-bmc
+          - const: aspeed,ast2500
+
+      - description: AST2600 based boards
+        items:
+          - enum:
+              - facebook,bletchley-bmc
+              - facebook,cloudripper-bmc
+              - facebook,elbert-bmc
+              - facebook,fuji-bmc
+              - ibm,everest-bmc
+              - ibm,rainier-bmc
+              - ibm,tacoma-bmc
+              - inventec,transformer-bmc
+              - nuvia,dc-scm-bmc
+              - quanta,s6q-bmc
+          - const: aspeed,ast2600
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index c71276d7752e..860017ff41a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1896,6 +1896,7 @@ L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 Q:	https://patchwork.ozlabs.org/project/linux-aspeed/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
+F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed-*
 F:	arch/arm/mach-aspeed/
 N:	aspeed
-- 
2.34.1

