Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BA2972901
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 07:48:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2t6N2gJJz30MZ
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 15:48:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::629" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725947305;
	cv=pass; b=N2j5O4aA3pvqSCV/b/iGh1dzPDfD45dEG87wRkaVjrTuXogs+o5oT0wM2Zm1LZFXhmyv5xF7JfX0RbQBQrZVoyBMJIIfmGLAV16asr8t2aru2jy30xKvfeA81SJ0x+VuPKs5vX9hR/baiE1SUHYSUliw3FcJ9hAZ5YIOOE7ohngFXYkHyBWeejxs18XXX6N1+fkE7Mm9g1penW3sqQngfI4GsENWvn3m+sDhZBh0Zkq+dg3WfvqUMj9EKa5Cozwdk14Nd7xeESYVaKlkoch7PLKnsm2NPD5vpSf43tj5+CPmzdRoNYV/XK8ajVx25ReGah7AFUNsUsTvNMK5nSF+NA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725947305; c=relaxed/relaxed;
	bh=iDLbwJxcVO6qXb84Bz9khN14NF7j0sVNm4T4YFM2eMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FXepv6UaFphu8xssxko0vkCWTnYStA4YGMX0l1EOqujW7LG7iJl2MZP1kVEQu//UFshajYjQpU54mhjrzNP7EvhIt2ywj9DVvpwBNtvghZ8hFlbL8b6HuezYQIwu/0cxParBTE45f0my4PUC68wCB/8/dzBwG+rqglTT9ilJE2NOSONZfrLOpGJQCbgGgftxrrQ84iIV3ko7M/nKSwSL42MXb0XFg+vxYmyf70k7OiUt+0x6evZB07FJltj2UEtDqEqb4Un6ymdG0Z86S6qvREyO88xbM3NCGBne3MFWArL2ssgSm8+kCgsut4QnrDSEw8NcxPkp2Z7Xwo1LKeZBjw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SjY6yZYY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::629; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SjY6yZYY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::629; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2t6H0DNpz2yDT
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Sep 2024 15:48:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhKrGWvAExacYImlC8kZ8gBLRY36Rlu/NxajgyILLBz2sRVW+oUGk1GwbxzIhxYAqHGeYjuUo/la/SI77WobkZAFgw+5T5vtIUuruuofT0H3R759dVWGaHpllvg5+vFjRxPsIy9VkfknuB1DtdVA+2GmBJE81IDr2/oaKWuTCq43rZYDa3ZohmT3Za+LXxMpujCveQYUubC88Sgczz2gi9nUQ67NjYp+dBZ3KScXQ8N+xMm3TGaKhH0bQAQwXW+q8/1n3nr54POXJwUCrJUoTtj8C7UGjx4Syuxk/OOQiaEQJlYsuaLhgcSjt3ff+aLkIHuwdPmFC3Fcp/eIlCl5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDLbwJxcVO6qXb84Bz9khN14NF7j0sVNm4T4YFM2eMs=;
 b=lH9eIY+5w2NOwcTz7LKiRxfWNzyW5g70rI2uxBTr4cOUZc7nlqNbhYLHqQZ97iZBF5r8zIKGVKsi9vzPmmRPeKxBJmL5lM2UMUtBd3tnqqUQpCESTf/qEqbCgAnfHvZtk/XZt2QtvM7pRQmjW1Pvd3EOlRw2ie2XQunqRaE4cUPhauBf+8y/jyihYSJeKIo44BZ6js5hnJOEEiJxonVnAJrIT3RvRry4kadbZMBHMjcTh+sn5upTFE+nuPupqW2yX6O7M2+kpLNE6Ia0XhOjvG51nmfoGx+oviRS0SMAraL3MRekEhVGiA5VIo4ItxBEIouh4rQIPp5yH8tno/xSUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDLbwJxcVO6qXb84Bz9khN14NF7j0sVNm4T4YFM2eMs=;
 b=SjY6yZYYJL4ZyYMEJqrEdqNr8B3CsKIu216VWCEqK3POD3BNXAlW9KFAXaFRSEievn8f16Zs45nJGQkA6rNH753wDltrhD7nBapmJJR1fDXRXyv/Efyxp2NmmKFvkkh3US4qAlw91Kb550GLs5Fdxjl6LwbTIT/QQ2PZEpyq4vW3EbirM/s0gfsVYvFmeo6YOO3127fk9tiogJNqiAczqbb4DP5xT6vdCQ690uJhhqdZeDkp3g6MiSfuIAdKa7QnMLtlhiwJrEW2wcKs3VLNt9HIhb4zNmbXBSV97AnGTsvuzttD0pJJcIryK2Pe/u9RDCq9Zf7C+cTS9oq/pii7Rg==
Received: from SG2PR02CA0136.apcprd02.prod.outlook.com (2603:1096:4:188::16)
 by SEZPR04MB5707.apcprd04.prod.outlook.com (2603:1096:101:72::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 05:47:55 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::d1) by SG2PR02CA0136.outlook.office365.com
 (2603:1096:4:188::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 05:47:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024
 05:47:53 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v1 0/2] Yosemite4: Add devices on I2C buses to server boards
