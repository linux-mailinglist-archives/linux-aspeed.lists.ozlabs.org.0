Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79C66567
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 05:56:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lJxh6XnbzDqNy
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 13:56:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZWJZ36c+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="J1ytC6y8"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lJXN3H2NzDqmM
 for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jul 2019 13:37:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4CA9A22223;
 Thu, 11 Jul 2019 23:37:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Jul 2019 23:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wkoAIErEzcHdT
 OhYOKxqtuFlPzo+edLdLqHK1zIdcu0=; b=ZWJZ36c+VcnsL4AIvV8Y31GLbiiiy
 nZo9Z6QG/Zf6NbSIlks9CmVZgXv1IX8GsYGeWtIDDM759fVKilPXwjjygAT+/EhM
 mJ9WRXV51yPZOMJQ5Ifl5tRIMQr4SxA97vGprxWFRbgb4dNKxy8uT/oe0YfVdMd5
 0smfv9uN/4/ufPquqXUnnOgEhNrlr12iuS6hs7ZLfUCXdBYNStCAkOXMSEOMSyJq
 SDspF0cjOp7chP0Ra7dDHI7Z0yV/XmXQAO+hHPgWun6yXcVTB0xDHFGhs9VWm93F
 dzlSbacoU/ihLcw9Tk7UriVgOt6Xzn6uCEupD5SG/AnbB/ZqBVsl/v4Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wkoAIErEzcHdTOhYOKxqtuFlPzo+edLdLqHK1zIdcu0=; b=J1ytC6y8
 Tr3qehwTCKCxh0nm4i5A6ORWoJSmimyt9WGVnORooi2bOO2SeK+Kjmt68+yg5Wpb
 WCb/bmNRXsbaO1dj4JDEMF8iuSkkDYxvJ+OQbSVThirA43fVIjgxnJr2H+ThZOoO
 YMhlmIrA53fRBH0LCOIynmLvde3EpNV1u62B/759Rc6N0FbuPlvGZsOiRLb7lNcZ
 Gjp0Ylm4LDF9jtY+C0arSQdAxtmPpgyf7Ec/b04yOtM03fnIVNoV+AwA8kV/NWTI
 bhT6qA5B/XkeUfCyK83hHc42ELOmaWAtsiYHhg2QMxktWcWluBOnM6P5qggRmnVO
 CTR7QkjHWjraug==
X-ME-Sender: <xms:fwAoXY8rHKslaU4FfgFauoJikKTPdyNlSo-JihW7Hj_KAHzPFDm2QQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeelgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:fwAoXW0KJO_zVEhE4_KUMGm1_16jeAEKykbuMcIrAnmR68g_0cKJcw>
 <xmx:fwAoXTkG7gBUKu7RbFT-H3SvzIp7kBO7foYj71lgnMMffGXlsXFp7g>
 <xmx:fwAoXb15oa9maB6T5NmiN6sL0vmtrV9OIOBVI0_ccCdTq4ZLAD2HFA>
 <xmx:fwAoXYLEvvwVpjmU5tV2hAadyys0ZGCG8YuwgTwbd0KyuAZ0g-PTig>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7CBE1380084;
 Thu, 11 Jul 2019 23:37:32 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 1/2] ARM: dts: aspeed: Describe SD controllers
Date: Fri, 12 Jul 2019 13:07:25 +0930
Message-Id: <20190712033726.25237-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190712033726.25237-1-andrew@aj.id.au>
References: <20190712033726.25237-1-andrew@aj.id.au>
MIME-Version: 1.0
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
Cc: mark.rutland@arm.com, ryanchen.aspeed@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2400 and AST2500 both share the same SD controller, at the same
location in the physical address space and the same hardware interrupt,
with the same clock configurations.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
In v2:

* Rename sd-controller compatible
* Drop "sdhci" compatible
* Explicit ranges
* Remove slot property

 arch/arm/boot/dts/aspeed-g4.dtsi | 28 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 28 ++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 5d7050d00874..6ef2563ce372 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -188,6 +188,34 @@
 				reg = <0x1e720000 0x8000>;	// 32K
 			};
 
+			sdc: sdc@1e740000 {
+				compatible = "aspeed,ast2400-sd-controller";
+				reg = <0x1e740000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e740000 0x10000>;
+				clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
+				status = "disabled";
+
+				sdhci0: sdhci@100 {
+					compatible = "aspeed,ast2400-sdhci";
+					reg = <0x100 0x100>;
+					interrupts = <26>;
+					sdhci,auto-cmd12;
+					clocks = <&syscon ASPEED_CLK_SDIO>;
+					status = "disabled";
+				};
+
+				sdhci1: sdhci@200 {
+					compatible = "aspeed,ast2400-sdhci";
+					reg = <0x200 0x100>;
+					interrupts = <26>;
+					sdhci,auto-cmd12;
+					clocks = <&syscon ASPEED_CLK_SDIO>;
+					status = "disabled";
+				};
+			};
+
 			gpio: gpio@1e780000 {
 				#gpio-cells = <2>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 4345c3153ca7..c0e71f814fec 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -262,6 +262,34 @@
 				reg = <0x1e720000 0x9000>;	// 36K
 			};
 
+			sdc: sdc@1e740000 {
+				compatible = "aspeed,ast2500-sd-controller";
+				reg = <0x1e740000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e740000 0x10000>;
+				clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
+				status = "disabled";
+
+				sdhci0: sdhci@100 {
+					compatible = "aspeed,ast2500-sdhci";
+					reg = <0x100 0x100>;
+					interrupts = <26>;
+					sdhci,auto-cmd12;
+					clocks = <&syscon ASPEED_CLK_SDIO>;
+					status = "disabled";
+				};
+
+				sdhci1: sdhci@200 {
+					compatible = "aspeed,ast2500-sdhci";
+					reg = <0x200 0x100>;
+					interrupts = <26>;
+					sdhci,auto-cmd12;
+					clocks = <&syscon ASPEED_CLK_SDIO>;
+					status = "disabled";
+				};
+			};
+
 			gpio: gpio@1e780000 {
 				#gpio-cells = <2>;
 				gpio-controller;
-- 
2.20.1

