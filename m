Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46529456F9
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 06:26:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C1eJH1g6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZt7S3Z81z3dWW
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 14:26:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C1eJH1g6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZt7J6fLKz3cTj
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 14:26:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722572764;
	bh=rZ69xzA8p2Oow4YuPdd/GjIQm3GsqDIn1wsPABwt06w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C1eJH1g6eChP1SUlFJkV1MoHLeez3oJaLPt5iLRd4LozsFPF4EhhtyKXNmzQZMPZ4
	 H/aklXY3cTOr+7HgPYkMrt1EjhoZfKe9FRj7Bu4WYq21+oxU9zyNclkGM/tvEu+JnZ
	 20Z5bIh7dA6FUvEwh29s3NpraNohWdsTRvL056MC4dBhnB6Dlv8wY28fbOMXmP5vv/
	 pyRtwbeYka5BSGGArfY/owS405PzQm3fmZRZAggmG4xamlN85qIdHnTZfFaQp/lAeo
	 R/izlKQFlmcpziZVAuizR/h8cyhZWoBQwECN8cSnyZTk1Nt5ROGtdgSUeK8fab5gjG
	 Pa8HjdwyghrfQ==
Received: from [127.0.1.1] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 87CD866E06;
	Fri,  2 Aug 2024 12:26:03 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 02 Aug 2024 13:55:19 +0930
Subject: [PATCH 2/7] ARM: dts: aspeed: Specify correct generic compatible
 for CVIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dt-warnings-bmc-dts-cleanups-v1-2-1cb1378e5fcd@codeconstruct.com.au>
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

The ASPEED CVIC binding documents `aspeed,cvic` as the required generic
compatible, but the devicetrees contained `aspeed-cvic`. Update the
devictrees to use `aspeed,cvic` as documented and as required by
the driver implementation. Presumably the bug was the result of some
incoherent thoughts while removing the SoC name at the time of
writing.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index 267a0c8e828b..ec9563c629df 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -123,7 +123,7 @@ vic: interrupt-controller@1e6c0080 {
 		};
 
 		cvic: interrupt-controller@1e6c2000 {
-			compatible = "aspeed,ast2400-cvic", "aspeed-cvic";
+			compatible = "aspeed,ast2400-cvic", "aspeed,cvic";
 			valid-sources = <0x7fffffff>;
 			reg = <0x1e6c2000 0x80>;
 		};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 4d805cf344a1..a846df1a65ff 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -140,7 +140,7 @@ vic: interrupt-controller@1e6c0080 {
 		};
 
 		cvic: interrupt-controller@1e6c2000 {
-			compatible = "aspeed,ast2500-cvic", "aspeed-cvic";
+			compatible = "aspeed,ast2500-cvic", "aspeed,cvic";
 			valid-sources = <0xffffffff>;
 			copro-sw-interrupts = <1>;
 			reg = <0x1e6c2000 0x80>;

-- 
2.39.2

