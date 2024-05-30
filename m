Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3CE8D431E
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 03:46:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GJCyeMjh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqTTr4SHNz79JL
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 11:40:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GJCyeMjh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqTTc19Lcz796s
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2024 11:40:20 +1000 (AEST)
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 67395201EE;
	Thu, 30 May 2024 09:40:19 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717033220;
	bh=ErLapQqkYUF70ZPHEVqq7CYbi3OWaCay12uuoAyOF+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GJCyeMjhaKZQp+DVyfyn+RCjNQk5fZnevTUN4H4qvXsc9qwy5dtqaJiNzHgi2eDBt
	 NcHGJA0u5NKxi9LuO010j1YdBnRPcS0zVTN3/TZbEjtNbkfdw0denWFu63IWIiOpuv
	 B19qQMDM2i8KAzpVRzuwy8aTUO7/kMqGrsfnvSoeZiPiv5O+Z09dQ2cN/9onQaz3cH
	 GBdiSRbcLUqtw/Ped02fX8RD9Qot/OmMz+ZD3wrTGrzxigVKA2JAz4xtZmOjGyv0FI
	 aXs8cU6YRZ6hrJEt5FFllY14G5bZEDa61U2MKNJ4HhD5o8cf8z46VO6bBJ6rcH1n0k
	 8DHVJ+NwCmwDA==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 30 May 2024 11:09:49 +0930
Subject: [PATCH v2 2/2] dt-bindings: gpio: aspeed,sgpio: Specify
 #interrupt-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-2-912cd16e641f@codeconstruct.com.au>
References: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
In-Reply-To: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.13.0
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
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Squash warnings such as:

    arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: sgpio@1e780200: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Also, mark #interrupt-cells as required. The kernel devicetrees already
specified it where compatible nodes were defined, and u-boot pulls in
the kernel devicetrees, so this should have minimal practical impact.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 34cdf1ad9c73..1046f0331c09 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -46,6 +46,9 @@ properties:
 
   interrupt-controller: true
 
+  '#interrupt-cells':
+    const: 2
+
   clocks:
     maxItems: 1
 
@@ -60,6 +63,7 @@ required:
   - '#gpio-cells'
   - interrupts
   - interrupt-controller
+  - '#interrupt-cells'
   - ngpios
   - clocks
   - bus-frequency
@@ -77,6 +81,7 @@ examples:
         reg = <0x1e780200 0x0100>;
         clocks = <&syscon ASPEED_CLK_APB>;
         interrupt-controller;
+        #interrupt-cells = <2>;
         ngpios = <80>;
         bus-frequency = <12000000>;
     };

-- 
2.39.2

