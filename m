Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A18A2ACE
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:18:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HzNNgXqD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9wN0j25z3vbd
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HzNNgXqD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9w75rNqz3vZj
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:15 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6ea1ef9e4e9so319382a34.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913492; x=1713518292; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHfABZko5E3OyVpk0Pm7Tx9/GwQM3X5Y0l7yapoWLPM=;
        b=HzNNgXqDjLU5wkDdpPPkzeUdR70qhaH0rWngIG2qGgPIBLlt3TSpGFHC37ESxsykfn
         iFKEQizHwenBvmStdlMOLMX0cnxbpOQAbisi4uducchaqKhhNUJLpAK06GSDVlKT1EQp
         in+jSsV/V1uIFPQr2Cl5avtlkOmZ6INPRhCMMam3QsyBEjzCL/9aBxxOUJqyLNulQY7Y
         A1EzypQYkRURSAUyg31WkhHz9crvzVunLP7+Kejk/91PCAMqg8sqQ/nO0SwRZeSI+YVJ
         nqGftgcjvhrG3VghW1W0FJZlvyLagMxUOUfVAYz9H7+JYPtcQysPECMzqufXWmzsbBNO
         JOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913492; x=1713518292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHfABZko5E3OyVpk0Pm7Tx9/GwQM3X5Y0l7yapoWLPM=;
        b=svaDbD1QJo7DyIdN82xrcebopSZEnEaaZ0wFGrbxRcDCd66K19HTlUDFQRG/RkoG8f
         hFKYzup5DYu5tEBG2FbnPjjWbVItADaAxOE+TvYd1hJ5xCLvcDFTktrqCHnbF3oDxl0e
         Vv/971qKP+rWHuouyrcdjTGYR0z8gHnUszXcacnf0W1svxPaRkR9P8tRmVNCfJL+MXWB
         4FY1bxFLRI2OefF61bT3jKdlIdrdPgQi3FUmi4g+s50kwamzOlbBY/T/fl6F+VoSvfYV
         OrC+IA2NOjQ8rphZaU2us1wHEyxVXddRYt8QWi05oIk8mUpWrE6fSwgw0AHo66WqGbDR
         Wh5g==
X-Forwarded-Encrypted: i=1; AJvYcCVSJXzB9sjK9MYR2Eok0F01MgzGEFON5IW8MGqdmxlRIdWbg6vc7FnmvT7uS1Dyjj7iYdvJQBERD3vBanv+KRfnyJuHpcfMrR5OiQrTGA==
X-Gm-Message-State: AOJu0YxZOU+AS29k/t7oXvgAhM3BLzhBBXdoLwthfDIVGhj5c7SYnzzC
	F+89qLKh4WMYJoWH+tQESZjYWpb5iXKZOw57M4FbpA3Vfp6Ck43D
X-Google-Smtp-Source: AGHT+IE5zLPdK96gYU8DzX11JbPPP1pJ6TJv2SNsqJsLZ6SPyHZ16UaEC+PEbBoCiuihIKgXeFrY3A==
X-Received: by 2002:a9d:6556:0:b0:6ea:3851:82d4 with SMTP id q22-20020a9d6556000000b006ea385182d4mr2139807otl.27.1712913492713;
        Fri, 12 Apr 2024 02:18:12 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:12 -0700 (PDT)
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
Subject: [PATCH v5 03/12] ARM: dts: aspeed: Harma: Remove Vuart
Date: Fri, 12 Apr 2024 17:15:51 +0800
Message-Id: <20240412091600.2534693-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
References: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
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

