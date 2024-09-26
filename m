Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F7986B4E
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 05:28:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDfFt5GrWz2yYd
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 13:28:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727321328;
	cv=pass; b=HEWa3M4kOfPjkJx/FHv8JeAg5AckEgoA2X7VwrS2a5mB9EbIJ0EIhyGeC3wtxz1W8gYV0hMC/jYqOjScRMLF8J6rdZ+BZM0pyHCBqkgTJgnCTwKMuahw4498pwrRVQXc0Pb8+H2K/RdW1fguGkTNlzRznnOiK2+rA21OklydJN+NcdPpmH3uckvNQJ1QXvkZ+/ySGmCHuKPwxCJRTNWxMHMIAoGKMi/RV2GvtcaSBIK6FNpPeDaX7hMjiI4c5tIVqSUC+E/B9ZpXwqia3HNzR+T/ViGBujM/aLjG8UaY54Tt0wXcBMmsEUpJtMlCWG8A2FgX7bDMhQw7LAU+hVUk9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727321328; c=relaxed/relaxed;
	bh=q5viLAlCTwazaKNUv1ok0UHyIQfjtp3M/XawChSHY4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=k3+MJCdHo7zegacvAjz1mAw2l3qe7qK5duf4nYqJQI2ggtQI+19YP6O+prMxx44Gyk6omuDRxPVlNfqwZOftBurBVvo5L2qXhLAQ3zRgupqnDuUYhmtBjPHHG4GScV6Sz3Q1G8fbqH1FGTrtU+WMeITb/lpIfOe9ZM5yNW8XjSHzMcOkJGuGDEHNwdiFHkURRtVX66GdBqBHDI2T7RgWAaqYGFxoFrj3KH/c0FzInA6VmDOQD5oYc7HVf+wtDG75AtwawHz8bRP2veuerKPkFdVazkLhnE8YBP5irQ8EflKrPiPQaxTZRVCuUIBVkIjQuXtXIz8c1x/5MYV/kIuumg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=PPtdETgC; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::619; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=PPtdETgC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::619; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDfFr15CTz2xsG
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 13:28:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1Gyv3X7EDw3VoaMckEdO6SgFvivOX/t9WGnTjONfmywfKjPvtUcdQI+6vJ/KwHG1R2LiPWdIiGBuKdMk7XldwsRFpo3l2yUFNk7sBI9EfePok7gkQDZ3+mKg5Q+gdDxU/6VBT8wW29Nd3o8aEq5rJHXzkGZjkOh2XY3N7DonfIDIU9udrNCQZUgwg1/5brogppIbcPLpSYZHAqlTyjpTUfjNMNpStIrB1wvOe784Ucnrs4uAo0XvzdAf5uKNhrKmYzLXUxkH4bX44myD7YEFk9zu61e/9385z2VqG+Sd/nCbVd5D/8l+sEtm97vnAW2ytL3r4MgsHrMrBn44DP0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5viLAlCTwazaKNUv1ok0UHyIQfjtp3M/XawChSHY4U=;
 b=uDfJ9fkhToIk/Uc2l3Jw+zFruDBfNDgiIbCmMpk3qW5FPk5tuOdiJo+QW+qCnoiq16ChyB7ktO5Kyv3fIB+mcu3RKgnqkfgRMLw6DMp5JDD1dbILnV+6/xRL/jr7xA/8HIPmS/O5BxZeTkgbc0jX9uMm5SASbhKSC/dsf7oyWhRCyw/c67GkvBZOD0fSQlJso5zU5nfZdog4CdfnBaaE6b9pyhARGpGrAbn69uy5ltpPVBDirU/eWFbAjbvFolpNTCxmv0/aB3SXcRBaRLUo3xNCP8PUZiUm0tkiwTBmTzkX7vvLxpY0i0mbeYI+pfJYifl9sSJG3KTUdm4qbA02jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5viLAlCTwazaKNUv1ok0UHyIQfjtp3M/XawChSHY4U=;
 b=PPtdETgCww+qtMedg2zO7/C502w9H75sofGOzAlkT3TWUjaw1zby1V8en9P4hOGQauddtsCli5UTz6CHxAi/AwPUqqEmnwiSs9E+yfT7hVw0mM8J5XlshKwOorRn8av+oz5a8PvbTCOvLbw6zLTiGjJGW/1FMKWqIBS1+aPGk+NxMohC0t1MkiPLXDIcusrdb0Q9MYbRoFgEoOQ+ogw+Mkb1r/geVl7o0nGCyCsWJWiFRkIQeUC8KucW38cBQ6ji4hh5ZedUNOuFcgJHTIXy4Uns31ZM8Cus79Os06LyN/Ka6xYQjIvYNNn+5mF9NynwJ5RvTjOPxRuIK/O3QXaPNw==
Received: from SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) by
 TYUPR04MB6790.apcprd04.prod.outlook.com (2603:1096:400:359::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 03:28:24 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096::cafe:0:0:93) by SG2P153CA0002.outlook.office365.com
 (2603:1096::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.5 via Frontend
 Transport; Thu, 26 Sep 2024 03:28:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server id 15.20.8005.15 via Frontend Transport; Thu, 26 Sep 2024
 03:28:23 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v1 0/5] Add I2C mux on BUS 14 for yosemite4
