Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F728995C5
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 08:46:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pSG4dqm4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9ptf2p0Lz3vXG
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 17:46:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pSG4dqm4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9ptN43QBz3bqh
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Apr 2024 17:46:34 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-56e2393b073so1799733a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Apr 2024 23:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712299589; x=1712904389; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C88NRL8nmY+MoIB7uTpD++kTTD8uuIo9qZUpVy3NKUM=;
        b=pSG4dqm4j7qTKWKs85ibhR1D/JSM+sH+6F0NpuY0d1Gk8c2qsQfViiUT7q7kM7w0gi
         E8ebspPPTrvUc7rnif/E7VLlGcOnDUIxmK7umPeA3f5SaB8zvZnlq2yKamz8nr8EEnGe
         JxenMaE0521GTcGksP4kse38MC5bjCW+4M3lD1KHO3OyKkrq6NPnJlQ4UJKdSLHLPAab
         lJJhGrx2Bw+eYtRqKCCp+EEHGWoDIU6oNLsm67QNGQyvUGC+Tx8hzDMJ56TG++qL6zl1
         fGS+5/tyerf4jwm30rHRQQHKS2NjaGHdO+gW9JnhVk3bKdhTyc2PJDwImymYVnZhuH8t
         FJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299589; x=1712904389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C88NRL8nmY+MoIB7uTpD++kTTD8uuIo9qZUpVy3NKUM=;
        b=Ap8/gN5SZmGy4GfDFSZSekMaldjowRklUGH6iAN8VZ2QM4Mkf53tDvJLS5CXj8+4zI
         D8hEvRJNYoQnTc5iglyeZUkJIGylzLodt4dhHkWbdQtmAFlOA9PNLoJghOt81TXKlHw8
         a94BQ4h1ccaTqgi0DdOqU8vRPlozNtwz61jmN7XOw6giGXn9xk/ggtsDuma/fRHNpfSg
         K3uYzeTOHT7mLtoJ09hS2j1WNN/6WbbMyjvhvH54Iv9er+guLlrvv5Vy1kw9N16qyRUQ
         ojt9Q0YifiSGjxEplbLC5gycfE8yIkh9Gpb3xzVfa2hGRkFgyvugt7C2rOSG6kjvqFD4
         nziw==
X-Forwarded-Encrypted: i=1; AJvYcCVO6wH3u1JTugajkzVfHjagOgpaiPAPU1mPBy0BstNUp0R+8QThhbQOAjJ3JzpcqTL6KUJuOWBM45sFw7Sb3Nz3SPZyX4dXNKRV+XU9nw==
X-Gm-Message-State: AOJu0Yz7bB0ki9eW1Bvtj9h0bbsg9yNoR/6EF62kuB+WGiEtiwYq2VSY
	ScVFn0veuVqokJqeyY7c4OPaSaHi961fCN4BlOzbWlNDeI5khedgpayFwRO91YU=
X-Google-Smtp-Source: AGHT+IG1ynomuaxg2OaBpcGgD2b1Fq8zJ4ThG3lqY51F73zTrc0Y14wcLKO2TbXNzANaGR5Nd5O8Ag==
X-Received: by 2002:a05:6402:e81:b0:56c:292f:84da with SMTP id h1-20020a0564020e8100b0056c292f84damr1254405eda.17.1712299589341;
        Thu, 04 Apr 2024 23:46:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id en16-20020a056402529000b0056e310e6655sm278888edb.68.2024.04.04.23.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 23:46:28 -0700 (PDT)
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
Subject: [PATCH v2 1/5] ARM: dts: aspeed: greatlakes: correct Mellanox multi-host property
Date: Fri,  5 Apr 2024 08:46:20 +0200
Message-Id: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
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

Changes in v2:
1. None
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

