Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DD9945705
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 06:26:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AN+C2fvK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZt7z020Qz3dk2
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 14:26:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AN+C2fvK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZt7M4Nh0z3cTj
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 14:26:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722572767;
	bh=vpxoEpHBuhmIeNKLI9W2DF35VDetA88m7ofJVzrN7Uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AN+C2fvK/Qy1SRVKJ+RLxPoaLE25plXPKLTeI3Q8m5qK2vFb7/KbHU1R294rv+//C
	 RJnWD30fMRQ6O2oDiLTrGgFGg1q8Ik6WXMoCEMKx1Bv05chv4uUEkZeo47ZjILQbaQ
	 kjjR60yiE+RMOpX1t17JRcl0pxuraFSahoZMEzUnQMEliq5Ry3TERJRE943t9AmDvn
	 +r/3x1ybUSTBzwnr/G2aEDRI1Nr9yut+KUfMly1egpzFu8Nqr4tHIepiR1kTVIZiTb
	 s1EGUfeUagPOLpLbouuNEiQrHeHS5RryytVsbNOdei4XCZPIPrU9QzlMvMJSxf6UqA
	 BQWR4cAPyqEEQ==
Received: from [127.0.1.1] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8058D66E0C;
	Fri,  2 Aug 2024 12:26:06 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 02 Aug 2024 13:55:23 +0930
Subject: [PATCH 6/7] ARM: dts: aspeed-g6: Use generic 'ethernet' for
 ftgmac100 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dt-warnings-bmc-dts-cleanups-v1-6-1cb1378e5fcd@codeconstruct.com.au>
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

Squash warnings such as:

```
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ftgmac@1e670000: $nodename:0: 'ftgmac@1e670000' does not match '^ethernet(@.*)?$'
```

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 6505eebf91af..ae8aa54508b2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -231,7 +231,7 @@ mdio3: mdio@1e650018 {
 			resets = <&syscon ASPEED_RESET_MII>;
 		};
 
-		mac0: ftgmac@1e660000 {
+		mac0: ethernet@1e660000 {
 			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
 			reg = <0x1e660000 0x180>;
 			#address-cells = <1>;
@@ -241,7 +241,7 @@ mac0: ftgmac@1e660000 {
 			status = "disabled";
 		};
 
-		mac1: ftgmac@1e680000 {
+		mac1: ethernet@1e680000 {
 			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
 			reg = <0x1e680000 0x180>;
 			#address-cells = <1>;
@@ -251,7 +251,7 @@ mac1: ftgmac@1e680000 {
 			status = "disabled";
 		};
 
-		mac2: ftgmac@1e670000 {
+		mac2: ethernet@1e670000 {
 			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
 			reg = <0x1e670000 0x180>;
 			#address-cells = <1>;
@@ -261,7 +261,7 @@ mac2: ftgmac@1e670000 {
 			status = "disabled";
 		};
 
-		mac3: ftgmac@1e690000 {
+		mac3: ethernet@1e690000 {
 			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
 			reg = <0x1e690000 0x180>;
 			#address-cells = <1>;

-- 
2.39.2

