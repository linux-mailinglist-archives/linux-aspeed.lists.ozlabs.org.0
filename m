Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFFE881B04
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:14:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=reMOh67s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TYb2RZfz3vbq
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:14:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=reMOh67s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::623; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TXk0Whbz3vYg
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYW56SrzVonPwBgAXGdK47sgOzESNUk6XGJJrzFQMLJhtxnxsoa8v7gEt473rD4r3/u+raZxdif9F+l4BtXg5VioFC5adNInjz5p6J9HhKMWjGV5KxZV2ajTZh/bmUZH8pdlK+rH+RRkV4+YWDMe7DaODkfOqlttqztmWJCp5xCyIBa6OL9UW8FnKsn3gGJMSWJOmQ1TBqqHBh1gCErS8SN/hjZkzosQZTtreT8789Ri1fmSyMWTjrfLvoZfE6HYwLAPQh7mrQ6iwsocmVFfueTpycRWQKTUUDSzgVDACd4EHnNYYLvP79INq490u5zoS86yUPRHq9ibPKdxTPy0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mt72pmhgjJYk/fEfDyefjhvaYE3FLnKIVE5WwkrqElg=;
 b=KLKJvM15gPFeelDBwrOD+Yh3bXAuN2jGW+hTMr7UXiGNFJ5FpVanUbOPu9i7vdOkPum23Vy54YCjHjzVda9NSKj0zaQW1bukgU+no1EhaYGw2Ql5KUiAbckKuhfjiGWDdVUvSQLv4G8fJ46r8LGO4oDTg4ImUP4tC3pVsKle7jee+aDtGFn1RPJ74J0IFa4yImWBbJGsyNk6q7mMX8lshnMXRcXwouU81Ri798+9NYaz2461zseXEO3lo/9qpfl7UJXNhZ1S3T+2+AirCshvWAh0G5gRXgz0lbVeZVMBCOzIrsGSE4Sg3RTwZ4tNuRUhRXE+NmW77pj6/cCJ9hTvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mt72pmhgjJYk/fEfDyefjhvaYE3FLnKIVE5WwkrqElg=;
 b=reMOh67spv7OeJD8v1l4rBmVvrkoh97XeEmbZdPej2Kr6bBnNkHZJAllvgR5fW23eROK0aLmLgGt4IyrlE8hptNse/rTtc+GB60LPRxdLgXYE4oNnyS89dcaR0oImhEOoPCJoG6jQX1Nc3dryZzJmJ9KLsIDvQGbMU14+t7L9Oyq/SQaAG+atFlFGepzc6qxaVoZzWhmv5VOiT/2wr28BTVHGhGOqDW/Khq4G3tHl8+mnSSZ34t/UCWzyupkpeNZbYRXR49nVXhvPcxN0quzAyUDFroiBkWttqSwlcSAhsuX5NC6smcOyFNUlndyvju818c3XCVNEWiONzKZ5Bo3Zw==
Received: from PU1PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::23) by KL1PR04MB7556.apcprd04.prod.outlook.com
 (2603:1096:820:124::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Thu, 21 Mar
 2024 02:13:39 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::e8) by PU1PR01CA0011.outlook.office365.com
 (2603:1096:803:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Thu, 21 Mar 2024 02:13:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:13:38
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 20/22] ARM: dts: aspeed: yosemite4: support medusa board adc sensors
Date: Thu, 21 Mar 2024 10:12:32 +0800
Message-Id: <20240321021236.1823693-21-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|KL1PR04MB7556:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a2e1b297-3105-4f77-d1f6-08dc494c85a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	A4nVvSFDCfoKhwpc7XR9nkEZGYOtOOzaYUOEXKBPEBZnqOsJV0MukV/IV65TuzEa/FU+bqmQWCn0CQINdEPzp5P0bPSF/anBuZBNdm85yaemVygKpqP0H5QLfBX58+oaFC6Z+w/7tppwDrB6yG0LOBmeLGh1v7Wu3seUvUFNJAdSr5D87w6OOpg3aFNgDpuIUT5XT3KW9l1hg1uDzD6CbqWfRsXiNfxn2XtXwu+gTqBVUmBIEQa2be/NwdkhnUSNju1E7zMWDnQngnvIBkn2gsgzg+tLAaJ0Eolpt8L5Eg4Aj3Yg3qa9q3xVbbeGKoI16sKo/LSm3GDNqKCfapC+K75OUwvfGgdsH7dbIKVfzdURuy6HSVn2WbE5gg9hC5DlFORr7ykk3rVnKB1ExvIUPFe6yoNoyyZra1nLxzJK681s7t6ZwLM05TfMc3fE+mYp2Hlk23E8jCKojNmy9dfCzvlI9VGeQiqwFQ1Qcjj6gm2V2Glx/p5+673lqaFiyfb7TdDqBF6A8aAMYbsTDSPSs+AlHRZNK3Fjjl/HDhcqZhvJiGFSJYKbCfg/zYqrxHuVZM0/ndnAtvWaEH9HY4hRXFXwvckTbz7j3LIajmmHfZNIfPRIIEP5RqX8s/zBror/JXihNYuOVNHNfrilgLg63yXFdEaag9LvA0aALpPcL7ohS6O/VrfBMv5MEiN9cXJbN/HHebKSlfQdUmB/iEQGCAWLbBOqeCY98TryrpySPQ1TycbBHwXjuFN17JjdX561
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(7416005)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:13:38.5730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e1b297-3105-4f77-d1f6-08dc494c85a8
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7556
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

Add ina233/ina28 support for medusa board adc sensors

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 373eacd3186e..d2ad6c8ea165 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -915,6 +915,19 @@ power-sensor@40 {
 		reg = <0x40>;
 	};
 
+	power-sensor@41 {
+			compatible = "ti,ina233";
+			resistor-calibration = /bits/ 16 <0x0a00>;
+			current-lsb= /bits/ 16 <0x0001>;
+			reg = <0x41>;
+	};
+
+	power-sensor@44 {
+			compatible = "ti,ina238";
+			shunt-resistor = <1000>;
+			reg = <0x44>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
-- 
2.25.1

