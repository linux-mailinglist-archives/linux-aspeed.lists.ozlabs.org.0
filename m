Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id E35098CE4A6
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 13:06:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=CWm+xpiI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vm2B56wCfz87Wn
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 20:59:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=CWm+xpiI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vm29t30lgz87W5
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 May 2024 20:59:44 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso7932651fa.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 24 May 2024 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1716548381; x=1717153181; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yP+35eRZqZ4WiMnuzTxJyTRhfiCcTNB314PeuCIhpmY=;
        b=CWm+xpiIGUHycUsc2tubliJTtnXwMqJ3yBn8i0rQqrL+yyaONd41tB1BybDZ1M+NVG
         DtNOPP8I9FNAIOdyeNu2xjGyFHHwYjMVWDSKhPmv3jgXzeHS2ono68L4jl7i8Nm91a8a
         3ZhsPt/fUqDQ/OxBc3pQvbRQKyoaPfc2NLdmg8zLl/Sh3INmWpul/VbrluQkmzYGXqoD
         zKzyV95va/tIr83bVA83qRXOmPXVv3z7dC0LdSwUygqzGk8zQ1KfxN0OTA/WdolgCZsm
         paPBDG+xy57pDhvTHvALGQ7Q7fV9RpcrMHcXYQrmcvuFri3M1OImBW7QcgLa8OQSASpE
         Xurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716548381; x=1717153181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yP+35eRZqZ4WiMnuzTxJyTRhfiCcTNB314PeuCIhpmY=;
        b=cNu0u4h4C7cjp8ivU1hKPQHG6b3xD9oc7tmqJ6bv0nFHQSLVXbojz37unDeCVWvqsT
         W3Oc0RO6hE/YBvEatPaBcC0UVws1BiajXkEsBulngjRCQQ/oS3i6qnsy5yX11FAJWjNQ
         5iDF8M3XPNDhpA4epZBcAM5W2gJztLn5xY+2V35ytGJtQyytgbuf/02PEtaLVyHksv0L
         umqclAaze+4AYcouiSOwNr7lzPzmvHeKIZjGhWXKEJMc2qqSVjMgPlHE4isFg1A6fbTp
         EndsMFe3vMiEhTM6KOLjMznqDBVCdG4dgxFEXOAp58uXVCJJ/1BCd+RqODWcDoFUdVBr
         ggfA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ9H2NgtX7eIkqPMORllmKqV4PZ+G9+XHfywmQYTEdMhy3pFOXtAax4n1A0QB/iYY4Wo9RGRYtJF9M/JHMDBVDE2Ge7eLeDvBcR3ONnw==
X-Gm-Message-State: AOJu0YyfY7JhIqG2dU1WUImYo27nSt8YTtfIkWNpagwE3jS+3AVaJaoW
	RSyrul1hXCdzzszvabf0EOfKk35jSE7fp6EX98xRI9d9s27gUqEVOnZEl5QJ5I8=
X-Google-Smtp-Source: AGHT+IGK/BLRQXataXUt6EPhmbkyqO5rhkY7srRTdSk9qHDfilweWDrpUOv1g25WtjZeg6fxNjakXA==
X-Received: by 2002:a2e:b70a:0:b0:2e1:adc4:47f6 with SMTP id 38308e7fff4ca-2e95b0945d4mr11424051fa.6.1716548380802;
        Fri, 24 May 2024 03:59:40 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108971393sm17396985e9.19.2024.05.24.03.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 03:59:40 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Date: Fri, 24 May 2024 16:29:23 +0530
Message-ID: <20240524105929.557129-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Naresh Solanki <naresh.solanki@9elements.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on IBM SBP1.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 749ee54a3ff8..307232336629 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -83,6 +83,7 @@ properties:
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
+              - ibm,sbp1-bmc
               - ibm,tacoma-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc

base-commit: d976c6f4b32c2d273d44ff9ad7099efe16279a39
-- 
2.42.0

