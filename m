Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F3D961FC1
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2024 08:28:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtvc01kxlz304B
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2024 16:28:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724826478;
	cv=none; b=UQ5tgN1YwMQIvRC7yWYet3KWcWQRItxdpdc5EwzegJ5sT1/nyEFZLxL3Hsad9m7SHt5ifGbhuOQDl1FwZBDLdn5eA73ecr3ckftxLhXgpOsjNw1fidI3wTXRet8Ok8h92VNRDDDEhnqJQ4EJxuDqDtojt7MfcCB1igBQf9PiS7lJxtVJUVnsbW7Fy1T2fNQsAHEawOYmV5cW2LgzKken4BsG8Be0cxOpqD9TYlbSVrKDw4CNTWGTRD0dnLUdmmrp0tS2DRdjf00wYpNGiWU/3okntxXvrWKNyTwzELlgK+oHwma8pfXTe8FIbAVR+gnCyJkp9eyOhiVaidfSfWUnmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724826478; c=relaxed/relaxed;
	bh=hmJ0sZrSWaDgOb/QPKwvOjcpLXl84e5qCJGpFcArhVo=;
	h=Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type; b=aNSubgQCmOSsFEa9D0BorqbynLtP+EphHixmLmHEKyQmljg3Q8A2uOiMV6dGFQcFV1H1ZpSpC4hMKBOq/dZAE1sq9WglQxdyCJcB0kFpFj78/2SF5ql7SWXB8JMuSyxp9B2UnpKAKiAOC7rzsXa1opMLQV8qyGyD2ZNT07YdG424IDcZyBHH6UGVLVmLe4QAieQna3DHR+9HYRu3KKs02xDrb2vAz794oUM8muUhjVN+x/MbmQZdI/Td6hkBVE1uApHZB+R1yHZKPwbKXMDrLzE2C69XEF2nKXSnmiCEnFwxPcqeBh58063LlyJ2VQlsEZrLQ1JKrMK2JomOM8kbog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtvby1VBDz2yZ6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Aug 2024 16:27:58 +1000 (AEST)
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
Subject: [PATCH v2 2/3] dt-bindings: clock: Add AST2700 clock bindings
Date: Wed, 28 Aug 2024 14:27:39 +0800
Message-ID: <20240828062740.1614744-3-ryan_chen@aspeedtech.com>
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

Add dt bindings for AST2700 clock controller

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../dt-bindings/clock/aspeed,ast2700-clk.h    | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.h

