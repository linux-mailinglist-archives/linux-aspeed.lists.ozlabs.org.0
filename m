Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C63537096
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 12:51:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9wMb5HR9z3bm2
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 20:51:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XnLQXMKp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XnLQXMKp;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9wMJ0zHjz3036
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 20:51:22 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id wh22so16069390ejb.7
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XJgrJH6VzxB0NOaXLZBtk1kHMAiBhxHObc1OGkzyqr4=;
        b=XnLQXMKpQooMz0LTDfeVZdT/8jn9drtnO9/L6j+D1xBT8MtoAzTc0iKf8jGix8lFCm
         AvZ5fD9pN+kdlQsGFvXhjTGDGIafnon1+y99oPli7/5sPhhIM4T8tMPB6asn3INKX1F2
         07/hFX77ZLsSRzRIxS8AzsKIM+2jl5r3nYvMc7uBaQp+T645U24CIcGtLQc3vdRziiNg
         tdnRq4uFCsMgo7I07S7pvmduq0r0+hKZdRTh9/WyAfcjDpem9S+n576AxVlNn1te2dpw
         rc7QizFmjJr4DobCMx87dj5GZfWu5qp6XXzEelhK4FEshGLVW/LXmB2AG44u+ZU0SXyy
         XasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XJgrJH6VzxB0NOaXLZBtk1kHMAiBhxHObc1OGkzyqr4=;
        b=zuBUzGIACBdQzCdZ0SVVxb85IbU1nT5IkdyrZ/IgiQMbCGcB5aFLzUEyWUCtWon3tT
         /jOWRRH58j0TUZ8pOUl3jZz13ztQ5YuLC55vujSPxw1OLupOtHHPCvlxnGV/tneXn4le
         EN0GroQCsjtjYzbxujzgN0ipKR2aMUmW4kWQLjYt9UCOeJuWoCALxEnVK0NCF9euqc79
         j0y6vAVmZZPfTgPv68uBXLRYvfHmXtcafVmTB5m0WtqGU2/kRuOq98YOBJeFo8ZUNctv
         kn6oCYpFwleRg652HUHWFZoN9y+bmKZjJL0WPvWg+wreONXJnZKS5dtqQVuwnXIN/ayw
         nlXA==
X-Gm-Message-State: AOAM532V4CUfYCR2JMxpEnGlgk2WZNDJcskKc7Gripwkc4tHPZNynslI
	nvmVeKBojpsKY4FXZ3P45NXyvA==
X-Google-Smtp-Source: ABdhPJyzUwttMgry1SmKq5Na3w95F/0sEySpMkDPp6XdTA3g4+KDhy/nTw3ubEXRzeUmaC1C+vVb3w==
X-Received: by 2002:a17:907:a426:b0:6ff:6c9f:7a3a with SMTP id sg38-20020a170907a42600b006ff6c9f7a3amr2064184ejc.316.1653821477170;
        Sun, 29 May 2022 03:51:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w25-20020a50f119000000b0042b0fcfe966sm4746991edl.37.2022.05.29.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 03:51:16 -0700 (PDT)
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
Subject: [PATCH 3/7] dt-bindings: arm: aspeed: add Aspeed Evaluation boards
Date: Sun, 29 May 2022 12:49:24 +0200
Message-Id: <20220529104928.79636-3-krzysztof.kozlowski@linaro.org>
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

Document the new compatibles used on Aspeed Evaluation boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index f214b57d5ae1..fe71cb10ba6e 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -29,6 +29,7 @@ properties:
       - description: AST2500 based boards
         items:
           - enum:
+              - aspeed,ast2500-evb
               - amd,ethanolx-bmc
               - ampere,mtjade-bmc
               - asrock,e3c246d4i-bmc
@@ -68,6 +69,8 @@ properties:
       - description: AST2600 based boards
         items:
           - enum:
+              - aspeed,ast2600-evb
+              - aspeed,ast2600-evb-a1
               - facebook,bletchley-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
-- 
2.34.1

