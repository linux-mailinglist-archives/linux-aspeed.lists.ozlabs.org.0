Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A810B917BDD
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:09:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=xe2dE0TH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G9V1K1Jz30WX
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:09:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=xe2dE0TH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::619; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G8y6SgQz3c5q
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZPzX8EWip/2Nb1H3DXR2raXgkyMf3lmixot/L8lgx4VLhjFy+04x0KJb4JJV0qb8E5rkdBMqC2nMe4bcJb0ux9ld+YHzPZOCU9npfndm0fuyhdgaeRv6LPnF/uXIifQp/7webSQ/TU8R2usnoTjj7L0dtlg0GycBfXQRl7E62TLEMysnADboLn4yzlfikFxmnAMU/52HAD+7nPJxTFhUPsMiLBc/qFvJN7ghykG+wnUDSlb7GaPoFRTJzxRXx2+Y/wEMa6xulvmE7THf9gXNIyKNXhJW9nKqe91k+UCFtCBWKLrzAm/+XFehlQOB9pzUnrBH71VcFQb3gI5o/a2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajdRlofMdvo42OVOqGXyRTdshC61xKgWuLqNg7HObWU=;
 b=GLVhWZYiDVbtcqQnixw3ETh4YKFuMkCTu7fAqkyKGOlGou0mqN7Njn2F4WuXIV+bnSuPSyYEQVKsPBrhebzs+xXdKO8G6UXZKjzVcizAs7kn6AjVyL1dplJfZ1D1ETAmOQUkvNlhupz3j7rumPOVTtrLGUp4UCneGMwpA0yPO2LAd78JCYJNaC0qJHwC6DJWAXjZKQlwnMWhRCJMwCDwcMxZk/n6ptqGh/czBuJ6HEsE5j8Nwe9HOzR3zJGHcFVS1etfg/sJB17Vf6wHu5hvL2zAwIKiajf4gQBzIYaykhPPSGXurEcLLXBtW9stwIXyBgic8DMR3r1Iwev6Oz4OCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajdRlofMdvo42OVOqGXyRTdshC61xKgWuLqNg7HObWU=;
 b=xe2dE0THJx970zU1MOis1CdeQSeJNeapxNskgVCzeUfDVi6mjw4Ob2atpDQrqHl43RlTxxtbAhaSNiayQjqz5US/VgETODWZlkTLiuW1/yyZ2YugfMm/Ur0FlJ2j4ZCKXrD72m3WyVAVWmJBSJQYtp9958Euok+IyzXXpO4WrKvE1yCbVFmFB0Z5cAxVu6Vqonv8M+/lzGRg5qwfKD75WQVE3aKC7EROMA/ajMvjm4exXTX/5Bvh9CPF8C9VEjttyCW947jIaIlReK2nwIvu4pxQYL37BWUptGVx/Alrt9fwmwumpgYikUpp04LIocCEISkpYom0+UW1hsLXJ3q6IA==
