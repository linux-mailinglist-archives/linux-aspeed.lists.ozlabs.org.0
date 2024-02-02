Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125C48477C8
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Feb 2024 19:40:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cJ+KZ62z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRPhs5Zbqz3cHS
	for <lists+linux-aspeed@lfdr.de>; Sat,  3 Feb 2024 05:40:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cJ+KZ62z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRPhj3TvSz3c9G
	for <linux-aspeed@lists.ozlabs.org>; Sat,  3 Feb 2024 05:40:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA6CD627F7;
	Fri,  2 Feb 2024 18:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8C5C43390;
	Fri,  2 Feb 2024 18:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706899200;
	bh=VisnG48v7H1BKRcG6W8u+lL8vcrOmwwqiTIoVM7Yz70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cJ+KZ62zGeiSTxNsm1rY8V86LysMUeO4Whx5bBHlCII8q6kuzvvZNQoU5hEx+i1ik
	 Aumo8kuU4/TyzQkS51k7FeiGMi3lQMyT9cUb9TLMCvXu1R7jAweUWSEgASgXF88N+1
	 ABVBaUPB5oPjB2P+pLbIxYT6M57KLOsJSGPiBv01Q9y+6Bz8JRG4CFBmROm8BVPtwX
	 FfO7GDGYGJRWj3LmBcUtBy1QO1064hInPkisJ6vV5bYJyyMLyJYE7TDeD+LCrEU6Ww
	 UMO4koAJq6MWvNa1VE2XcLQHvOHYCO+PoirK5ZmIkDFBSBkxKInKW0hH+jNXEqphKK
	 KCQu2dbgG893g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 20/23] ARM: dts: Fix TPM schema violations
Date: Fri,  2 Feb 2024 13:39:16 -0500
Message-ID: <20240202183926.540467-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202183926.540467-1-sashal@kernel.org>
References: <20240202183926.540467-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.3
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org, conor+dt@kernel.org, bcousson@baylibre.com, linux-aspeed@lists.ozlabs.org, tony@atomide.com, Bruno Thomsen <bruno.thomsen@gmail.com>, robh+dt@kernel.org, Patrick Williams <patrick@stwcx.xyz>, Lukas Wunner <lukas@wunner.de>, krzysztof.kozlowski+dt@linaro.org, linux-omap@vger.kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Lukas Wunner <lukas@wunner.de>

[ Upstream commit 8412c47d68436b9f9a260039a4a773daa6824925 ]

Since commit 26c9d152ebf3 ("dt-bindings: tpm: Consolidate TCG TIS
bindings"), several issues are reported by "make dtbs_check" for ARM
devicetrees:

The nodename needs to be "tpm@0" rather than "tpmdev@0" and the
compatible property needs to contain the chip's name in addition to the
generic "tcg,tpm_tis-spi" or "tcg,tpm-tis-i2c":

  tpmdev@0: $nodename:0: 'tpmdev@0' does not match '^tpm(@[0-9a-f]+)?$'
        from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#

  tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
        ['tcg,tpm-tis-i2c'] is too short
        from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#

Fix these schema violations.

Aspeed Facebook BMCs use an Infineon SLB9670:
https://lore.kernel.org/all/ZZSmMJ%2F%2Fl972Qbxu@fedora/
https://lore.kernel.org/all/ZZT4%2Fw2eVzMhtsPx@fedora/
https://lore.kernel.org/all/ZZTS0p1hdAchIbKp@heinlein.vulture-banana.ts.net/

Aspeed Tacoma uses a Nuvoton NPCT75X per commit 39d8a73c53a2 ("ARM: dts:
aspeed: tacoma: Add TPM").

phyGATE-Tauri uses an Infineon SLB9670:
https://lore.kernel.org/all/ab45c82485fa272f74adf560cbb58ee60cc42689.camel@phytec.de/

A single schema violation remains in am335x-moxa-uc-2100-common.dtsi
because it is unknown which chip is used on the board.  The devicetree's
author has been asked for clarification but has not responded so far:
https://lore.kernel.org/all/20231220090910.GA32182@wunner.de/

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
Reviewed-by: Tao Ren <rentao.bupt@gmail.com>
Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts   | 4 ++--
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts    | 4 ++--
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts           | 2 +-
 arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts        | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi    | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index e899de681f47..5be0e8fd2633 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -45,8 +45,8 @@ spi1_gpio: spi1-gpio {
 		num-chipselects = <1>;
 		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
 
-		tpmdev@0 {
-			compatible = "tcg,tpm_tis-spi";
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
 			spi-max-frequency = <33000000>;
 			reg = <0>;
 		};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
index a677c827e758..5a8169bbda87 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
@@ -80,8 +80,8 @@ spi_gpio: spi {
 		gpio-miso = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
 		num-chipselects = <1>;
 
-		tpmdev@0 {
-			compatible = "tcg,tpm_tis-spi";
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
 			spi-max-frequency = <33000000>;
 			reg = <0>;
 		};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
index 3f6010ef2b86..213023bc5aec 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
@@ -456,7 +456,7 @@ &i2c1 {
 	status = "okay";
 
 	tpm: tpm@2e {
-		compatible = "tcg,tpm-tis-i2c";
+		compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
 		reg = <0x2e>;
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 31590d3186a2..00e5887c926f 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -35,8 +35,8 @@ spi_gpio: spi {
 		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
 		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
 
-		tpmdev@0 {
-			compatible = "tcg,tpm_tis-spi";
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
 			spi-max-frequency = <33000000>;
 			reg = <0>;
 		};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi
index 44cc4ff1d0df..d12fb44aeb14 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi
@@ -116,7 +116,7 @@ &ecspi1 {
 	tpm_tis: tpm@1 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_tpm>;
-		compatible = "tcg,tpm_tis-spi";
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
 		reg = <1>;
 		spi-max-frequency = <20000000>;
 		interrupt-parent = <&gpio5>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts b/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts
index 3a723843d562..9984b343cdf0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts
@@ -130,7 +130,7 @@ &ecspi4 {
 	 * TCG specification - Section 6.4.1 Clocking:
 	 * TPM shall support a SPI clock frequency range of 10-24 MHz.
 	 */
-	st33htph: tpm-tis@0 {
+	st33htph: tpm@0 {
 		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
 		reg = <0>;
 		spi-max-frequency = <24000000>;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi
index b8730aa52ce6..a59331aa58e5 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi
@@ -217,7 +217,7 @@ &spi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi1_pins>;
 
-	tpm_spi_tis@0 {
+	tpm@0 {
 		compatible = "tcg,tpm_tis-spi";
 		reg = <0>;
 		spi-max-frequency = <500000>;
-- 
2.43.0

