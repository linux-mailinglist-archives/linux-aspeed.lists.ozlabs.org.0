Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0E5939D8C
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 11:25:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=CfgTTb55;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSsDt5HxTz3dTf
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 19:25:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=CfgTTb55;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSsDF1Vztz3cxn
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 19:24:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lffRcww1R3C4HOK5AzHAdl+YlvTDVOCXgF/3F5XB51PDqEWESEmjL/gS3mh5klV345xNjzhQNr/EtnT51WUEyzTYH2GtLLdiYHpMS+uxVOCI9w1fXXSU3s9PArsiYkvzXZFjxnwim65zEIZPHAP7pnhgdpo08kbTsQ/xtykKaSYHeOZriZL/351MA89rRwUVduaUVE9iBbAf/kN1UgCbsHPy9jIzBdRIHKQxnjoVY5xsA34Bzyc7iu9DS3ji3Muqalrpr7GJ4+8/YGvDoUkTCawWlD8MhYB5hwkuVoQBh69//ZUAnWm9MqT3WGwl9UrTNrxt5+qXkczZnbG153iW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP7PVLwcCxjPpagISxynxIAExRDCx7daqT/H5FzbdV8=;
 b=Heeyc2cKYsk7kDnsO2nFShHYnloAoaspIQzH1IXgxcWB0lFXUTEn3aFGm2pfTjG5RxfNFBIcMht/yhW96mARUpQuRDLI09O+x+1fgyu9EsZfVHOByfCECFM00aQcJqTJ6OcnzxY+zbKm/Cbhazz27nstMl+15JvH+fcVcx22LtsWQkioLhTrfK6eUDEQmyRudbWRWiBvnsh0aBp5wYSmrEWslifl51PtIeLih7OQ/rUA4q9i4oVtEc+XQA9I8Mtm55I0qWyjB3W4S5rOL6UqKoVs3qUzQSOMUPOPENMD7UT+Er6GFGDnHXmBJsufTfeA85mrvIhG4JW2RtuxOhn41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP7PVLwcCxjPpagISxynxIAExRDCx7daqT/H5FzbdV8=;
 b=CfgTTb55IBUOhex5isvzjeXHBfh8PSn1MS+ENNdGvhrmmmyu3aQZgat5+4LNUw5kEsyiCA09IGxq/ljH5ICYOT5VYCs473VUOlxRhpiQXe6tFT22Wcg9D0PYtsc1rP+kGhZ96k6gazJH9Jg34sYH0+fLaHWit+IGDOZXrQygDxcsrl6cjAvUpHbJgnKD0I/swUz2trmtBmytPRFtEskb2XhPnidLbXnekJrkQyMFqEr/In2L3M6WI7yhDwfK56YRMRKyDTMNTiyrs31cyHfmE3ziCYtEWzP7KGHjslpWWJnxX+ekteejByRw/gKyNnYMMhZY58imVrvLtkGaCsXE1g==
