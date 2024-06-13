Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A072907696
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2024 17:27:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PP3/Zk81;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0R95123kz3cZs
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jun 2024 01:27:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PP3/Zk81;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0R8g0wG5z3cVG
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jun 2024 01:26:42 +1000 (AEST)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5b970e90ab8so606260eaf.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2024 08:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718292400; x=1718897200; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN0iVbvUCtHrusvPM7j5d8Cr0NiexIYpDbZftj2H28Y=;
        b=PP3/Zk81Dx5TaS99wCZhT+oL9plnOU/vfZK0VI5ntIV4Md6JQx4LTvSaS4tWotN6qP
         n8OI7fU+kBLFwYvA7ESImGQulTf+9eFtIFe8momsKIUZkfqf7gOBAAj5lnw3wVlEJugH
         E4MPe0QWPA9xOGR7WoW/M1tW8AHxabxNKGLrVZBfOzoVLee6MW5gvA9/fw2wWdWhmkaC
         bkoBwYziawCLIMo6459WVdKuRJWxcBLC301wrlXEVgHKWBNfVl6cqtSkjJsMkdCxPqj7
         +L7IfMJ6KQt8MeAyJyXIsB+5CuoaWhSNWH7xqS7Ub8MQwi/12axYGnx80VT2HQHScU8g
         Ud1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718292400; x=1718897200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uN0iVbvUCtHrusvPM7j5d8Cr0NiexIYpDbZftj2H28Y=;
        b=Z9ibqiH8wrJY+ArOwiJb5kJQ2Ahd6xq62c7YoDxpvRMYrshRdX9iE22QEmyWSDW4ZH
         RyjPqZYn8AosU4Ip5kgKNfjY6KzRhOP6sqKen17UnK55rKRPyeq13fLqHCQjXtdXhHU7
         UMK3mEAzqWtOKepx6Gv+RbvgtXoe7jkFHRB5n8HY04axrbY+AJ5sc9MOhNh9dXmwNky0
         7zzEQQsPr9KujC3lmnl6LN8Gj7q2SUB/KzAXFNEelj1rn1e+EsYYbh+ZU+tE8APmVuKn
         sU2lo1t7mEZCO3AWLSxr57ppn5pcsEkSDPdD7J7s9zk2uvz5Au/9Kdc5/UhV7nrw8Qp4
         ZCEw==
X-Forwarded-Encrypted: i=1; AJvYcCUZPTmiWYqrGDlX8TcXPR6h+LpULhYuYCW++pj86hSTjFm67flr1AmBEKVXHEf/QmaLpUIAj9CzkoivAChS8G1pGvgBCVNTO50M5j5++Q==
X-Gm-Message-State: AOJu0YwJ2+yRQYM8HlHFzsElcDiZHr2i2wbdfEX3FNo7YVmmrBaa9VEo
	9ikbFPPMY4HVLN+WccMHy0PHuQrW7tKmoNqBcrdD92F4IXszvS2z
X-Google-Smtp-Source: AGHT+IEf10NElgIFM/CEvfdR+k7HaTuO6/i/+QFJcKhnj7u317VP70MArazE03nYYpgOWFTfeto06g==
X-Received: by 2002:a05:6358:5328:b0:19e:fa9c:5ec9 with SMTP id e5c5f4694b2df-19fa9e5c31dmr11451155d.9.1718292400375;
        Thu, 13 Jun 2024 08:26:40 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee41663d2sm1198183a12.92.2024.06.13.08.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:26:40 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/7] ARM: dts: aspeed: Harma: add ina238
Date: Thu, 13 Jun 2024 23:24:22 +0800
Message-Id: <20240613152425.1582059-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
References: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
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
index 06c8b5ff1125..05020e23a901 100644
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

