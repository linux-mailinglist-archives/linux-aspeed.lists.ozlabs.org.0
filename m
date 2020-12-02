Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3AD2CB51C
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 07:38:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm8S85Nh6zDr4r
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 17:38:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm8Rx0FydzDr1j
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Dec 2020 17:38:19 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0B26XlZL062294;
 Wed, 2 Dec 2020 14:33:47 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from TroyLee-PC.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 2 Dec 2020 14:36:15 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "Borislav
 Petkov" <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Robert Richter <rrichter@marvell.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:EDAC-CORE"
 <linux-edac@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: edac: aspeed-sdram-edac: Add
 ast2400/ast2600 support
Date: Wed, 2 Dec 2020 14:36:09 +0800
Message-ID: <20201202063612.21241-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0B26XlZL062294
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

Adding Aspeed AST2400 and AST2600 binding for edac driver.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 .../devicetree/bindings/edac/aspeed-sdram-edac.txt       | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt b/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
index 6a0f3d90d682..8ca9e0a049d8 100644
--- a/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
+++ b/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
@@ -1,6 +1,6 @@
-Aspeed AST2500 SoC EDAC node
+Aspeed BMC SoC EDAC node
 
-The Aspeed AST2500 SoC supports DDR3 and DDR4 memory with and without ECC (error
+The Aspeed BMC SoC supports DDR3 and DDR4 memory with and without ECC (error
 correction check).
 
 The memory controller supports SECDED (single bit error correction, double bit
@@ -11,7 +11,10 @@ Note, the bootloader must configure ECC mode in the memory controller.
 
 
 Required properties:
-- compatible: should be "aspeed,ast2500-sdram-edac"
+- compatible: should be one of
+	- "aspeed,ast2400-sdram-edac"
+	- "aspeed,ast2500-sdram-edac"
+	- "aspeed,ast2600-sdram-edac"
 - reg:        sdram controller register set should be <0x1e6e0000 0x174>
 - interrupts: should be AVIC interrupt #0
 
-- 
2.17.1

