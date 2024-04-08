Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25A957905
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHq0h4wz3bkf
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DhZ6ealC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCtsr66bFz3dBn
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 01:53:20 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a47385a4379so1039944066b.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Apr 2024 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712591597; x=1713196397; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSuQkBcadOBIFzAv5VWT53mPgt24650g8Yc46Jnu+po=;
        b=DhZ6ealCVz4t/CyeIcpSzUSiEVUIEr4VI+cCYtm1OQgyZ3XJ/OBhiM/qzSNXt8UU1S
         f/iK6xBa6zSf7oljp0cOD9ziufG6PYzDIVrGD+KXNMmvSQw6HVH3KUqi9t6Ch/aAJ29g
         SUBkg2VqmL7EuUQWuR6COxnQfNnq0GwOkhwBnZY75Mv9uWgDfekLa8pRJI5lViT7xxEu
         LGg7CywT0Q6kaK4WpNX70ikAYq1LXcHKR9bYELcX/8p57qYznRY1CgICm7730jYymUXL
         Y32kaWvMLGXDgwXjLle9Uwe8w2nDUmF2Shj1/dYOkSaV7Wlr4SDVXaH/QRggTTbVgIWc
         xQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591597; x=1713196397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSuQkBcadOBIFzAv5VWT53mPgt24650g8Yc46Jnu+po=;
        b=ge3SyKHrXq30v1YI+KE9qObPtmoPK9lsHjeepJq8EeazTyqcZSNtYuo2s7PT1QI//4
         FDc6iSqSnlapHShlWwFWr1u6xPuxrLkE8BKXVJwTYbNznW2EBsza++cAi9gsINFE6tYg
         otWVVA8dDKa5Pp40CmObQNtDoN2Fewr5ZEI6pfw1MJK0pHUv2JDwkp2GBL4MVV2xx+jv
         n6B6PGseiv0ulj8rn2XdfAmfVqtp8TLGzF9vTFb/H0Q8magAxet/Oiy4M2cIpwZQPebM
         rMEQnk8UzOYHJOZmvS1sqU/SARF6kfodpCxMZnNHSZqOwDvM9uCBGjvkLz8lH2nYMSM8
         RG7g==
X-Forwarded-Encrypted: i=1; AJvYcCX5NjdGx1MBj7Suw2gXhOpF6M5klISgZHKdG2xG7wG8cg6egvGe5yFL4YN6ElyLSzEfx+846RFBAhX10UxCY2dWBcjvhuXcNLJFn6ayWw==
X-Gm-Message-State: AOJu0YzX04r0ScfoCHbeoh+Am3V4xu3dzz/JHK4cdKQ47Hd9Tc1qGsOS
	XCiqXPMOlykBmbji99FDivuA641+btt2GI1SDb7PrCwOwt11faYk
X-Google-Smtp-Source: AGHT+IG+xooPJVfqxdhFca/m9VCSLYMJBFoaSR9jS3Fdk4ttcukr9i773eeoHIdSGYXmNnF/nymuPQ==
X-Received: by 2002:a17:906:fd8d:b0:a51:e188:bced with SMTP id xa13-20020a170906fd8d00b00a51e188bcedmr48379ejb.37.1712591596913;
        Mon, 08 Apr 2024 08:53:16 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:04 +0200
Subject: [PATCH 4/9] dt-bindings: rtc: maxim,ds1742: move to trivial-rtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-rtc_dtschema-v1-4-c447542fc362@gmail.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
In-Reply-To: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1594;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=zOZomgntzrvpzwsWCTBIKhRP00SpDrEpbkluseuFse8=;
 b=VG/4RZspITvXhEWAGam4EeebdbdnRgZkL5lRkdQjPLh+WlxRCuzFnJI7lPUjmco9VoyuOiVXq
 akjKl/hvaUaBliOoiWRR9Z/+c9DEfQXxUVCqUVbp5NFNzefeTmLd4wH
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This RTC only requires the compatible a reg and properties,
which makes it suitable for a direct conversion into trivial-rtc.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/devicetree/bindings/rtc/maxim,ds1742.txt | 12 ------------
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt b/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
deleted file mode 100644
index d0f937c355b5..000000000000
--- a/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-* Maxim (Dallas) DS1742/DS1743 Real Time Clock
-
-Required properties:
-- compatible: Should contain "maxim,ds1742".
-- reg: Physical base address of the RTC and length of memory
-  mapped region.
-
-Example:
-	rtc: rtc@10000000 {
-		compatible = "maxim,ds1742";
-		reg = <0x10000000 0x800>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index d6ce7ac29033..710b096fe6f7 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -49,6 +49,8 @@ properties:
       - isil,isl1218
       # Mvebu Real-time Clock
       - marvell,orion-rtc
+      # Maxim DS1742/DS1743 Real-time Clock
+      - maxim,ds1742
       # SPI-BUS INTERFACE REAL TIME CLOCK MODULE
       - maxim,mcp795
       # Real Time Clock Module with I2C-Bus

-- 
2.40.1