Received: from PS1PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::13) by TYZPR04MB5606.apcprd04.prod.outlook.com
 (2603:1096:400:1ce::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 09:24:10 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::f4) by PS1PR01CA0001.outlook.office365.com
 (2603:1096:300:75::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 23 Jul 2024 09:24:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 09:24:10
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v11 15/27] ARM: dts: aspeed: yosemite4: Remove idle state setting for yosemite4 NIC connection
Date: Tue, 23 Jul 2024 17:22:56 +0800
Message-Id: <20240723092310.3565410-16-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TYZPR04MB5606:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1002a97a-1105-4956-5c64-08dcaaf935bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?8MI15SMSYfjn0jkbmeA2dKdHzBxXiZYwuNnnAF8rjTjkHdtg+WlQGhtFZ0/Z?=
 =?us-ascii?Q?nJvaGL7j4XgGpT2q6pAx1JINozfF9Lo2si9D8MsAd07Ee+PeTjkO2fTNd84o?=
 =?us-ascii?Q?2u6mzaJU07G6hD7KLdJ/Jey8h3h1oYoc59ko3y8HR/BlbZvmzWnmtEQytabe?=
 =?us-ascii?Q?6+m6E8KQoPZWnwEyp9BW8c/3KIv3JDuQgTl/ppCtsBzB5qeA+FeO2sec+XPC?=
 =?us-ascii?Q?KcKaz55kwwYxtOArQs1LyMXIjf+LgphZgnG1mBbdQ89uiXW1fRTUCDOzmquN?=
 =?us-ascii?Q?gX3tiJK2hlU7EaMgjGtc1R365p5HmC0zSGJo9catqMTAW62B1/lhy7wvYAPs?=
 =?us-ascii?Q?75agDZiv0UIw4z98EBinUIWhCCIQwhC43opxtu7Eonecla0KkKHEiKpodC8U?=
 =?us-ascii?Q?kJXDXRNHu+4IKQpZ5KoFbWWAjkRogkyi3HXQ3LZQ2TrtcGOpyguh8yWFusnt?=
 =?us-ascii?Q?+RYc/hOJPM5s1WDhgIOOBZzPviI0fDTFcLbcoMSGpocdwZSEO8DTxlv/Tu/9?=
 =?us-ascii?Q?u0zRHKTWwt2Hc2HZ+2BY/dQ6meiTtzqO5mtr49o6sGiBlrvrFXtKJsHXANBj?=
 =?us-ascii?Q?FAMX5NzJ5FM6eMzo3vmO2ipkumLhVks+2qXEumbuW7+yPcsa39u3ZEwpnW05?=
 =?us-ascii?Q?zLmpwQqAIug1deOa8YQi20quLAOpP8m0sitCmq5l6I1u9TTpMWCUNkGo3m5o?=
 =?us-ascii?Q?j/+73ual6nkfPVZwFbBgh/5ZYqOMtH8rffUjXOARPD70XIXQ2HTntv7xo3ZN?=
 =?us-ascii?Q?iUG22FDcrIj3E4U4CNDnBV1Mg/HvGo3iPPyhRVC3+9QB209RYNexrVznKhMK?=
 =?us-ascii?Q?gH2dt5gv8VWCrQmC5V+lZTFHPTzn1DFJ4rA3QkkzP9mClF5PR1bJOTd9Bksd?=
 =?us-ascii?Q?H4jSJ0gsCyoWXHdiF3pma3UBh6JZa6fYn3BRU6c+VDSVm2pEw6cp7n87IPj7?=
 =?us-ascii?Q?8K/HRS9jPiDt1s8AKKChI8m3k/tJAG6kEFiX17mzvvNAu4Dq9bLmGjEA80WB?=
 =?us-ascii?Q?sB5O6qln70rEHeHG9ynv94OXTUuRHzKjGhbC5WdcliE6HBGiwUPogOwL/01J?=
 =?us-ascii?Q?5Bi1AXkUlb7Bg0qJxMq8usA3NBMaqckSOLSOl17Gw28JmGXwO+8FwRj+DBzR?=
 =?us-ascii?Q?SAceoUyK1UWAjU0nfkD6vzJ7LNAYwb1LD2dXt4h8/eTeT2l31k1yNdZOFnE+?=
 =?us-ascii?Q?WtGhIJfFDmFQeOjzjstkNN1YDaxewRs2MPSoNsz61iusk9wT8K62oPyMdvYV?=
 =?us-ascii?Q?FHgHpoQi5PDp5WqyChzThQeatq9Fs3/xU6uY1FBmyLCVzKFiIq62tUJCe8ep?=
 =?us-ascii?Q?CIYogGgqSoIWNDE5dALwfrS7NGRhmu4cpVhvx63rz0LMbSM2msRjCOwiF+0t?=
 =?us-ascii?Q?o2dEeYvaPrhGDK2TmmCX0Q4C3cGkNxzfFec3hrc5Vc8iR7XuDvswsj1cIwAE?=
 =?us-ascii?Q?Ce6ZXBs0EJP++SPHCWmY8qKjhl2GwpfH?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:24:10.2695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1002a97a-1105-4956-5c64-08dcaaf935bc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5606
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

Remove idle state setting for yosemite4 NIC connection

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index df389b506b4b..c0497a1aa93e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1235,7 +1235,6 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		i2c-mux-idle-disconnect;
 		reg = <0x72>;
 
 		imux24: i2c@0 {
-- 
2.25.1

