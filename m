Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8CB7A187A
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Sep 2023 10:19:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RmjBIjbO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn6Yd0tt7z3cGq
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Sep 2023 18:19:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RmjBIjbO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn6YG3GhMz3bq4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Sep 2023 18:19:30 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-401187f8071so12466445e9.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Sep 2023 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694765966; x=1695370766; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMmVp1YvywRgwqXV3K4o6cwT625G5ebxBNdHP9KsYLE=;
        b=RmjBIjbOcMH6WqX/DRG47G9A/Qt+i4sAuoks1UhiWcG68IQWlfb5+qrDY1GPAwBChm
         S3qghsM4kU+jyz/jukdmb55yJbcxEYlkblkJQRIxZdCEtCdy3P2dRK9QrXvirrsT1xMO
         8GohAEp8qgbNQA0kuQTDNGUgsJRBrpfqi3SEqbg6FowR1UrRK8iloKJ9/1FHvU1POnwP
         vh/+9F3A+TD592BYTgPLa7kuaGUxtalaCny+ZTGH9jiS4OVeRNCZIGOLzsdVLoJfa0q/
         ODUIhCfiOeQ6/49n1Uw4oGdNSYe1s0l26Ae78qrodcl2TYeH3L+5vpsJtUzxnjaupK3I
         ksgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694765966; x=1695370766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMmVp1YvywRgwqXV3K4o6cwT625G5ebxBNdHP9KsYLE=;
        b=F+chyPJcdnupXV2W6g7t3Fbu8P0tyXyOA4upbQhU6+G97fdHGovIetx4vsoS0/G6WA
         VolJpUc5EeSln2zLDi+gbmgjIwjWA0oRyMEgYv1TxcqP90+G1JdrAWrTPgi0RYd3mBMK
         XATkUT6hgA1PgFUgw/ao2h8QTy8AOI13C+9zLrum+QY5KrebUpn6EEcZjWgd7Lmq5b+/
         Eo1UyDlnr/kj/5BU9CHI4xnnnSapkjpg03N4zBygIhmS2q5+UJa+902HMhtljeZxj+Y+
         j1tHz4JuEoUmpgh7nIDR1+MGUcig10SWa5TSPc0xWSi0pKKIAUWv7SpOCGGEfhXomQcN
         InHg==
X-Gm-Message-State: AOJu0Yw3KcG4ax8vqYZvISHejGRjKBIiBqvHmGdU4P1AB0TuT6T+bLcM
	8cIYjaTSUFp9Vz4r9S6cC2uskg==
X-Google-Smtp-Source: AGHT+IFwQSiNq1oNuKceanpbwe42c14OOgztYj0a+8pFp4H8DTwizyq3b0t8wEPIZAL4bdoQY0rzpg==
X-Received: by 2002:a1c:4c0a:0:b0:401:b307:7ba8 with SMTP id z10-20020a1c4c0a000000b00401b3077ba8mr639336wmf.13.1694765966288;
        Fri, 15 Sep 2023 01:19:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id c4-20020a05600c0ac400b004030c778396sm6878763wmr.4.2023.09.15.01.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 01:19:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: aspeed: yosemite4: use proper "mellanox" DT vendor prefix
Date: Fri, 15 Sep 2023 10:19:17 +0200
Message-Id: <20230915081917.22368-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915081917.22368-1-krzysztof.kozlowski@linaro.org>
References: <20230915081917.22368-1-krzysztof.kozlowski@linaro.org>
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

"mlx" Devicetree vendor prefix is not documented and instead "mellanox"
should be used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 64075cc41d92..1bd555a6c3ba 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -88,7 +88,7 @@ &mac2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii3_default>;
 	use-ncsi;
-	mlx,multi-host;
+	mellanox,multi-host;
 };
 
 &mac3 {
@@ -96,7 +96,7 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii4_default>;
 	use-ncsi;
-	mlx,multi-host;
+	mellanox,multi-host;
 };
 
 &fmc {
-- 
2.34.1

