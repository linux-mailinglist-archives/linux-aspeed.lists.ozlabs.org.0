Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF0881B01
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:14:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=nIrkWBfj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TYV5c4nz3vYL
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:14:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=nIrkWBfj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TXg0RMRz3vYP
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+d/L/ST/iiLre6+75l3nMktsq2BcRuJp7pLJTN5icLvhOUQACbZ9DANitTaVu1Lc2iLYr9BMsF/EagZ75VNEw+4QIvg2njJ86WRMVzhD455Z5tTp+HcPvfJKOdr+sY0Ou7lYAjeoUSEYgeojSButP083Ay71IwW2aAq2+rcbbHReS2jXHg3lkMpPG+T6b7T+cc2/BZ1+Zpo9DYlhKIgHdgtr9WpzXYDCZ5PDJ4Y8heAHQiIL5tvlewAp1njnTEJerxzRbkws33rgIsIrnEODFv1sZqcJI1kwyNGSvd45eKyNnAcJrJcOZj3qqg11W4qya68oDAl61lfEvP7KPitLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HE4AiR2ftxMOG59ugCbzYP6XtBmBun9n35GE/zOsliI=;
 b=IzXc6bQOODXV+fOuM+JJYWHw2uGRCKWR7BxCUZUKNXcBiPi+BPAGkRd7oQluZFnMSCUVj34GPptC10XErlkkPskpQC7cImHSmPOJrscRJJ+NIWUeaIWu5zx1pP54tOevR/Uia0A6BfMFK6lhJDbX4zZxb+PGqnBZnfpHQED0DtZjTtNFAi9mPz5bz74Mqit4Qdje6vj+BBf8Xa0MkKZ7X8CPz8QP3QNYkYjfk3ZAEgaAH1iTYOfU+Lf1fcYNeZwSmsBLZv3jU+KAunt3ZxJTbntjEXqr3bhQ4h+2SSW6l7YXbiSm7NfxvHm7YIw091tHnAwO3nmZtS5pKlQEezc0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HE4AiR2ftxMOG59ugCbzYP6XtBmBun9n35GE/zOsliI=;
 b=nIrkWBfj+mh3lpTrY/xBB5Va0UP0KH/Rwr2AQfAHAta1ASM23wwI9hy2P2uyNi3zJsjucdCB9uXhGFlRNmBmu+VNCslsM6X7nI1qK+6gzOoW/Tv1gSL0GY+CoP2ImZ9zzyw0KYOFr/qrWb2afW9nFw+ONLftJOns0Vmd6C9O2fb1xu38GXf/xYPdTP0BgWEWrSf0huxLFqeUiVUfj6RwYrk1ZzMIMGl+i1LOryO+iOXeMyxFMO+kUSFeSc53ivfhu+9shS8oGhIpls8bRFRH8+j0dZDoeA8zT/HLr0bttH1OEblyIGPXESdUTP8QdZPPNTlFEeJawbDIP7MKX2yJsQ==
Received: from PU1PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::15) by KL1PR04MB7770.apcprd04.prod.outlook.com
 (2603:1096:820:12c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Thu, 21 Mar
 2024 02:13:36 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::c3) by PU1PR01CA0003.outlook.office365.com
 (2603:1096:803:15::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Thu, 21 Mar 2024 02:13:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:13:35
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 19/22] ARM: dts: aspeed: yosemite4: support mux to cpld
Date: Thu, 21 Mar 2024 10:12:31 +0800
Message-Id: <20240321021236.1823693-20-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|KL1PR04MB7770:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 042efbb6-6677-41f5-3493-08dc494c83e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NJm4v1Ic8ivic+VOGkXtW9TLFHzZvp3Os1HbW0MwXUk2Z0L34aFkMAuENDCi+v0Isw4mgXhwD03d/pprjiDr5O2P7TNhYRgkWhKRICC3drI5MAnl5zFyT0nuKNnMgheKlNHwrhTCXDefMI+KFIFjVlgXZsyIqq3qv+d0C2FnvnsICIIdVA93aptGRtLmjwkdx6NhouxskzXeVGAFR3lKIQL8U68mOs6265OPCKpLcA9fUSh+vBHucsubXwrm3LU3iR8sYtoGqMX+SqBpQTLgHFe4dUS+h44wH5jHVDBh9hzpf1COp8gTBsnZ5osnkqiPyia3CZnUWAYYHqdFifn8+CtMZMe7JIWbxt8fC1j5BLZpqgsQShu5QUy4NNTWnDDjiK3bDh4/GlcwmBUhk9sP+Hh0q1rGVxco3AF0CDnJuOmHUTxoMo514mEFMWlpsMYZWLbd01BISPL71PSbjpmi2HtdTaLWZK/S4NClb6c6Xj+LIy8dDbvJNfdESibQ+ChkkNm0Q4QZ8pTVeKFO0nMz2ih8F7cP6gwCuaOa0Ya9rv8mb3YgcKbhbgxtpXf4/ACKBHQs8yQ0Kl1b09wDwe7LuQXKaMHcOw0mGkYdj5FI+2XdVH9ndOIs7nYXL26BgenOSm09eHrmJAJmJrW+7GcMN2rFjpZdlBOTuKTn7m2ATxauIfWwJrPTGE+6aoeoVDX12tCAKSkbLYssIM5NySu+f5EOi0dv9d7ZiOCaH+8TlfqqTNq4PTxKwCKfglICxjMj
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400014)(376005)(7416005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:13:35.6824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 042efbb6-6677-41f5-3493-08dc494c83e6
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7770
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Mux pca9544 to cpld was added on EVT HW schematic design,
so add dts setting for devices behind mux pca9544 to cpld

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 64 ++++++++++++++-----
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 0d2f0c589944..373eacd3186e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -36,6 +36,10 @@ aliases {
 		i2c31 = &imux31;
 		i2c32 = &imux32;
 		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
 	};
 
 	chosen {
@@ -951,24 +955,54 @@ &i2c12 {
 	status = "okay";
 	bus-frequency = <400000>;
 
-	temperature-sensor@48 {
-		compatible = "ti,tmp75";
-		reg = <0x48>;
-	};
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x70>;
 
-	eeprom@50 {
-		compatible = "atmel,24c128";
-		reg = <0x50>;
-	};
+		imux34: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
-	};
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
 
-	rtc@6f {
-		compatible = "nuvoton,nct3018y";
-		reg = <0x6f>;
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			rtc@6f {
+				compatible = "nuvoton,nct3018y";
+				reg = <0x6f>;
+			};
+		};
+
+		imux35: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux36: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux37: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 };
 
-- 
2.25.1

