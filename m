Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F618242F8
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jan 2024 14:48:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aNjCjRkW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5Sb42rPmz3cVP
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Jan 2024 00:48:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aNjCjRkW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5SZp6ScRz3cWd
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jan 2024 00:47:46 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d409bcb0e7so2858215ad.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Jan 2024 05:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704376064; x=1704980864; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHfABZko5E3OyVpk0Pm7Tx9/GwQM3X5Y0l7yapoWLPM=;
        b=aNjCjRkWOrBi2vkkKDrmn/9vml7QTUb5Lz6cmQOhfgMLFwVS5164XRlA6l1/e73BFk
         9oDr4Jthj9mRG3fgxRsuD+ADT9QACc8tHj6UEJT1iqaqNbAnC6dPzJcJC+zs1NwybmUL
         WnIzWZM/WTKpZ7q8OZtiFzaBxZXV4kNHG+aF7/CENDQRMDckj4IdqRvgHpuTOR4AstFr
         eXpJ7Nzs0W4MutIQfeA+x30lb5gnIckro88qi/Od++iovOn/wrgkQSEqEKayKSqTG0x5
         X3Be6zzVhiti/4C6P9S0dRg5+Ja8jPF9op1j0UCc3QR1d6VrfbUgzwwamCoBfIU55aRK
         hpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376064; x=1704980864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHfABZko5E3OyVpk0Pm7Tx9/GwQM3X5Y0l7yapoWLPM=;
        b=Z77i5Bvh+jsGrKE9QpdOWjlw1IlSCm9yb2ff91H05oiFsTKjrB22jJvoy7oXITf5lg
         KfiUfxFPT/x5pu1Ymz8aYPGZaWMKUDMB00GE6JYJlgfdpxgegrwZNSArUaWXqnHGdWIu
         S32cCVHllqdYFX0jkGa6kYnuw6yXF+w2b614JQAU6GH2+KcpmCG7j9SkS7Ok3Vb3sxd1
         qt3kXr13PSr5VCjM5Er5C7zo9wrD+SZ7vcuN3GjSGbLoyev7aVWhiA5z12eWQTFy5HzQ
         0krivC5Xpt/wMYT/cbiPyl3EnlMKCbZlGysLnh7ln+iQZnEfHTPZVu4pW6z8BMIjR5HE
         QN7A==
X-Gm-Message-State: AOJu0YzlOTM2wAW+j7ieA09+E1f1K11fGgoSWK157tT/9C+S8bqGVR/1
	Py1J5W20YvqYqzpgIM3SSIE=
X-Google-Smtp-Source: AGHT+IHUiOTg4zCNAIBM0tpqHX3KafYYflpL77hic8vey7JDTAmJ354vcnuYX8fns2HYsVVBMeoeQw==
X-Received: by 2002:a17:903:1c3:b0:1d4:cea8:5d6a with SMTP id e3-20020a17090301c300b001d4cea85d6amr595332plh.4.1704376064558;
        Thu, 04 Jan 2024 05:47:44 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709027d9600b001d425d495c9sm22990550plm.190.2024.01.04.05.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 05:47:44 -0800 (PST)
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
Subject: [PATCH v2 3/6] ARM: dts: aspeed: Harma: Remove Vuart
Date: Thu,  4 Jan 2024 21:45:29 +0800
Message-Id: <20240104134532.536793-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
References: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
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

Remove vuart to avoid port conflict with uart2

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index a0056d633eb1..5d692e9f541e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -100,10 +100,6 @@ &uart_routing {
 	status = "okay";
 };
 
-&vuart1 {
-	status = "okay";
-};
-
 &wdt1 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1

