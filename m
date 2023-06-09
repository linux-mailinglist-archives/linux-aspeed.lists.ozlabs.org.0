Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D7E729C48
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Jun 2023 16:07:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd2wM6DTbz3fBX
	for <lists+linux-aspeed@lfdr.de>; Sat, 10 Jun 2023 00:07:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YE8YFric;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YE8YFric;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd2wD3rX0z3c7q
	for <linux-aspeed@lists.ozlabs.org>; Sat, 10 Jun 2023 00:07:37 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f642a24555so2314006e87.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Jun 2023 07:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686319652; x=1688911652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNpjcXkr4XdA1aEMYzKVhMl+Nwfx5E6NuXkWy4+942c=;
        b=YE8YFrictyQKV/0Cl7h8zFEtuwc7hRkTvM5tzIbYABx4wBQ5jtZMCL6mQzreu+5ebz
         abBtRCIS8OKn0uYYqFnbOfDZnB/pWbWdeDcKYCneD0m2ssq4JJuRcOpKyAmqmxovKirx
         SMZkCnCRS+3+BgAnK/qgGC7+izGZ7FwJpr5JiUX4GChVxO/vIgD3vOhpJ2orfferC/KO
         Sm2dKzk9Wx9OtGQ1OioUkw16OVkmHPvvCZg6iGxRJqAu4994PDXpSkROcAV3DgKIiyRJ
         4/k6d6ZuXyWrS02G5If7j0+FmP8SihgkAYk6ryC1gAX+5na0USk6hpaIysmvvczajfXO
         ipVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319652; x=1688911652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNpjcXkr4XdA1aEMYzKVhMl+Nwfx5E6NuXkWy4+942c=;
        b=DVv/GHSgBEpI0kYepPDw42SjwfrELDixZ4HbqbuTxXW0TJ+makJQshThGfZo0DT8NH
         vh46E9NFld3jnR7UPxwTpVk0ytqHI4SixiaypvVlhBUEE5TTX+aII5dFBk9se/AGftzC
         qv1/QA19TM6hob4qNYcm266dnArBy/cp6L4Nd8/ePGa+2MkuLEJFwtgxjAkgCX3QF98E
         CosUlbgDctTSdWihDTEDHmL4B2oCUYxilonsKib13085SfAgFpa/rufeXS4bdBNLhtRY
         ofPFZDaZem3WxV/s+7ac2qOFCl2Ux3p5dXwyDN/0+5vT4z8Ar2SD7SsbSvZ+rgRmLzau
         P+2Q==
X-Gm-Message-State: AC+VfDxO0fNjvUsqzCDDy9ryaLOv4EChagzsrTcE1yp525VGhHXz57js
	lpVofYAvykeOpINA+72y5kFt5g==
X-Google-Smtp-Source: ACHHUZ6tu0S7jpijz8wYA/H2VIUA9frrKVPVS0WyI8s8uHqseYj4pLDhHub+2PrCg8ZxcgNEya9nBQ==
X-Received: by 2002:a19:5f5d:0:b0:4f6:2b74:d05c with SMTP id a29-20020a195f5d000000b004f62b74d05cmr1033768lfj.62.1686319652088;
        Fri, 09 Jun 2023 07:07:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n24-20020a05640206d800b005169f9365c3sm1807036edy.20.2023.06.09.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:07:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Corey Minyard <minyard@acm.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: ipmi: aspeed,ast2400-kcs-bmc: drop unneeded quotes
Date: Fri,  9 Jun 2023 16:07:29 +0200
Message-Id: <20230609140729.64799-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
index 4ff6fabfcb30..129e32c4c774 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
@@ -41,7 +41,7 @@ properties:
       - description: STR register
 
   aspeed,lpc-io-reg:
-    $ref: '/schemas/types.yaml#/definitions/uint32-array'
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 1
     maxItems: 2
     description: |
@@ -50,7 +50,7 @@ properties:
       status address may be optionally provided.
 
   aspeed,lpc-interrupts:
-    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
     maxItems: 2
     description: |
@@ -63,12 +63,12 @@ properties:
 
   kcs_chan:
     deprecated: true
-    $ref: '/schemas/types.yaml#/definitions/uint32'
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: The LPC channel number in the controller
 
   kcs_addr:
     deprecated: true
-    $ref: '/schemas/types.yaml#/definitions/uint32'
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: The host CPU IO map address
 
 required:
-- 
2.34.1

