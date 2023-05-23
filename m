Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A570E11E
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 May 2023 17:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQf7l0QVnz3f6l
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 May 2023 01:56:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=195.130.132.48; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 349 seconds by postgrey-1.36 at boromir; Wed, 24 May 2023 01:56:28 AEST
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQf7c0np1z3cDt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 May 2023 01:56:27 +1000 (AEST)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4QQf0n4cTwz4x2Y3
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 May 2023 17:50:33 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:b0ac:7afd:272:4cff])
	by michel.telenet-ops.be with bizsmtp
	id 0FqP2A00N0Jkz7G06FqP0l; Tue, 23 May 2023 17:50:32 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q1UH3-002t5w-BR;
	Tue, 23 May 2023 17:50:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q1UHH-00Ckpv-QS;
	Tue, 23 May 2023 17:50:23 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: marvell: Fix pca954x i2c-mux node names
Date: Tue, 23 May 2023 17:50:21 +0200
Message-Id: <fed5b15691283ce72ceb9fb074f953c5da0f6852.1684856632.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684856632.git.geert+renesas@glider.be>
References: <cover.1684856632.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

"make dtbs_check":

    arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: i2c-switch@70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: i2c-switch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2' were unexpected)
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    ...

Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
multiplexer/switch DT bindings and the Generic Names Recommendation in
the Devicetree Specification.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi      | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index ca1aeb69a8929931..c864df9ec84d1b6f 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -135,7 +135,7 @@ &cp0_i2c1 {
 	pinctrl-0 = <&cp0_i2c1_pins>;
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
index eb04735039362373..42a60f3dd5d142fc 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
@@ -285,7 +285,7 @@ &cp0_i2c1 {
 	pinctrl-0 = <&cp0_i2c1_pins>;
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9544";
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.34.1