Date: Thu, 26 Sep 2024 11:28:16 +0800
Message-Id: <20240926032821.4171466-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|TYUPR04MB6790:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 346b5d2d-5352-4b7c-56ee-08dcdddb4729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?2bDJTAnj9feRRsEtjY6f4IyTWZq4HGYp8qWV/mE0F6Br4KYfu5QOXYFnc8/6?=
 =?us-ascii?Q?+TaRBxgGcYhrHY+kChRz1C7WZT3gPhOMD7123xZvwzNZcVx2P2rttRVgFpU9?=
 =?us-ascii?Q?tCjRUoX1aOmp8pHqCp2OuYdtM5WQhynt3MOaS0STF4vsL7Y17LUozYx+v4MS?=
 =?us-ascii?Q?JfNLLdKx7ZdfqW/oWOPnYy+oipj6xlM8Ir55Yc4Ld8/RgrqAW2MlC2HEj02O?=
 =?us-ascii?Q?ZKzRWFdgmToW4jSoK6uGPaclN3bDlP7mu0RoIZOnzNE/3LW+AiRTKXCsMIZg?=
 =?us-ascii?Q?Wdf6cH5k0ml2Uj5c/sPnJ52zytxuhAc7xp62t7P3TWx23oS3TC3OTa8ixE8n?=
 =?us-ascii?Q?F7S4y7ONBc31vLddUvUL4ZXNRP9Wa66+Wu+0YEoGoiVsoNIn/yWuAiIxuini?=
 =?us-ascii?Q?Fc0aHRB2XF4PvbcdJdiU8AurBs8cDNHnMzW6DHxQM0h3wL+ilWpLnsPRSWxK?=
 =?us-ascii?Q?h71XJ19OxFOhplS7x5rTTDUQcnnt0xIdF272Gwr0XjOpdhtAWECzQ2WBOpv4?=
 =?us-ascii?Q?5uXXxxhS7T9dzOaq01PRrq5kGRzd7rbJraMRiSd1KvRuMHckmaSof0aSrOWI?=
 =?us-ascii?Q?TptorMDsAjR6zoXUZK7istS3HKhNbKx8F8evKVguzgD7K3DU1yGIYQHHfL4t?=
 =?us-ascii?Q?sPBUNZTdXXWrK/KcIyXlZ7829XOArG/QTVwyclDPjRHyp+bz10tl8L4EFTR8?=
 =?us-ascii?Q?UHXsplXeUrvcznbfhm/TtchQEwLStePOUJ4YooCPF72MgrKY48zQVLf2Bk15?=
 =?us-ascii?Q?C4QR9883NRd6u1HqMyxtK5mTWWKF0GAo1DQKpMpueF7Q6Sqodue58OPd7fgA?=
 =?us-ascii?Q?p6Vn7EknhzpTid7eIrszMRT1/490LHPYNUMnIiirIskSAarF5ZfC+xldb+UO?=
 =?us-ascii?Q?/s8zl09jkLqENHYXYJMLkUAQOMeNp1ufjiHr6eX+7K30VkP0KEkwkUIMpTK5?=
 =?us-ascii?Q?dCUCagQ73SDxD+E+R8mgVFxiZCGx5mmhACHuyRFFd5uGN6Z2klli0LdUDLFw?=
 =?us-ascii?Q?WyV0aKFtP2kUdA90+Ea+8JRKVj5nVZPuU90RZmmcNM5MEF49onGsWjlK/I6T?=
 =?us-ascii?Q?bGiY30lDId1Xv+7yq1NIc9RRL0yTUR94XtW0gy7A35yDWQARrVeZI59B/NFQ?=
 =?us-ascii?Q?7UgBWlp71yPAWfSmXKo7/TWLD4B0mucCgB7WzjrkQjzAaYtjAIuhOZHcu9+U?=
 =?us-ascii?Q?7xmTMKKxSjEVwVG/q4I4gpWFvFpsuW/tdfEvso91mEXKFoIKHGu9z96dOOoW?=
 =?us-ascii?Q?JKeb37FHHUjPSLZUCa861pku9luKIQoKCIKvAjbIZ7lQaekbHWBJmcr/Q4w8?=
 =?us-ascii?Q?7zskWCaXhoXor/guKJhs9NrCzTJA/IYOxOkg98VzWQFFS7U/JRuxuLuTmg2S?=
 =?us-ascii?Q?HYvnDrf+jP4iVSvLmJjqIMndPaTh?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 03:28:23.4673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 346b5d2d-5352-4b7c-56ee-08dcdddb4729
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6790
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

- v1
  - Add i2c-mux for ADC monitor on Spider Board.
  - Revise adc128d818 adc mode on Fan Boards.
  - Change the address of Fan IC on fan boards.
  - Remove led gpio pca9552 on fan boards.
  - Add i2c mux for for two fan boards.

Ricky CX Wu (5):
  ARM: dts: aspeed: yosemite4: Add i2c-mux for two fan boards
  ARM: dts: aspeed: yosemite4: remove led gpio pca9552 on fan boards
  ARM: dts: aspeed: yosemite4: Change the address of Fan IC on fan
    boards
  ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Fan Boards
  ARM: dts: aspeed: yosemite4: Add i2c-mux for ADC monitor on Spider
    Board

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 131 ++++++++----------
 1 file changed, 55 insertions(+), 76 deletions(-)

-- 
2.25.1

