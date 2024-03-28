Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D888F4B1
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 02:33:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e7UgYZ5n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4mJl1P0Mz3vXk
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 12:33:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e7UgYZ5n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4mJZ2vXbz3vXd
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 12:33:18 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e0d8403257so4092255ad.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 18:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711589596; x=1712194396; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bI/8H0pAGYbJspCOpWpVMnvSIVC0SWhWj4SAbo7SW7A=;
        b=e7UgYZ5n7e9Rp/R4Dm8oNqoQsVg1ROEWEpuP17GRDx+tPv4ZVlHb1BqDfh2l2Qz1u2
         oGqm2XXzlEj+ksCAPWO/S4WoktyC36daxVo2SFF7/WYtEhO18OZOOQ4AofoYTCLUinLX
         xmNd6sIl6+p0tpOhtynAiDTPzEfe76UvR2zrvcWCFsHn3F2VcriAaHcpuJCxu6fOqZQN
         h3vTEMuwTzMcYZILxEX0IojbteepicnH5o3rpmJ6mZnKUbk4VyDdVThJ5YtQzs1MFG7K
         76o2lDyCqzHjfjqLvirQYcJcSqjJYeHK/SLiBobriq5RFIy1jyBmwPlK/PD9Ep9UWWmU
         Efqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711589596; x=1712194396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bI/8H0pAGYbJspCOpWpVMnvSIVC0SWhWj4SAbo7SW7A=;
        b=KiVPOz6r3zrRfLk7ebxIZqiMWYpVJrnrlLjHhcISdCNeIBU2ulXY3vMk8cIYbY+up0
         M2GFYvKmqBGvA9x0WmX9CaXL7owB+VGswoETEku6+Lapgj+xp7iDIoXjXvbzd92SfRGx
         VB/i1T8HcKFuiDUpbh7T7bGWMEGVLQdXwWPvKqooNR7NTEPvJghpuRdldLzPvrcSUOHp
         d6HMDUCf/OhT4rz2E1AXuCS6bAj+2g07grIibCeQvr0Bho02LIvpY0OlOhSv/x1hF5A2
         XGFicCeIldlH2HmmEmf+aVBLdC5YgS8u40blNCvyI13QJNQyK9inUQRmPQ7W5FOSCw4J
         2CcA==
X-Forwarded-Encrypted: i=1; AJvYcCX6MkvFIVb6X1x2zVmSspWJbsfmCEfXOlTRnUp/KEsWWOz/6SIy+CJVkF13eFQKDpVJnDxpwrnHJw6dGj1Lsc8rSByNZJGz3yjuMrHKJw==
X-Gm-Message-State: AOJu0YyZMoVaLEIxfOrmuAWhBbc8qml7CxTPB0hALVYSv9LcoTCQLI4k
	IfxbTs6dDcNvKqpYdiaXS9r/SOlXqDvvEOzsNda8yhpTm7duWUIFFNdPluM/
X-Google-Smtp-Source: AGHT+IFsBLzrq9PPCeN5NGFGoiK1EWQwfPzGwMyzieFUAaPbnalux9RNDxGXm3wYog97cDv+yXPGLw==
X-Received: by 2002:a17:903:986:b0:1e0:d9da:b126 with SMTP id mb6-20020a170903098600b001e0d9dab126mr1644145plb.15.1711589596275;
        Wed, 27 Mar 2024 18:33:16 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e355-7eb0-b4d0-66d2-2269-ef6c.emome-ip6.hinet.net. [2001:b400:e355:7eb0:b4d0:66d2:2269:ef6c])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902c38500b001e0e85a21f5sm201338plg.32.2024.03.27.18.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 18:33:15 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] ARM: dts: aspeed: Add the AST2600 WDT with SCU register
Date: Thu, 28 Mar 2024 09:33:00 +0800
Message-Id: <20240328013303.3609385-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328013303.3609385-1-peteryin.openbmc@gmail.com>
References: <20240328013303.3609385-1-peteryin.openbmc@gmail.com>
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

The AST2600 Watchdog Timer (WDT) references
the System Control Unit (SCU) register for its operation.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index ead835fca657..b47850f0dca0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -557,23 +557,27 @@ uart5: serial@1e784000 {
 			wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785000 0x40>;
+				aspeed,scu = <&syscon>;
 			};
 
 			wdt2: watchdog@1e785040 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785040 0x40>;
+				aspeed,scu = <&syscon>;
 				status = "disabled";
 			};
 
 			wdt3: watchdog@1e785080 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785080 0x40>;
+				aspeed,scu = <&syscon>;
 				status = "disabled";
 			};
 
 			wdt4: watchdog@1e7850c0 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e7850C0 0x40>;
+				aspeed,scu = <&syscon>;
 				status = "disabled";
 			};
 
-- 
2.25.1

