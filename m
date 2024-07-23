Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A28939D81
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:24:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=uZyKwh21;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsDL10bXz3dLB
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:24:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=uZyKwh21;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsCt5HHcz3dF9
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:24:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib3OEVcOujPdTood1s3JLeHRXzfHQSHkN9JyRXr3S9D9lyXN0bpuxcr6M8Zzrp1ws+DRu+bSfr3P/W7ATMyQ9P2Y9U86cHAbqNtv5DIG5dGtDeDIXq0lfwujWEmd5aTEV6v42US+OUHBetJs/rc6ZBSGk/D3/b+XTPZvQ+JaA3vDJpFN1jRbsl2elHxZqpefsdG6dWusZymBaZSUz0kzQE9CyeV4tEODNjDGBf4tWfB1NjVyL//Ye6O5//ZdmBzwn2qTUNs/kxwSriD26Aw9oWCQKYz5pXF7KJdxmSinPPU/F/5UakPJF55QnOTiTdFiXg1PfyExlrbuqvriRr2B6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
 b=StHAdMzfywtDnufxT5J6xqbyqhiBsypECFyrvIggS5a3MKIVhapsicl87mCL99ew0Gf0/nD2hIF7SBepT2gnXoB8+KlBzlWj03Ta+O3A3v+vwPP3HhdkfCqCxBlqKTCg8Oy8tC6hry0JHaPu++YrzUMX4mtWyLIBG0VN4PsMythNC5LjTQBbZwceGeVxUSH3L8VJ9JzbL62heSmS1ozc8NJHbkULc253umHbhSFT/SjNMWGdCG3/hlIc9QMefR3OXXmXbyOchWM7VfgOHB3TZPjTQFSLCW3q1S9TtRhu8OT2DqBXmJb67veUEf5knNS4qzn2BGCw+DswZ6XEr3ghfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
 b=uZyKwh216mDmXgV+iz6OiYoaR7biAisBxxFQESGtz3iWa69ppEN6JZDc3N1IOuBWpxPSxtdn26+TMIhcbvmW8GwMahhPAgO1qNDg/ViehMAc7XOiGmOhRYUvcKm+p0g3PpvsL5qWJYcf6rDiUWqMHH3glTOcC64rUCt8/Ycd9iLC+6BIl9ku8pAr1EStcysv5ooxwdgj1L0/9tm682jHSy5gXMLz+4VxQWiRMMSSGm1joYfkO3B46wZyg2ABJ6LvKHz3UL9DkRDm89gwtkrJsWn9JBXX9LEBeMg/+QGHtygq005OrZXEMx+huaHiowdhpszyceEoTprmHT0mE0uuGQ==
