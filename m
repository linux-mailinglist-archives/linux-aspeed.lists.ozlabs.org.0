Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39795973F
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:42:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphFm6n1Bz2yVb
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:42:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=pnTlAT4q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphFk58VMz2yDT
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:42:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEsE/V7/nNFJaS7/q6Goj84rwceiTokkbl65MEid8hOnnSlvNHm4j8OsLBu38VZ9tv+DUcjWXApnvhW1N5v0oVvXQ1FBQdAjKsm3EIBhgLXUwUubbRQJaERNKlCZcaGqXRDCeEr+I17FMTQ/AM3oaT0U1FTIxXDuwL7Ps7vn2Jr1RwcjJKpOXbP8VR0uhPt2XzOdyD45+Vwe3uDOhN8dLofg50jKbyxJ8VhSGyzMilJgFzw7n5/o1VbPyy1xe4NLtsjHSdNwcIkrJ9qKy4QHltlEvV+T9Sfs2gNpKODXLL2OiZzzCNpuV3Fb7MzHRi97uBJsBCvh7yS3+tZ/+zgcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1Mo5JFgxGn5H6HKsVEDEaSyXk72X/JC48fJnaRvMS8=;
 b=ZGNaj5RxaPKZjbSr2HzhDsa2lnGZIV0K87/igEev2B7TVCfSLm9IeH2ulB0T716PGROh9mwL5rqbuCWnxXEbHg2ysLLGkDE+9cmYeFj8Ra6EZGZz9lnoHYn2mawLm4msyutyWy/SWsAqbwRLsehmqui+xfL0cAXnEoidqouDRUn5rSUBZ2MlBNeFRBeD8b0SPfArHMiXx039glHhPgTy5WfvnmuThoEMuNvDcC8srPc2BExyqbVW7hWneioJAk7Q2HzyXU9k/80OQczx5gbDw7lmUJPg/yXzlFNjFWNU39RyfFnI7DCv4DmqhHTycci8tJGvKhOLV9XSnpZKHXnLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1Mo5JFgxGn5H6HKsVEDEaSyXk72X/JC48fJnaRvMS8=;
 b=pnTlAT4qL82u9Mj0bQRS1HY76myB786H6m9XbPeYxIEqdoaPXgqRBHd8MrmXsvCMsWAvK118bAN2ZZ2329CYICPAPpd7eRksvXgG3oUR5V9IWPxslrrNltlO23zV5HJKxnlZRhseJ0SVdRRxCjq/XRsnFVTjnrMYz4XmCV2lZ/W9HVA8VUM7Ve5AUDranVvH9bBOEYsxnDrLsdEMdhbkKkLqV9h/NY1+PBnh4HaXhCeHc3zAs0JK+b8eJ9iUrF/293veewIS6kPWXcSdTtA+N/7gNff962TNnZ6HhTEHWalfMocGIZomk0D7RbOkNGAWm1u5ujJI+1ydbL9IE1RVVg==
Received: from SI2PR02CA0024.apcprd02.prod.outlook.com (2603:1096:4:195::18)
 by TYUPR04MB6741.apcprd04.prod.outlook.com (2603:1096:400:351::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 09:42:11 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::d1) by SI2PR02CA0024.outlook.office365.com
 (2603:1096:4:195::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16 via Frontend
 Transport; Wed, 21 Aug 2024 09:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:42:10 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 11/29] ARM: dts: aspeed: yosemite4: Add eeprom for yosemite4 use
