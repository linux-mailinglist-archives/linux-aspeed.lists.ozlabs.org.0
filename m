Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C019F957A00
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL14tdcz3vXs
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkRDS65Vzz2yJL
	for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2024 21:41:33 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 14 Aug
 2024 19:41:08 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 14 Aug 2024 19:41:08 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <tglx@linutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<kevin_chen@aspeedtech.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v1 0/2] Add support for AST2700 INTC driver
Date: Wed, 14 Aug 2024 19:41:03 +0800
Message-ID: <20240814114106.2809876-1-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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

Introduce to the AST27XX INTC modules, which contain two conponents in
CPU die(12nm) and IO die(40mm) comunicating by SLI or LTPI protocol.

There are lots of device in IO die, which need to be serviced in
requested interrupt handler. As two die ICs, combine 32 interrupt source
in IO die into 1 interrupt in CPU die.

soc0_intc11 represent CPU die INTC, which each bit mapping to soc1_intcX.
soc1_intcX represent IO die INTC, which combines 32 interrupt sources.

Kevin Chen (2):
  dt-bindings: interrupt-controller: Add support for ASPEED AST27XX INTC
  irqchip/aspeed-intc: Add support for 10 INTC interrupts on AST27XX
    platforms

 .../aspeed,ast2700-intc.yaml                  | 120 +++++++++++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-aspeed-intc.c             | 198 ++++++++++++++++++
 3 files changed, 319 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
 create mode 100644 drivers/irqchip/irq-aspeed-intc.c

-- 
2.34.1

