Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1DB773B2E
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 17:45:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKyDy6Rqrz3bWW
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 01:45:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx02.aspeed.com; envelope-from=dylan_hung@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX02.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKyDh4tPNz2ytn
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 01:44:52 +1000 (AEST)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Aug
 2023 23:42:44 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Aug 2023 23:42:44 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <alexandre.belloni@bootlin.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<p.zabel@pengutronix.de>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] ARM: dts: pinctrl-aspeed-g6: Add I3C1 and I3C2 control pins
Date: Tue, 8 Aug 2023 23:42:39 +0800
Message-ID: <20230808154241.749641-2-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of dylan_hung@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
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
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add pinctrl support for the I3C1 and I3C2 pins.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
index 7cd4f075e325..289668f051eb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
@@ -297,6 +297,16 @@ pinctrl_i2c9_default: i2c9_default {
 		groups = "I2C9";
 	};
 
+	pinctrl_i3c1_default: i3c1_default {
+		function = "I3C1";
+		groups = "I3C1";
+	};
+
+	pinctrl_i3c2_default: i3c2_default {
+		function = "I3C2";
+		groups = "I3C2";
+	};
+
 	pinctrl_i3c3_default: i3c3_default {
 		function = "I3C3";
 		groups = "I3C3";
-- 
2.25.1

