Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA4945707
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 06:26:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=McD/rsNu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZt832RPGz3dhR
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 14:26:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=McD/rsNu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZt7N3tRqz3cTj
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 14:26:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722572767;
	bh=cZGQunjjz3bBRdwK5TaMAYgHuGZTvp+2LbpR3fHMKp4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=McD/rsNu+SHROYSlJH8AL3nzTcujMWcuCEbLIfovl8Otm/4YGGT2tgCd9vc1RLDFP
	 xsLO0IjMcXScs22DM5Iuq94kZhwYi4qj8Bp9G1FhJZVLrnWlVG1nqYp/t7v1x627vd
	 K/mO6IrwSLXV56b30SJkif27yxIzrtDgZ/aDRhrLoelDmLi82Wvq5Xe+ZeNP6OK8E0
	 DiWuZo45V+6yqZgvsgHRXBNRgfkdRX5HJJI+tOoemxTQrlUm92zonwaELMkOuM3+GM
	 rQZWzqUGsPwP3wAdyQyKo+l+Z9gll0+647wTcvfTVkGM+dIgTTaL3tDGh6Trml6uHd
	 p1VOJfDIwvYCQ==
Received: from [127.0.1.1] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4223C66E0D;
	Fri,  2 Aug 2024 12:26:07 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 02 Aug 2024 13:55:24 +0930
Subject: [PATCH 7/7] ARM: dts: aspeed-g6: Drop cells properties from
 ethernet nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dt-warnings-bmc-dts-cleanups-v1-7-1cb1378e5fcd@codeconstruct.com.au>
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

These are not specified in the binding and produce warnings such as
the following:

```
...
arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:254.27-262.5: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1e670000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
...
arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:264.27-272.5: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1e690000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
...
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e660000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
```

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index ae8aa54508b2..8ed715bd53aa 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -234,8 +234,6 @@ mdio3: mdio@1e650018 {
 		mac0: ethernet@1e660000 {
 			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
 			reg = <0x1e660000 0x180>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>;
 			status = "disabled";
@@ -244,8 +242,6 @@ mac0: ethernet@1e660000 {
 		mac1: ethernet@1e680000 {
 			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
 			reg = <0x1e680000 0x180>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>;
 			status = "disabled";
@@ -254,8 +250,6 @@ mac1: ethernet@1e680000 {
 		mac2: ethernet@1e670000 {
 			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
 			reg = <0x1e670000 0x180>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>;
 			status = "disabled";
@@ -264,8 +258,6 @@ mac2: ethernet@1e670000 {
 		mac3: ethernet@1e690000 {
 			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
 			reg = <0x1e690000 0x180>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>;
 			status = "disabled";

-- 
2.39.2