Date: Wed, 21 Aug 2024 17:40:22 +0800
Message-Id: <20240821094043.4126132-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYUPR04MB6741:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b1e7bdc5-25ca-475e-6236-08dcc1c587e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?JWgsfTn2pmLd9LELzl+75b6+//Wovq7xReQ9nBbyM7oQBfqgKsC3EgL6TO5z?=
 =?us-ascii?Q?iFuoiGL9Yrr1xps/nsjBHklSTacOQMZWDO1ZYanhPjEugQ9CD76HZEiOVYtG?=
 =?us-ascii?Q?nI0VxQHQFNmIaOOXmMwP3dDaNjY4yZPyZaJEzNz8PK34hjCGcK8TCVS9X8tw?=
 =?us-ascii?Q?NE9hmp6EfkDE+gVrZzYfpBRLnlwMmn7Bd5RQLrzgXLWRKqr8Hu8SbTH5zD85?=
 =?us-ascii?Q?lON/mX4KlZSNdcqHIUGTsBkuIPA6c16qYNSMN6Fu5RCneLaM2sIDuY22JXBy?=
 =?us-ascii?Q?R35qxSVli75sAlzKGWZ7UPRiH2Dbtjagoj27yrTZplc7K1IdYN6/jcMs0saG?=
 =?us-ascii?Q?YGBczODbK8qqB7zWM3mPdrEwAB1/x+OBnIbt6nGCyMSbrSr6DUAGBtSJf9IV?=
 =?us-ascii?Q?n0xTrT+G+eH/dhSPo2b82bmqtsKpRPa3FJbinCisbT+neR9x5+NATqB06Cb4?=
 =?us-ascii?Q?ywkbInIhc56+eu3IISklBPC652HgjylViKiWTUBiGBmFd+XdyW2vGJYDdOqD?=
 =?us-ascii?Q?jC/rUqNolOsfvEik2gR+Zcx10UKlIPSOu2ZUzqsGOX0BXhQeS+5XKoI/pI9d?=
 =?us-ascii?Q?PdYoT6IFWr579gj3zLq6FwecPUEn3S9W+ifiq0szIA2YQH104GK8yYsG3P3/?=
 =?us-ascii?Q?fx5KBi16M0xo5l5uV/WTmfkcTy2znMPQlLkUX7SsUO919eaNy6z1dZ+wBnv3?=
 =?us-ascii?Q?J6yQs2JZT7XuyTjKbd3lkhWI9ZU98h0QUvf8t/KzqISd5jguGW/7ne7tl6pI?=
 =?us-ascii?Q?IX6lqMxGLjZG7U5znoWzcgCi1Upfloi8b4AQikCJ6FNx3RiUcJZzwug7ktX/?=
 =?us-ascii?Q?f2Iy6fULStrXjEQVE3nVthz+DYhNWBQ1pLlCgwq9WoUqIjMnaBAwEvAYSxze?=
 =?us-ascii?Q?ioOylzhIsGDx1Kl8a5vvIe0V5TXjIyVl/8t5de73Fr+tPqFgAzQ/K6iaPBhV?=
 =?us-ascii?Q?Dp7rszcEDB0NNYArp9YABfj43DfJv5pI+Y258xhLZsNr+S7sr4FqzzTRNheI?=
 =?us-ascii?Q?k6TScntMDHN1xRMhQaNrBt/SDr4G11IxL+kN7I642bgHolLGyEEH8CVjh+hi?=
 =?us-ascii?Q?37lF/pYRf4aPZy/VvJXVdmO1wb3wqH+zQXJTp9Mw82Xu+uJ4liQ0xmsmX1QD?=
 =?us-ascii?Q?CT3s9fpW/qM+wgsfQdEoM9P/BcoP1eIt9BIiqnPbGT/2C1xm8AWaPWomAead?=
 =?us-ascii?Q?SbLyO59P3GVtB5TDf151vNtsChsFNvpRJWAv6f6BQQ7FFYctL0VjtHjswr8a?=
 =?us-ascii?Q?2pkrMVlwI4OmLVgb3gCTeeSfeSDq3/qGO9HgwA/yXCFOU3k1s9o4zR1rOZYZ?=
 =?us-ascii?Q?Xm1/a5kbelmnRST4tipvFPASYrHX6t14ww1Y+4c/77E9eCuXR6vcdI5CdBPs?=
 =?us-ascii?Q?UTHdiCfNbHltrbUeDEtOmMXE4YZVRIenXEBjNhkMPpQpn/ELnvn3yWQ+cm4W?=
 =?us-ascii?Q?DzjvihgutJIKMr8YENrKsO46hARHvgP+?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:42:10.5593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e7bdc5-25ca-475e-6236-08dcc1c587e3
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6741
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

Add eeprom for yosemite4 use

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 139a09de24cf..e83cb51ac19d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -932,7 +932,7 @@ temperature-sensor@4b {
 	};
 
 	eeprom@54 {
-		compatible = "atmel,24c256";
+		compatible = "atmel,24c128";
 		reg = <0x54>;
 	};
 
@@ -971,6 +971,11 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
 	rtc@6f {
 		compatible = "nuvoton,nct3018y";
 		reg = <0x6f>;
-- 
2.25.1

