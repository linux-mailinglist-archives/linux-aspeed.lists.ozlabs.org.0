Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317AD537094
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 12:51:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9wMT3cDZz3bnh
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 20:51:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r3oLuFyL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r3oLuFyL;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9wMJ0pXwz2ypZ
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 20:51:22 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id q21so16107385ejm.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WG2alJJEUiFUsTUssLuacIQlAnfrVBSipCBTK2ZQ304=;
        b=r3oLuFyLFfHTXiFMf3qFMnpoW2K7OINHmNW09UWdX00Co5LyDIJSUaxZa8+2Chf7D2
         P1/4lNUDVHAbXAPCj+/YohWp4TlG664iclnUeBwpIa0CwURyv72KCdQlBAKvPKFkUKqe
         pTd97pDgv14GLt/i+CDUJm5y+QAP0ee6PsKejQoM3DLT5Ho+Go5bEEf/BJBI/YATLE6u
         DyGyFRZy/4dIyoIxrCpw6OZseRzHNkewQq27hKZUnf3vIpcGsl+dtfa77kBa81CPBSfl
         vKdgW4ygXAAxnLvamA0yWHPCH77agefNu/xjRcHBATH0rSGaee/EvA07TZDLUdfXSzFn
         H0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WG2alJJEUiFUsTUssLuacIQlAnfrVBSipCBTK2ZQ304=;
        b=Wbp2fM0+NgoSAsjOe4194RSnwMqWzfCBd4vmQJqTki+x5QUZAniMASQtp7ebFnBMNd
         JE1nZWYDzLxY7gukC/q0WAUlkdAABujXgNw2BtpCbZEp2qpWYPBSD05F7FZZAGA93ke1
         z1EREzfYyjcc2y9UUEjZWI9jwfzXBLzuUbBK6oy6bBkN8wZwPwWPT1NK/GudlWNonmzJ
         WAhgOy1/66y7Cg+7Nf423pbbJBmI7rnjasfGShuPEiemFMRZD99ME6rG+ozCfY4YT/5k
         7S1nAUnZpGM/98hwPjo5xyMsY3d6lPpLpGkIguAUYbvUxykhXuOriElt3eBmG+QzTN9B
         wIVg==
X-Gm-Message-State: AOAM530vDhC95MWOxp1qM/0wAoBpb/WkKgDy7yEJIGGGcDVy2szmWxcY
	u+HL+kLGv76NT+gQtHR0S8bR5g==
X-Google-Smtp-Source: ABdhPJyj6oLgJuEi9K+8KrQi1YE7XhrD3YlFKzr1kM6Jl/9u/Gt9lNhiMVx9XFKfT/WN03gdCI2E8g==
X-Received: by 2002:a17:906:2883:b0:6e8:7012:4185 with SMTP id o3-20020a170906288300b006e870124185mr43913960ejd.204.1653821474869;
        Sun, 29 May 2022 03:51:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w25-20020a50f119000000b0042b0fcfe966sm4746991edl.37.2022.05.29.03.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 03:51:14 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: vendor-prefixes: document several vendors for Aspeed BMC boards
Date: Sun, 29 May 2022 12:49:22 +0200
Message-Id: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Add vendor prefixes for manufacturers of Aspeed SoC based BMC boards:
ASrock, ByteDance, Ingrasys, Inventec and Quanta.  Move also bticino to
proper alphabetical place.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/vendor-prefixes.yaml     | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 495a01ced97e..169f11ce4cc5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -141,6 +141,8 @@ patternProperties:
     description: ASIX Electronics Corporation
   "^aspeed,.*":
     description: ASPEED Technology Inc.
+  "^asrock,.*":
+    description: ASRock Inc.
   "^asus,.*":
     description: AsusTek Computer Inc.
   "^atlas,.*":
@@ -195,12 +197,14 @@ patternProperties:
     description: Broadcom Corporation
   "^bsh,.*":
     description: BSH Hausgeraete GmbH
+  "^bticino,.*":
+    description: Bticino International
   "^buffalo,.*":
     description: Buffalo, Inc.
   "^bur,.*":
     description: B&R Industrial Automation GmbH
-  "^bticino,.*":
-    description: Bticino International
+  "^bytedance,.*":
+    description: ByteDance Ltd.
   "^calamp,.*":
     description: CalAmp Corp.
   "^calaosystems,.*":
@@ -544,6 +548,8 @@ patternProperties:
     description: Shenzhen Hugsun Technology Co. Ltd.
   "^hwacom,.*":
     description: HwaCom Systems Inc.
+  "^hxt,.*":
+    description: HXT Semiconductor
   "^hycon,.*":
     description: Hycon Technology Corp.
   "^hydis,.*":
@@ -578,6 +584,8 @@ patternProperties:
     description: Infineon Technologies
   "^inforce,.*":
     description: Inforce Computing
+  "^ingrasys,.*":
+    description: Ingrasys Technology Inc.
   "^ivo,.*":
     description: InfoVision Optoelectronics Kunshan Co. Ltd.
   "^ingenic,.*":
@@ -598,6 +606,8 @@ patternProperties:
     description: Inter Control Group
   "^invensense,.*":
     description: InvenSense Inc.
+  "^inventec,.*":
+    description: Inventec
   "^inversepath,.*":
     description: Inverse Path
   "^iom,.*":
@@ -1010,6 +1020,8 @@ patternProperties:
     description: Shenzhen QiShenglong Industrialist Co., Ltd.
   "^qnap,.*":
     description: QNAP Systems, Inc.
+  "^quanta,.*":
+    description: Quanta Computer Inc.
   "^radxa,.*":
     description: Radxa
   "^raidsonic,.*":
-- 
2.34.1

