Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B738F3C8C5E
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Jul 2021 21:39:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQ7B64fKPz308c
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Jul 2021 05:39:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=izee9JHd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=izee9JHd; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ7B321V5z3004
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Jul 2021 05:39:39 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C258613CF;
 Wed, 14 Jul 2021 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291576;
 bh=lrWpKwP8nOxGEVR6JMOZyNEM335MQz25AnAVPJiYWSc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=izee9JHdmy1AQHb9EXeCdHmwHVAMAvNHZngaxN0lHXsxTnT6w//4FM8GHZZSr3wAk
 beYMDvyuzmdE4xj7m1+q9b/eojczJ0BtMdc4pEPAgYJkCKVawqvZnhf+r5JE8Mr4B2
 mSaCPtwEqFUzQ0kPjbxczAQoRCL2NKnLvxjxBPtYV/+B00lpn5DSlA5j3GUIQnsDEg
 Y2NASC5HjAQF1sr+IlOZMnIMw0d3L+o1aioE5vMNmnUO619LWKpiEtvsYqoAZssWac
 m4he3KeR2kV5k6i/At5mNbo/+Ld+CFe/H6l9jszCr7VQt5wOzLLJ1LhibcU0+LC65B
 epjq8f470ab8Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 066/108] ARM: dts: aspeed: Everest: Fix cable
 card PCA chips
Date: Wed, 14 Jul 2021 15:37:18 -0400
Message-Id: <20210714193800.52097-66-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714193800.52097-1-sashal@kernel.org>
References: <20210714193800.52097-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Santosh Puranik <santosh.puranik@in.ibm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Santosh Puranik <santosh.puranik@in.ibm.com>

[ Upstream commit 010da3daf9278ed03d38b7dcb0422f1a7df1bdd3 ]

Correct two PCA chips which were placed on the wrong I2C bus and
address.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Santosh Puranik <santosh.puranik@in.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 168 +++++++++----------
 1 file changed, 83 insertions(+), 85 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 3295c8c7c05c..27af28c8847d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -353,10 +353,47 @@ gpio@15 {
 
 &i2c1 {
 	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
 
-	pca2: pca9552@61 {
+&i2c3 {
+	status = "okay";
+
+	eeprom@54 {
+		compatible = "atmel,24c128";
+		reg = <0x54>;
+	};
+
+	power-supply@68 {
+		compatible = "ibm,cffps";
+		reg = <0x68>;
+	};
+
+	power-supply@69 {
+		compatible = "ibm,cffps";
+		reg = <0x69>;
+	};
+
+	power-supply@6a {
+		compatible = "ibm,cffps";
+		reg = <0x6a>;
+	};
+
+	power-supply@6b {
+		compatible = "ibm,cffps";
+		reg = <0x6b>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	pca2: pca9552@65 {
 		compatible = "nxp,pca9552";
-		reg = <0x61>;
+		reg = <0x65>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -424,12 +461,54 @@ gpio@9 {
 			reg = <9>;
 			type = <PCA955X_TYPE_GPIO>;
 		};
+	};
 
+	i2c-switch@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c4mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+		};
+
+		i2c4mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c4mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
 	};
+};
 
-	pca3: pca9552@62 {
+&i2c5 {
+	status = "okay";
+
+	pca3: pca9552@66 {
 		compatible = "nxp,pca9552";
-		reg = <0x62>;
+		reg = <0x66>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -512,87 +591,6 @@ gpio@11 {
 
 	};
 
-};
-
-&i2c2 {
-	status = "okay";
-};
-
-&i2c3 {
-	status = "okay";
-
-	eeprom@54 {
-		compatible = "atmel,24c128";
-		reg = <0x54>;
-	};
-
-	power-supply@68 {
-		compatible = "ibm,cffps";
-		reg = <0x68>;
-	};
-
-	power-supply@69 {
-		compatible = "ibm,cffps";
-		reg = <0x69>;
-	};
-
-	power-supply@6a {
-		compatible = "ibm,cffps";
-		reg = <0x6a>;
-	};
-
-	power-supply@6b {
-		compatible = "ibm,cffps";
-		reg = <0x6b>;
-	};
-};
-
-&i2c4 {
-	status = "okay";
-
-	i2c-switch@70 {
-		compatible = "nxp,pca9546";
-		reg = <0x70>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "okay";
-		i2c-mux-idle-disconnect;
-
-		i2c4mux0chn0: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-			eeprom@52 {
-				compatible = "atmel,24c64";
-				reg = <0x52>;
-			};
-		};
-
-		i2c4mux0chn1: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-			eeprom@50 {
-				compatible = "atmel,24c64";
-				reg = <0x50>;
-			};
-		};
-
-		i2c4mux0chn2: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-			eeprom@51 {
-				compatible = "atmel,24c64";
-				reg = <0x51>;
-			};
-		};
-	};
-};
-
-&i2c5 {
-	status = "okay";
-
 	i2c-switch@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
-- 
2.30.2

