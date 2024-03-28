Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA0881AFF
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:14:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=EgpFbO1K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TYQ3gQVz3vXG
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:14:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=EgpFbO1K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::61e; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TXg09zTz3vYN
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9DvkKzhCZm63paaaNn+6Dk7wjAGDId4vF6QDY92fwQRQtEhIrj94xfqEc8YFumJ0x9dR8zLRl+dR8hryE5qQEDBVEmMFqhN95TskXoCTbj70hz9sSET8b0BTUrpO1h0R6M/QOoHgZRrahoqoFPyuPsOSL1mHlXr2diTx70TaL9lHYrgA7AnPfmHADjEjjnbItanoT0NIxDi9qRAfL3SGS0eQZkXpt03Z+ie/CHmL3oy+zFe4X9xcEpFb+ItGl8uhZ6EqVxEO3VFk0BpyT5GLyGQe4MQJ00SxFNICMCgKUUZLS3ph7glLpnLrSZ4lQ1vG5OYEmUnrejZoFQQKz2R2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9YPN4+GKhRVOD+PVplTunx/K5X+lj3LHdrFGWn0TtE=;
 b=lyx6Ns4zOE1HgC9bZf9mieLRRxXBDpp3IquOqotsB/C3+wdoDaBP0QL1OWsDrWa3sZpUc5czUvMoxdLFx3Mi2X57frtn0J0mI/tbhlaqnzMc2YdX5/0BIEAokzPffy5n63lufR7hXBhmqxVxpXjZAk95HbG48WguK6crt2bYJiCPHBuFJk/TfQjuRmg6NSYcTeRunQ2k3SJ/O3v0sVMQBvL8gZ5IXT7qg7PF2/mf+PQsM7dtaA7+8SvGbubK4t3mqFXJASaiBJrsgJlFdHuQkFLB+jAv4+ko+Ppytp9G4Y173luPfltOkgMv1TqjXbkBkymuflOOjucyhkOUkMLt9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9YPN4+GKhRVOD+PVplTunx/K5X+lj3LHdrFGWn0TtE=;
 b=EgpFbO1K5AF0NVEpbrcTnTW9QrIc97kQoTQLp1jq1wP20YG5aQb5wYWyzE3K8Y6gaVrbFlTyJ71VIK9ypP7tDF6Q1WW147/sKmLScnRFEHAv5fVF6YHFnpCg5Lt6OeWHcDsbe1xkj3BuXNF8n0tpm1zHcNO8DmdiWcR6+QANFfh1m3ZQJn0dByRfTMOI5s2EFtfOZd0dnaYq+xHRolVMfTlqBl0FDHR0bXs2dJW+kXbVWL4bPYh9aQLBEdss+GG5kjKJaOVS3vVgkrMdTiVEXhyMSE+wrEVc6H3Migpzt6WO/HHxdqz7gQXEtvuiORAfUph4iLo5BwBB2Cs+j7+QSw==
Received: from PU1PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::32) by SEYPR04MB7040.apcprd04.prod.outlook.com
 (2603:1096:101:171::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Thu, 21 Mar
 2024 02:13:33 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::a9) by PU1PR01CA0020.outlook.office365.com
 (2603:1096:803:15::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Thu, 21 Mar 2024 02:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:13:32
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 18/22] ARM: dts: aspeed: yosemite4: add mctp config for NIC
Date: Thu, 21 Mar 2024 10:12:30 +0800
Message-Id: <20240321021236.1823693-19-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|SEYPR04MB7040:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c0d9dfdc-6866-4af1-aa56-08dc494c8236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4v6Pfl9T08ed2m/kgyBDkLs6U6/WDsnq2lGqODcycP6LCcLgfY1/KE7s63Fa2afjsl6NNv5Vf5rnXLQuXQ0v0VoCt+9bDWycg2lWMrDF2ZFK1j1AtFpfKb0RcwB1Q3t+FXML6dgFAh0ZaUVTF/xe+efsAUicMRBxg7wIxjwzCHpkzqQUTEjzyJwNZ6RoJk13qxnOUS5Up6lBygZovXREpqpjchwGFrbCT+l/k7i7kGwMxa4QeIqUcZVEpjF445ap8abr8EYxAlh+54Mki5rSqNO9p91Qa5O4AWG8U1i/Qst3W0c6oek5cXXv+MSJOPcf7oOzeRxVnkAgN+RE+dLMD+934oWlVO3tlMiR3w02zunfurqKCUsIY5HKEEmSWEXr925VulNb3tWOMmCl72nekH1mY73gYHmk31ekniXmxK2er6erdWfJPpbrVLUlO0stzuYpWV3OLqzBIFliiQ1gXIOA777T1NhaNlJjltFv1C6jYHQiA885RhuairmClqeMH0lj5/xWMsK2JFJmkKPzMEPP/CoGXWNSJACOj5EXREXeY/2pL4mSlAtvVv9L/AOQslp0yMZVC9KSssJksKrkkA/BN9hgexR4cWbeY+ELGTsudeAFDEDi26vh3GEIrOQ0Adb6IPafUnpo8pzW/lbGyzOIeQ+/36TeN8EhMghpMcvjos8c5sO03OlkJ5wsPtIywDOx0B74sHxuFZsO9giP6WQ0Gf3quVyKyp5bpdT7ogQjPCLgFLOtUU2o9N7LmemT
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(82310400014)(7416005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:13:32.8543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d9dfdc-6866-4af1-aa56-08dc494c8236
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7040
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
index e0ca0f7b65ea..0d2f0c589944 100644
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
+			temperature-sensor@3c {
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
+			temperature-sensor@3c {
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
+			temperature-sensor@3c {
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
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 	};
 };
-- 
2.25.1

