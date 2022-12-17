Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F3C64F59F
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Dec 2022 01:10:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYmZh00TRz3bbx
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Dec 2022 11:10:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dhdd7xkr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dhdd7xkr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYmZY4c0Dz3bVK
	for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Dec 2022 11:10:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69DB4622C8;
	Sat, 17 Dec 2022 00:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64CEC4339C;
	Sat, 17 Dec 2022 00:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671235826;
	bh=l/uTSJpkb7iF9/bwE+UEqemQYnCtWxrWUH9JUkWJkGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dhdd7xkr6rP22tO0oUkeB1G3jtT88Nyi+rMojDaTMp72vwew6YDJo5HoSHWgM9wo9
	 8jh7HhBeBWZjCy+WbDmAtOrot86Ze4kh9FSUPOrzxKCwQGi2M25XOi/iTBSYkXC4aT
	 jvVX+omNn13dzyBE+mYIfXF1VwFvIbPTkQnttd/p1sLh0knVFpAt/XLii1JK1dEx6p
	 lWjOpMGABaGNa1IfjkteHxfGKGnpIhraqupBXnMrkcF2FOZABneGZ3WcuEVatvE2WQ
	 EepvjBGlXwLxuwyX5DZqd+A/o8zBIdavX3YKIRoMKEAcEmOSaECJBq19fA4jh/LDAy
	 YSgJw3TkbiEKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 3/8] ARM: dts: aspeed: rainier,everest: Move reserved memory regions
Date: Fri, 16 Dec 2022 19:10:07 -0500
Message-Id: <20221217001013.41239-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001013.41239-1-sashal@kernel.org>
References: <20221217001013.41239-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org, keescook@chromium.org, linux-aspeed@lists.ozlabs.org, Adriana Kobylak <anoo@us.ibm.com>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

[ Upstream commit e184d42a6e085f95f5c4f1a4fbabebab2984cb68 ]

Move the reserved regions to account for a decrease in DRAM when ECC is
enabled. ECC takes 1/9th of memory.

Running on HW with ECC off, u-boot prints:
DRAM:  already initialized, 1008 MiB (capacity:1024 MiB, VGA:16 MiB, ECC:off)

And with ECC on, u-boot prints:
DRAM:  already initialized, 896 MiB (capacity:1024 MiB, VGA:16 MiB, ECC:on, ECC size:896 MiB)

This implies that MCR54 is configured for ECC to be bounded at the
bottom of a 16MiB VGA memory region:

1024MiB - 16MiB (VGA) = 1008MiB
1008MiB / 9 (for ECC) = 112MiB
1008MiB - 112MiB = 896MiB (available DRAM)

The flash_memory region currently starts at offset 896MiB:
0xb8000000 (flash_memory offset) - 0x80000000 (base memory address) = 0x38000000 = 896MiB

This is the end of the available DRAM with ECC enabled and therefore it
needs to be moved.

Since the flash_memory is 64MiB in size and needs to be 64MiB aligned,
it can just be moved up by 64MiB and would sit right at the end of the
available DRAM buffer.

The ramoops region currently follows the flash_memory, but it can be
moved to sit above flash_memory which would minimize the address-space
fragmentation.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Link: https://lore.kernel.org/r/20220916195535.1020185-1-anoo@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 17 ++++++++---------
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 16 +++++++++-------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index a6a2bc3b855c..fcc890e3ad73 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -162,16 +162,9 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		/* LPC FW cycle bridge region requires natural alignment */
-		flash_memory: region@b8000000 {
-			no-map;
-			reg = <0xb8000000 0x04000000>; /* 64M */
-		};
-
-		/* 48MB region from the end of flash to start of vga memory */
-		ramoops@bc000000 {
+		ramoops@b3e00000 {
 			compatible = "ramoops";
-			reg = <0xbc000000 0x200000>; /* 16 * (4 * 0x8000) */
+			reg = <0xb3e00000 0x200000>; /* 16 * (4 * 0x8000) */
 			record-size = <0x8000>;
 			console-size = <0x8000>;
 			ftrace-size = <0x8000>;
@@ -179,6 +172,12 @@ ramoops@bc000000 {
 			max-reason = <3>; /* KMSG_DUMP_EMERG */
 		};
 
+		/* LPC FW cycle bridge region requires natural alignment */
+		flash_memory: region@b4000000 {
+			no-map;
+			reg = <0xb4000000 0x04000000>; /* 64M */
+		};
+
 		/* VGA region is dictated by hardware strapping */
 		vga_memory: region@bf000000 {
 			no-map;
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index bf59a9962379..4879da4cdbd2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -95,14 +95,9 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		flash_memory: region@b8000000 {
-			no-map;
-			reg = <0xb8000000 0x04000000>; /* 64M */
-		};
-
-		ramoops@bc000000 {
+		ramoops@b3e00000 {
 			compatible = "ramoops";
-			reg = <0xbc000000 0x200000>; /* 16 * (4 * 0x8000) */
+			reg = <0xb3e00000 0x200000>; /* 16 * (4 * 0x8000) */
 			record-size = <0x8000>;
 			console-size = <0x8000>;
 			ftrace-size = <0x8000>;
@@ -110,6 +105,13 @@ ramoops@bc000000 {
 			max-reason = <3>; /* KMSG_DUMP_EMERG */
 		};
 
+		/* LPC FW cycle bridge region requires natural alignment */
+		flash_memory: region@b4000000 {
+			no-map;
+			reg = <0xb4000000 0x04000000>; /* 64M */
+		};
+
+		/* VGA region is dictated by hardware strapping */
 		vga_memory: region@bf000000 {
 			no-map;
 			compatible = "shared-dma-pool";
-- 
2.35.1

