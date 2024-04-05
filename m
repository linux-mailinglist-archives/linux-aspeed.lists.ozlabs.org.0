Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8708995C3
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 08:46:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qXzO6vsC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9ptY6Lfsz3dXQ
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 17:46:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qXzO6vsC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9ptN4y1Jz3d2m
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Apr 2024 17:46:35 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56e0c29ad5dso2186269a12.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Apr 2024 23:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712299592; x=1712904392; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqaOKeWznzlvC1XCcKBAQS54bawEm7Vn0+X5Xfjzv+I=;
        b=qXzO6vsC3CKAbNXg4+D+EWjV2UxypE18ZZQo4qCByfgndz59VOsTTizSSQgt8d3zzk
         RR1Jlz+Vi8r/kFaHihs3HhVJis4QZbqh6K0EmVUoQSfSeNOXdlCySKQMfOrCDJhk5pKH
         YthMuzyaJyZRepQoMuMwQbIjT7plhDV0mdpcyRYTQkgT2vxpsrMDTWOdJ7E8ODsMSmlc
         U/e4hd/rZY0zB/SEXWL3u3ZBGxBVjcBThvVBDu2wW6VSgfCv2THpHFMUnuh8AHNJcEht
         7NzxPC2MNv8Qc6yNgtelY3K8aGACcqqe4ExPQCejkrbthFT0fl7WnEJ+UgPW5fk4TSjQ
         8RkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299592; x=1712904392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqaOKeWznzlvC1XCcKBAQS54bawEm7Vn0+X5Xfjzv+I=;
        b=nijz1ZBvIU2jhiWWvwIyZW1BBAaLRZ6VxljjByYyFxoBDMiRo2oFYiWPu43B6E7xqe
         H6HH9l8Vxs4QHrb4B9BVpFPWGS4aODD6OWWbgTP9jTjYwT93uZ+DSacfGFOPqM/f291Z
         oRjwv+vgGYMxd9RUF+HXIvOfutszipVrLWHoyCt1AdvFJBNYDGrGrXuwkKAQJgUYwZeX
         8YKXhzXrizQy/BEhH1Nl1QTLDVWIhWYlN0hFVScwtP7M8fe0yipRa2p2Lta8TmikN70Q
         4xELIqdjMBXNlSfRHEi+7iTI9ZVhZ3fWk4e4ldKE9jO5yIunxfA+EAplha4qCE77R8mv
         3ntw==
X-Forwarded-Encrypted: i=1; AJvYcCXU/MpVBMpzrOTY4XKsYin54Pt0oSafXWQBV14m1uigBO4nnw3LhGIKUagPH4oAEi5xdQ5IfoipWuPgDaHmyaAbOSDpmlOKo8jBDWN+5Q==
X-Gm-Message-State: AOJu0YwRFFHQ7Qyk+8GnJqTSGcq2bwqB9NfeusOaxWRmmiwhi0sTwvNE
	L0eYZRIx1mPIyrx2PYg0VFI+f//RhVN+43H88DWrN6MBux74NgQEZRNSigiEMz0=
X-Google-Smtp-Source: AGHT+IHaq8ZI5s360lQz4Csf07pRYkxlWqzQ5JJ18jBlHILxctxfqmu+H82/vJ4d6O4xMd9eJrn7UQ==
X-Received: by 2002:a50:d784:0:b0:568:7c01:a4a2 with SMTP id w4-20020a50d784000000b005687c01a4a2mr352531edi.13.1712299592051;
        Thu, 04 Apr 2024 23:46:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id en16-20020a056402529000b0056e310e6655sm278888edb.68.2024.04.04.23.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 23:46:31 -0700 (PDT)
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
Subject: [PATCH v2 3/5] ARM: dts: aspeed: yosemitev2: correct Mellanox multi-host property
Date: Fri,  5 Apr 2024 08:46:22 +0200
Message-Id: <20240405064624.18997-3-krzysztof.kozlowski@linaro.org>
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

