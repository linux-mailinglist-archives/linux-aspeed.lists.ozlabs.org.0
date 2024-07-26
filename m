Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1395B9579E2
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKd4mWKz7CYL
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVlQ63tvsz3d95
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2024 21:09:34 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 26 Jul
 2024 19:04:00 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 26 Jul 2024 19:03:59 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <lee@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <p.zabel@pengutronix.de>, <quic_bjorande@quicinc.com>,
	<geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
	<shawnguo@kernel.org>, <neil.armstrong@linaro.org>,
	<m.szyprowski@samsung.com>, <nfraprado@collabora.com>, <u-kumar1@ti.com>,
	<kevin_chen@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v1 02/10] dt-binding: clk: ast2700: Add binding for Aspeed AST27xx Clock
Date: Fri, 26 Jul 2024 19:03:47 +0800
Message-ID: <20240726110355.2181563-3-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
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

Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
---
 .../dt-bindings/clock/aspeed,ast2700-clk.h    | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.h

diff --git a/include/dt-bindings/clock/aspeed,ast2700-clk.h b/include/dt-bindings/clock/aspeed,ast2700-clk.h
new file mode 100644
index 000000000000..5ca85503736d
--- /dev/null
+++ b/include/dt-bindings/clock/aspeed,ast2700-clk.h
@@ -0,0 +1,180 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Device Tree binding constants for AST2700 clock controller.
+ *
+ * Copyright (c) 2023 Aspeed Technology Inc.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_AST2700_H
+#define __DT_BINDINGS_CLOCK_AST2700_H
+
+/* SOC0 clk-gate */
+#define SCU0_CLK_GATE_MCLK	(0)
+#define SCU0_CLK_GATE_ECLK	(1)
+#define SCU0_CLK_GATE_GCLK	(2)
+#define SCU0_CLK_GATE_VCLK	(3)
+#define SCU0_CLK_GATE_BCLK	(4)
+#define SCU0_CLK_GATE_D1CLK	(5)
+#define SCU0_CLK_GATE_REFCLK	(6)
+#define SCU0_CLK_GATE_USB0CLK	(7)
+#define SCU0_CLK_GATE_RSV8	(8)
+#define SCU0_CLK_GATE_USB1CLK	(9)
+#define SCU0_CLK_GATE_D2CLK	(10)
+#define SCU0_CLK_GATE_RSV11	(11)
+#define SCU0_CLK_GATE_RSV12	(12)
+#define SCU0_CLK_GATE_YCLK	(13)
+#define SCU0_CLK_GATE_USB2CLK	(14)
+#define SCU0_CLK_GATE_UART4CLK	(15)
+#define SCU0_CLK_GATE_SLICLK	(16)
+#define SCU0_CLK_GATE_DACCLK	(17)
+#define SCU0_CLK_GATE_DP	(18)
+#define SCU0_CLK_GATE_RSV19	(19)
+#define SCU0_CLK_GATE_CRT1CLK	(20)
+#define SCU0_CLK_GATE_CRT2CLK	(21)
+#define SCU0_CLK_GATE_VLCLK	(22)
+#define SCU0_CLK_GATE_ECCCLK	(23)
+#define SCU0_CLK_GATE_RSACLK	(24)
+#define SCU0_CLK_GATE_RVAS0CLK	(25)
+#define SCU0_CLK_GATE_UFSCLK	(26)
+#define SCU0_CLK_GATE_EMMCCLK	(27)
+#define SCU0_CLK_GATE_RVAS1CLK	(28)
+/* reserved 29 ~ 31*/
+#define SOC0_CLK_GATE_NUM	(SCU0_CLK_GATE_RVAS1CLK + 1)
+
+/* SOC0 clk */
+#define SCU0_CLKIN		(SOC0_CLK_GATE_NUM + 0)
+#define SCU0_CLK_24M		(SOC0_CLK_GATE_NUM + 1)
+#define SCU0_CLK_192M		(SOC0_CLK_GATE_NUM + 2)
+#define SCU0_CLK_UART		(SOC0_CLK_GATE_NUM + 3)
+#define SCU0_CLK_PSP		(SOC0_CLK_GATE_NUM + 4)
+#define SCU0_CLK_HPLL		(SOC0_CLK_GATE_NUM + 5)
+#define SCU0_CLK_HPLL_DIV2	(SOC0_CLK_GATE_NUM + 6)
+#define SCU0_CLK_HPLL_DIV4	(SOC0_CLK_GATE_NUM + 7)
+#define SCU0_CLK_DPLL		(SOC0_CLK_GATE_NUM + 8)
+#define SCU0_CLK_MPLL		(SOC0_CLK_GATE_NUM + 9)
+#define SCU0_CLK_MPLL_DIV2	(SOC0_CLK_GATE_NUM + 10)
+#define SCU0_CLK_MPLL_DIV4	(SOC0_CLK_GATE_NUM + 11)
+#define SCU0_CLK_MPLL_DIV8	(SOC0_CLK_GATE_NUM + 12)
+#define SCU0_CLK_D1CLK		(SOC0_CLK_GATE_NUM + 13)
+#define SCU0_CLK_D2CLK		(SOC0_CLK_GATE_NUM + 14)
+#define SCU0_CLK_CRT1		(SOC0_CLK_GATE_NUM + 15)
+#define SCU0_CLK_CRT2		(SOC0_CLK_GATE_NUM + 16)
+#define SCU0_CLK_MPHY		(SOC0_CLK_GATE_NUM + 17)
+#define SCU0_CLK_AXI		(SOC0_CLK_GATE_NUM + 18)
+#define SCU0_CLK_AXI1		(SOC0_CLK_GATE_NUM + 19)
+#define SCU0_CLK_AHB		(SOC0_CLK_GATE_NUM + 20)
+#define SCU0_CLK_APB		(SOC0_CLK_GATE_NUM + 21)
+#define SCU0_CLK_MCLK		(SOC0_CLK_GATE_NUM + 22)
+#define SCU0_CLK_ECLK		(SOC0_CLK_GATE_NUM + 23)
+#define SCU0_CLK_GCLK		(SOC0_CLK_GATE_NUM + 24)
+#define SCU0_CLK_VCLK		(SOC0_CLK_GATE_NUM + 25)
+#define SCU0_CLK_BCLK		(SOC0_CLK_GATE_NUM + 26)
+#define SCU0_CLK_REF		(SOC0_CLK_GATE_NUM + 27)
+#define SCU0_CLK_USB0CLK	(SOC0_CLK_GATE_NUM + 28)
+#define SCU0_CLK_USB1CLK	(SOC0_CLK_GATE_NUM + 29)
+#define SCU0_CLK_USB2CLK	(SOC0_CLK_GATE_NUM + 30)
+#define SCU0_CLK_YCLK		(SOC0_CLK_GATE_NUM + 31)
+#define SCU0_CLK_UART4		(SOC0_CLK_GATE_NUM + 32)
+#define SCU0_CLK_SLI		(SOC0_CLK_GATE_NUM + 33)
+#define SCU0_CLK_ECC		(SOC0_CLK_GATE_NUM + 34)
+#define SCU0_CLK_RSA		(SOC0_CLK_GATE_NUM + 35)
+#define SCU0_CLK_RVAS0		(SOC0_CLK_GATE_NUM + 36)
+#define SCU0_CLK_UFS		(SOC0_CLK_GATE_NUM + 37)
+#define SCU0_CLK_RVAS1		(SOC0_CLK_GATE_NUM + 38)
+#define SCU0_CLK_EMMCMUX	(SOC0_CLK_GATE_NUM + 39)
+#define SCU0_CLK_EMMC		(SOC0_CLK_GATE_NUM + 40)
+#define SCU0_CLK_U2PHY_CLK12M	(SOC0_CLK_GATE_NUM + 41)
+#define SCU0_CLK_U2PHY_REFCLK	(SOC0_CLK_GATE_NUM + 42)
+
+#define SOC0_NUM_CLKS		(SCU0_CLK_U2PHY_REFCLK + 1)
+
+/* SOC1 clk gate */
+#define SCU1_CLK_GATE_LCLK0       (0)
+#define SCU1_CLK_GATE_LCLK1       (1)
+#define SCU1_CLK_GATE_ESPI0CLK    (2)
+#define SCU1_CLK_GATE_ESPI1CLK    (3)
+#define SCU1_CLK_GATE_SDCLK       (4)
+#define SCU1_CLK_GATE_REFCLK      (5)
+#define SCU1_CLK_GATE_RSV5CLK     (6)
+#define SCU1_CLK_GATE_LPCHCLK     (7)
+#define SCU1_CLK_GATE_MAC0CLK     (8)
+#define SCU1_CLK_GATE_MAC1CLK     (9)
+#define SCU1_CLK_GATE_MAC2CLK     (10)
+#define SCU1_CLK_GATE_UART0CLK    (11)
+#define SCU1_CLK_GATE_UART1CLK    (12)
+#define SCU1_CLK_GATE_UART2CLK    (13)
+#define SCU1_CLK_GATE_UART3CLK    (14)
+/* reserved bit 15*/
+#define SCU1_CLK_GATE_I3C0CLK     (16)
+#define SCU1_CLK_GATE_I3C1CLK     (17)
+#define SCU1_CLK_GATE_I3C2CLK     (18)
+#define SCU1_CLK_GATE_I3C3CLK     (19)
+#define SCU1_CLK_GATE_I3C4CLK     (20)
+#define SCU1_CLK_GATE_I3C5CLK     (21)
+#define SCU1_CLK_GATE_I3C6CLK     (22)
+#define SCU1_CLK_GATE_I3C7CLK     (23)
+#define SCU1_CLK_GATE_I3C8CLK     (24)
+#define SCU1_CLK_GATE_I3C9CLK     (25)
+#define SCU1_CLK_GATE_I3C10CLK    (26)
+#define SCU1_CLK_GATE_I3C11CLK    (27)
+#define SCU1_CLK_GATE_I3C12CLK    (28)
+#define SCU1_CLK_GATE_I3C13CLK    (29)
+#define SCU1_CLK_GATE_I3C14CLK    (30)
+#define SCU1_CLK_GATE_I3C15CLK    (31)
+
+#define SCU1_CLK_GATE_UART5CLK    (32 + 0)
+#define SCU1_CLK_GATE_UART6CLK	  (32 + 1)
+#define SCU1_CLK_GATE_UART7CLK    (32 + 2)
+#define SCU1_CLK_GATE_UART8CLK    (32 + 3)
+#define SCU1_CLK_GATE_UART9CLK	  (32 + 4)
+#define SCU1_CLK_GATE_UART10CLK   (32 + 5)
+#define SCU1_CLK_GATE_UART11CLK   (32 + 6)
+#define SCU1_CLK_GATE_UART12CLK   (32 + 7)
+#define SCU1_CLK_GATE_FSICLK      (32 + 8)
+#define SCU1_CLK_GATE_LTPIPHYCLK  (32 + 9)
+#define SCU1_CLK_GATE_LTPICLK     (32 + 10)
+#define SCU1_CLK_GATE_VGALCLK     (32 + 11)
+#define SCU1_CLK_GATE_USBUARTCLK  (32 + 12)
+#define SCU1_CLK_GATE_CANCLK      (32 + 13)
+#define SCU1_CLK_GATE_PCICLK	  (32 + 14)
+#define SCU1_CLK_GATE_SLICLK      (32 + 15)
+
+#define SOC1_CLK_GATE_NUM	(SCU1_CLK_GATE_SLICLK + 1)
+
+/* SOC1 clk */
+#define SCU1_CLKIN		(SOC1_CLK_GATE_NUM + 0)
+#define SCU1_CLK_HPLL		(SOC1_CLK_GATE_NUM + 1)
+#define SCU1_CLK_APLL		(SOC1_CLK_GATE_NUM + 2)
+#define SCU1_CLK_APLL_DIV2	(SOC1_CLK_GATE_NUM + 3)
+#define SCU1_CLK_APLL_DIV4	(SOC1_CLK_GATE_NUM + 4)
+#define SCU1_CLK_DPLL		(SOC1_CLK_GATE_NUM + 5)
+#define SCU1_CLK_UXCLK		(SOC1_CLK_GATE_NUM + 6)
+#define SCU1_CLK_HUXCLK		(SOC1_CLK_GATE_NUM + 7)
+#define SCU1_CLK_UARTX		(SOC1_CLK_GATE_NUM + 8)
+#define SCU1_CLK_HUARTX		(SOC1_CLK_GATE_NUM + 9)
+#define SCU1_CLK_AHB		(SOC1_CLK_GATE_NUM + 10)
+#define SCU1_CLK_APB		(SOC1_CLK_GATE_NUM + 11)
+#define SCU1_CLK_UART0		(SOC1_CLK_GATE_NUM + 12)
+#define SCU1_CLK_UART1		(SOC1_CLK_GATE_NUM + 13)
+#define SCU1_CLK_UART2		(SOC1_CLK_GATE_NUM + 14)
+#define SCU1_CLK_UART3		(SOC1_CLK_GATE_NUM + 15)
+#define SCU1_CLK_UART5		(SOC1_CLK_GATE_NUM + 16)
+#define SCU1_CLK_UART6		(SOC1_CLK_GATE_NUM + 17)
+#define SCU1_CLK_UART7		(SOC1_CLK_GATE_NUM + 18)
+#define SCU1_CLK_UART8		(SOC1_CLK_GATE_NUM + 19)
+#define SCU1_CLK_UART9		(SOC1_CLK_GATE_NUM + 20)
+#define SCU1_CLK_UART10		(SOC1_CLK_GATE_NUM + 21)
+#define SCU1_CLK_UART11		(SOC1_CLK_GATE_NUM + 22)
+#define SCU1_CLK_UART12		(SOC1_CLK_GATE_NUM + 23)
+#define SCU1_CLK_APLL_DIVN	(SOC1_CLK_GATE_NUM + 24)
+#define SCU1_CLK_SDMUX		(SOC1_CLK_GATE_NUM + 25)
+#define SCU1_CLK_SDCLK		(SOC1_CLK_GATE_NUM + 26)
+#define SCU1_CLK_RMII		(SOC1_CLK_GATE_NUM + 27)
+#define SCU1_CLK_RGMII		(SOC1_CLK_GATE_NUM + 28)
+#define SCU1_CLK_MACHCLK	(SOC1_CLK_GATE_NUM + 29)
+#define SCU1_CLK_MAC0RCLK	(SOC1_CLK_GATE_NUM + 30)
+#define SCU1_CLK_MAC1RCLK	(SOC1_CLK_GATE_NUM + 31)
+
+#define SOC1_NUM_CLKS		(SCU1_CLK_MAC1RCLK + 1)
+
+#endif
-- 
2.34.1

