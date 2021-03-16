Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC14733D07F
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Mar 2021 10:21:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F078g47xfz30BX
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Mar 2021 20:21:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1263 seconds by postgrey-1.36 at boromir;
 Tue, 16 Mar 2021 20:21:53 AEDT
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F078d5Jfwz303K
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Mar 2021 20:21:51 +1100 (AEDT)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 12G8q7hw007628
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Mar 2021 16:52:07 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 12G8oqqZ007507;
 Tue, 16 Mar 2021 16:50:52 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 16:59:37 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <wangzhiqiang.bj@bytedance.com>, <yulei.sh@bytedance.com>, Rob Herring
 <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] ARM: dts: Fix 64MiB OpenBMC flash layout and
 aspeed-ast2600-evb.dts
Date: Tue, 16 Mar 2021 08:59:32 +0000
Message-ID: <20210316085932.2601-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 12G8oqqZ007507
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
Cc: leetroy@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Aspeed AST2600 u-boot requires 600KiB+ flash space. Sharing the same
openbmc-flash-layout-64.dtsi requires to resize the flash partition.

The updated flash layout as follows:
- u-boot: 896 KiB
- u-boot-env: 128 KiB
- kernel: 9MiB
- rofs: 32 MiB
- rwfs: 22 MiB

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts      | 32 +------------------
 .../arm/boot/dts/openbmc-flash-layout-64.dtsi | 18 +++++------
 2 files changed, 10 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 89be13197780..2cfae9cfed3a 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -121,37 +121,7 @@ flash@0 {
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			u-boot@0 {
-				reg = <0x0 0xe0000>; // 896KB
-				label = "u-boot";
-			};
-
-			u-boot-env@e0000 {
-				reg = <0xe0000 0x20000>; // 128KB
-				label = "u-boot-env";
-			};
-
-			kernel@100000 {
-				reg = <0x100000 0x900000>; // 9MB
-				label = "kernel";
-			};
-
-			rofs@a00000 {
-				reg = <0xa00000 0x2000000>; // 32MB
-				label = "rofs";
-			};
-
-			rwfs@6000000 {
-				reg = <0x2a00000 0x1600000>; // 22MB
-				label = "rwfs";
-			};
-		};
+#include "openbmc-flash-layout-64.dtsi"
 	};
 };
 
diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
index 91163867be34..31f59de5190b 100644
--- a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
+++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
@@ -9,27 +9,27 @@ partitions {
 	#size-cells = <1>;
 
 	u-boot@0 {
-		reg = <0x0 0x60000>; // 384KB
+		reg = <0x0 0xe0000>; // 896KB
 		label = "u-boot";
 	};
 
-	u-boot-env@60000 {
-		reg = <0x60000 0x20000>; // 128KB
+	u-boot-env@e0000 {
+		reg = <0xe0000 0x20000>; // 128KB
 		label = "u-boot-env";
 	};
 
-	kernel@80000 {
-		reg = <0x80000 0x500000>; // 5MB
+	kernel@100000 {
+		reg = <0x100000 0x900000>; // 9MB
 		label = "kernel";
 	};
 
-	rofs@580000 {
-		reg = <0x580000 0x2a80000>; // 42.5MB
+	rofs@a00000 {
+		reg = <0xa00000 0x2000000>; // 32MB
 		label = "rofs";
 	};
 
-	rwfs@3000000 {
-		reg = <0x3000000 0x1000000>; // 16MB
+	rwfs@6000000 {
+		reg = <0x2a00000 0x1600000>; // 22MB
 		label = "rwfs";
 	};
 };
-- 
2.25.1

