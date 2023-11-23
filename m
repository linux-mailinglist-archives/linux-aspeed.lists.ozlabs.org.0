Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E6D7F57A4
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Nov 2023 06:06:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q+bUoTei;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbR0v68prz3dH4
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Nov 2023 16:06:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q+bUoTei;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbR0j0LcWz3cZF
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Nov 2023 16:06:27 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so347048a12.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Nov 2023 21:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700715982; x=1701320782; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06y6U8sIEAJcocDpDQt1xUv0207pV5nMk8x8doEVyR8=;
        b=Q+bUoTeiteHeNA7RKC0NR3r2Lzf2/a9BZTwsYjo4xJFqJd9agSOazzHfIdJmpISXKu
         OH/EWCfGj+NVCKGEP/hk93HIHWWBunGP2LG+QKGXZC2DnzY8qlJTiWlJaOn/xPjMo58L
         XOoiyJOsJ9Kj3TaVOiYYaHhuD6EJTdN8ZCsG+4hG/2p2p0HvrfEJo1NzDt6kb6r5IQ5u
         hvbNxVfBSOjuGXvw1IOyKHV+L20oUpGgc0tJSPwKNRv5YOX9hIWrfQbDBXMWcCS2KmK2
         BBdED5Eovh1ybfH7/zsCZDdkp63CCIOlxBjOhvE0G/ZT0uklMe0vu052d4XW9FCoLEkA
         gYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700715982; x=1701320782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06y6U8sIEAJcocDpDQt1xUv0207pV5nMk8x8doEVyR8=;
        b=suBOWHgj+QXka7bW1HPbQ2N2+pGm8t+iliQD51CEZKMPzVBasKVX6mVa1+2K/Z8Csp
         eyvt2LQ+aYY9Yp2wSdKO1SCts8eUk17RLSEVDM+dxQiYbAy5mH98wgMXnHJJ4sLidBuO
         LlxJZ2WM6G5aNWziVcaFbnZpWUNG+59fQDdhoI5VbbYZjZ/vXKpJ6KrNo8a7X+FqzPG3
         TsqvdZCuftEoASxI8YhEUFnXW7DIwfklJUwhI5/oymIXPyHNwNtvyhzSrbHMyaQFmJjz
         GPt3zfkfVDFb8tt+YRmgtS10xa68Ca7r4I2bq2l6QUO9+MmLqBeqI/r0xqvicLK74i5i
         sl0A==
X-Gm-Message-State: AOJu0YyuISpF18f1+OFb++v0zs6aoxNkezCrL5TKe6tuWloQjvR5+ReQ
	MnKLVNiQ8QE1irqK0MiRjic=
X-Google-Smtp-Source: AGHT+IE2oDgvfrZRgLZA8qhFqq7AjitHcEDeG6RL/YuUGyIcWL/Ny0EQ1/k8fM7YVk/DBcEcZ6Y2wQ==
X-Received: by 2002:a17:90b:4f48:b0:283:27e0:652c with SMTP id pj8-20020a17090b4f4800b0028327e0652cmr4547767pjb.43.1700715982406;
        Wed, 22 Nov 2023 21:06:22 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id 4-20020a17090a1a0400b0027b168cb011sm413101pjk.56.2023.11.22.21.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 21:06:22 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Minerva Harma board
Date: Thu, 23 Nov 2023 13:04:14 +0800
Message-Id: <20231123050415.3441429-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123050415.3441429-1-peteryin.openbmc@gmail.com>
References: <20231123050415.3441429-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on Meta Minerva Harma.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e17b3d66d6e5..20e3be8d8c78 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,minerva-harma
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.25.1

