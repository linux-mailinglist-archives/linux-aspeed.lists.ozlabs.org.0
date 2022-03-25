Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178F04E6D0B
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 05:15:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPpfW5k73z30C2
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 15:15:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=dylan_hung@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPpfQ5cbHz2xtp
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 15:15:21 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22P43Zb8035813;
 Fri, 25 Mar 2022 12:03:35 +0800 (GMT-8)
 (envelope-from dylan_hung@aspeedtech.com)
Received: from DylanHung-PC.aspeed.com (192.168.2.216) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Mar
 2022 12:14:12 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
 <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: [PATCH v3 3/3] ARM: dts: aspeed: add reset properties into MDIO nodes
Date: Fri, 25 Mar 2022 12:14:51 +0800
Message-ID: <20220325041451.894-4-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325041451.894-1-dylan_hung@aspeedtech.com>
References: <20220325041451.894-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.216]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22P43Zb8035813
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add reset control properties into MDIO nodes.  The 4 MDIO controllers in
AST2600 SOC share one reset control bit SCU50[3].

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index c32e87fad4dc..ab20ea8d829d 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -181,6 +181,7 @@ mdio0: mdio@1e650000 {
 			status = "disabled";
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_mdio1_default>;
+			resets = <&syscon ASPEED_RESET_MII>;
 		};
 
 		mdio1: mdio@1e650008 {
@@ -191,6 +192,7 @@ mdio1: mdio@1e650008 {
 			status = "disabled";
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_mdio2_default>;
+			resets = <&syscon ASPEED_RESET_MII>;
 		};
 
 		mdio2: mdio@1e650010 {
@@ -201,6 +203,7 @@ mdio2: mdio@1e650010 {
 			status = "disabled";
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_mdio3_default>;
+			resets = <&syscon ASPEED_RESET_MII>;
 		};
 
 		mdio3: mdio@1e650018 {
@@ -211,6 +214,7 @@ mdio3: mdio@1e650018 {
 			status = "disabled";
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_mdio4_default>;
+			resets = <&syscon ASPEED_RESET_MII>;
 		};
 
 		mac0: ftgmac@1e660000 {
-- 
2.25.1

