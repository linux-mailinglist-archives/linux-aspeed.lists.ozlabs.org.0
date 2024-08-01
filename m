Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB799944FE7
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:04:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jgAEmd5E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYg24ZRPz3dLl
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:03:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jgAEmd5E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYfr3bGBz3dTb
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:03:48 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc6a017abdso47878595ad.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528225; x=1723133025; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Xvc/KjGA8csQnGpC5265d0N0RHT5WtgS5gajMnjS20=;
        b=jgAEmd5E6PzZOAKtC+TKG0AncoauyWMKpJL39Yo26FvafYADddb9Y5WpaUyaDv/HMW
         SsL+QWzoYVqNADjLuAH4dR4y4OlrOc/nKNcLO18/4N3dXRSzIMzeJ5rlj35mR1SL0bvL
         VZ9vkAPIhzxqP0SeT+Npbomop/0xr0ArjIw093YnPLt5bhDa/OLa3CHJDS3hiBs8Jt+M
         wdyKiy48xgR6EBRXeNLS0UqMfz+Pl8o2CGdaCeUbmk4pC2KpsbU6IYmUxyrz+vYKvo+L
         W1bpETnR2p2u4Yc1G6LtUXLyDNJAmxT+5Ynq6ZtSh8IchI+FZjBnV0g6u3/YENp4EzZ3
         RF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528225; x=1723133025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Xvc/KjGA8csQnGpC5265d0N0RHT5WtgS5gajMnjS20=;
        b=NoP1xeTw6phtcyUKH/wkrSuj/y1oa7rhKJpoqm/n8nWwLYtsvvBzZFM9F9AzAD74AS
         xTrfITWZsv7Hf1dNfsHpbvz+lmyKd03G6nr+qmB72TtN8qff7J8gtNlb1d6Y2e0Kqvsu
         3daYqRB3RmaoUQ2/Lx6Po+iLhNY0Ga3qtizLUtiL/UkoIPbEP1Foz0HUeiKvVXQPTj7D
         UynZ3bZQB/pEyAj2LxZwhr3B5fDoqv5+1DoV1ZC8eL9tebGhUyfGi/bkh2QJFvd4uArF
         Y3Zhs1ySiXpRROuoPPtIMR29DZ7nsNvB/2jLzW1+6gYsDlDYAjtuvbdpP2kvT7BiDAZR
         2hew==
X-Forwarded-Encrypted: i=1; AJvYcCVMJUii9A42UY9igRV0qwt1RXyQwQIlM3qShCFlGSuiLx0qLKFvw452ySqbxJZH53wkoRoGGc6ISVEVJQrMbmduMaIaUXxw5QNB2bX/Lg==
X-Gm-Message-State: AOJu0Yx3T3AKepGNMYBaiRX+Ix9u1lLhuKOmYdlEBbYAwh/nmDBw0OKV
	ZATa9okNMYhE1Nv4UNZu1e9jqx2YwhhVbu/paxeXcqxwRajgPodS
X-Google-Smtp-Source: AGHT+IGlU2dt7pndOA3Re1nLJoWTvZUFUwdcLWsGa5x2aRYRnbOEpyrYhTN1gMD98bbpeN6JFr+Lig==
X-Received: by 2002:a17:90a:a417:b0:2c9:6f8d:7270 with SMTP id 98e67ed59e1d1-2cff9544dc7mr680631a91.42.1722528225310;
        Thu, 01 Aug 2024 09:03:45 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:03:44 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/11] ARM: dts: aspeed: Harma: add VR device
Date: Fri,  2 Aug 2024 00:01:26 +0800
Message-Id: <20240801160136.1281291-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
References: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
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

Add isl69260, xdpe152c4 device

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index d99fba321379..8fb30029e46c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -398,6 +398,30 @@ imux28: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			power-monitor@61 {
+				compatible = "isil,isl69260";
+				reg = <0x61>;
+			};
+			power-monitor@62 {
+				compatible = "isil,isl69260";
+				reg = <0x62>;
+			};
+			power-monitor@63 {
+				compatible = "isil,isl69260";
+				reg = <0x63>;
+			};
+			power-monitor@64 {
+				compatible = "infineon,xdpe152c4";
+				reg = <0x64>;
+			};
+			power-monitor@66 {
+				compatible = "infineon,xdpe152c4";
+				reg = <0x66>;
+			};
+			power-monitor@68 {
+				compatible = "infineon,xdpe152c4";
+				reg = <0x68>;
+			};
 		};
 		imux29: i2c@1 {
 			#address-cells = <1>;
-- 
2.25.1

