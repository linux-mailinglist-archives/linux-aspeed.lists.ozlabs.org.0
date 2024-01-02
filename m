Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48530821704
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 05:48:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kmjQVvsx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T40j470GHz2xQC
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 15:48:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kmjQVvsx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T40g23XZKz3bmb
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Jan 2024 15:46:22 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-28bd623c631so7458121a91.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Jan 2024 20:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704170780; x=1704775580; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHfABZko5E3OyVpk0Pm7Tx9/GwQM3X5Y0l7yapoWLPM=;
        b=kmjQVvsxKqPeQjV14Um7Oj3H0b6m7zfRFcIVJ5woFiKf0nv8CXQP+VLi3dIGexalth
         7WHhCjsLoVB4jGmU1VV03tpQJRkXFRrRbJGw4Xzf8dyRUFKa/YhT2JKQW7ABFmm0w3jQ
         qX0hOyZrOdIKqKdZJIhOojKe7W5z70sLm4oSdMb4v154wxTTSOUz1QhY6EHbfmY1v5iJ
         5ciHNlNEoZXRsyfCugGvnfGdIpvtpkD9W0rRWGpKVkeJfj+wddo1tTL1/QdWrp+9k2Xo
         iFIQ/nCBs7wHzKDEwLU/FY3nRxgpiri5IaO7JoC44wendBs6pztdz3SAov9TbFDvbFXA
         apBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704170780; x=1704775580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHfABZko5E3OyVpk0Pm7Tx9/GwQM3X5Y0l7yapoWLPM=;
        b=mf1DgBrVuGdrj56+TQ1agX8u3QbWa1GGpg1Td4Tt49r6O6SRlbLKEib+CaINtUP222
         tc+bkDi64Z8tKJioqnOAxfxnz6AX9f3bskxb7XNBM10o/jRSNOmijyZeZvSW69jfRs7a
         D8ci0+glFGqjn+wQJmwcBCZRnroDnPGoP3ExFKAUqAag/8+noO70RHnna7ysrzx3VQZW
         7Ef6oYO1MWsawWs/60NI+Vs2K6/YJ7qw8E/6Tr3M0w2SAqJy0nJoqkAQ2PhuE3nt7fil
         KzRDtVD7uLe5v1zvA4MFRAphrwd59JW8u980vEo2EBweb+wv4UmEXzkhWkE8vR2CB7bS
         jZeg==
X-Gm-Message-State: AOJu0YwQ3dK+WjCWv7oFPeV7EZbkI29bIpbWiHkeGjiBcvZOFaPsG7b+
	B3k1hlXNjFhAp9LY11eyJ9w=
X-Google-Smtp-Source: AGHT+IEzzDEg3r0oZfdhsV1Nr6yrEvbWCtjZygtLmN2XYZpEq4qUatFFkmkI9O0r7Lsjjffya75KzA==
X-Received: by 2002:a17:90a:8f03:b0:28b:904a:93f2 with SMTP id g3-20020a17090a8f0300b0028b904a93f2mr8478432pjo.32.1704170780021;
        Mon, 01 Jan 2024 20:46:20 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090abf9500b0028c2b2b76c0sm17308392pjs.22.2024.01.01.20.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:46:19 -0800 (PST)
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
Subject: [PATCH v1 3/5] ARM: dts: aspeed: Harma: Remove Vuart
Date: Tue,  2 Jan 2024 12:44:07 +0800
Message-Id: <20240102044409.3810873-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
References: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
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

