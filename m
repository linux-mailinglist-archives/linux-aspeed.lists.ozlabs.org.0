Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 404E68D69C6
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2024 21:32:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C3l0Dp+k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrYCr3cxBz3dV9
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 Jun 2024 05:32:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C3l0Dp+k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrYBz3lgCz3dwG
	for <linux-aspeed@lists.ozlabs.org>; Sat,  1 Jun 2024 05:31:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6640FCE1CC2;
	Fri, 31 May 2024 19:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D735C32786;
	Fri, 31 May 2024 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717183879;
	bh=O2WoFSMavx99jPJmo7ZaJnxp5DHusm4ofbYWWbFHvU4=;
	h=From:To:Cc:Subject:Date:From;
	b=C3l0Dp+knX1MUgyZyPf8tm0zg81p+2torVq7r9ADrEkhOAJXdZtk3Rge/SMVdbyPE
	 g3pMOWihlXbizVZ6AiZdx5TrrRymmJYIJ8RTK/KPFGAifnhbKiEgat4EiW0Mrd9s8t
	 Gr3OrxuVQ8THufSzUPowZk1oH7B/d0r7T68gatJH4Y5KtpSUzF004WXinbtcu2Kr7Q
	 i4eDwvme7xU/PEwGkVDfgUvQ4nU5cQ/seHOqOkm7tSN65NYMhipbMYThassDUUrW0T
	 E806BwsSehy9oFuO+qntFr6GI9giGa14eCGxjPOC56YValxYtpPMynUkZUwgi4K3u1
	 l6Gejf7CoylPg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH] arm: dts: aspeed: Use standard 'i2c' bus node name
Date: Fri, 31 May 2024 14:31:14 -0500
Message-ID: <20240531193115.3814887-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The standard node name for I2C buses is 'i2c'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 28 +++++++++++-----------
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 28 +++++++++++-----------
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 32 ++++++++++++-------------
 3 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index 857cb26ed6d7..c669ec202085 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -463,7 +463,7 @@ i2c_ic: interrupt-controller@0 {
 		interrupt-controller;
 	};
 
