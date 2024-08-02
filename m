Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1062D9579F8
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKz56D4z3bVR
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb0Lt6FDMz3cWN
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 19:06:30 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 2 Aug
 2024 17:05:52 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 2 Aug 2024 17:05:52 +0800
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
Subject: [PATCH v2 9/9] arm64: dts: aspeed: Add initial AST2700 EVB device tree
Date: Fri, 2 Aug 2024 17:05:44 +0800
Message-ID: <20240802090544.2741206-11-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
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

Add EVB board of AST2700 in ASPEED G7 Architecture.

Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
---
 arch/arm64/boot/dts/aspeed/Makefile        |  4 ++
 arch/arm64/boot/dts/aspeed/ast2700-evb.dts | 58 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
 create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts

diff --git a/arch/arm64/boot/dts/aspeed/Makefile b/arch/arm64/boot/dts/aspeed/Makefile
new file mode 100644
index 000000000000..ffe7e15017cc
--- /dev/null
+++ b/arch/arm64/boot/dts/aspeed/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_ASPEED) += \
+	ast2700-evb.dtb
diff --git a/arch/arm64/boot/dts/aspeed/ast2700-evb.dts b/arch/arm64/boot/dts/aspeed/ast2700-evb.dts
new file mode 100644
index 000000000000..09c9569c0f7b
--- /dev/null
+++ b/arch/arm64/boot/dts/aspeed/ast2700-evb.dts
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/dts-v1/;
+
+#include "aspeed-g7.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "AST2700A1-EVB";
+	compatible = "aspeed,ast2700-evb", "aspeed,ast2700";
+
+	aliases {
+		serial4 = &uart4;
+	};
+
+	chosen {
+		bootargs = "console=ttyS4,115200n8";
+		stdout-path = &uart4;
+	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	memory@400000000 {
+		device_type = "memory";
+		reg = <0x4 0x00000000 0x0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		mcu_fw: mcu-firmware@42fe00000 {
+			reg = <0x4 0x2fe00000 0x0 0x200000>;
+			no-map;
+		};
+
+		atf: trusted-firmware-a@430000000 {
+			reg = <0x4 0x30000000 0x0 0x80000>;
+			no-map;
+		};
+
+		optee_core: optee_core@430080000 {
+			reg = <0x4 0x30080000 0x0 0x1000000>;
+			no-map;
+		};
+	};
+};
+
+&uart4 {
+	status = "okay";
+};
+
-- 
2.34.1

