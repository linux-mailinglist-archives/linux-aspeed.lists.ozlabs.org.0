Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1045899E7
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Aug 2022 11:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lz3KZ1z6nz30Hf
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Aug 2022 19:27:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p0GLltuI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p0GLltuI;
	dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lz3KQ1DQjz2xnV
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Aug 2022 19:27:20 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id s9so15531353ljs.6
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Aug 2022 02:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=28KYhVTag+j2JBtmvytZTw71Q/CcsBjx32UmQc4KhYw=;
        b=p0GLltuIZ2wwyn34RSyNzxiqdd0F4ggEEPZlR24YM1hlHFR9cLuy/PMcrInKVdvHpr
         pc+y6KogJLRRNx1vv/GA6wGq4ZbF84lKR5bma8Woz9HyD+EcTKdMqJFqEo7iZ5wzqOBw
         M9ghBItoBk30hQGPOIZRZL5b/uN1vxDsjE+mD1qG2aVH10WnPucAGka99AkVyEWl9uj8
         5lTuaNKR6I8k84BIvzDjnmPIut3gaN2Mwkr99qaoGxULf1xLqlX9VUTz1cIEoSDORT8F
         9ViC+sxCwigncPZbyBjz7Wx1ayGE4czZymaVJ8E4t3SKXIHxzsOTwIbhn4SCpy0zcoQm
         l32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=28KYhVTag+j2JBtmvytZTw71Q/CcsBjx32UmQc4KhYw=;
        b=YRNoq9rHP0W02kYfUEsux9wZsX5vPOmnYUwchZ8e9j/mpPj0OaDdSXHb6vu2sROgFe
         OQjemuLXQ2sRrhUzS7x60uS5ju2cX0WNbnseJp/Z4aCzV/RsvXJYCZBlxOBYPwPiGO6a
         MrY83ECaNrJV/UFdo+arauNuvWaqotn11CxWfHZTfmIxgHhff2KB4MI08tnt4VgqIDX3
         k4VEQ3Nc7dU7ir3Z3WQXaGm8w8it2xHncX59YjMdQQq0Jhb8w+eztyGHITGOdpVYDU2D
         58J1949LGChkl/xhRr4E+CslfggeBobqA/Ou++A3XijbB3wkH4a7xLtXDzcudCF+n21c
         VVRA==
X-Gm-Message-State: ACgBeo3VuFORfcN6AX6hiJU/cC1EGnJqQwm1E39kCvC5ODLt2LCm4V/O
	VEwEjSP4clba9ooAQEPmWXcR8Q==
X-Google-Smtp-Source: AA6agR6LQs8Dxh2DfyUwdwGwwOspgFjtcqDb42faNaU0poHFNgTwixRzCFLPmqip8KSu19pgH6dQBg==
X-Received: by 2002:a2e:93c3:0:b0:25d:d31f:ef1b with SMTP id p3-20020a2e93c3000000b0025dd31fef1bmr284211ljh.102.1659605234655;
        Thu, 04 Aug 2022 02:27:14 -0700 (PDT)
Received: from krzk-bin.. ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id h16-20020a2e5310000000b0025e42641a32sm52437ljb.123.2022.08.04.02.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 02:27:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: aspeed: adjust qcom,dc-scm-v1-bmc compatible after rename
Date: Thu,  4 Aug 2022 11:27:10 +0200
Message-Id: <20220804092710.64636-1-krzysztof.kozlowski@linaro.org>
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
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1895ce9de461..20469519e497 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -80,7 +80,7 @@ properties:
               - ibm,tacoma-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
-              - nuvia,dc-scm-bmc
+              - qcom,dc-scm-bmc
               - quanta,s6q-bmc
           - const: aspeed,ast2600
 
-- 
2.34.1

