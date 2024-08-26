Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD6F95E88D
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 08:25:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsgfR1L20z30HB
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 16:25:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653549;
	cv=pass; b=LyxIDEO9MYdfe8mI+cEJvzFO3gyLs562S5P3ko4ndGAubkxQp7yCGsD9hjEMBjYPYKNYDxPxk58nPGgweJibtMywXTB2XXTqfeKehcGJaac3EP0Xjwwz7kLqvRkuz7+H+fYadzf1XXVASwoKCe8uCehJvVog5V8J6MdvgBFslErTEmEESRzfb3rUczkYNNEBLc+N2/hm1trJZys6+q6cMIe6iW6Sy9IUPCtvC8JbsdnxGPZiDWj+X+TmDl3tK8fmHhALPxEqNOynRQNTrWOTmW7xXyBk1Yx9JoQh2S2/F3OSiGKUNKh7lSB3S0xAn4yB2/FD/cth5ooCT0cniXShtA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653549; c=relaxed/relaxed;
	bh=Lo2LnZejiHLnr3GYBrZTsuUBWpB3Ws7w5C5IaBMRr/o=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchan
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kwMxqb0g; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::62a; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kwMxqb0g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62a; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsgfP0r8bz2y7M
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 16:25:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amb6LNd/6XmGzjE/tkSZ96DhhPrsZ+QpknirIlYubCfwGVPjIM+6YpbTJwGW8WPNBZn7EZ/fGtDzRN3bJ/GnCSDGeKu9hItRShTK9IdOJLHau393j2NcS86ips0P52cftRwe2v2IfTiWkfgzWslzhz6JmiM/7n8O+zasA+KxcsEIxLDPvPelBSmU/vqpvunfW1QIxt96TGHD3MkuqEfYUmzpNQyEQmsApk6B7JreJAsWqi5MGF3VB+xRm5bjXaOQSBObv8DYC/Gn36CnP70IxMexufRQ4Go9kYFK+HLxBUTKOrfgG6DKAYJS9KDjjCitkLiWrYiBtM3CRxnF3VEfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo2LnZejiHLnr3GYBrZTsuUBWpB3Ws7w5C5IaBMRr/o=;
 b=UOQ+mKo9m4VbZXLUjY7PdBmZeME7iNu7Hh8D2J6OqbBsewTfe8ilEWK3TxpfXEYkbHT1VqqijvVqwf4XEQujx5FcZDg3K82gPxflbTsQQmzSwbwyXUFI1H2kbUOUChgOsJG2Sp664llWxY0Piw+zRYc//oRhNp5y/KMlH61uTDuJfROkdhFnUxNYqH7nCd3PI8ub1VMUzhBngAmgg3E1t2h71myb0XIGAN0LT6FNIO5pwYAzuv4wLEmzRDAxUWhLl8HXHaH15jjguih3GdhJmy0raKu8XLONle2k9xW+DmxN7Dmj9GcOsRbE3k8OUy+gZ31RoGmQNiUHHh46LFN+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo2LnZejiHLnr3GYBrZTsuUBWpB3Ws7w5C5IaBMRr/o=;
 b=kwMxqb0gIsve2PTjUPvqYprHUsDa8cMZxtg/EEPuHNe94YWOClLWA2hFcKElx/rHYR3BLKDMlJLMouVHh3LvkUkvgsvGDecki8ZEGB1+8x5Voe3jzR63K1LZLDLBuMLJJCh0zh/M4trHiVtI4Zq+WvsIJfwWyOpMhJIOrVOq5suPd3r3lr3eRdCAy4wfQgbz6fJAsRjfeKZkANmubeX9WugTiuChEYInWBVj1Wg2eRtCuBTLvdwuguYsHXjhOnYkEIXWETKlO537b6TTJOTdMD0ShTmTR7zdXg9trtov1Z+H88JMTiV+CxNaYYyVRZg1wtBHdc0ft0eLT14FgnWSiA==
