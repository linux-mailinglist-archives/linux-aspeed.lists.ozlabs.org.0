Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BFE516BD3
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 May 2022 10:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsG9550NVz3bZd
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 May 2022 18:14:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsG92719Gz2xy3
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 May 2022 18:14:46 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsG926lrKz4ySt;
 Mon,  2 May 2022 18:14:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsG8x4Pqyz4x7Y;
 Mon,  2 May 2022 18:14:41 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v5 09/11] ARM: dts: aspeed: Enable Dual SPI RX transfers
Date: Mon,  2 May 2022 10:13:39 +0200
Message-Id: <20220502081341.203369-10-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502081341.203369-1-clg@kaod.org>
References: <20220502081341.203369-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

All these controllers support at least Dual SPI. Update the DTs.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Tao Ren <rentao.bupt@gmail.com>
Tested-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
 arch/arm/boot/dts/aspeed-g6.dtsi | 8 ++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 3b7b98e787e7..1c6354cec9f2 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -64,27 +64,32 @@ fmc: spi@1e620000 {
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
+				spi-rx-bus-width = <2>;
 				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
 			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@2 {
 				reg = < 2 >;
 				compatible = "jedec,spi-nor";
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@3 {
 				reg = < 3 >;
 				compatible = "jedec,spi-nor";
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@4 {
 				reg = < 4 >;
 				compatible = "jedec,spi-nor";
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 		};
@@ -100,6 +105,7 @@ flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 1e727cbaab14..c89092c3905b 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -66,18 +66,21 @@ flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@2 {
 				reg = < 2 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 		};
@@ -93,12 +96,14 @@ flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 		};
@@ -114,12 +119,14 @@ flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 6ae5dfecbdf1..4264fc0a7c3f 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -106,18 +106,21 @@ flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@2 {
 				reg = < 2 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 		};
@@ -133,12 +136,14 @@ flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 		};
@@ -154,18 +159,21 @@ flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 			flash@2 {
 				reg = < 2 >;
 				compatible = "jedec,spi-nor";
 				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
 				status = "disabled";
 			};
 		};
-- 
2.35.1

