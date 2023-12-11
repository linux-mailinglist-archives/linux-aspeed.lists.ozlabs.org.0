Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE2680C0F2
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 06:49:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=TDwDTZuN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpW5R47VNz3cCn
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 16:48:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=TDwDTZuN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62d; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpW591k6dz3c1T
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 16:48:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQai5NrM6X5Zun3yELSJx0x0qizpbAMUEKYPNrraIToyOe0yYxsXgCgHLOMJ10qx8gf5tOBK6OwgKKq4Wstq22WSQ0f1mRM4APTv8eSeCUe4ELOrha3+z19QDd66YLnQtSjURiS/KKhHiXAGReC2/S4h0kvav6sEeeOli6MN4YXhW4QVYUjmVT5ny7DDL1GDIwyufK2N1fqNQmU/dyBKDAIAsdNZOJY7wz3NFAGj+MKJ5VWxWedhmgrC4m/ojffTA0RybeZrP7liPmL3OPdwQ/oXzTztCUJg7ewR7furJzwutcnY2X5FOEEo+0xYNubAzAkg0Lt72IoukRjyjGZIWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ffrzl7Q7LhBDD1DGW62uNYlTs/fc48bAT0TeP8J1+Xg=;
 b=EW4yUn5cKWtqFzEgI636deq8JXFMXVwuLgUyAcG7AF0n+fVEQwJw9kJwknffgeoPMOkVCz5sYiynC6DoILOqVfWMzMmeNWLVZogEDpXIBYQR4rMQAX9fo9Ep0klIR2DNRfUYhjWI1qS+g1mSjHFwrsV1OQxCAJnGCbri/1HxXtio85sqvrk0siCsYeGG36/m6E0hnfZ+mxKcUHhDPwbccUN32NGA6JKm3YQRA3rs20QTNqHu55S6L6ns9LXUII0bwSUKYOgRG0q5DhZngUAIu1XBCMMVXS9IoFgrlPx/S3OU+YgkvRyhZTg59O/uItwg1QSaxntpCCwAqXCLD423jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ffrzl7Q7LhBDD1DGW62uNYlTs/fc48bAT0TeP8J1+Xg=;
 b=TDwDTZuNh/IyAsTEhNtdTFz5qu4tmhcBr5iTakK4lNrjgFt8tSB1wlSbmdhZKWy9QUu5Vd0z1YjZHSeXZg8WIWmHKD4hxXQJc+M22RYxJId1qz8QiqA6MzZ4KTFsfsTg/Sog/n+363moN6Us2OF2Wjz+Cnd9s7cLhr/hz/84s56s9w9fScIM8DQ54vpMoZUvoq41wi5hJvulLScKFNONw5y+zMg1g1+jfiCD/9PiNJXD9sZAyU9Sqsp0178IUVzO+1hLpsmvALgLX06KLZrHNAfP/64GOfvm77NsHk4ES31OFIHpL9ai8LDuVkPLVMkUr/pmv3+C4naRvcP3f7MgAA==
Received: from SG2PR02CA0066.apcprd02.prod.outlook.com (2603:1096:4:54::30) by
 TYUPR04MB6791.apcprd04.prod.outlook.com (2603:1096:400:350::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 05:48:25 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:54:cafe::a2) by SG2PR02CA0066.outlook.office365.com
 (2603:1096:4:54::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 05:48:24
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v3 12/14] ARM: dts: aspeed: yosemite4: add mctp config for NIC
Date: Mon, 11 Dec 2023 13:47:27 +0800
Message-Id: <20231211054730.208588-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211054730.208588-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211054730.208588-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|TYUPR04MB6791:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e474e829-e08f-4220-a33d-08dbfa0ccaca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	sUpXHjeZhYaRc4sQ9tLMu1OnrUbREpd3rNAuuZLafNSKEBnIRtsp37L08tQhfYCahFgSKpnYX0So9cUtlyBprALkWkLwUUa+nnd3T8M/nXun2l7gquvYiAataX9bvKse3U+5fJ8i31qrT27t7+/xqXgqcKBJhHlmAQLdAKAYt5mYM8/sWGcWKJFyiEq2Yd0bC1HCRN4al43EI/QKVyDfa5AaxzkQOmZKkK9INrSCKDERM2CCwbBEiFbJMPCcWQKuweKgEqVCYlGIJ9uYXZD2bhme2pA7z85lolH3TOuoi2716DxlP5nxMAcauC2JC5RZg+bTnXvIX7DzeOZ58tQEWYZ5+FQKFH2NEWOFlzLcMeCzve4FPnz1YI35JTWZgZZ2gv5yhgQ6YN7pD19Ps2JWAJlBkccUv6e+LFohPn7K61FxvvZjPnECLWK2PUsQ7nyuw7u/wh8i1MyWtZLHg/OIcGRmgqD4+ru5PqQzx0n+yC85Ho3Lv4UX9PAkgKJ9TyF+2CElJVlbeTGZWkHBhIt0ap4QGtzjJ3Mr373rihKJ8Ixkqnt/woMw3XUwVmPLtErzWT9SCUaQOqJnUZg7iuc5gGep6Dx+wkialHS2ZBZGvePl7SIG701kS//LdyeVYQppkq3IOP8xq3+RnKB9CqXCSlckOu1ANyxFHsCimbTMO3qTWZ4YJ44sqVVKfNaq+aESizTPuhluTVL2RGhJrhmZxA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(36840700001)(46966006)(1076003)(26005)(956004)(2616005)(336012)(6506007)(6512007)(36860700001)(47076005)(5660300002)(7416002)(41300700001)(2906002)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(110136005)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:48:24.9698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e474e829-e08f-4220-a33d-08dbfa0ccaca
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6791
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

add mctp config for NIC

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 073f27f1e35f..c8e3a85b7a11 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1273,40 +1273,64 @@ imux24: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux25: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux26: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux27: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 	};
 };
-- 
2.25.1

