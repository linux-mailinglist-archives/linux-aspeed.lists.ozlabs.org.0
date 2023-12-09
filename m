Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD75180B3BE
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Dec 2023 11:44:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gbiXN3Ry;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SnPlK1hM2z3cjf
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Dec 2023 21:44:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gbiXN3Ry;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SnPl94LH4z3cBV
	for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Dec 2023 21:44:21 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54c79968ffbso3839000a12.3
        for <linux-aspeed@lists.ozlabs.org>; Sat, 09 Dec 2023 02:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702118658; x=1702723458; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4Hqs9/ZrITwFhPupOGW4Vaim70WWGNp01DNqeiJxRM=;
        b=gbiXN3RyFn/ZTunyOblVlBAQhfIFuDqTOX/2d5ngW11udzORrJYQHnlCbDunbxiIxB
         TaZECRTSWpGbdMuhk/S05AQbtVohdMt6EYhmUU4pG0DqR80zou1I1bTYLWY5BpC2weSc
         czyRoq5zwKwawkCwdAZc+U1Pb7peg6fMzOWpk+j+6KCngKHU91PLvk8CrPgteEf17T8b
         yACily6UNuVmaA4DtK/iVEqeVarqIqHaXXbs+0zThh9VAN17apw/OaopieChqCQzIFtm
         ErVCeEUtM38IP4RAOihFGJNrlePiTEe9Hboi0k2VeRHKLVgr055bTaQLvO5KVgpPWtmb
         1WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702118658; x=1702723458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4Hqs9/ZrITwFhPupOGW4Vaim70WWGNp01DNqeiJxRM=;
        b=OUc4Y1eEtwQyGa9jEDUAWaowphXmX1+Be7kVbmAMx3SqhOY3EDOSMYPB1V0qSiL1aN
         tjuPVz6lSQ1nU/08yQFan/Esv93rONpE2d+k9TpNNjGeIRJ3qHNp5LVf/wVrF6cv3x5m
         Lzfg2YZpIgHHjRnbp8vZim+uLmbps4yXeaKO6ytibHuhHYrqfnemW5y2gdXoKeXUtTLK
         lCxxnFHt0TiLTFTCDAtWJUewVYl0gIcBAhlj2xzKW2e59oRENxEppcyshMS/cr415yT3
         3btW+R36rSqWIUZSe6gmWIxQV+RXq8gwCfDyB8Y5Jc3PJUtfhoeQWIfNMRy9jHuU4ZrZ
         D8eg==
X-Gm-Message-State: AOJu0YywTEZdRqrANR18dad+28ReSkWIJjMBm+h43AnkrXj+N/gbLXzz
	TnB8uX73wPvFSYKLqp/3tEbqTg==
X-Google-Smtp-Source: AGHT+IEkzNG9N1bAbnaeGgMfxxB2TwMSICgsr4j3JwI3MWSMFxSNj17nraBpbbXjUP70L03CqcJXNA==
X-Received: by 2002:a50:8a99:0:b0:54b:28e9:b283 with SMTP id j25-20020a508a99000000b0054b28e9b283mr717390edj.14.1702118657731;
        Sat, 09 Dec 2023 02:44:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id eh12-20020a0564020f8c00b00550e21a4f76sm349604edb.8.2023.12.09.02.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 02:44:17 -0800 (PST)
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
Subject: [PATCH 2/4] ARM: dts: aspeed: minerva-cmc: correct Mellanox multi-host property
Date: Sat,  9 Dec 2023 11:44:10 +0100
Message-Id: <20231209104412.12916-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231209104412.12916-1-krzysztof.kozlowski@linaro.org>
References: <20231209104412.12916-1-krzysztof.kozlowski@linaro.org>
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
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
index f04ef9063520..29f042a47e96 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
@@ -51,7 +51,7 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii4_default>;
 	use-ncsi;
-	mlx,multi-host;
+	mellanox,multi-host;
 };
 
 &fmc {
-- 
2.34.1

