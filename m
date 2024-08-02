Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B19C9456FD
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 06:26:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BbNlBZh+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZt7X5LJxz3dVr
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 14:26:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BbNlBZh+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZt7K0LYNz3cVR
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 14:26:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722572763;
	bh=H+XJZd6Qz1b0F/2H37PFytvDYtgyyZJ1Vc0HJaY31DY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BbNlBZh+tnuelh737EZYd6gRQe+RmPTzXJbPmew8G+nQ8ZBZgnhzzVMxwspI7O/c3
	 +oKR+vWzUH9+iWXhqc4VIt35N73ngi5G+6EaJ2sMof02dYYtXjH5Z141LdLSFuehhU
	 bm6PQmeZiC3796vFmfToFIaVrbvP18WCFJZ65AiRtkkcs4lF80ZHXzGRzPe7ayYDYP
	 SVPLqV/HoXmGo7tCi/6G5qG2G2CQFypplAY0zpaMrjSfaJlxalA+mpacL8vOb9jurR
	 RdbwE9dXS2imcbssljJC3A73j4jokkKeGfbjVD7B21iJVKkXag6BmPbHjPDgpLFG5/
	 LuVz2jzclmCEg==
Received: from [127.0.1.1] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CAC4166CBD;
	Fri,  2 Aug 2024 12:26:02 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 02 Aug 2024 13:55:18 +0930
Subject: [PATCH 1/7] ARM: dts: aspeed: Fix coprocessor interrupt controller
 node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dt-warnings-bmc-dts-cleanups-v1-1-1cb1378e5fcd@codeconstruct.com.au>
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

Squash schema warnings such as:

```
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
```

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index c669ec202085..267a0c8e828b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -122,7 +122,7 @@ vic: interrupt-controller@1e6c0080 {
 			reg = <0x1e6c0080 0x80>;
 		};
 
-		cvic: copro-interrupt-controller@1e6c2000 {
+		cvic: interrupt-controller@1e6c2000 {
 			compatible = "aspeed,ast2400-cvic", "aspeed-cvic";
 			valid-sources = <0x7fffffff>;
 			reg = <0x1e6c2000 0x80>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 6e05cbcce49c..4d805cf344a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -139,7 +139,7 @@ vic: interrupt-controller@1e6c0080 {
 			reg = <0x1e6c0080 0x80>;
 		};
 
-		cvic: copro-interrupt-controller@1e6c2000 {
+		cvic: interrupt-controller@1e6c2000 {
 			compatible = "aspeed,ast2500-cvic", "aspeed-cvic";
 			valid-sources = <0xffffffff>;
 			copro-sw-interrupts = <1>;

-- 
2.39.2

