Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2E5961FC0
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2024 08:28:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtvc00Bjpz2ywR
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2024 16:28:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724826478;
	cv=none; b=KPmxo/5tXlyqaSihrbR41W02t5x44XgV9qyTanLeV3fgH0/uTFtKIApNlQY4eMG9mUE9dKy78yBIhAldKPMX2ATX09ho845twfBCsjuJrIvRiN+HkE1VLXiL8c0zeCFyvrTVUreFrUY18LrvCYMii4OVYUErFYxiVe7yE4C5sz3cMEHKTtKlbzgydnEe+xN+/HTDAsa91Gt6vM/jPrGUipVrBSP2euyYw3HLyGPmdjsMEkRdzBpFcSQqOc2lZEj6pgPhnAOQrAu2yttjsToE/7f8PHnSsQivQ159VqCOhbvuodDXNyiF3MYoMFD4WY10wAKuQjWgMHZ1PUTQahvzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724826478; c=relaxed/relaxed;
	bh=cvHoG3yNhXhfqi6CrBOyT0xKKoRXY3Log5jwPrhorFM=;
	h=Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type; b=HSJMSwQVFICOlsl/L+ROD6vZOA6b+5wg+SA4WH88PvdnKXaMGCXlkylZ8xGfWxYHgu1AmMnbwmAOcrlFQpcyuOUF3KErWl208okFW2h/AXVOxTILW1ditGVed4mh2+lroAyBr/3HC4AKOoDse9KbcacKPVoVfVDylK2s80IZpEzttzysssl51q+NEhsnTZNkaSZzZpCUdhsV2gSQCgir/5LDrHl10C1gucgW45qJ11YoS8zQXUwo1IHVgHQDgm7IdAN9WyuRJP7ICpjlj5fKcuLD7Nw6OIFnm65m5DCrOtZMtUNKqihSiipVI7bhLPmpC/scEQtDzowAe9YR4seJfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtvbx5BG2z2yZ6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Aug 2024 16:27:57 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 28 Aug
 2024 14:27:40 +0800
Received: from twmbx02.aspeed.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 28 Aug 2024 14:27:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v2 1/3] dt-bindings: reset Add AST2700 reset bindings
Date: Wed, 28 Aug 2024 14:27:38 +0800
Message-ID: <20240828062740.1614744-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828062740.1614744-1-ryan_chen@aspeedtech.com>
References: <20240828062740.1614744-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add dt bindings for AST2700 reset driver.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../dt-bindings/reset/aspeed,ast2700-reset.h  | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 include/dt-bindings/reset/aspeed,ast2700-reset.h