Date: Tue, 10 Sep 2024 13:47:49 +0800
Message-Id: <20240910054751.2943217-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|SEZPR04MB5707:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c4935c1b-99ad-4b86-8943-08dcd15c1dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?cBH6avbHty3OJe5OLHsTbSOCYrOG9RT/1tuiMDrezmk+drNEIoTZzg0ekvtw?=
 =?us-ascii?Q?iFDt9dFPt8UZD1JYRX+l+j6OeK4YpUnoKrN20IJRQRkSJbMtoc2qk0ZAjsQJ?=
 =?us-ascii?Q?IL1zMgrUROjEitZZhoFIld6kLh7iOq0w2qVu4sv+XKVYFEd/RzjMPFdRaCEU?=
 =?us-ascii?Q?u/EtP15cn/WIsLfD6uQPTj9oBtq4D2Dtb/vbYtAs+mCUNeiObHcdTaXa+oWF?=
 =?us-ascii?Q?Ts17LuDTSbihCIB8W5jI7s2B59yF5eliY1Ec1Ndgh5d+eNbxv9YFDyhdD8xP?=
 =?us-ascii?Q?/VX4x4ajI9r1vc0VeRhDmXV1RUc375M9bxXzSxZo3oG7nlFlBLNG0FsUklRF?=
 =?us-ascii?Q?NXWYVrUAMyiBjwLZRM5c9OeDHS87Yt2mT+Hqq2Sv81pchXfeljyk04ekaNha?=
 =?us-ascii?Q?H/5UB+AHDf3IYjBB+GZzvBt0wkid/Gfh96Gj9rySD1y2DWpHVJDM8IhHCjPc?=
 =?us-ascii?Q?8GYYHJLn/hQJall0FAacJ15Ypa65cqPRhzylSGAXdkmP4cHOlO/RCprwhSVL?=
 =?us-ascii?Q?mcgSWO/WoxX6dxBAM53lWttnKuaykf0duV4WMa5aojY0pyCOpa/Rl126P3kQ?=
 =?us-ascii?Q?mLygDfceOzUDsxwgxRfMUZwKLSTTecvI/ShtmQlUW1YovGmeIFEbduyoTgU6?=
 =?us-ascii?Q?HivQ9wW9+6lS5aLXRIqG1Gi/ZRAliO/kIMBxrPKVUPGQ4IgzHUM8ED+x6PKo?=
 =?us-ascii?Q?2w91jKoOmPwOOabY/7EReQP63ajym9nPlv67VTL0Lh1un/Ldzus8RKBq95lL?=
 =?us-ascii?Q?/8g+RS1jcm7F370zUZUnFYrN02sjzZtLloEuj+fhZQAzlG++8lFibGsLn15g?=
 =?us-ascii?Q?LHtMRgUxKWtUHyLKpcD+9gi92G730fhCnB5qS6EZeCaPe9aciX/WvhI9R5IG?=
 =?us-ascii?Q?6dLJ85vzrS98kBVaMct58fTbJdkYI+KAQcsAj4ZqLoT0mvaXBYNm37b8hdem?=
 =?us-ascii?Q?KV5F0x5rmeR0t438YhaiTfQ4MYXJTdbjCaDXcQ4NWBJFI+h19BhcOSCH1EuY?=
 =?us-ascii?Q?bmrnEjZY8rhQSCyzgXzn9coTIUBzRVFlf5Y1im6Y/ewUGiuS2IFncqDUEACF?=
 =?us-ascii?Q?zcWqGEcSoqDbSQITFOTc8qbxPiCaTDlnlRxJyoodPU+1xwSNFERLSE3cYCuF?=
 =?us-ascii?Q?tcuifR7AUSQZ+28IX75xSi6iZIrtUm/hUIq1st+KrO79G8VHWi9M6mM2UsF+?=
 =?us-ascii?Q?LXASeqEKdqU7x0wnoO6t+Bko2+kB6brcaUHY02PxV/gLXMrt1/7wIDR74iz9?=
 =?us-ascii?Q?xydbd+gJYuPYXeZ6idDjAi1FgPtQnFGTz679Y94sjhgQCrxbnqM21eZxTjF+?=
 =?us-ascii?Q?IldATg05v7RxmCrbUn29XxyjWpG9prPX1CiZSF+pnphxEW8RZDcGTNhkNAw2?=
 =?us-ascii?Q?NN2PdSV1Z8ObSsfBsUC50axysU8DVmzoUKPn8hVzpAoVTYCza1Sn04Vi5sl3?=
 =?us-ascii?Q?Z2v6vI+Y6xBPXpWq32T/GTpZ/fH9Cgih?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 05:47:53.9901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4935c1b-99ad-4b86-8943-08dcd15c1dca
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5707
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

Changelog:
  - v1
    - Revise to use adm1281 on Medusa board.
    - Add gpio pca9506 for CPLD I/O expander.

Ricky CX Wu (2):
  ARM: dts: aspeed: yosemite4: Revise to use adm1281 on Medusa board
  ARM: dts: aspeed: yosemite4: Add gpio pca9506 for CPLD IOE

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 276 +++++++++++++++++-
 1 file changed, 268 insertions(+), 8 deletions(-)

-- 
2.25.1

