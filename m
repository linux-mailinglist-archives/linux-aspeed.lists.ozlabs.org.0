Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF889957910
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHs49Kqz3g0h
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kOqz3F2y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF6qs5xN3z3d2Y
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Apr 2024 01:55:53 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-56829f41f81so10000615a12.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Apr 2024 08:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712764550; x=1713369350; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jSeqduTcQGsgyy//ksgmL2wkqDSRJ2+W9of4aqh+v0=;
        b=kOqz3F2ySOF6ujdZYmXFiUVTINB6rT5+L+p2oQntORfbRs9fXpj09pwCmoPFcVPWwG
         CdIhinkmrD5Y0mqbrYM7Owa+0Jsl8osxvGGASt4l1Ri51gh7ChsRjz4pBS+gto0lJExD
         9OG74owi2d+r13te728bNHhBctRo1tVTX0cnu65DzYij3qY6Dqa3caEl0hUdyt5U2Mcv
         jv7PtCXHaWqT9Wg0ghcVVPsl1foRs3SVH3MTXFEe6U1XPRqjf9DaKM640ah8/WqPMyJr
         tfYOYHbgHhthSkTRat+JPDar2xE2x30sKdWhoRalmFd8sLfgzLZQtFDAwfUl5R11LJim
         vi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764550; x=1713369350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jSeqduTcQGsgyy//ksgmL2wkqDSRJ2+W9of4aqh+v0=;
        b=U3TEXonwMEwPw8atetVcZqNAH+gUfQrCrGu4jbu2Lclf5XsaRLYVUNsZbjVst8ex4z
         qIkyrqHyFvsD5SHlHGxRljtB9BCsTT8DugyEGAMbAjf2N8l+qvboaLurzkrAZlFsdCy6
         4u07y+uSQm24CR32X3NtR/XKt17n6mkLoFZQVd1KVJLGPmCAT17dXGdzM2sEmzEAHzMc
         pllmcZ7aXLoFnqdxMU5fUz6NAEluNPnUnFGUztslaNwAT+0csSberMPQ91tC80R42FQ3
         X4F19dbsMJCSGqqZORZMYOAPDi5WbPmiLWqYMb/SHeIBWqHHHOTdvWtQ/Pbyb9rvNpxF
         sJqg==
X-Forwarded-Encrypted: i=1; AJvYcCXqatE++5XWNS6BaNYzt17du/0qeqtdnWxyDcyUweb79GoHO5hN7E9qPDT/LUimotP4a8fAwpt+CeWOWgkiWk1vzQ4BP+o51H1wnQYb4A==
X-Gm-Message-State: AOJu0YyghaEUHg3rPZaIdz7CDdvU/LtgBLFcGnVbxPbFYqe26aZ0+xsb
	9spvcsbRn67UnLfwFPWc0YyKsGX3jtF2HeNFMIWeFcr4wROoEjP1
X-Google-Smtp-Source: AGHT+IHpKcHkzaocAzKrmqOnvknnOqrXFgO2SiOZTgXtv8v+e/D+kmcUtUHf56S5Bi+ZgUEYHg907g==
X-Received: by 2002:a17:906:fb11:b0:a51:9f5b:b659 with SMTP id lz17-20020a170906fb1100b00a519f5bb659mr1789622ejb.34.1712764549870;
        Wed, 10 Apr 2024 08:55:49 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id qw6-20020a1709066a0600b00a52172808c9sm279884ejc.56.2024.04.10.08.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:55:49 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 10 Apr 2024 17:55:35 +0200
Subject: [PATCH v2 3/4] dt-bindings: rtc: pxa-rtc: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-rtc_dtschema-v2-3-d32a11ab0745@gmail.com>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
In-Reply-To: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712764543; l=2124;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=MljIxyWTISU+l2odfMzkGB6VwOiZuuSwves7xqGR7H0=;
 b=+KJHEjpPSKgc0aYcDAt7jz8cMXuHaOsYXEx5xaxeDu98Mi3pAhR8m4a1H7J9Gj9c95Iq1CkTX
 C3b9IAdDAlrBY7JmKPRwT4zrKX9Ox8dBgU+omNT/BdB/TfsjCFwU3O4
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert existing binding to dtschema to support validation.

The missing 'reg' and 'interrupts' properties have been added, taking
the 2 supported interrupts into account to fix the example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 ++++++++++++++++++++++
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 --------
 2 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml b/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml
new file mode 100644
index 000000000000..43d68681a1bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/marvell,pxa-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PXA Real Time Clock
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: marvell,pxa-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: 1 Hz
+      - description: Alarm
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    rtc@40900000 {
+        compatible = "marvell,pxa-rtc";
+        reg = <0x40900000 0x3c>;
+        interrupts = <30>, <31>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/pxa-rtc.txt b/Documentation/devicetree/bindings/rtc/pxa-rtc.txt
deleted file mode 100644
index 8c6672a1b7d7..000000000000
--- a/Documentation/devicetree/bindings/rtc/pxa-rtc.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* PXA RTC
-
-PXA specific RTC driver.
-
-Required properties:
-- compatible : Should be "marvell,pxa-rtc"
-
-Examples:
-
-rtc@40900000 {
-	compatible = "marvell,pxa-rtc";
-	reg = <0x40900000 0x3c>;
-	interrupts = <30 31>;
-};

-- 
2.40.1

