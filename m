Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C980B3BF
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Dec 2023 11:44:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=naS9LdBN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SnPlP5Tjlz3dBs
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Dec 2023 21:44:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=naS9LdBN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SnPlC0NzGz3cfy
	for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Dec 2023 21:44:22 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54c4f95e27fso2677029a12.1
        for <linux-aspeed@lists.ozlabs.org>; Sat, 09 Dec 2023 02:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702118659; x=1702723459; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BCoGI7s/gCFS6PWgnQhz780oAr1iVhq6zVeEGwbfs8=;
        b=naS9LdBNM9e86U/bioGsa0bhAmEWvDTO/kzccsINnvdt6cZob1x5+DGmfRJGzJAa3/
         /Fa8y9lhy/moSHTnFGv25sRVNRB5i2QXZiWdSMqyMY4SVNGEe13+PqyvhsikfWEmXIx7
         I7Z8VgexhzVNiz8knqi3wlltC03GtcqmFlfS9wXHabmYdaqkH9L3k6fXIN71XAWZMOQA
         gHQ2BYFtnLSYTlsxsZLDMzzZL/QTf/DJbcjBdXRiMZvzW/z86YEiBQnUYXbtXUnXyg3W
         06KKvFhCY+/BQfTfbPtjxdd29Txg2jtuafOkOmWWnVmMDwxmGDlX72lkI6JMV13C1R0z
         1hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702118659; x=1702723459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BCoGI7s/gCFS6PWgnQhz780oAr1iVhq6zVeEGwbfs8=;
        b=BJN0yqnISeSOVfLMPo7Xmpva1AxMDbATtYHQ30VOT+sdgc/OmloYg0NooZEKJCNnCm
         Uulk+r232Nl70g1V8I/WZJm6F1QY6mqOUtapiWR5N3hujgbRCXeBw6RmKlq2ECx5zxAk
         n+hBAwJB9oje+06V5dx7RZK1prQFYi8DZ/2LqShbBwzOiUGwCFKTs+Kub1lLCcjjxNvX
         QspHxAAZ5pdLQ4kAfS4uZMts11shvwVZJ9Y/5Xw22DlJphoFcBeMARFEsCLB1ehwmDwW
         kWJmALyg4RatoTk/msYW9jHMGF4dwFp5a35WIlABgxRWgzgRtDENnUcZzu6AqsyxZhrG
         xqAA==
X-Gm-Message-State: AOJu0YxFa8zPc+R+T6DKGBwT/N+3d72YZGyJPo/TP0WrQSvHpddwvSS7
	afXum1V/eqiUpTqZa+K0dixlig==
X-Google-Smtp-Source: AGHT+IHKXydt6szGsD9Uw4tFNlKvRW/prO21WATDg6wz6AXTumqPVhK40FOV2/2+4YdghH02q1yM9g==
X-Received: by 2002:a50:8d12:0:b0:54b:2894:d198 with SMTP id s18-20020a508d12000000b0054b2894d198mr1011540eds.4.1702118659237;
        Sat, 09 Dec 2023 02:44:19 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id eh12-20020a0564020f8c00b00550e21a4f76sm349604edb.8.2023.12.09.02.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 02:44:18 -0800 (PST)
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
Subject: [PATCH 3/4] ARM: dts: aspeed: yosemite4: correct Mellanox multi-host property
Date: Sat,  9 Dec 2023 11:44:11 +0100
Message-Id: <20231209104412.12916-3-krzysztof.kozlowski@linaro.org>
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

