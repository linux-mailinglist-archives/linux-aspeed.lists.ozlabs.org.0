Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D4788D989
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 09:53:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ul5/AHCX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4L7L6r16z3dwr
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 19:53:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ul5/AHCX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4L7C0dGbz3cGK
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 19:53:42 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5e152c757a5so3335609a12.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711529620; x=1712134420; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axYCeiGWmH5zGIGoROlm87X0Iv4FCoHgVdnjtyDTc9Q=;
        b=Ul5/AHCXLNr4UEEW4WtJ46aOIcKI4w3qBP5ZiVAJhxdDZHf1ih26y82z1sQBkXyyEn
         B9HVETAFxsi5X7GhlLqCmZ9DM21+zU7kAG4sPZNwR3+fvvymUiIP4hDp4PJvwVeCR/LC
         36x8FTTT0eY861lB9mHVvLifVgBv9E2Wv1x0F4jOyr6HvGrEXio0kXLgpr2Dn/L3r/JC
         c4LeyKmK7JQydjeUumfzOn4T3eTZmbZaIXOoQ4fdwfT2yOus3D6D3tGw6UwbkdmWdtxC
         DtVC9DKVp94OhsA78nOuKGHL+bw181rj+HrJRY3rgZwWKVs51mx4NGLe4FNIUqu2VZlu
         1t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711529620; x=1712134420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axYCeiGWmH5zGIGoROlm87X0Iv4FCoHgVdnjtyDTc9Q=;
        b=bMmRsxHUR703GPmKH0c8T9AF9Dbt6LOk48QxRAD9tqx4M/rMArXkHnGIsrEoV8xMwv
         mpSo2HCH8mOSnA1JRQOOMkmvjizUxJ9sr+spZ/1HC+Y0JF3PvZ4CXl461UZEL6V4l9jL
         4d/KD00cSNnINV3AuZgNQimyx4JHGE2beB55NFYsNg8L5tS3fDdCyqAIWujMsn+AZZ7Z
         26xR6ZMZPVrfaSpCgceVQ4iXO3eol79s9v0O9DQTZcNB+Egx13D+3cQEeXWyCDNGzFv/
         u0yt7N+BTZYIi0MI/E1hWqsk+7KvSgnAnbzHWUrWe9C7BFJOzQ9Ep7+++ZnDZhGGge6P
         5p4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGYN1S8cJ59xgflOvs487VL1exgtoAyUMuIfkxNaVJsBC+JueaGeK4kUpbc8barbcwwVZ70VukYrWO73GWtN2eS+CQhc7b1qoKFb523A==
X-Gm-Message-State: AOJu0Yz42/9h/nWAaEd6UZMdLvS8KDr4ZPfTLsUy6k+2EuCUnzpmdvMT
	ogvFjXjzLiSGOF9r2q5BEGAeZZptOJi4PQs24euycx9Ob9v09PPE
X-Google-Smtp-Source: AGHT+IGb/Tw3XGNhOyfvK3yRw4V3NFMG20lg3pc2PVS38GELaklkOPObegfstg6VozJB2qusMOgTAw==
X-Received: by 2002:a05:6a20:c888:b0:1a1:87c7:2d03 with SMTP id hb8-20020a056a20c88800b001a187c72d03mr2484994pzb.33.1711529620366;
        Wed, 27 Mar 2024 01:53:40 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e383-3566-013c-5a87-9abc-381e.emome-ip6.hinet.net. [2001:b400:e383:3566:13c:5a87:9abc:381e])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902eecc00b001e0501d3058sm8356848plb.63.2024.03.27.01.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:53:40 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] ARM: dts: aspeed: Add the AST2500 WDT with SCU register
Date: Wed, 27 Mar 2024 16:53:27 +0800
Message-Id: <20240327085330.3281697-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
References: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2500 WDT references the System Control Unit
register for its operation.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 04f98d1dbb97..5fd12c057c31 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -410,12 +410,14 @@ wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785000 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				aspeed,scu = <&syscon>;
 			};
 
 			wdt2: watchdog@1e785020 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785020 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				aspeed,scu = <&syscon>;
 			};
 
 			wdt3: watchdog@1e785040 {
@@ -423,6 +425,7 @@ wdt3: watchdog@1e785040 {
 				reg = <0x1e785040 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
 				status = "disabled";
+				aspeed,scu = <&syscon>;
 			};
 
 			pwm_tacho: pwm-tacho-controller@1e786000 {
-- 
2.25.1

