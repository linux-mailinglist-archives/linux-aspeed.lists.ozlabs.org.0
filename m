Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97D8A2AD8
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:18:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SBmYvdZX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9wt306tz3vdj
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SBmYvdZX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9wR2N2Kz3vcZ
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:31 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ee0642f718so828647b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913509; x=1713518309; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aW3rP8p4z3TO0Ihdn0FuHfBWSAl8GOUADIxx8TKfnls=;
        b=SBmYvdZXHrY/ctdPGIXYtX6qsSQd+Xd44ksVtyjmqQrvhcF8NnB0mpq7tGlN0XDvIj
         wMH9iUY2ei4i7aRM59ElydK+dQyqRGUjgWZIMzrp1XWtXS/ZVGhEN7lnzeKIQ8+HmZF2
         x+qRgPkehqsu7rvDkoQSl0x+gu+efab0d/jxB9eAim/nlEN9LEkBsL6NrCZYjensSz/f
         txnd7lL0f+M7omZvg6t633k/Sika1tyT5Is7IRNu3gFQEH3UX7H6VJPLO7wE85twt2Qd
         4imKPb/gNmUhOL37lL9tf2ue8fCe0OTUOg/xUMK80+vgelHAuW6Q4gqJ7dQua+q/jWMA
         i16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913509; x=1713518309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aW3rP8p4z3TO0Ihdn0FuHfBWSAl8GOUADIxx8TKfnls=;
        b=Tb3BZ2ttyMZsNSo/re1gG+exBjZ6VM8cN7KqBxjpLzXkrBF7xGQy4gZGKybyTVlP5g
         adHAtTvdinhaOkMrKYHQkyrB6fHtvnfSxq3vPqR6KC7a+FkHVRHut4zVeEkbG7Of8uUi
         787RJfW6COvqRBOK4LOH882HNqQVi5x470KoWL25xung03xR3XsvzrPjtG1w25LgqZwq
         cNqCEXeQ/rolyEybFx9Rf8qhMSGSI1+G9+kTsUNevEp31rlrndB4gnrjQM7bhFOCdp6R
         Az8HD8ojm+/FcvKiDlwPgtoXgoZHZKP7QJmttFLsM//2jUYeJQMemrVEsMTvJ0AiExOg
         hJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCWsZsexD/UqISWDiFttzRLxORyhUrs3DVzttM2tHWKw5RTH/ISRxOsFgUE6PGjWnFzEQzCQFQzjAvUpXWL6gl/uLOtJi4m3uibBGF/Tsw==
X-Gm-Message-State: AOJu0Yy70fkbgWNBxCgW/oIkPOBgGKYcnBuz4Ck2rsA1fuAGkDAWTGMU
	TShvCAWskmFvzNvYqzD8lOGH/BULwDMF8w06bhAcLfvc3a+xu7r2
X-Google-Smtp-Source: AGHT+IGNVugvPemv29ATP+GSohH3oVVJHymL0x51x1Nragz+Vk4X+Jk1g5T53aDsbWhGBUZM1l8H6A==
X-Received: by 2002:a05:6a21:164a:b0:1a7:5413:1e6d with SMTP id no10-20020a056a21164a00b001a754131e6dmr7274993pzb.4.1712913508603;
        Fri, 12 Apr 2024 02:18:28 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:28 -0700 (PDT)
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
Subject: [PATCH v5 09/12] ARM: dts: aspeed: Harma: Add ltc4286 device
Date: Fri, 12 Apr 2024 17:15:57 +0800
Message-Id: <20240412091600.2534693-10-peteryin.openbmc@gmail.com>
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

Add ltc4286 device.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 6e9e6e559838..7dd48c384a4d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -271,6 +271,13 @@ temperature-sensor@49 {
 		compatible = "ti,tmp75";
 		reg = <0x49>;
 	};
+
+	power-monitor@22 {
+		compatible = "lltc,ltc4286";
+		reg = <0x22>;
+		adi,vrange-low-enable;
+		shunt-resistor-micro-ohms = <500>;
+	};
 };
 
 &i2c5 {
-- 
2.25.1