Received: from PS1PR03CA0019.apcprd03.prod.outlook.com (2603:1096:803:3d::31)
 by KL1PR04MB6928.apcprd04.prod.outlook.com (2603:1096:820:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:25:18 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:803:3d:cafe::47) by PS1PR03CA0019.outlook.office365.com
 (2603:1096:803:3d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Mon, 26 Aug 2024 06:25:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 06:25:17
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v14 14/31] ARM: dts: aspeed: yosemite4: Revise ina233 config for yosemite4 schematic change
Date: Mon, 26 Aug 2024 14:23:48 +0800
Message-Id: <20240826062408.2885174-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240826062408.2885174-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|KL1PR04MB6928:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9904065a-ee49-4670-12bc-08dcc597da84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?1PkHiW1LlY8MH5O72tRb8ZK3xhZ/RP4UWbUurxVantvzCNolGfK+K9b0NWyT?=
 =?us-ascii?Q?j6D7kDzD2OXI+yTal2+m+99fQzUoC69XuJrDFBrlgyEYm9bl21ABAlCuvfpI?=
 =?us-ascii?Q?xgixxiqecEYo+LvoZNx4tvsIaulCxpbrnhozEz7/UBQeVDg2YNYtooyMaGsx?=
 =?us-ascii?Q?UDbb+CnKbBS94VgB/uzQGbvIIKmt1IyeHFlroe8u3CaCspW4nyFIq75oopTA?=
 =?us-ascii?Q?2FPOjeUpUOTv1YGNVOnU0got+VSxs15aVsw48BqmUh54XZcMv4cudt2iv0N4?=
 =?us-ascii?Q?9clw9urp99wxNKWFXcbJVSCqd2yL8R79SIFrfR9aLXIZteNz/s9u5P1L5ug1?=
 =?us-ascii?Q?Jig2B/pzNjF9i+GDRbGrdUOFlMwLP7MMYFvIhhadhtbHC07EiSKfpo3StBkQ?=
 =?us-ascii?Q?q5zQEsEzRpMj3+AWmrqM1bAgOqjZzg8V7yUpnZdUeWT+HOev/FBm5kA9n0Zf?=
 =?us-ascii?Q?YOBTPamm2frCNRTrDqMvquc3qHYtHeTg+AlrpPFdXmFLF5F5Q6GKGFq8oyFl?=
 =?us-ascii?Q?sQuuDg6yt/tmmvMuI8Vs39+xzEYpt3xP+8f9Eq7QdkT4Njd13Vr0CSVSzkxq?=
 =?us-ascii?Q?WWShQsbK7cMpYZ1CYKL+JSEz8dEcHCxYt/y4XM7wLJ/XNjrq0FcsIUW2tCsn?=
 =?us-ascii?Q?pdq1G2+rkIKk98sV9GA74L+fFd+QfksPkVkdNTXkUu30eJYYbOHMC/xsZw0U?=
 =?us-ascii?Q?NsawBa3nOAzKi8ZBLQrnzjNsBcN5egeUZteqrkvtv30dB/04W2d0DhxUDgwC?=
 =?us-ascii?Q?O6VMPV1F8qSXpKIViGr9zr2wXtYeFIZAvpM/GfdZDKp469sRxriXppTY4ISv?=
 =?us-ascii?Q?nCEXRRoFTOSjp1z3y6fdYX+rfXqxy8po3iCc6qXMZzXZ0AzK2cJdP6j4zdTa?=
 =?us-ascii?Q?YjOUvj8nJs8OqTnngvNrZ0NLOHfskZz4Zu7IdVWqsvdQLseVeUDKjW01T79e?=
 =?us-ascii?Q?5LxH2L2bTugWZnAN69+zLqulQFDejLbTveEephU1tsAw9F5HUgmhh8EE/JO6?=
 =?us-ascii?Q?g6OfLl/yg8pJ6wSC8vg2y/XoWpPj7Mp1dx7eERY6hY+DF6DEJ+CQ8qVqKl0j?=
 =?us-ascii?Q?tX4s1t33kgrs+TpnvSi+LS/wuS+92TURYmnJ1fluwmWgNGwBKGrIw9HHmXuM?=
 =?us-ascii?Q?yV5cZWzaw0C1dX0EhHDQNK9t6Xmo5a5UpCsDWnusfvS5fZB2RhVYmGEAh/BA?=
 =?us-ascii?Q?7eAClF4zebk+X1fd2mOhchIJ/c0dV6V85MnaBePaRHhHRXlYpFsYJxDzvVbv?=
 =?us-ascii?Q?H7XLnlwVloP9wZyyI+CZuvDmebnVF1FwUawaRkjDhHrvzDr/XhAExqaw/P9u?=
 =?us-ascii?Q?qAzOhEEKuOrRFtbdzgvqHXkd9DIGYteKPOTA96yZEWAqvvL7XNqWMSkUl+cL?=
 =?us-ascii?Q?sO8eccIu2pRcJkZPLq/aX6Ehf/DEDmrgTSaUrwuf2b6ojelq4OuRt+Mj3QKM?=
 =?us-ascii?Q?C8S2u3kYgfN9LB140D4VFc9lo3Fh4Dqt?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:25:17.4402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9904065a-ee49-4670-12bc-08dcc597da84
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6928
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

Revise ina233 config for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 1765a0bb70d7..df389b506b4b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1034,28 +1034,38 @@ adc@37 {
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x40>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x41>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x42>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x43>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x44>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	temperature-sensor@4e {
-- 
2.25.1

