Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C180B3C0
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Dec 2023 11:44:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xloxyzJe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SnPlV0gxhz3cQ4
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Dec 2023 21:44:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xloxyzJe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SnPlC3gc4z3d87
	for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Dec 2023 21:44:23 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54dccf89cfdso3535390a12.0
        for <linux-aspeed@lists.ozlabs.org>; Sat, 09 Dec 2023 02:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702118660; x=1702723460; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlRF5ESN+8f4udkYKhzr8luKmrU8RaKXvO/JYQMW7WI=;
        b=xloxyzJeIXlPmiuskSyXd0b4eNC64yq/qZ1TuIlB+bjSQhFeP0EHwQM+qc97w9OVM7
         wf7ABt9Ij4wUNVwhA429TK2U3zMTuUN7zlS6FrJDmQluM6xZ26zTWSOYlG6wwrGkbe3C
         v0o7VbV3WLXbmn/fkFQ5D1X8sGO65MeJjuj0EntLgBVUCi8PnVa76Zsn9K592u7uovyt
         VDDbChSU8zGHreANQrX9QhY+WD+KnqNjdql1SVIZdc+Q6oWwomjoHGJAQRlKlfgu3KTv
         SSs9s4XJmWG79x+ZV9ixAvPG+pkTS/pkuuer1kS991/5mrszxf6FgzPNoli7C5bbxagQ
         MLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702118660; x=1702723460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlRF5ESN+8f4udkYKhzr8luKmrU8RaKXvO/JYQMW7WI=;
        b=EQFtQ/xLGq5F6dEWReHF7nycdHPCnu/XVGHrJRRcbQEHj09Mgslw62ahvmR/F9Smer
         NErnCCsWGN/QHqVJa8CrJjpQ3/ZCztx59qDgb1ObW0POcnd7WwKqmdl72zeje3m3ogXq
         HRTOYYMiB8BUL5sGPCxt/AGyWvXmTDYUTpKeCZxrInItNeIT/8XkwNqVJvRrea45H5DE
         hO1FrHY5JVLSqEecgX4QQ3C8HywvApKh8sz5HhAdYxC6wfpxEfW5npHYq+x7ms1QEc8i
         f8YTd570/i1BDbjymbYcveQfJS4xpfq9uTF4Bq/OxPe8+fld2sKrm3fcd/QCp+JMIQVt
         +xMA==
X-Gm-Message-State: AOJu0YysZZOyvj96qhTRZNNcay9rBuNoIaX1XaPY8kEzqbpvI/FB6aXN
	hDBLHdiXK1UZW7xg8+3L+lDKfw==
X-Google-Smtp-Source: AGHT+IHda76JkbbrEN5rBMhtlIG3Ox0CJOlh8Z2lE6T50ouOps31F6tLOfl570vTj7LIB2OLM+9I/A==
X-Received: by 2002:a05:6402:2152:b0:54d:412:c8f4 with SMTP id bq18-20020a056402215200b0054d0412c8f4mr705393edb.84.1702118660737;
        Sat, 09 Dec 2023 02:44:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id eh12-20020a0564020f8c00b00550e21a4f76sm349604edb.8.2023.12.09.02.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 02:44:20 -0800 (PST)
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
Subject: [PATCH 4/4] ARM: dts: aspeed: yosemitev2: correct Mellanox multi-host property
Date: Sat,  9 Dec 2023 11:44:12 +0100
Message-Id: <20231209104412.12916-4-krzysztof.kozlowski@linaro.org>
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

