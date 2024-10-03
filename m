Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F098EA98
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 09:43:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=s1l3pELK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK3ZG2Qg1z2ydR
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 17:43:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::625" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727941396;
	cv=pass; b=Kut4DPpXZV0pDcKOehAkuaA4WxIfHxORHTAl/wqKtdUwwOsHg/oFmVTPX1T6HAEBq2EwUGh87HuN5vfebEqho9D/mV8Znru5mdl8+bXERvNknQ06DRgu2cbXZqsNoqIxUKzu9NCcyEMJ/HQYxx9UHUOr0cG+kzP6lvNUU7ptKT9w4oWI1PyoB7EiYH5nTrlFGTu514cCnXvgNW6GEo8Xl1uF8X2zXLwfGhqpevTcuApkpmnmDRAbUPjcUVWwzw/vEmM2gfz75eqH91+97AZ03xaJFL+UqYmnRLwhAJUlhXobycTveIlmA2FsIKH+3ye4YDkkhE5Sl8o/REkRvqwcRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727941396; c=relaxed/relaxed;
	bh=bkFUz0x5o8gB8pgeK6lqYD07m6EOGDfR3NvpdsN6XTY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aquXpnvPloOMZRS9VcGLPT3ZgcS02WcR6WtLkhcrWQ9ypasH4yTLVL3SLxoaITjg+r/nD776vhwegMuGOKbvbHfAfrneE2jiYIyvK0R+3/6wmSiFqg/anI/l6DNaqcB8hMUjtC6quJ+uHkFIt9C2Qis8cjvQ5Klfy9GZGvK4subTISn8ddWvM7oP12mkOsVQrGwmFC9NhIrysvtKhiGsPMykM4WE29XsB/mzZRBlCxVU1c5dSlupjg4u5V/0vr30beYrIU6wSaQmCGUwe7E3FPUVAXjuFcZTXOrx3gqkN5uopFgKIOZqmiX6mKRtAegcteqbBDa4rDxkmigzhZVgzw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=s1l3pELK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::625; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=s1l3pELK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::625; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK3ZC4d75z2yT0
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 17:43:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1kAHSVMnPfcdPrzPpXZMzocDJcostszN2ZU/wD3JATOTmiYUOfu/gZdqq8ZNhRhGbCw4pG63LHWn8GijYeHRAtqDRD6N7EaXpLNkiYSRZ56msVmUErgqMt6HBuw60Tib8IyhZkUn0AzSIwl95ctbuxjNvAoQRyDbLVqRIB9no0G93vbSUTccni1ToXZ8/qA6BXRg1d0E/TJaQ9Sc+ZOEv1HTT1Gv18KwwXbYKNyelQqbTVrl1NGHbFeQhqE2sFnXWBsagegsE5srd6cOOloye1+Xe12FUjtfj6OAAqbT4YfacTxGBLejcbu8rrNUv7aKAofQbbceMhjb0QInd5wpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkFUz0x5o8gB8pgeK6lqYD07m6EOGDfR3NvpdsN6XTY=;
 b=dG53Pohy19px9j86K0tRC47nEzYQj8YsbGEm77RYFWPUHH58WBahUofiO2IiXN84GzH4E7q9DkDIR9b1cDLH/y3aI+h6vSLyG/vW/HCkdDS+0Q/ki8yD0VKtkKg2Qy8bru6wETlgvbqP5MKY0bLz7QFp4OvpSjjFlHgci6R9mbxf723ppjQ7xh++zY3zzp0mWHqd/vsJcsfpP9Okjt6fSiRdxouPbAiKAldV9Nh5aBQ2LoVm5JmgS3fjlT1tfq+sw8kDDaE2LE2k0XKrNJHBN96vyY80HcTMUpqlDa3zxDEvmMym9beCGF2ibm5ZtVZL3WWcN+i5qbeEZF/E5TBRHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkFUz0x5o8gB8pgeK6lqYD07m6EOGDfR3NvpdsN6XTY=;
 b=s1l3pELKKW3aGyoqcCj9SGcSpzu40+nE2/avlk97fIvDB0tY3salV01kM01J2k7eisV8jKWHqL2+l8bK9+1OcEpp/kdEPV4Qy46cBgraUPDiV7aWnMhvsh26a7pCCdwnjgZcdQONcbNaHMHQ9JhxvyoGLCyydW6fxoSXpEJBPtsF1BlurRwzhJCs97qg5z8ul/F6nhV80tnWQgw1LPahMkRMJg2hWZZSMGYDLA36wiIMv7830bP9xxavnenY7xhH+ZT/waJ6rkDb1gDXjXyianP7Zw0qCa+M4YKGGKKV2eoKrLOiwYNqLqKwc9LecZnx+YSxXeKaaao9krIWsS5G/A==
