Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C237680801
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 09:57:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P52BD2fYVz3cLW
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 19:57:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (unknown [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P52B83Zw6z3c4w
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Jan 2023 19:56:38 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 30U8gwqv001936;
	Mon, 30 Jan 2023 16:42:58 +0800 (GMT-8)
	(envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 30 Jan
 2023 16:54:35 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Eddie James <eajames@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
        "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] irqchip: aspeed: scu-ic add initial register
Date: Mon, 30 Jan 2023 16:54:30 +0800
Message-ID: <20230130085430.635583-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 30U8gwqv001936
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add register initial in probe. For avoid isr/ier is not initial.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/irqchip/irq-aspeed-scu-ic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
index 279e92cf0b16..94a7223e95df 100644
--- a/drivers/irqchip/irq-aspeed-scu-ic.c
+++ b/drivers/irqchip/irq-aspeed-scu-ic.c
@@ -17,8 +17,9 @@
 
 #define ASPEED_SCU_IC_REG		0x018
 #define ASPEED_SCU_IC_SHIFT		0
-#define ASPEED_SCU_IC_ENABLE		GENMASK(6, ASPEED_SCU_IC_SHIFT)
+#define ASPEED_SCU_IC_ENABLE		GENMASK(15, ASPEED_SCU_IC_SHIFT)
 #define ASPEED_SCU_IC_NUM_IRQS		7
+#define ASPEED_SCU_IC_STATUS		GENMASK(28, 16)
 #define ASPEED_SCU_IC_STATUS_SHIFT	16
 
 #define ASPEED_AST2600_SCU_IC0_REG	0x560
@@ -155,6 +156,8 @@ static int aspeed_scu_ic_of_init_common(struct aspeed_scu_ic *scu_ic,
 		rc = PTR_ERR(scu_ic->scu);
 		goto err;
 	}
+	regmap_write_bits(scu_ic->scu, scu_ic->reg, ASPEED_SCU_IC_STATUS, ASPEED_SCU_IC_STATUS);
+	regmap_write_bits(scu_ic->scu, scu_ic->reg, ASPEED_SCU_IC_ENABLE, 0);
 
 	irq = irq_of_parse_and_map(node, 0);
 	if (!irq) {
-- 
2.34.1