Received: from PS1PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::15) by TYZPR04MB7589.apcprd04.prod.outlook.com
 (2603:1096:405:45::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 09:23:54 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::1) by PS1PR01CA0003.outlook.office365.com
 (2603:1096:300:75::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 23 Jul 2024 09:23:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:23:53
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 10/27] ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
Date: Tue, 23 Jul 2024 17:22:51 +0800
Message-Id: <20240723092310.3565410-11-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TYZPR04MB7589:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f276a6fa-5d5c-4301-8ef8-08dcaaf92bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|36860700013|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?ZL3ZUjLFTg6QsEEeKqTrpkbBDPCnDKwtBmgY6nBReHNh0B2D9301Mw6z9FZQ?=
 =?us-ascii?Q?wVuuWgT2U15CgM7Lnbn9AmcsdgMpd/vKJZ2+wYDkNnw5weBeTIMBp+4p8a6V?=
 =?us-ascii?Q?iLuvbysYEsj1rr9PeAQLZXHUtzBDvv+f5di5cHQ7Dww2hwEidrUGpcHn7lJR?=
 =?us-ascii?Q?kHTwnJ+/WO2+mMDZIx543IwAELHc1t3vpcH0/3xc8kMYH+i9n5jkViJ2ASuP?=
 =?us-ascii?Q?x1AGmqdNA1s4CIHcCFCd8I4kRAhlTjEMgNNn2wGKTDcDutge7BDd2XdaKKJB?=
 =?us-ascii?Q?wJtOvPMxgf0RjNABM8ZzrXOvqSjdrxcAAQncbsBnXrQCXgrWbKG5MmL3h48W?=
 =?us-ascii?Q?LYcNrom8izfq4KtrmQZeZiqSKBFYL6d1+vKgtoTblddNAkV2ehEuAWp3D+Ni?=
 =?us-ascii?Q?1kTtxl+2Y8llS9hwiliGsayX43KlXwC48mO/gkEzhzIS7OlvvKD0u5D0gvHT?=
 =?us-ascii?Q?W4GNOvAkZzP3s+TaaVnbzKi7gdekC5GT4LIHkrbqWJdfSPYR8sopygpsqYck?=
 =?us-ascii?Q?Px8z1PToXjcDTCbr0sTuw06hRYu3kS9NiKyfCQnrxeX+/KrTN50IpP5Nf7AX?=
 =?us-ascii?Q?YF1IDoAUfMafl4Nmsgh0Fz0ryZStLyxcnvDZURr+iboXabN/h5peSCkGBULi?=
 =?us-ascii?Q?whFLhOjWlFNQh9+IlL052vst0CLLkZXpJ594shSPAszUc19r4sb8IKndwF7X?=
 =?us-ascii?Q?AfeoPqu0encAiGhlolpJFsAPv8J8utmwqw+H971tOA35ThAx+d6kBNsvwsj8?=
 =?us-ascii?Q?mL5qcxxYLPtcBJn4pzUvxHtLWToqC1tfR+JB+jQPn3j2RauioKoHe/c3QAIw?=
 =?us-ascii?Q?yTejFo+cLsTBScyKqxwhQ+7GkKWdpXs1JI2nN34ntir0kntkn4asUdDxsX7F?=
 =?us-ascii?Q?CFJgl9UNKlWBtpoTkI78M8UfFUmpdn4QzKtvyVHnN5JHXMN8oUtBkDAinWNF?=
 =?us-ascii?Q?9eGFMSgG92ZcUSZMs0rKKZ11E4fhR1JbWTTmO425WThbOyc5SsOvmVFQ9Jur?=
 =?us-ascii?Q?pM0BW5GWn3Qdv3M6Hglzf/2UvZfo06cTAWHgqwRVhMbiUDxQpjmBSVSC2rPv?=
 =?us-ascii?Q?6ne1OfWS6HBEZi5ex6WCd/NYTfSZZ8tn3GpuElvBWPTmXAjzkQClinBmhKXL?=
 =?us-ascii?Q?hjR/xjhDtulU0NKhfP1pce8T8eznopxH5AqJZvZjfdhBzkYGy+KpM4Uu9OFs?=
 =?us-ascii?Q?iQxHYjVZr5wPjdaR34JVq9lHRpi7z8962SUqizDxt6Tyw6Kio+diZxt7FuKT?=
 =?us-ascii?Q?lCv16uZJOgjQ1hprBPLSRvcAFgU3HjJhZLY6b4OdSJtp83N5YoCsYUKszS83?=
 =?us-ascii?Q?2Uf/6bPIuxDZ9pOmy2uHNaNzJoyAgUspsaQMVy3N8K53hokaDq+P3Uoqs+1U?=
 =?us-ascii?Q?XI0Lz7Is401IwBFV7kPx+7afpcX7WCG4kK+YjAhWEixXnTlxitZXIhs93ly0?=
 =?us-ascii?Q?MnF3efI9H1O9Se4fXEWpZa+8qFZ04KNL?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:23:53.8006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f276a6fa-5d5c-4301-8ef8-08dcaaf92bf2
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7589
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

Add power sensor for power module reading

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 09bbbcb192f5..139a09de24cf 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -906,6 +906,11 @@ gpio@23 {
 		"HSC7_ALERT2_R_N","HSC8_ALERT2_R_N";
 	};
 
+	power-sensor@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
@@ -930,6 +935,26 @@ eeprom@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
 	};
+
+	power-sensor@62 {
+		compatible = "pmbus";
+		reg = <0x62>;
+	};
+
+	power-sensor@64 {
+		compatible = "pmbus";
+		reg = <0x64>;
+	};
+
+	power-sensor@65 {
+		compatible = "pmbus";
+		reg = <0x65>;
+	};
+
+	power-sensor@68 {
+		compatible = "pmbus";
+		reg = <0x68>;
+	};
 };
 
 &i2c12 {
-- 
2.25.1