Received: from KL1PR02CA0009.apcprd02.prod.outlook.com (2603:1096:820:c::14)
 by KL1PR04MB7291.apcprd04.prod.outlook.com (2603:1096:820:101::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22; Wed, 26 Jun
 2024 09:08:51 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::5a) by KL1PR02CA0009.outlook.office365.com
 (2603:1096:820:c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:08:50
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 15/26] ARM: dts: aspeed: yosemite4: Remove idle state setting for yosemite4 NIC connection
Date: Wed, 26 Jun 2024 17:07:31 +0800
Message-Id: <20240626090744.174351-16-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|KL1PR04MB7291:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5c4270d9-e722-4ce5-5352-08dc95bf9882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|82310400024|376012|7416012|1800799022|36860700011;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?DUaLpTlz9YYNJ2HozkxxiAN4qmgImrZvv7Yz/DIADWtOPqTRcCXsVIruL3+4?=
 =?us-ascii?Q?j4f/weQBgllXMbyRNCO3m3RwO88UEDnkejTveTomYnV1J//xaBe3tfp33zxL?=
 =?us-ascii?Q?AXrWhaW7D4ve2Am0AQ5r8kWfCQhvf92ikZET4JZtbkv8xNTZmpu4kUTr5ZDC?=
 =?us-ascii?Q?eo6UePVJv90JRb5CukpaxHlLMW+YjZkpf/+n+a0eMeGJsd6xp/dWK2V2LVtW?=
 =?us-ascii?Q?qIKTDYsT9tXeiHFSy5plVijHwvpoWQ2pADXUzaqFf13ol9v9cqMKA5bo5byT?=
 =?us-ascii?Q?XpMNhtUlSXNnVUg+MCxGCJPp671zSr0fG2dL680w5dzuAO82At+n5akAHr/H?=
 =?us-ascii?Q?HBNi5z2qYdjlJGJLSRexxWV2UeZseEaFifTpefDOs/c5NkR2uB2BgOw8RAeK?=
 =?us-ascii?Q?MmAvszs7kniLHeWC6G9icHdLlmKDackJEUAveobLQQgkS7VEqGiy3coSiHR2?=
 =?us-ascii?Q?duFiDnZJcNRDs7MtZ6vboMvQlFU/jFwlgn0OlG3hXujrDVC7t4263OYCi37/?=
 =?us-ascii?Q?U2XnNeKOx6WcLQF1R2RH/4FKgxJ0NqO3DOps4JR2Fchj/scQydDxziuZgs71?=
 =?us-ascii?Q?OO1Kg1MRpq4L9+k3oc3LkXCpURz/sl4G3bKKqmbkbVMM5pATfAjUMdmemFqN?=
 =?us-ascii?Q?j4kKJWHI/vyvcA5AGU121f0YuK6GeacohUrPlbtFoDpRi9FERKfxZWI5DkxE?=
 =?us-ascii?Q?L0/xAGqXx/g2O31AKvmwqfcqoBdR6FfXW+UyRuUEq/SSNCebauu9wr3WS16s?=
 =?us-ascii?Q?usd00rGt6KcTi/BcK8bQNBY1UPtF8SdC6qRCpXSTC34MGS+mW2W/lutpNusY?=
 =?us-ascii?Q?/bDssR7KcVYjXBLkuo6gguYguHOswCVkS/anm5fczT9r0GoSxL6sLZ44smTe?=
 =?us-ascii?Q?IkQ+TJKRaF1V4rWsnYBRKc2KrCM8JVKxud4TUgNTNopiQq5pecW+UyS+xwl5?=
 =?us-ascii?Q?o64F+O8IZEBIPOpa6tGLKPLMpthR9ykIJ14rFqz/iDfhtkmE8wZeaXpSc3x7?=
 =?us-ascii?Q?gIYUo8+FONKsanUc9fyxmnsmvewABCsOTFTmZjctRQ/xECWvfycaangrsPhw?=
 =?us-ascii?Q?0xDwq2mTK2qHhtQN5EIPOK7H7hniZGqJ6mlU7BXgnvoQ0gKDsuvsaM9UT/rh?=
 =?us-ascii?Q?5DYfV2A5j4ch1g43LhWLVAfo11Go7DYNQPhGAfggKmi7wu4l4V02Ysj187bl?=
 =?us-ascii?Q?MO2NMq09/n1NRAnRsTEERG/XTbd2KVj05eRtGFTXsM8Mvob42U3R6zjHiYMk?=
 =?us-ascii?Q?jO3V1OUpQlGu3FlkDCh12IdGTVuld5re5dkeTtWihtTNppDWOF5HkecFmFfd?=
 =?us-ascii?Q?eoh71HMFU3OR6WLPSf1TfSp5RsfI6o5DP8im8g9h6jO5dfCxL24fFr7NAH12?=
 =?us-ascii?Q?KLHrQNqAdlzWpk54kmTA8Q7wzkdl92aCQvMnYLgeKYuia/G/TQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(82310400024)(376012)(7416012)(1800799022)(36860700011);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:08:50.6612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4270d9-e722-4ce5-5352-08dc95bf9882
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7291
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
index 67e3c787d675..8b23b012d6f5 100644
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

