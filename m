Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45580944FEA
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:04:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ezs/+upc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYgD1NJjz3dRp
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:04:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ezs/+upc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYfy1tmJz3dRm
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:03:54 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-6bce380eb96so4426035a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528232; x=1723133032; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gix3DBO+oHGmr+N4AH/BAu7/Kk6dQdl46Hkauc/qyS8=;
        b=ezs/+upcLFvyehKInbu0/U4/h1aafrzrYEV+xwwN8beFkKVHu5N75H9hphFi/ZSD9a
         uIMm9+CRRWOBZFCEVY7toPDcCTUPH1Gw0c97LC6EPltUc0Yi/BusQDbkyaARhJs3OkUh
         z4GH4TKz+Go1gS7hITCYzCVILqQ23w1YscpxMbZHONaQn7vCClWED+0BXK4gF/7EV49v
         dnaGv3cBMuggb8o/b4QcOHgDzOkUlra2DBnLFeQ0n9AABibj++Ol81HD9jXCOM6T+FSK
         Ci+nwq2A/oWJ/PIG8x8CYyOc5eke1WB3YNS1aGIdvbJi4IOOCXNydo93ZnbwkoFJ/H9E
         t4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528232; x=1723133032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gix3DBO+oHGmr+N4AH/BAu7/Kk6dQdl46Hkauc/qyS8=;
        b=IFmVi67JN+bEwlgEl+t8q0FQCSy9A3j9NiPFDId+886qFXJlt1AMPwEzd0YP1elpMp
         M7A/k59cXuWDiGpo+7vb6/rBKZLa1NshyicIhru7PUai+1Nw1wp2DPGzIOIa53HeTzZW
         JovSFmV80VBtID/uBiCOTpjUzoeaoGOAkZJ0n0d0ViqUtW0L0TD59/sDL9BHtRob4Ctv
         bwFEauBSSb/U7/W23g/lmtdOhCfkkW6sam3gA/wcFx4F0YvzBm2rOC3AkPgQlJZQBddn
         9QPf+lBUJECckD5WsyvL8pSGRJlSOnspFa5WPoKEQ4oP9B3x+inWTNyNjOxWKHYEWnYS
         c+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkxuCcdFj1OQ1gqcudbYMOt0Bg0j6Q+Po1AL3dexky9Vy+OEHUpoQh5+oLOCeYPH4vTcibwHaBvOe+vR3mpsQQlAWXrbxoWGlnskTSkw==
X-Gm-Message-State: AOJu0YxnqWtTF03nrmfnSVgE3G3SDnbv7GunnjNI7YeS7Mu/T/7pPBDy
	6mKIgfBAF6NqSTqIfVonzr7YuKPK9XCC5pVy5uvf4DZ0IB7lLzp+
X-Google-Smtp-Source: AGHT+IFG5G7AxA+RzvVGzDQ4AyH7OEXpR+B2oXS5vzJ/MDsP30IZ6t28E1tgeg6dwW701rf3IQ9e3g==
X-Received: by 2002:a17:90a:6b45:b0:2c9:a3ca:cc98 with SMTP id 98e67ed59e1d1-2cff93d5a16mr919401a91.7.1722528231525;
        Thu, 01 Aug 2024 09:03:51 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:03:50 -0700 (PDT)
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
Subject: [PATCH v3 04/11] ARM: dts: aspeed: Harma: add ina238
Date: Fri,  2 Aug 2024 00:01:28 +0800
Message-Id: <20240801160136.1281291-5-peteryin.openbmc@gmail.com>
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

Add INA238 power monitor for Harma fan board.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 0c4bf165d0b0..7d809f1636d6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -198,6 +198,30 @@ pwm@5e{
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
+
+	power-sensor@40 {
+		compatible = "ti,ina238";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina238";
+		reg = <0x41>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina238";
+		reg = <0x44>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina238";
+		reg = <0x45>;
+		shunt-resistor = <1000>;
+	};
 };
 
 &i2c1 {
@@ -224,6 +248,30 @@ pwm@5e{
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
+
+	power-sensor@40 {
+		compatible = "ti,ina238";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina238";
+		reg = <0x41>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina238";
+		reg = <0x44>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina238";
+		reg = <0x45>;
+		shunt-resistor = <1000>;
+	};
 };
 
 &i2c3 {
-- 
2.25.1

