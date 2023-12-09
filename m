Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24E80B3BC
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Dec 2023 11:44:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yMS4Oa+o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SnPlD5nydz3cTH
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Dec 2023 21:44:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yMS4Oa+o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SnPl76zD1z3cBV
	for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Dec 2023 21:44:19 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54c79968ffbso3838972a12.3
        for <linux-aspeed@lists.ozlabs.org>; Sat, 09 Dec 2023 02:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702118656; x=1702723456; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jtN/02LS5E97y/eNJTai0WYBoLVbIzeuypbCd6U1aWQ=;
        b=yMS4Oa+ojoOL99VTvMJ/CM9xNHI2PmwFCk0QpfNuvYAhwPAIqVyEP4kivXrO/sYT4B
         G4vBfeImTptHLBGaEgfrCR4gG0sdFQQBMDkK425zbY4XoYo9oJBTiEmas1fWrjDBiXWV
         BUJ8MMKR87WP1ry3p7euA2yJeOX7WO9M8zD8yXUNahXb9fz/LPirIJlhhS3QrJ8OvEmU
         g4xJ2CCZR86COJarkKcalEGb9on77hoH13t6USA66CaSE8N6BCOKQabm9enwibeLUmyP
         dtP8n+VfwinldDynECyW3MeGaA+EsgXXgEKeatV6pt9D+m0AAI2PadnXY9zGoKJq6Q3t
         xRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702118656; x=1702723456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtN/02LS5E97y/eNJTai0WYBoLVbIzeuypbCd6U1aWQ=;
        b=Jfaz47/dufhkUtakmXVRuApyCKfTDpsO5si43y3NXZo9S9b2VqD/ugZYmVyUbrtFjw
         et8IfhPqo26guacAg2bSKoQaVClGE6zvXsFSvckChqk0KanzpZfUeWMj//lMAvTHuyl2
         jXLU37Nsn0Gy/g7Wdhxc8mVzgGThHG1DSUGHHXNpy/jac5AV1zSpLI6Pq4B8MF4STvBP
         n3sdrGV45bBD1sY15x9ooIfcjAsxQgLG2TOTJ0DhzmO9G5bepsT9lhXlbm8ODjP5F7Cb
         05kSj71UzzMbvsXbSSjs5uKva1ydKk6qhQYBkryecfy4c9NC1hsRAjnLw2A9qJ1+ny3f
         9/Tw==
X-Gm-Message-State: AOJu0YxAH8Oc0mZIH4FvopTo9zp1CxzeKS8VajvTseBbPWCB/YKMUH5o
	Fgqro/uhnaJsMc4TGvvmgRwp8Q==
X-Google-Smtp-Source: AGHT+IG0NrZS0c4C0ix0b3pjL98TjBc1sefC79SI5ddIN36Yx4a1EYmrZ64aGRIjRluE67nicf7OAw==
X-Received: by 2002:a50:aa8f:0:b0:54c:4837:7587 with SMTP id q15-20020a50aa8f000000b0054c48377587mr948749edc.51.1702118656099;
        Sat, 09 Dec 2023 02:44:16 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id eh12-20020a0564020f8c00b00550e21a4f76sm349604edb.8.2023.12.09.02.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 02:44:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: aspeed: greatlakes: correct Mellanox multi-host property
Date: Sat,  9 Dec 2023 11:44:09 +0100
Message-Id: <20231209104412.12916-1-krzysztof.kozlowski@linaro.org>
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

"mlx,multi-host" is using incorrect vendor prefix and is not documented.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
index 7a53f54833a0..9a6757dd203f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
@@ -66,7 +66,7 @@ &mac3 {
 	pinctrl-0 = <&pinctrl_rmii4_default>;
 	no-hw-checksum;
 	use-ncsi;
-	mlx,multi-host;
+	mellanox,multi-host;
 	ncsi-ctrl,start-redo-probe;
 	ncsi-ctrl,no-channel-monitor;
 	ncsi-package = <1>;
-- 
2.34.1

