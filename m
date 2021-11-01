Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE544242A
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 00:37:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjqFK2nYHz2yHN
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 10:37:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hjps537vtz2xCh
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 10:19:37 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="211902792"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="211902792"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 16:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="727670711"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga005.fm.intel.com with ESMTP; 01 Nov 2021 16:18:24 -0700
From: jae.hyun.yoo@intel.com
To: Rob Herring <robh+dt@kernel.org>, Corey Minyard <minyard@acm.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Cedric Le Goater <clg@kaod.org>, Haiyue Wang <haiyue.wang@linux.intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH -next 3/4] ARM: dts: aspeed: add LCLK setting into LPC KCS
 nodes
Date: Mon,  1 Nov 2021 16:37:50 -0700
Message-Id: <20211101233751.49222-4-jae.hyun.yoo@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 Nov 2021 10:37:01 +1100
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
Cc: devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Add LCLK clock setting into LPC KCS nodes to enable the LCLK by
individual LPC sub drivers.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 4 ++++
 arch/arm/boot/dts/aspeed-g6.dtsi | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d0cc4be2de59..7495f93c5069 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -446,6 +446,7 @@ kcs1: kcs@24 {
 					compatible = "aspeed,ast2500-kcs-bmc-v2";
 					reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
 					interrupts = <8>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					status = "disabled";
 				};
 
@@ -453,6 +454,7 @@ kcs2: kcs@28 {
 					compatible = "aspeed,ast2500-kcs-bmc-v2";
 					reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
 					interrupts = <8>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					status = "disabled";
 				};
 
@@ -460,6 +462,7 @@ kcs3: kcs@2c {
 					compatible = "aspeed,ast2500-kcs-bmc-v2";
 					reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
 					interrupts = <8>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					status = "disabled";
 				};
 
@@ -467,6 +470,7 @@ kcs4: kcs@114 {
 					compatible = "aspeed,ast2500-kcs-bmc-v2";
 					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
 					interrupts = <8>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					status = "disabled";
 				};
 
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 465c3549fdc3..891b862363a7 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -520,6 +520,7 @@ kcs1: kcs@24 {
 					compatible = "aspeed,ast2500-kcs-bmc-v2";
 					reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
 					interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					kcs_chan = <1>;
 					status = "disabled";
 				};
@@ -528,6 +529,7 @@ kcs2: kcs@28 {
 					compatible = "aspeed,ast2500-kcs-bmc-v2";
 					reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
 					interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					status = "disabled";
 				};
 
@@ -535,6 +537,7 @@ kcs3: kcs@2c {
 					compatible = "aspeed,ast2500-kcs-bmc-v2";
 					reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
 					interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					status = "disabled";
 				};
 
@@ -542,6 +545,7 @@ kcs4: kcs@114 {
 					compatible = "aspeed,ast2500-kcs-bmc-v2";
 					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
 					interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					status = "disabled";
 				};
 
-- 
2.25.1

