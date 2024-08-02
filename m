Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E9945702
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 06:26:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MXnyLsMc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZt7p33Vpz3dXP
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 14:26:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MXnyLsMc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZt7L0sGWz3cTj
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 14:26:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722572765;
	bh=+Qq/WSoK+u2AglB77aeXcCPltkt+02ev2aFN48iHui0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MXnyLsMcLNgRuLeoYxizDxsxIcojn3n8Aym+9LTMJ9fzbxEWVRpR3cVKWtYNMqaXb
	 D6YEDeQ8KQCcwaIIF/QtiD2uqaHKo7j992KDS/PZVzUv1DLjIYRKoLmgdrW+AXcumF
	 NH8t1hTzBuq4aNLXHsAX7DGSe4fHikNFujirfrpTBEaufXRid9gDpd4zURQ2eUpdDm
	 J251oi0em97JIf9Sl2XGccNaYD+uCVxxQh+DaXqSsKG4xmWyfBGhioeCuC7nwKcBZx
	 EIrvPDcSQqb+KZzMMFsKeiNaKreGhD8P29slySlgk1H2Gs4pAXPn6hLQR9TgCgcdxb
	 hf75uljHDaSrw==
Received: from [127.0.1.1] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 041DC66E0A;
	Fri,  2 Aug 2024 12:26:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 02 Aug 2024 13:55:21 +0930
Subject: [PATCH 4/7] ARM: dts: aspeed: Remove undocumented XDMA nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dt-warnings-bmc-dts-cleanups-v1-4-1cb1378e5fcd@codeconstruct.com.au>
References: <20240802-dt-warnings-bmc-dts-cleanups-v1-0-1cb1378e5fcd@codeconstruct.com.au>
In-Reply-To: <20240802-dt-warnings-bmc-dts-cleanups-v1-0-1cb1378e5fcd@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eddie James <eajames@linux.ibm.com>
X-Mailer: b4 0.14.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

There's no binding defined for the device, so remove it from the
devicetrees until someone has the motivation to write one.

Squash warnings such as:

```
arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb@1e6e0000/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
```

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts     |  5 -----
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts     |  5 -----
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts     |  5 -----
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts      |  5 -----
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts |  5 -----
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi                 | 11 -----------
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                 | 13 -------------
 7 files changed, 49 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
index 6fdda42575df..7364adc6b80d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
@@ -570,11 +570,6 @@ &wdt2 {
 	status = "okay";
 };
 
-&xdma {
-	status = "okay";
-	memory-region = <&vga_memory>;
-};
-
 &kcs2 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0xca8 0xcac>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
index 214b2e6a4c6d..513077a1f4be 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
@@ -2486,11 +2486,6 @@ &wdt2 {
 	status = "okay";
 };
 
-&xdma {
-	status = "okay";
-	memory-region = <&vga_memory>;
-};
-
 &kcs2 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0xca8 0xcac>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
index 5cb0094e21e0..0776b72c2199 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
@@ -1722,11 +1722,6 @@ &wdt2 {
 	status = "okay";
 };
 
-&xdma {
-	status = "okay";
-	memory-region = <&vga_memory>;
-};
-
 &kcs2 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0xca8 0xcac>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
index 213023bc5aec..b31eb8e58c6b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
@@ -870,11 +870,6 @@ &pinctrl {
 		    <&pinctrl_lsirq_default>;
 };
 
-&xdma {
-	status = "okay";
-	memory-region = <&vga_memory>;
-};
-
 &kcs2 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0xca8 0xcac>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
index a20a532fc280..7820bc829dff 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
@@ -696,9 +696,4 @@ &video {
 	memory-region = <&video_engine_memory>;
 };
 
-&xdma {
-	status = "okay";
-	memory-region = <&vga_memory>;
-};
-
 #include "ibm-power9-dual.dtsi"
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 100380417f99..57a699a7c149 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -281,17 +281,6 @@ gfx: display@1e6e6000 {
 				interrupts = <0x19>;
 			};
 
-			xdma: xdma@1e6e7000 {
-				compatible = "aspeed,ast2500-xdma";
-				reg = <0x1e6e7000 0x100>;
-				clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
-				resets = <&syscon ASPEED_RESET_XDMA>;
-				interrupts-extended = <&vic 6>, <&scu_ic ASPEED_AST2500_SCU_IC_PCIE_RESET_LO_TO_HI>;
-				aspeed,pcie-device = "bmc";
-				aspeed,scu = <&syscon>;
-				status = "disabled";
-			};
-
 			adc: adc@1e6e9000 {
 				compatible = "aspeed,ast2500-adc";
 				reg = <0x1e6e9000 0xb0>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 0c00882f111a..6505eebf91af 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -398,19 +398,6 @@ gfx: display@1e6e6000 {
 				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			xdma: xdma@1e6e7000 {
-				compatible = "aspeed,ast2600-xdma";
-				reg = <0x1e6e7000 0x100>;
-				clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
-				resets = <&syscon ASPEED_RESET_DEV_XDMA>, <&syscon ASPEED_RESET_RC_XDMA>;
-				reset-names = "device", "root-complex";
-				interrupts-extended = <&gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-						      <&scu_ic0 ASPEED_AST2600_SCU_IC0_PCIE_PERST_LO_TO_HI>;
-				aspeed,pcie-device = "bmc";
-				aspeed,scu = <&syscon>;
-				status = "disabled";
-			};
-
 			adc0: adc@1e6e9000 {
 				compatible = "aspeed,ast2600-adc0";
 				reg = <0x1e6e9000 0x100>;

-- 
2.39.2