-	i2c0: i2c-bus@40 {
+	i2c0: i2c@40 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -478,7 +478,7 @@ i2c0: i2c-bus@40 {
 		/* Does not need pinctrl properties */
 	};
 
-	i2c1: i2c-bus@80 {
+	i2c1: i2c@80 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -493,7 +493,7 @@ i2c1: i2c-bus@80 {
 		/* Does not need pinctrl properties */
 	};
 
-	i2c2: i2c-bus@c0 {
+	i2c2: i2c@c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -509,7 +509,7 @@ i2c2: i2c-bus@c0 {
 		status = "disabled";
 	};
 
-	i2c3: i2c-bus@100 {
+	i2c3: i2c@100 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -525,7 +525,7 @@ i2c3: i2c-bus@100 {
 		status = "disabled";
 	};
 
-	i2c4: i2c-bus@140 {
+	i2c4: i2c@140 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -541,7 +541,7 @@ i2c4: i2c-bus@140 {
 		status = "disabled";
 	};
 
-	i2c5: i2c-bus@180 {
+	i2c5: i2c@180 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -557,7 +557,7 @@ i2c5: i2c-bus@180 {
 		status = "disabled";
 	};
 
-	i2c6: i2c-bus@1c0 {
+	i2c6: i2c@1c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -573,7 +573,7 @@ i2c6: i2c-bus@1c0 {
 		status = "disabled";
 	};
 
-	i2c7: i2c-bus@300 {
+	i2c7: i2c@300 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -589,7 +589,7 @@ i2c7: i2c-bus@300 {
 		status = "disabled";
 	};
 
-	i2c8: i2c-bus@340 {
+	i2c8: i2c@340 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -605,7 +605,7 @@ i2c8: i2c-bus@340 {
 		status = "disabled";
 	};
 
-	i2c9: i2c-bus@380 {
+	i2c9: i2c@380 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -621,7 +621,7 @@ i2c9: i2c-bus@380 {
 		status = "disabled";
 	};
 
-	i2c10: i2c-bus@3c0 {
+	i2c10: i2c@3c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -637,7 +637,7 @@ i2c10: i2c-bus@3c0 {
 		status = "disabled";
 	};
 
-	i2c11: i2c-bus@400 {
+	i2c11: i2c@400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -653,7 +653,7 @@ i2c11: i2c-bus@400 {
 		status = "disabled";
 	};
 
-	i2c12: i2c-bus@440 {
+	i2c12: i2c@440 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -669,7 +669,7 @@ i2c12: i2c-bus@440 {
 		status = "disabled";
 	};
 
-	i2c13: i2c-bus@480 {
+	i2c13: i2c@480 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index e6f3cf3c721e..6e05cbcce49c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -592,7 +592,7 @@ i2c_ic: interrupt-controller@0 {
 		interrupt-controller;
 	};
 
-	i2c0: i2c-bus@40 {
+	i2c0: i2c@40 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -607,7 +607,7 @@ i2c0: i2c-bus@40 {
 		/* Does not need pinctrl properties */
 	};
 
-	i2c1: i2c-bus@80 {
+	i2c1: i2c@80 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -622,7 +622,7 @@ i2c1: i2c-bus@80 {
 		/* Does not need pinctrl properties */
 	};
 
-	i2c2: i2c-bus@c0 {
+	i2c2: i2c@c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -638,7 +638,7 @@ i2c2: i2c-bus@c0 {
 		status = "disabled";
 	};
 
-	i2c3: i2c-bus@100 {
+	i2c3: i2c@100 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -654,7 +654,7 @@ i2c3: i2c-bus@100 {
 		status = "disabled";
 	};
 
-	i2c4: i2c-bus@140 {
+	i2c4: i2c@140 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -670,7 +670,7 @@ i2c4: i2c-bus@140 {
 		status = "disabled";
 	};
 
-	i2c5: i2c-bus@180 {
+	i2c5: i2c@180 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -686,7 +686,7 @@ i2c5: i2c-bus@180 {
 		status = "disabled";
 	};
 
-	i2c6: i2c-bus@1c0 {
+	i2c6: i2c@1c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -702,7 +702,7 @@ i2c6: i2c-bus@1c0 {
 		status = "disabled";
 	};
 
-	i2c7: i2c-bus@300 {
+	i2c7: i2c@300 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -718,7 +718,7 @@ i2c7: i2c-bus@300 {
 		status = "disabled";
 	};
 
-	i2c8: i2c-bus@340 {
+	i2c8: i2c@340 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -734,7 +734,7 @@ i2c8: i2c-bus@340 {
 		status = "disabled";
 	};
 
-	i2c9: i2c-bus@380 {
+	i2c9: i2c@380 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -750,7 +750,7 @@ i2c9: i2c-bus@380 {
 		status = "disabled";
 	};
 
-	i2c10: i2c-bus@3c0 {
+	i2c10: i2c@3c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -766,7 +766,7 @@ i2c10: i2c-bus@3c0 {
 		status = "disabled";
 	};
 
-	i2c11: i2c-bus@400 {
+	i2c11: i2c@400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -782,7 +782,7 @@ i2c11: i2c-bus@400 {
 		status = "disabled";
 	};
 
-	i2c12: i2c-bus@440 {
+	i2c12: i2c@440 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -798,7 +798,7 @@ i2c12: i2c-bus@440 {
 		status = "disabled";
 	};
 
-	i2c13: i2c-bus@480 {
+	i2c13: i2c@480 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 7fb421153596..0c00882f111a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -905,7 +905,7 @@ udma: dma-controller@1e79e000 {
 #include "aspeed-g6-pinctrl.dtsi"
 
 &i2c {
-	i2c0: i2c-bus@80 {
+	i2c0: i2c@80 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x80 0x80>;
@@ -919,7 +919,7 @@ i2c0: i2c-bus@80 {
 		status = "disabled";
 	};
 
-	i2c1: i2c-bus@100 {
+	i2c1: i2c@100 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x100 0x80>;
@@ -933,7 +933,7 @@ i2c1: i2c-bus@100 {
 		status = "disabled";
 	};
 
-	i2c2: i2c-bus@180 {
+	i2c2: i2c@180 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x180 0x80>;
@@ -947,7 +947,7 @@ i2c2: i2c-bus@180 {
 		status = "disabled";
 	};
 
-	i2c3: i2c-bus@200 {
+	i2c3: i2c@200 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x200 0x80>;
@@ -961,7 +961,7 @@ i2c3: i2c-bus@200 {
 		status = "disabled";
 	};
 
-	i2c4: i2c-bus@280 {
+	i2c4: i2c@280 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x280 0x80>;
@@ -975,7 +975,7 @@ i2c4: i2c-bus@280 {
 		status = "disabled";
 	};
 
-	i2c5: i2c-bus@300 {
+	i2c5: i2c@300 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x300 0x80>;
@@ -989,7 +989,7 @@ i2c5: i2c-bus@300 {
 		status = "disabled";
 	};
 
-	i2c6: i2c-bus@380 {
+	i2c6: i2c@380 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x380 0x80>;
@@ -1003,7 +1003,7 @@ i2c6: i2c-bus@380 {
 		status = "disabled";
 	};
 
-	i2c7: i2c-bus@400 {
+	i2c7: i2c@400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x400 0x80>;
@@ -1017,7 +1017,7 @@ i2c7: i2c-bus@400 {
 		status = "disabled";
 	};
 
-	i2c8: i2c-bus@480 {
+	i2c8: i2c@480 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x480 0x80>;
@@ -1031,7 +1031,7 @@ i2c8: i2c-bus@480 {
 		status = "disabled";
 	};
 
-	i2c9: i2c-bus@500 {
+	i2c9: i2c@500 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x500 0x80>;
@@ -1045,7 +1045,7 @@ i2c9: i2c-bus@500 {
 		status = "disabled";
 	};
 
-	i2c10: i2c-bus@580 {
+	i2c10: i2c@580 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x580 0x80>;
@@ -1059,7 +1059,7 @@ i2c10: i2c-bus@580 {
 		status = "disabled";
 	};
 
-	i2c11: i2c-bus@600 {
+	i2c11: i2c@600 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x600 0x80>;
@@ -1073,7 +1073,7 @@ i2c11: i2c-bus@600 {
 		status = "disabled";
 	};
 
-	i2c12: i2c-bus@680 {
+	i2c12: i2c@680 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x680 0x80>;
@@ -1087,7 +1087,7 @@ i2c12: i2c-bus@680 {
 		status = "disabled";
 	};
 
-	i2c13: i2c-bus@700 {
+	i2c13: i2c@700 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x700 0x80>;
@@ -1101,7 +1101,7 @@ i2c13: i2c-bus@700 {
 		status = "disabled";
 	};
 
-	i2c14: i2c-bus@780 {
+	i2c14: i2c@780 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x780 0x80>;
@@ -1115,7 +1115,7 @@ i2c14: i2c-bus@780 {
 		status = "disabled";
 	};
 
-	i2c15: i2c-bus@800 {
+	i2c15: i2c@800 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x800 0x80>;
-- 
2.43.0

