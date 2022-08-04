Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E69B589E3A
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Aug 2022 17:10:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzBwq2zzZz3bN6
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Aug 2022 01:10:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ry/Jo/Ok;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ry/Jo/Ok;
	dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzBwh4dNwz2xJZ
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Aug 2022 01:09:54 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id y11so31194767lfs.6
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Aug 2022 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Ls3wmwZc27FOQS4WF8l9pDgrn7cd87DuWOgr6YV+4E=;
        b=ry/Jo/Ok9+ZPG+82b0uF1vKq1QNAELdkGNfI7VaEYH0ZsY84RoECLsV8WP67WdFRyw
         7FJNlhQGiady5DovDtRe/sfuxxZjHPX975QQMmgsGbP5GChZ6/Gn11+R/RlNC/CeJxob
         ia3qIvsgLSgPGDjoR6s9sS1AH9cNjOSDO/lcwQEoV4qb0hRJ1T1mnIjOYH+DH8ZReSLf
         35MfUIXVLmklevioSRjGU3GuukTaX50dnOeYT0LhPhVQaIjtx4vU4jVM1Ed6tpVMgoZw
         ufTr6ccTJkc79a6LvE9SZ7WqUAqVyIq7d5qE62/EhMJGzVdjlhlsQWv1YzuKoo7eaOPQ
         sJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Ls3wmwZc27FOQS4WF8l9pDgrn7cd87DuWOgr6YV+4E=;
        b=oO1KoFwfna163glnjd18QmV3seFEwFeT0chw4grw/4mo8BSy9O0KY4VVkZ6jZZeoG+
         wHA5SLNU6vDu6ZMTjnH9COUzDoEyL1kXlwVeM+xZnX/STYBahk6vFoXPLJwUOOXDClxs
         sUblJcvBZpG1AVrgyDXYA5zpXvyHBFfj/i3Ed+UvK2GTNEGxqzSU3xW+ewGfR4ZgeG0Z
         flCg04dvUcYtr21gy69EupH273R6Sgb6LaZ0Nhaa+uYJK6cjoD9/YMQGq9XzYVko9bCC
         G+5n0mzUjiQTaYqasXzdJNnSnSUi0v1kCzME7b67mitU/V9mRwy4WwWX0sKLIRNqlDyL
         P/qw==
X-Gm-Message-State: ACgBeo186ZHamfR6KYkmCd61FB7rR/kJ2wiA54MAQ4yv5GyKLGfA19RM
	DmI3lm/YAFCFh6EFL4vlYT5JDA==
X-Google-Smtp-Source: AA6agR5X0yl7CVbndZJi7Hs/+Xnnpb6lNmxgp0Wl/kB+ntjRtZ+aQgTxPPqdoYXv4nAKYO2X3G1YBQ==
X-Received: by 2002:a05:6512:ba4:b0:48a:f185:db17 with SMTP id b36-20020a0565120ba400b0048af185db17mr790025lfv.107.1659625789282;
        Thu, 04 Aug 2022 08:09:49 -0700 (PDT)
Received: from krzk-bin.. ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id be39-20020a056512252700b0048b37d29256sm152681lfb.63.2022.08.04.08.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 08:09:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: arm: aspeed: adjust qcom,dc-scm-v1-bmc compatible after rename
Date: Thu,  4 Aug 2022 17:09:35 +0200
Message-Id: <20220804150935.121890-1-krzysztof.kozlowski@linaro.org>
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

The Nuvia DC-SCM BMC board compatible was renamed iin commit
7f058112873e ("ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom"),
so adjust the bindings as well.

Fixes: f77024c80147 ("dt-bindings: arm: aspeed: document board compatibles")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Use proper qcom compatible.
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1895ce9de461..4f0b308e9f0f 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -80,7 +80,7 @@ properties:
               - ibm,tacoma-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
-              - nuvia,dc-scm-bmc
+              - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
           - const: aspeed,ast2600
 
-- 
2.34.1

