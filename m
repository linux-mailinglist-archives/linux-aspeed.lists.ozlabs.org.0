Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F548B8483
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 05:45:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YQ1KQucJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTjdg6Jp7z3btX
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 13:45:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YQ1KQucJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 385 seconds by postgrey-1.37 at boromir; Wed, 01 May 2024 13:45:38 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTjdZ6cvHz30gp
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 13:45:38 +1000 (AEST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id E5A252019F; Wed,  1 May 2024 11:39:10 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714534750;
	bh=7oapRTJqY1YXZtznldlbQ7h2355L4bGDZc4nRiSauP4=;
	h=From:To:Cc:Subject:Date;
	b=YQ1KQucJ/pFDSVQg0EWK5MfNJughorP+ElJ/JSXhdug4zwo6gSF8d1ZkzUghrb1/G
	 wfzbmCRrG9Ywsy5Ie41m9HZNNIvh+SrOi0CWf4BleYMQLId5nHz30qySVg8e877IrD
	 TNhfHcXkWN93W7GrzisnYZpQTr74rWJYfGxuz3TYxtzAC4+ZpvqO05tAPl88g64kNE
	 pvQMJrfnZvRAj1vo4qWKDAVcWxahyImYIof9EoSMqLeKox7G54/W7yjsxtblKH+szt
	 hQaiXmbPxS8na+fz9hf8BJ2FMLB+LjoH5IUvuDGNrOl5ZczV0H7J4xszmLvb7G1dhK
	 6lT90XSMp3XVw==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed-g6: Add nodes for i3c controllers
Date: Wed,  1 May 2024 11:38:32 +0800
Message-Id: <20240501033832.1529340-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add the i3c controller devices to the ast2600 g6 common dts. We add all
6 busses to the common g6 definition, but leave disabled through the
status property, to be enabled per-platform.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 93 +++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 29f94696d8b1..f9d01599a965 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -866,6 +866,13 @@ i2c: bus@1e78a000 {
 				ranges = <0 0x1e78a000 0x1000>;
 			};
 
+			i3c: bus@1e7a0000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e7a0000 0x8000>;
+			};
+
 			fsim0: fsi@1e79b000 {
 				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
 				reg = <0x1e79b000 0x94>;
@@ -1125,3 +1132,89 @@ i2c15: i2c-bus@800 {
 		status = "disabled";
 	};
 };
+
+&i3c {
+	i3c_global: i3c-global {
+		compatible = "aspeed,ast2600-i3c-global", "syscon", "simple-mfd";
+		reg = <0x0 0x1000>;
+		resets = <&syscon ASPEED_RESET_I3C_DMA>;
+	};
+
+	i3c0: i3c@2000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x2000 0x1000>;
+		#address-cells = <3>;
+		#size-cells = <0>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C0CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c1_default>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 0>;
+		status = "disabled";
+	};
+
+	i3c1: i3c@3000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x3000 0x1000>;
+		#address-cells = <3>;
+		#size-cells = <0>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C1CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c2_default>;
+		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 1>;
+		status = "disabled";
+	};
+
+	i3c2: i3c@4000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x4000 0x1000>;
+		#address-cells = <3>;
+		#size-cells = <0>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C2CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c3_default>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 2>;
+		status = "disabled";
+	};
+
+	i3c3: i3c@5000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x5000 0x1000>;
+		#address-cells = <3>;
+		#size-cells = <0>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C3CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c4_default>;
+		interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 3>;
+		status = "disabled";
+	};
+
+	i3c4: i3c@6000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x6000 0x1000>;
+		#address-cells = <3>;
+		#size-cells = <0>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C4CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c5_default>;
+		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 4>;
+		status = "disabled";
+	};
+
+	i3c5: i3c@7000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x7000 0x1000>;
+		#address-cells = <3>;
+		#size-cells = <0>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C5CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c6_default>;
+		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 5>;
+		status = "disabled";
+	};
+};
-- 
2.39.2

