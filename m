Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56699FEC5
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2024 04:24:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSvtY07Sbz3bjs
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2024 13:24:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729045475;
	cv=none; b=CIMJkJ1+28NgQunw2Wwxv397EU4oEB07M28jtA4EtKGzOdNvRgtlmp9+/3IzL3NrbdInviIykELNa/Jka6PwTLLvIFEB7OlCR8QVB8aaMT/kZrc6TrUBbF3AH6vQmEZv37+VKra736wuc8/DjKZAbspyNZY470EJC+TlTQ/QkbX+AR4dTL3oP8SCgV6AUlkK14g9OjIStbKzQrhv48DcFTozADMVeAvuvJPilYUlFZgYkV/5cPEVx935hDtQU+Z6vD4+FpZAU4N8TOzv5zyEnN59lVOnJ7aRunfuuVq6vlDGbCWC5dn9h8galF6vB7hIi3RtZOPDtkJVtq2P3yGArg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729045475; c=relaxed/relaxed;
	bh=4NNa5D6FQ12F2pH4KIb5fzDpI2rzICwJw0V+ICw4xxY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ITE0F4eANQYZyZZyqILXXU9JVy6lX2f3qr0o74sr46T/2nyzko0icujVkbBsIFZwj1ZHamSfGKmBNk6vZvpYicsHwaJfdpul5l6C0oD/beo/r7/gJeRIOI72Xw614eBCfhNJIwiX+RPChQcyfBLDrsCtBpzG5ALocHoOo/9kFdN7u78vjQ/3V1R5Cd+CUHKkpuui4ZuW62zEpswv+ulVqBKtjh1ODpsI7pzhA+/QABEZOYClL443hWIi45/wv9Odc2q49dO/LyA7UEDXp63j5Lhl/nWr7cMFFM5J0dkzDf/+xfaeqBUuNk2Nh/QFECYLcqz+8qbPBSa9Ld3rSH3TIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSvtV2Hktz2xnS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2024 13:24:30 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 16 Oct
 2024 10:24:13 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 16 Oct 2024 10:24:13 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <tglx@linutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<kevin_chen@aspeedtech.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v4 0/2] Add support for AST2700 INTC driver
Date: Wed, 16 Oct 2024 10:24:08 +0800
Message-ID: <20241016022410.1154574-1-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

---
v4:
aspeed,ast2700-intc.yaml:
  - Add |' to preserve formatting.
  - Remove the interrupt nubmer accroding to maxItems of interrupts.

drivers/irqchip/irq-aspeed-intc.c
  - Reduce scope of variables, which are bit and status.
  - Replace 32 with INTC_IRQS_PER_WORD define.
  - Remove reduendant tab.

v3:
aspeed,ast2700-intc.yaml:
  - Change reg with maxIntems:10 only.
  - Change interrupt with maxIntems:10 only.
  - Add description of INT0 and INTC1.
  - Fix the indentation.

drivers/irqchip/irq-aspeed-intc.c:
  - Change to use CONFIG_ARCH_ASPEED.
  - Fix indentation.
  - Remove irq_domain name assignment.
  - Check all irq numbers first, and set chained.

Kevin Chen (2):
  dt-bindings: interrupt-controller: Add support for ASPEED AST27XX INTC
  irqchip/aspeed-intc: Add AST27XX INTC support

 .../aspeed,ast2700-intc.yaml                  |  86 +++++++++++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-aspeed-intc.c             | 140 ++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
 create mode 100644 drivers/irqchip/irq-aspeed-intc.c

-- 
2.34.1

