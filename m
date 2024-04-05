Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE908995C7
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 08:46:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=j1yFQcWP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9ptk4lTSz3dlY
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 17:46:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=j1yFQcWP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9ptN743dz3dCH
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Apr 2024 17:46:36 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-56e2393b073so1799789a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Apr 2024 23:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712299593; x=1712904393; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L03qktEe5BqKc8+hjupnXevOErFDWhALUB7ZlYJD1vo=;
        b=j1yFQcWPcdfmk8rxvkKYDK/0RHsuZrr9MCmXdmK6SnA6rj41oPHJdlxORFjucq0j/D
         aUjO3f9zOvDJXeDPsT+dGd4qONDBDAxTETT53KdW1M/HOMIh4L+aAp74DO6igc+43DmO
         w+7YFHhz9T5klNuNqGTzJ4mBCGsjU+wFuJYhUfJjbd/qXK7iQe0WXmDn/vqqwuT+IRaw
         QeltQ0ZrAF53FgAFolti0LUs/Ag49h6eHFYRuBxJeKf2AfQ4JCGQCEjx9DexWBf63Feq
         baJWX1vgmbN5Okyl/83KLI3fg5448r2zVs7UA5sjv5xjsmXa4TMNSTNrAyb95aQDdaWR
         SYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299593; x=1712904393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L03qktEe5BqKc8+hjupnXevOErFDWhALUB7ZlYJD1vo=;
        b=WXjmigdfxAhVeTOk8VWmkuuWfzLcYSBM0oiWBmZ6DaPHnEWXZDjyg9Z36Vmg9G+h7y
         xIJ+2pK1BMAIxwbyXXBlv/mVWFSdFdtQUYjXHxnVJ3hbvg1FOdlDLjaLYNW3x6KFIAFG
         h6LwiINLcgg2a7rEz6jPbMF96a807iJG3ePCNuWhsZMXmVgZwZHS5KYYhhOtyLWiT3ST
         +l+zgQvy+Nmcbh6pNeP+CzV2cVGMPPPRynLqLDLtFvlQR375ZN5gTBkt7D5n6lTJQsAX
         fg7jse37a3K1WcVAQqHQf7ImshR/Gk5RIMgiHJoWqxNkO4ruIZGgQrvKta+PnBFoXeeB
         z/8w==
X-Forwarded-Encrypted: i=1; AJvYcCWzLCn/qzBNWe8StQlX5unl4IN/3JwqElgzdHW0tJjR43J8VogqdFV9zbjazvylCzLrNumRwSBq8nctUh0Lnx3VEDXHeZ2XNe51GjXRVA==
X-Gm-Message-State: AOJu0YwfZZ4FYNSsSb9Jk6j6vQd8F/1Z+wf0JIhwlpcYKWr83gRANpB5
	O/jC26Zqgp/XEIA4c01u3CWzAqxsmAqghSyi/Q2rADJugQbsYkaR4d5jtQFsB6I=
X-Google-Smtp-Source: AGHT+IHjmGROnu9Y1ix4apCPz2PhAt2PPjFja55HBstpjpgqzxLJBVjFWv5eRYdGN8y9f2GLmM9gRQ==
X-Received: by 2002:a50:cd9e:0:b0:56d:fc50:ec50 with SMTP id p30-20020a50cd9e000000b0056dfc50ec50mr759789edi.13.1712299593304;
        Thu, 04 Apr 2024 23:46:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id en16-20020a056402529000b0056e310e6655sm278888edb.68.2024.04.04.23.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 23:46:32 -0700 (PDT)
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
Subject: [PATCH v2 4/5] ARM: dts: aspeed: harma: correct Mellanox multi-host property
Date: Fri,  5 Apr 2024 08:46:23 +0200
Message-Id: <20240405064624.18997-4-krzysztof.kozlowski@linaro.org>
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
1. New patch
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index bbbab8023cd6..b2834399f3d1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -137,7 +137,7 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii4_default>;
 	use-ncsi;
-	mlx,multi-host;
+	mellanox,multi-host;
 };
 
 &rtc {
-- 
2.34.1

