Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D49E3A068D
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 00:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G04485xWhz305t
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 08:03:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=sudeep.holla@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4G04455vzzz2xYp
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Jun 2021 08:02:58 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F36FAD6E;
 Tue,  8 Jun 2021 15:02:54 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A1463F73D;
 Tue,  8 Jun 2021 15:02:54 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Drop wrong and inconsistent "sdhci"
 compatible
Date: Tue,  8 Jun 2021 23:02:47 +0100
Message-Id: <20210608220247.2237139-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

As per mmc/aspeed,sdhci.yaml, "sdhci" is not a valid compatible. In fact,
it is not documented at all(including old txt bindings). Also it is
pretty inconsistent within the same dtsi. Once instance of controller
refers to it while the other doesn't.

Fix it by dropping the wrong "sdhci" compatible.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index f96607b7b4e2..3488e8ba9df8 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -541,7 +541,7 @@ sdc: sdc@1e740000 {
 				status = "disabled";
 
 				sdhci0: sdhci@1e740100 {
-					compatible = "aspeed,ast2600-sdhci", "sdhci";
+					compatible = "aspeed,ast2600-sdhci";
 					reg = <0x100 0x100>;
 					interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 					sdhci,auto-cmd12;
@@ -550,7 +550,7 @@ sdhci0: sdhci@1e740100 {
 				};
 
 				sdhci1: sdhci@1e740200 {
-					compatible = "aspeed,ast2600-sdhci", "sdhci";
+					compatible = "aspeed,ast2600-sdhci";
 					reg = <0x200 0x100>;
 					interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 					sdhci,auto-cmd12;
-- 
2.25.1

