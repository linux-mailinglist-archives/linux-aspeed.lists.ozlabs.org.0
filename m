Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7861ECBA39
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 14:20:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l88p06gWzDqfV
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 22:20:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.40.29; helo=14.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1041 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Oct 2019 22:20:16 AEST
Received: from 14.mo4.mail-out.ovh.net (14.mo4.mail-out.ovh.net [46.105.40.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l88c3dvHzDqdm
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 22:20:13 +1000 (AEST)
Received: from player792.ha.ovh.net (unknown [10.109.159.159])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 1ED6620A050
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 14:02:50 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 830B8AA662A3;
 Fri,  4 Oct 2019 12:02:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 11/16] dt-bindings: mtd: aspeed-smc: Add new comptatible for
 AST2600
Date: Fri,  4 Oct 2019 13:59:14 +0200
Message-Id: <20191004115919.20788-12-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3812860034892991411
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The SMC controllers on the AST2600 SoC are very similar to the the
AST2500. The SoC has one Firmware Memory Controller and two SPI flash
memory controllers.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 Documentation/devicetree/bindings/mtd/aspeed-smc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
index 49f6528ef547..c2373d9cfd90 100644
--- a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
+++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
@@ -14,6 +14,8 @@ Required properties:
 	"aspeed,ast2400-spi" for the AST2400 SPI Flash memory Controller
 	"aspeed,ast2500-fmc" for the AST2500 Firmware Memory Controller
 	"aspeed,ast2500-spi" for the AST2500 SPI flash memory controllers
+	"aspeed,ast2600-fmc" for the AST2600 Firmware Memory Controller
+	"aspeed,ast2600-spi" for the AST2600 SPI flash memory controllers
 
   - reg : the first contains the control register location and length,
           the second contains the memory window mapping address and length
-- 
2.21.0

