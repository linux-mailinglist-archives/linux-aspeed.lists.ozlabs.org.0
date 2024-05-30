Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 08BEB8D431F
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 03:46:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RWjkJhrx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqTTm1pBDz79CZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 11:40:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RWjkJhrx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqTTb3jjqz796s
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2024 11:40:19 +1000 (AEST)
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AC7D12012B;
	Thu, 30 May 2024 09:40:18 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717033219;
	bh=1SCvZYb3nhOKFCGFtjKWFoOu9SXIs+4ZnQMej0UWIdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RWjkJhrxwBcBObJ0K8kU8WL58ykxTlzxaP4Kv/nhclY8RSr0aRrt1m9cIB6vlC5Xb
	 lew55Xvs39WtfhzH/1NjMe0Bi+2fEQ0QVOMN6ybsdChDIf9rwiFcE/kQGMdGFJgspI
	 Wy5wV/47vRSPlF3y2fZpwWeUotNpqvYIBNonZ+G217GZSkX8/VFGm2SqE8kKXriv40
	 pjUvUSQ2pmlkHRkkAup7FWcqT0Gt958UTtHcY2zsM4MU570RH3ud8ZPMIVyCRw5/+v
	 ILaiFKoeKfeNjFS7f0rQNv9RckE7fU54n3yOnbHFql5x4XJYHVX8b6qTPnIrTVEFQz
	 tF8UXvIKeQRyA==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 30 May 2024 11:09:48 +0930
Subject: [PATCH v2 1/2] dt-bindings: gpio: aspeed,sgpio: Specify
 gpio-line-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-1-912cd16e641f@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Some devicetrees specify gpio-line-names in the sgpio node despite it
not being defined by the binding. It's a reasonable thing to do, so
define the property to squash warnings such as:

    arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: sgpio@1e780200: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 46bb121360dc..34cdf1ad9c73 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -33,6 +33,11 @@ properties:
 
   gpio-controller: true
 
+  # Each SGPIO is represented as a pair of input and output GPIOs
+  gpio-line-names:
+    minItems: 160
+    maxItems: 256
+
   '#gpio-cells':
     const: 2
 

-- 
2.39.2