diff --git a/include/dt-bindings/clock/aspeed,ast2700-clk.h b/include/dt-bindings/clock/aspeed,ast2700-clk.h
new file mode 100644
index 000000000000..d5cefb455b4e
--- /dev/null
+++ b/include/dt-bindings/clock/aspeed,ast2700-clk.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Device Tree binding constants for AST2700 clock controller.
+ *
+ * Copyright (c) 2024 Aspeed Technology Inc.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_AST2700_H
+#define __DT_BINDINGS_CLOCK_AST2700_H
+
+/* SOC0 clk */
+#define SCU0_CLKIN		0
+#define SCU0_CLK_24M		1
+#define SCU0_CLK_192M		2
+#define SCU0_CLK_UART		3
+#define SCU0_CLK_PSP		4
+#define SCU0_CLK_HPLL		5
+#define SCU0_CLK_HPLL_DIV2	6
+#define SCU0_CLK_HPLL_DIV4	7
+#define SCU0_CLK_DPLL		8
+#define SCU0_CLK_MPLL		9
+#define SCU0_CLK_MPLL_DIV2	10
+#define SCU0_CLK_MPLL_DIV4	11
+#define SCU0_CLK_MPLL_DIV8	12
+#define SCU0_CLK_D0		13
+#define SCU0_CLK_D1		14
+#define SCU0_CLK_CRT0		15
+#define SCU0_CLK_CRT1		16
+#define SCU0_CLK_MPHY		17
+#define SCU0_CLK_AXI0		18
+#define SCU0_CLK_AXI1		19
+#define SCU0_CLK_AHB		20
+#define SCU0_CLK_APB		21
+#define SCU0_CLK_MCLK		22
+#define SCU0_CLK_ECLK		23
+#define SCU0_CLK_VCLK		24
+#define SCU0_CLK_BCLK		25
+#define SCU0_CLK_REF		26
+#define SCU0_CLK_UART4		27
+#define SCU0_CLK_SLI		28
+#define SCU0_CLK_UFS		29
+#define SCU0_CLK_EMMCMUX	30
+#define SCU0_CLK_EMMC		31
+#define SCU0_CLK_U2PHY_CLK12M	32
+#define SCU0_CLK_U2PHY_REFCLK	33
+
+/* SOC0 clk-gate */
+#define SCU0_CLK_GATE_MCLK	34
+#define SCU0_CLK_GATE_ECLK	35
+#define SCU0_CLK_GATE_2DCLK	36
+#define SCU0_CLK_GATE_VCLK	37
+#define SCU0_CLK_GATE_BCLK	38
+#define SCU0_CLK_GATE_VGA0CLK	39
+#define SCU0_CLK_GATE_REFCLK	40
+#define SCU0_CLK_GATE_PORTBUSB2CLK	41
+#define SCU0_CLK_GATE_UHCICLK	42
+#define SCU0_CLK_GATE_VGA1CLK	43
+#define SCU0_CLK_GATE_DDRPHYCLK	44
+#define SCU0_CLK_GATE_E2M0CLK	45
+#define SCU0_CLK_GATE_HACCLK	46
+#define SCU0_CLK_GATE_PORTAUSB2CLK	47
+#define SCU0_CLK_GATE_UART4CLK	48
+#define SCU0_CLK_GATE_SLICLK	49
+#define SCU0_CLK_GATE_DACCLK	50
+#define SCU0_CLK_GATE_DP	51
+#define SCU0_CLK_GATE_E2M1CLK	52
+#define SCU0_CLK_GATE_CRT0CLK	53
+#define SCU0_CLK_GATE_CRT1CLK	54
+#define SCU0_CLK_GATE_VLCLK	55
+#define SCU0_CLK_GATE_ECDSACLK	56
+#define SCU0_CLK_GATE_RSACLK	57
+#define SCU0_CLK_GATE_RVAS0CLK	58
+#define SCU0_CLK_GATE_UFSCLK	59
+#define SCU0_CLK_GATE_EMMCCLK	60
+#define SCU0_CLK_GATE_RVAS1CLK	61
+
+/* SOC1 clk */
+#define SCU1_CLKIN		0
+#define SCU1_CLK_HPLL		1
+#define SCU1_CLK_APLL		2
+#define SCU1_CLK_APLL_DIV2	3
+#define SCU1_CLK_APLL_DIV4	4
+#define SCU1_CLK_DPLL		5
+#define SCU1_CLK_UXCLK		6
+#define SCU1_CLK_HUXCLK		7
+#define SCU1_CLK_UARTX		8
+#define SCU1_CLK_HUARTX		9
+#define SCU1_CLK_AHB		10
+#define SCU1_CLK_APB		11
+#define SCU1_CLK_UART0		12
+#define SCU1_CLK_UART1		13
+#define SCU1_CLK_UART2		14
+#define SCU1_CLK_UART3		15
+#define SCU1_CLK_UART5		16
+#define SCU1_CLK_UART6		17
+#define SCU1_CLK_UART7		18
+#define SCU1_CLK_UART8		19
+#define SCU1_CLK_UART9		20
+#define SCU1_CLK_UART10		21
+#define SCU1_CLK_UART11		22
+#define SCU1_CLK_UART12		23
+#define SCU1_CLK_APLL_DIVN	24
+#define SCU1_CLK_SDMUX		25
+#define SCU1_CLK_SDCLK		26
+#define SCU1_CLK_RMII		27
+#define SCU1_CLK_RGMII		28
+#define SCU1_CLK_MACHCLK	29
+#define SCU1_CLK_MAC0RCLK	30
+#define SCU1_CLK_MAC1RCLK	31
+
+/* SOC1 clk gate */
+#define SCU1_CLK_GATE_LCLK0		32
+#define SCU1_CLK_GATE_LCLK1		33
+#define SCU1_CLK_GATE_ESPI0CLK		34
+#define SCU1_CLK_GATE_ESPI1CLK		35
+#define SCU1_CLK_GATE_SDCLK		36
+#define SCU1_CLK_GATE_IPEREFCLK		37
+#define SCU1_CLK_GATE_RSV5CLK		38
+#define SCU1_CLK_GATE_LPCHCLK		39
+#define SCU1_CLK_GATE_MAC0CLK		40
+#define SCU1_CLK_GATE_MAC1CLK		41
+#define SCU1_CLK_GATE_MAC2CLK		42
+#define SCU1_CLK_GATE_UART0CLK		43
+#define SCU1_CLK_GATE_UART1CLK		44
+#define SCU1_CLK_GATE_UART2CLK		45
+#define SCU1_CLK_GATE_UART3CLK		46
+#define SCU1_CLK_GATE_I2CCLK		47
+#define SCU1_CLK_GATE_I3C0CLK		48
+#define SCU1_CLK_GATE_I3C1CLK		49
+#define SCU1_CLK_GATE_I3C2CLK		50
+#define SCU1_CLK_GATE_I3C3CLK		51
+#define SCU1_CLK_GATE_I3C4CLK		52
+#define SCU1_CLK_GATE_I3C5CLK		53
+#define SCU1_CLK_GATE_I3C6CLK		54
+#define SCU1_CLK_GATE_I3C7CLK		55
+#define SCU1_CLK_GATE_I3C8CLK		56
+#define SCU1_CLK_GATE_I3C9CLK		57
+#define SCU1_CLK_GATE_I3C10CLK		58
+#define SCU1_CLK_GATE_I3C11CLK		59
+#define SCU1_CLK_GATE_I3C12CLK		60
+#define SCU1_CLK_GATE_I3C13CLK		61
+#define SCU1_CLK_GATE_I3C14CLK		62
+#define SCU1_CLK_GATE_I3C15CLK		63
+#define SCU1_CLK_GATE_UART5CLK		64
+#define SCU1_CLK_GATE_UART6CLK		65
+#define SCU1_CLK_GATE_UART7CLK		66
+#define SCU1_CLK_GATE_UART8CLK		67
+#define SCU1_CLK_GATE_UART9CLK		68
+#define SCU1_CLK_GATE_UART10CLK		69
+#define SCU1_CLK_GATE_UART11CLK		70
+#define SCU1_CLK_GATE_UART12CLK		71
+#define SCU1_CLK_GATE_FSICLK		72
+#define SCU1_CLK_GATE_LTPIPHYCLK	73
+#define SCU1_CLK_GATE_LTPICLK		74
+#define SCU1_CLK_GATE_VGALCLK		75
+#define SCU1_CLK_GATE_USBUARTCLK	76
+#define SCU1_CLK_GATE_CANCLK		77
+#define SCU1_CLK_GATE_PCICLK		78
+#define SCU1_CLK_GATE_SLICLK		79
+#define SCU1_CLK_GATE_E2MCLK		80
+#define SCU1_CLK_GATE_PORTCUSB2CLK	81
+#define SCU1_CLK_GATE_PORTDUSB2CLK	82
+#define SCU1_CLK_GATE_LTPI1TXCLK	83
+
+#endif
-- 
2.34.1