Received: from SI2PR02CA0017.apcprd02.prod.outlook.com (2603:1096:4:194::17)
 by PUZPR04MB6652.apcprd04.prod.outlook.com (2603:1096:301:11f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Thu, 3 Oct
 2024 07:42:54 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::a6) by SI2PR02CA0017.outlook.office365.com
 (2603:1096:4:194::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Thu, 3 Oct 2024 07:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Thu, 3 Oct 2024 07:42:52
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v3 0/9] Add I2C mux devices for yosemite4
Date: Thu,  3 Oct 2024 15:42:41 +0800
Message-Id: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|PUZPR04MB6652:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f3c676a7-e55f-42d6-3a11-08dce37efd53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?S6iFITT0Rxfkoy5wbOGtiHj6jrAnNLMlS2Q9YPHK4xXeBmZiQtLyRTlN7jMD?=
 =?us-ascii?Q?+pi1jgf6GVMkj1Mr6HqL6XnUatFPcTJwdl+2azANt7hJhNcKc44MDDkXAceb?=
 =?us-ascii?Q?xK8NxbAqgb832Edl7C/gp8G2Sa6xf88VUU5vrciZgolVQLySu6BJFanTc23R?=
 =?us-ascii?Q?moYp+qRdDVoDZ78CFzmFqCfVx58+ZXx1W/oTWZ5JChJ4V+QDv0cdKNQWrNQE?=
 =?us-ascii?Q?c1dz9PdGxMakmoxYC2YOVT5JiqRWpA6wBUn9xT+u4AwxxRV7hj9veH7Tkjnw?=
 =?us-ascii?Q?dz4k5sxgHoim9jMf0kcNJA9znVY8WbLEd2J5xyUbbQf1FYIHvGiwDohaWwjc?=
 =?us-ascii?Q?Sr0rETlly5fApC7yslc6SRlWhcP8Zjudpm1SsNgGOHYTuI3GpEQ69qdgyYnK?=
 =?us-ascii?Q?KJVCDLlueGE/I8L5TTp4YiOl+o4Dw2eDk2mfui5DRhGC3tobh09lTgc34VPc?=
 =?us-ascii?Q?Q3N3liexO3VrWEJ2GfooiqjGhgJycZIoN5hCICScuIJ0I08dbaqIS0FeAk7L?=
 =?us-ascii?Q?JKY9JJEu8w38N3EMDWew6Mz0KBJ/zNA5M9IfOpzPIHrTbkfRlBkyvfxMAn7y?=
 =?us-ascii?Q?AmKxZPJhLhrH4DbESvwhZ8uKBxRL6iolQRniz+z9j4v7mbCXxn0TZiSQ66vd?=
 =?us-ascii?Q?N0/gr/LLxdgYkycJAAgCFxBtremxQmx3cwLGFKYAJjLobsgPkcan09oyDfe3?=
 =?us-ascii?Q?I3lKGQ3HQu9ePw1otwHC1JO98Vtw5JqqrKSDNIG0OldvSmgETZarmRDKhWpV?=
 =?us-ascii?Q?6icuLLibrtkZPSjv4SrsAs2tz0nIzx+z428NbQKv4XHpruaBx+Tpk41BT4kl?=
 =?us-ascii?Q?X5HYixR/knWd0PBl73VrgxYakQlodjC1OEXBzN3iHCQ7d+FYgGsri5YwuIdl?=
 =?us-ascii?Q?sqzwljAH5wUirN+odTGNuu8EzmK0ruy4/c6j0M2dQyYZRoF7SVjVvf6TaGdp?=
 =?us-ascii?Q?vvKbWj0T+vVZ05sX7eVy8WeZbnbhqlGjn45ifnF1zBm3Tgp+NX+0nKWMi9CG?=
 =?us-ascii?Q?uYZytjANzmxxnHEwOUC0WIIHlomLaoRLassbjnz5rsGvmngfs5TaWtB8wTFM?=
 =?us-ascii?Q?/mdP+zq+4Ds7fAGTI/lFG5E5GF/Djr+NUy/g595lQvi3ivI5lM17ym2ihpa+?=
 =?us-ascii?Q?d8BcYfWo9rpwfwJ+LBvOXHsIeDFL6L6Fn15zKM+kXwPtJnBH3mDS43v1fCks?=
 =?us-ascii?Q?C9E95+BM1l/lwVHoSlppR8FMeDpuJXcScg2s4WISDZYZMxakBlEntoS0TyTO?=
 =?us-ascii?Q?WWLSgMsTh8eCuY6Z+03r600Pa31BRhcwmjtYFI138M+5OyeZNNSsfP/BxW6Q?=
 =?us-ascii?Q?yqzXw9K3/bzcE/g+OfH1wmRO1EnXH8d+piSiPg67EloAzKy4j0+Bh/HNsRFh?=
 =?us-ascii?Q?7bQjwFs=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 07:42:52.7742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c676a7-e55f-42d6-3a11-08dce37efd53
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6652
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

- v3
 - Merge the remove mctp property patch to patch 02.
 - Order the patch to correct compatible string of max31790 before patch
   06.
- v2
 - Remove mctp property on I2C Bus 15.
 - Add required properties for IOE on fan boards.

- v1
 - Add i2c-mux for ADC monitor on Spider Board.
 - Revise adc128d818 adc mode on Fan Boards.
 - Change the address of Fan IC on fan boards.
 - Correct the compatible string for max31790.
 - Revise address of i2c-mux for two fan boards.
 - Add i2c-mux for CPLD IOE on Spider Board.
 - Add i2c-mux for four NICs.
 - Add i2c-mux for all Server Board slots.

Ricky CX Wu (9):
  ARM: dts: aspeed: yosemite4: add i2c-mux for all Server Board slots
  ARM: dts: aspeed: yosemite4: Add i2c-mux for four NICs
  ARM: dts: aspeed: yosemite4: Add i2c-mux for CPLD IOE on Spider Board
  ARM: dts: aspeed: yosemite4: Add required properties for IOE on fan
    boards
  ARM: dts: aspeed: yosemite4: correct the compatible string for
    max31790
  ARM: dts: aspeed: yosemite4: Revise address of i2c-mux for two fan
    boards
  ARM: dts: aspeed: yosemite4: Change the address of Fan IC on fan
    boards
  ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Fan Boards
  ARM: dts: aspeed: yosemite4: Add i2c-mux for ADC monitor on Spider
    Board

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 483 +++++++++++++++---
 1 file changed, 422 insertions(+), 61 deletions(-)

-- 
2.25.1

