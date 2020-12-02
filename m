Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 542002CBA3B
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 11:14:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmFF52ZjfzDr3V
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 21:14:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmFDz4blLzDr0K
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Dec 2020 21:14:08 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0B2A9qgg086424;
 Wed, 2 Dec 2020 18:09:52 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from TroyLee-PC.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 2 Dec 2020 18:12:21 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "Borislav
 Petkov" <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Robert Richter <rric@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:EDAC-CORE"
 <linux-edac@vger.kernel.org>
Subject: [PATCH v3 2/3] ARM: dts: aspeed: Add AST2600 edac into common
 devicetree
Date: Wed, 2 Dec 2020 18:12:17 +0800
Message-ID: <20201202101218.18393-2-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202101218.18393-1-troy_lee@aspeedtech.com>
References: <20201202101218.18393-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0B2A9qgg086424
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

Adding Aspeed AST2600 edac node into common devicetree.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index b58220a49cbd..74367ee96f20 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -69,6 +69,12 @@
 		always-on;
 	};
 
+	edac: sdram@1e6e0000 {
+		compatible = "aspeed,ast2600-sdram-edac", "syscon";
+		reg = <0x1e6e0000 0x174>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	ahb {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.17.1

