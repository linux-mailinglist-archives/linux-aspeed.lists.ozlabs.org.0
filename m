Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65258F46BA
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Nov 2019 12:44:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478djL2yLXzF6sJ
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Nov 2019 22:44:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="L91WHj27"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478dfr4kkRzF6tT
 for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Nov 2019 22:42:28 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD05D21D82;
 Fri,  8 Nov 2019 11:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573213345;
 bh=AnQeayZI8Q5t0IuDvtp0ycef/61y+WT5LaZc9K/UZ0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L91WHj27v+YdXfcHNqHSbxQwUhwO25RJELGFwUW91Ia73XGcr8Ky55X3w8hKVfm06
 rC2Fu66Pthf2QGgDacPecxuhXsjEKFycadoCufx0SBpGyQzilBhs20v+1C8lO2XE1t
 PQgZnZ76h/5ImLCAZa/DuSZA8uM/aRb6UfXWNZCA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 181/205] ARM: dts: aspeed: Fix I2C bus warnings
Date: Fri,  8 Nov 2019 06:37:28 -0500
Message-Id: <20191108113752.12502-181-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108113752.12502-1-sashal@kernel.org>
References: <20191108113752.12502-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Rob Herring <robh@kernel.org>

[ Upstream commit 1426d40e11f730e0c0fd3700a7048082f87b0e6e ]

dtc has new checks for I2C buses. The ASpeed dts files have a node named
'i2c' which causes a false positive warning. As the node is a 'simple-bus',
correct the node name to be 'bus' to fix the warnings.

arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-ast2500-evb.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-opp-zaius.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dtb: Warning (i2c_bus_bridge): /ahb/apb/i2c@1e78a000: incorrect #size-cells for I2C bus

Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index b23a983f95a53..69f6b9d2e7e7d 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -350,7 +350,7 @@
 				status = "disabled";
 			};
 
-			i2c: i2c@1e78a000 {
+			i2c: bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 87fdc146ff525..d107459fc0f89 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -410,7 +410,7 @@
 				status = "disabled";
 			};
 
-			i2c: i2c@1e78a000 {
+			i2c: bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
-- 
2.20.1

