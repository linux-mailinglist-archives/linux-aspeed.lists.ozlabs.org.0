Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFDB7A1879
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Sep 2023 10:19:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lEVnPna/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn6YX6j2Qz3c8v
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Sep 2023 18:19:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lEVnPna/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn6YD46Snz3bq4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Sep 2023 18:19:27 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40434d284f7so17716065e9.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Sep 2023 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694765964; x=1695370764; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77anH4uV98R6p4UPwYpneEAfgcMSfw3qxntLj+ymQb8=;
        b=lEVnPna/LIWhgSs3RLEoX7ZF81+kRr+8pFzqapgYHBd95QDrFI1XMV5Iyj825yY1sx
         oVoRPaBTjBWkhWnbt0NCw+8Eyt5wkN9zxZ+n+cfeG3vMqSsbVPb+04g/1fhSIRZkOOnc
         kPXtq+/6sCLe9XyvgI3A2tKuY2LKr01sLSgUscOId3crCbVUid1CWpZQCZyh8GL9w4M+
         hTiqmfMk5C+ZZCMmiZ0igQ3k+dQ8Oo/e0oE5A94EV67qPozWjXaFcdHYwYFGIT+Xj9aq
         eEFqdgG8OoATAZMiuDqn0kjzFmI6ijGlHUFMVjQ+zZDmtm1QiTynLpPTvfbyjHBRUU62
         9s+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694765964; x=1695370764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77anH4uV98R6p4UPwYpneEAfgcMSfw3qxntLj+ymQb8=;
        b=m6HniLrzvFe6RtXmklEmlOkxKerOdlw8P4en/3LUjKsOFKgKUGhoaFY8HvXgiNecye
         Pjw1sKPISHGUsiYcSXV72aQ4/8KtB/ZN5E22UC/5hojZP6QRQu2VheTzNctb18yrWlZT
         eyhBeQwHUV+h/FV6OyQ7aZX2oYTu4RwRyxYzHl2uoYTCRsdwBa6NbGihzBcntsYBpngT
         suLwDFRMSOdxJHPeiYcOcnONLXs++l4pu8QdS/Phk06QYQaiihcHtLzcxL1x1CB/4TEj
         3zIprQR05KXhQr781JYrNchI1Nrhz9xVMag40NN3/R5dH8imf4ztaNOG8t3j6HF92A2J
         mThg==
X-Gm-Message-State: AOJu0Yx46vf3DEpPOg3IowuAnwG2XzptC4VPNP3Mq1z41zmmNxc3Qxz6
	05SZXCUo4iEWHK+vqhouragLgA==
X-Google-Smtp-Source: AGHT+IG3Jrna4I9rGuIOCWNIxV2GoWQGl+gJXtGUwcHhgF0/sd3Xtw4tG7ZA7v5hv5q67vQCIpjOVQ==
X-Received: by 2002:a05:600c:230c:b0:3fe:d71a:d84e with SMTP id 12-20020a05600c230c00b003fed71ad84emr987853wmo.1.1694765964535;
        Fri, 15 Sep 2023 01:19:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id c4-20020a05600c0ac400b004030c778396sm6878763wmr.4.2023.09.15.01.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 01:19:24 -0700 (PDT)
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
Subject: [PATCH 2/3] ARM: dts: aspeed: yosemitev2: use proper "mellanox" DT vendor prefix
Date: Fri, 15 Sep 2023 10:19:16 +0200
Message-Id: <20230915081917.22368-2-krzysztof.kozlowski@linaro.org>
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
should be used:

  aspeed-bmc-facebook-yosemitev2.dtb: ethernet@1e660000: 'mlx,multi-host' does not match any of the regexes

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts
index 6bf2ff85a40e..5143f85fbd70 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts
@@ -95,7 +95,7 @@ &mac0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
 	use-ncsi;
-	mlx,multi-host;
+	mellanox,multi-host;
 };
 
 &adc {
-- 
2.34.1

