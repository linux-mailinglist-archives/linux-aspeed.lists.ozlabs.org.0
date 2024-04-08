Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A0957904
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHp6GzVz303K
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SjVz6FVz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCtsq1V3Gz3dBn
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 01:53:17 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a44ad785a44so546173366b.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Apr 2024 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712591591; x=1713196391; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMMzpPgaja57dJ/QOl1X3xfBEKxBkGZzp3htau/BjRY=;
        b=SjVz6FVzS/ENTR53SDnatxPqLZM/hWhxJkSklogQAAKzhA8bePK6bL2gDL2qUnPNvg
         5UeEMDOTUcJhVdJwsLB2hA9dRmFPEvOH5bo9Ip3Vxu2quedLledsu8BNezoqA1Pq7OmG
         pCNhxzkV7czHUJmbJtxX4HE9dtpiObjt9UfDN1UkatFnkvk1SRmj6fB9RCw9lHLO0FAc
         27zr1kZkNmScytnu0JHh3sTwqXpi3Zi54LEwf9LbhiR7ZOHV39Iu74rPMfAD8BNiCVOy
         Ia/zqH2EgIf/tyi/5kLr8utY96gOvubWhX7N6DqcmyakjYcGdx4V5SSwuyQi0WFbSbAl
         U15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591591; x=1713196391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMMzpPgaja57dJ/QOl1X3xfBEKxBkGZzp3htau/BjRY=;
        b=uqq9tk4Px0FBvhM04w3RfsjGYTbn/URIt0o+8p3tGE7eFnKZz2SNk6xI9o4EzLzlBm
         zeHyJomiI8dgLYXRUFpCvmuAW6bll3vSYGf6yEQ8dyizVmYFSRrdla3GiCChV6DCMbuB
         F2OZwTgrJ90PkBJtk4PnS4J4GLtpA3HFt0cIupeSq9yWxO+b4dK7ZBs0yi4FhmGXywxQ
         Jvi+H3/VPLLCt7bcRnnkclzV5iw7cUhwgYMRgTb7zWS+F5JCPfMst0ekacVa/1Md9EPq
         eR5UHgSTBX8gKYKbD7hz+7wsO+JZulnECpZlAYKdwl4nFFjXqDqSvOCsRNtE14bwEOFd
         nD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVY/rJs4xqGFzqbZDVwzb2r6CZ2pUfx//Upz0/fDevuom1j1OxGHPJzL0axX8cFL0n1CDy9rx29V6+bZFFxL/itPDyEcgmiOy5CjLFwog==
X-Gm-Message-State: AOJu0Yyv2Q5Po9HsowEgTqb0povuOhckkPnAE9w5V/UUmM6t1lVzCYRV
	EPdU6kTxyQJv2tCn6M4kEPZmPpd9nbp56Mo0rVwPTuk6OrzPSNXT
X-Google-Smtp-Source: AGHT+IFLOo9Lg9B3qIOklTKOZd0LvNU1njK/wu05Sxkr5yVm3kefeiWUgywKL7V+AzBxsRaFEqHPcg==
X-Received: by 2002:a17:906:b19:b0:a51:d19c:aba8 with SMTP id u25-20020a1709060b1900b00a51d19caba8mr2466641ejg.20.1712591591195;
        Mon, 08 Apr 2024 08:53:11 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:10 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:01 +0200
Subject: [PATCH 1/9] dt-bindings: rtc: orion-rtc: move to trivial-rtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-rtc_dtschema-v1-1-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1761;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=hBd9i56nvCzyVs8yanPT9S2Cyv5djpJ1RLlYTOAQDRk=;
 b=7fLnaSy2d1QTC1X9rDdRmPK4NxyIq/8k0OfRmCyhOdL4+L4l6InroboEy3X1aqCBh1Yh2+xlS
 q5z7AlDDx3nB+S8LjphJkGb7U1aUoHLT6vOelE+aTDV7mVFf8o3lo5A
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

This RTC requires a compatible, a reg and a single interrupt,
which makes it suitable for a direct conversion into trivial-rtc.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/devicetree/bindings/rtc/orion-rtc.txt    | 18 ------------------
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/orion-rtc.txt b/Documentation/devicetree/bindings/rtc/orion-rtc.txt
deleted file mode 100644
index 3bf63ffa5160..000000000000
--- a/Documentation/devicetree/bindings/rtc/orion-rtc.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Mvebu Real Time Clock
-
-RTC controller for the Kirkwood, the Dove, the Armada 370 and the
-Armada XP SoCs
-
-Required properties:
-- compatible : Should be "marvell,orion-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: IRQ line for the RTC.
-
-Example:
-
-rtc@10300 {
-        compatible = "marvell,orion-rtc";
-        reg = <0xd0010300 0x20>;
-        interrupts = <50>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index c9e3c5262c21..5e63c8f7f618 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -45,6 +45,8 @@ properties:
       - isil,isl1208
       # Intersil ISL1218 Low Power RTC with Battery Backed SRAM
       - isil,isl1218
+      # Mvebu Real-time Clock
+      - marvell,orion-rtc
       # SPI-BUS INTERFACE REAL TIME CLOCK MODULE
       - maxim,mcp795
       # Real Time Clock Module with I2C-Bus

-- 
2.40.1