diff --git a/include/dt-bindings/reset/aspeed,ast2700-reset.h b/include/dt-bindings/reset/aspeed,ast2700-reset.h
new file mode 100644
index 000000000000..eca7912b9138
--- /dev/null
+++ b/include/dt-bindings/reset/aspeed,ast2700-reset.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Device Tree binding constants for AST2700 reset controller.
+ *
+ * Copyright (c) 2024 Aspeed Technology Inc.
+ */
+
+#ifndef _MACH_ASPEED_AST2700_RESET_H_
+#define _MACH_ASPEED_AST2700_RESET_H_
+
+/* SOC0 */
+#define SCU0_RESET_SDRAM		0
+#define SCU0_RESET_DDRPHY		1
+#define SCU0_RESET_RSA			2
+#define SCU0_RESET_SHA3			3
+#define SCU0_RESET_HACE			4
+#define SCU0_RESET_SOC			5
+#define SCU0_RESET_VIDEO		6
+#define SCU0_RESET_2D			7
+#define SCU0_RESET_PCIS			8
+#define SCU0_RESET_RVAS0		9
+#define SCU0_RESET_RVAS1		10
+#define SCU0_RESET_SM3			11
+#define SCU0_RESET_SM4			12
+#define SCU0_RESET_CRT0			13
+#define SCU0_RESET_ECC			14
+#define SCU0_RESET_DP_PCI		15
+#define SCU0_RESET_UFS			16
+#define SCU0_RESET_EMMC			17
+#define SCU0_RESET_PCIE1RST		18
+#define SCU0_RESET_PCIE1RSTOE		19
+#define SCU0_RESET_PCIE0RST		20
+#define SCU0_RESET_PCIE0RSTOE		21
+#define SCU0_RESET_JTAG			22
+#define SCU0_RESET_MCTP0		23
+#define SCU0_RESET_MCTP1		24
+#define SCU0_RESET_XDMA0		25
+#define SCU0_RESET_XDMA1		26
+#define SCU0_RESET_H2X1			27
+#define SCU0_RESET_DP			28
+#define SCU0_RESET_DP_MCU		29
+#define SCU0_RESET_SSP			30
+#define SCU0_RESET_H2X0			31
+#define SCU0_RESET_PORTA_VHUB1		32
+#define SCU0_RESET_PORTA_PHY3		33
+#define SCU0_RESET_PORTA_XHCI		34
+#define SCU0_RESET_PORTB_VHUB1		35
+#define SCU0_RESET_PORTB_PHY3		36
+#define SCU0_RESET_PORTB_XHCI		37
+#define SCU0_RESET_PORTA_USB		38
+#define SCU0_RESET_PORTB_USB		39
+#define SCU0_RESET_UHCI			40
+#define SCU0_RESET_TSP			41
+#define SCU0_RESET_E2M0			42
+#define SCU0_RESET_E2M1			43
+#define SCU0_RESET_VLINK		44
+
+/* SOC1 */
+#define SCU1_RESET_LPC0			0
+#define SCU1_RESET_LPC1			1
+#define SCU1_RESET_MII			2
+#define SCU1_RESET_PECI			3
+#define SCU1_RESET_PWM			4
+#define SCU1_RESET_MAC0			5
+#define SCU1_RESET_MAC1			6
+#define SCU1_RESET_MAC2			7
+#define SCU1_RESET_ADC			8
+#define SCU1_RESET_SD			9
+#define SCU1_RESET_ESPI0		10
+#define SCU1_RESET_ESPI1		11
+#define SCU1_RESET_JTAG1		12
+#define SCU1_RESET_SPI0			13
+#define SCU1_RESET_SPI1			14
+#define SCU1_RESET_SPI2			15
+#define SCU1_RESET_I3C0			16
+#define SCU1_RESET_I3C1			17
+#define SCU1_RESET_I3C2			18
+#define SCU1_RESET_I3C3			19
+#define SCU1_RESET_I3C4			20
+#define SCU1_RESET_I3C5			21
+#define SCU1_RESET_I3C6			22
+#define SCU1_RESET_I3C7			23
+#define SCU1_RESET_I3C8			24
+#define SCU1_RESET_I3C9			25
+#define SCU1_RESET_I3C10		26
+#define SCU1_RESET_I3C11		27
+#define SCU1_RESET_I3C12		28
+#define SCU1_RESET_I3C13		29
+#define SCU1_RESET_I3C14		30
+#define SCU1_RESET_I3C15		31
+#define SCU1_RESET_I3C15		31
+#define SCU1_RESET_MCU0			32
+#define SCU1_RESET_MCU1			33
+#define SCU1_RESET_H2A_SPI1		34
+#define SCU1_RESET_H2A_SPI2		35
+#define SCU1_RESET_UART0		36
+#define SCU1_RESET_UART1		37
+#define SCU1_RESET_UART2		38
+#define SCU1_RESET_UART3		39
+#define SCU1_RESET_I2C_FILTER		40
+#define SCU1_RESET_CALIPTRA		41
+#define SCU1_RESET_XDMA			42
+#define SCU1_RESET_FSI			43
+#define SCU1_RESET_CAN			44
+#define SCU1_RESET_MCTP			45
+#define SCU1_RESET_I2C			46
+#define SCU1_RESET_UART6		47
+#define SCU1_RESET_UART7		48
+#define SCU1_RESET_UART8		49
+#define SCU1_RESET_UART9		50
+#define SCU1_RESET_LTPI0		51
+#define SCU1_RESET_VGAL			52
+#define SCU1_RESET_LTPI1		53
+#define SCU1_RESET_ACE			54
+#define SCU1_RESET_E2M			55
+#define SCU1_RESET_UHCI			56
+#define SCU1_RESET_PORTC_USB2UART		57
+#define SCU1_RESET_PORTC_USB		58
+#define SCU1_RESET_PORTD_USB2UART		69
+#define SCU1_RESET_PORTD_USB		70
+#define SCU1_RESET_H2X			71
+#define SCU1_RESET_I3CDMA		72
+#define SCU1_RESET_PCIE2RST		73
+
+#endif  /* _MACH_ASPEED_AST2700_RESET_H_ */
-- 
2.34.1

