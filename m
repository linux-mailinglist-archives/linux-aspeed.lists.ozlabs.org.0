Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C380E53C
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:54:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fu+JvufF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9r23LWMz3c4M
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:54:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fu+JvufF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qg6RV6z3bv3
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:23 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-286f8ee27aeso5568337a91.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367661; x=1702972461; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ub1Mj5QhW4GYsiqkx+k8Ak5A4JATw8yMZFp7nxSVbQ=;
        b=Fu+JvufFDITS17RRMn42g1ES0yHWhvimTp+OJ5mvwfWs0u5UHoZEdc9nF5lRkjt+H5
         4+corVpryGBTgSmR2Rkvha0bBCKvujXxzXiIHv3slCfm+UjA/Q9w682g35oKgZNjDKjC
         EAukSTR3R6MMrhjCiVuOQXAp0Da2WiwlmKrAtFB4axJkMRrM8cybTdmtCAAF3aG0ymkS
         UiCkEgPCGV3CYHH4IFEi/Ru4OIj//LjAP7w+MUQi0d0kJ7P2Z2UoIn/hpxo/B2aUCO54
         aK74Ey4VZkPN3PiB+C4biUSLLnichWR0eXkOmOvhZhBoC4VblQvagWhlJGmu1Sd4hPA+
         +NkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367661; x=1702972461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ub1Mj5QhW4GYsiqkx+k8Ak5A4JATw8yMZFp7nxSVbQ=;
        b=Dqa+YF2kirWWF6RgGafTvlAzIxr4VIBYpwJpE9C4BHOThWwiiKEXjed7EIjwqCVzMY
         hDMXtIgudEr089wT14ciCeIBTxesKa9Zpoo/RA6NRsedorKKkAQF0S8vm3jle2sokaYV
         tU2eEOve1YLfCyHRpQKWMLDQg5yfwFvnnfXg8JqdJUVPJF/Ya05H6mmQhk2jp3yu4lCt
         /GEHe4NlGmscgEonFaftt2KXJkf0v4YWW/RNbOlN4xtP4/nKDgIh0wA5GbmzbRMJyeiv
         a18UsHsJr4gUCaqWEsi6ee0mZCza5VjlTosCuTXYU33W46b7CeSNpY0sPv+O8yfZPE8q
         74fA==
X-Gm-Message-State: AOJu0Yzx7dRlTpzfyDj8B3iS0s15phmP7hfcVQIh3jpXKTvxOexFxFrP
	kM413duRSag497/2h2ljO2k=
X-Google-Smtp-Source: AGHT+IFc2GRXDPOs0KJgpeLIDeiYAzGM8hIgYjADbg0H7JznPz1hDW7A0FKXOTQVVBxbRjK3yXC14Q==
X-Received: by 2002:a17:90a:e2cc:b0:28a:c6c7:1eb with SMTP id fr12-20020a17090ae2cc00b0028ac6c701ebmr148300pjb.86.1702367661194;
        Mon, 11 Dec 2023 23:54:21 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:20 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] ARM: dts: aspeed: minerva: correct the address of eeprom
Date: Tue, 12 Dec 2023 15:51:55 +0800
Message-Id: <20231212075200.983536-7-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
References: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, Leslie.Tong@quantatw.com, EasonChen1@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Correct the address from 0x51 to 0x54 of eeprom on the i2c bus 1

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 783d4d5a8f3d..f2a48033ac5c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -123,9 +123,9 @@ temperature-sensor@48 {
 		reg = <0x48>;
 	};
 
-	eeprom@51 {
+	eeprom@54 {
 		compatible = "atmel,24c128";
-		reg = <0x51>;
+		reg = <0x54>;
 	};
 };
 
-- 
2.34.1

