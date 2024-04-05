Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E478995C1
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 08:46:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sNjTwwSo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9ptT45kTz3vXp
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 17:46:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sNjTwwSo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9ptN4g8Fz3cZB
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Apr 2024 17:46:34 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-56e1e6e1d01so1923908a12.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Apr 2024 23:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712299591; x=1712904391; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+UqM3H8PVtmZJzWNwLXI8j0aa2hbrCpkSPJmFMLYHA=;
        b=sNjTwwSocTU3s66j4Mae+/s5bUICVLq6CKGKG5c0UObfooVsSDGDnXDub0jspdb863
         HgdfviQBS+ZgOInike0BtyVWgMvKjgmEjHj49NkW7SBYCclLjqT2pLJwbaF3rSct2vyk
         LSuZ+C5NjDHKeTqrBhRSDj5H04vCl+jQkfTR0NMe6cfRTo/mLX/NYu8Pl8wsplq+cr+m
         OXm2UTIYclk8ujihLeJdlIw35QvaOZoP+gz27/AWKGm98BQNsl39l0UU5VMjAVeLpxst
         p8pDBYq2hNEGiFz6IbX0LcyCW2MKhVr8NDIqWiWq6xkrF4J6q68zD5WNK2Y30LI1tIsp
         F76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299591; x=1712904391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+UqM3H8PVtmZJzWNwLXI8j0aa2hbrCpkSPJmFMLYHA=;
        b=pHBBNSClH5sF+buULP0iQfxMMGY6tzlSbNXe1RUByiXMjt/J5SWJzLNrhMgkKDMssM
         3q3EbLjnE7jirt/QBgOg1NZCONNiRkq72c0lZmDvPo4Nws2d187P4U5XHP9w2p0mjHDw
         WYjd9V3ni825CcuI3+gQDDTAhd9jTMByI1ia2TnjCeJXRKC+koelLjgYmeMusjnBi920
         sV8D4TNdArAI1b/g3HdvR/KgXGQt4DLW5QgRRFNZDELWYoHEmnHAmWBGM1ArecxXiwoq
         5rJiQztcT/d3QkgPWHn8N+1kO+JjqpzEDw0eNYTcWhBtUqX6BXpYQpH/3E3qp/HqYVVE
         u5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCV7DcumzeihIXLBkbH+07glw95lgrzLQ0l2FB5qf6RWCu0WOEXhVhXSHczJqM4Emj6rnPRfptHco/MPXSYz2SBeFGmtwu2meUtDcnezVw==
X-Gm-Message-State: AOJu0Yxbkpm955WTApjuPGsst/e8Sqc/7QuDCOfcQEh9oIomLlegvnDF
	7ZxSKjURJjfWhZjeKZ0ftGFG+RPTfMMAyNEXuXNYkaAR2Wv3J7gRy72fpZw4T9o=
X-Google-Smtp-Source: AGHT+IGeVQQOsWD3RRp2nLjnTGbweeoIgbKqDmAqFoGst9o8fm+FI9kAswgJa9x35D6KWQQvPQfc3Q==
X-Received: by 2002:a50:a69d:0:b0:56e:2b0b:58 with SMTP id e29-20020a50a69d000000b0056e2b0b0058mr326730edc.10.1712299590730;
        Thu, 04 Apr 2024 23:46:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id en16-20020a056402529000b0056e310e6655sm278888edb.68.2024.04.04.23.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 23:46:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] ARM: dts: aspeed: yosemite4: correct Mellanox multi-host property
Date: Fri,  5 Apr 2024 08:46:21 +0200
Message-Id: <20240405064624.18997-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
References: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
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

Changes in v2:
1. None
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

