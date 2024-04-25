Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D68A48B1AAD
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 08:07:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=P2beOp/n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQ54H14Tmz3dKV
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 16:07:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=P2beOp/n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQ5466Rt3z3cmg
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Apr 2024 16:07:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pk/CLLRiYnOgZJwBl2uqAZqbWqNVLUR+WY509WO/MN4vfZebdCQIMDxAlw6uECvPXkwdcL/InvffAplICQIqgDwj1NdY3ynhLmHkTKHQAVzCPBTwy+L8lJpnRVsZkbQeVg5XdwqdB0XbDmgy8msjJ/fixT4Ntg40990Q+HpObNMuaAoKBdnW2KqeR6EJ5UNC2PyoPRBvpTfdeL36Sc9U5kg288ZG5Y6rhkvQi6/io0T+kG8YDGPkiaADR1rBSGJYB4+un7jXiVSEl06YFhWWjAvSrH1TXaIrsqxdThECts//JtWuIM0RDfJMyFd9Wrob4abgsAasBqnNRcD2ZSgddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76ym1qanZjf24E0MQC315rUWdqS1IXErqE4QWfxXeYA=;
 b=JHyD2yLiyNTj+G+Mz6uHY+i06K1Y4g/VgSmj3Dp66fgbm05Xn3W+PMvrN1tA4Z3xZZfBfZFka3f58pxkQGp0sTQ9vTCxQK/SKMxsAAYHXZ4PrM/tZXwJnWH8CysqXlc09B/0VdtpKItJJiOpVZEBpc9bQybg3Yol4aT4USg892D3ilwK9Ee8LjFc0w5k18e5OVO29hsppO9a66yCGG9rXR/ln+cCZTc4aYsTUxRUkp4DnJnEWqmDffjUo2Hl67AafHpjEAJpYgG24IbIIoitHtwOY+3l1EhP9JVVflZstFSGiNxRfQL98fqLacHix2j5NXaiRA8xqPJVqZkRmKHtEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76ym1qanZjf24E0MQC315rUWdqS1IXErqE4QWfxXeYA=;
 b=P2beOp/ndSzDwzTHuAlF4tWhHaduqXVH+51xAA2Qwdmy9Ck4c8E36ntawpNz4FtV1cIuP/5Hlg+hCShKzwl/8FlMsLBFMkOERx+BS8gg2X2IpzJJ6LwpcZgrS7ivCy8WKZ9jF31mf8dhzyAOBXxd1LO4huOJhtUeVo97kgybuZ4KtTNf94e8P5jSD0S8U9w9ivoKfYtiUZRUbCgjml6XgOwOpE4UQ2ifVRNZUObtufm7PIwaBuV84RCxC22Q98N7JLITx1QsrhcWSFjCVPZhrs49bVh06B599+bHl9uyMmcQmO+ClsPWHD0HTt6AekEyR3Nf85eaBw3I74VW56CEtA==
Received: from SG2PR04CA0201.apcprd04.prod.outlook.com (2603:1096:4:187::23)
 by TYSPR04MB7081.apcprd04.prod.outlook.com (2603:1096:400:47d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 06:07:09 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:187:cafe::f2) by SG2PR04CA0201.outlook.office365.com
 (2603:1096:4:187::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.25 via Frontend
 Transport; Thu, 25 Apr 2024 06:07:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024
 06:07:06 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v1 0/2] Update yosemite4 dts for nct7363 and hardware
Date: Thu, 25 Apr 2024 14:06:23 +0800
Message-Id: <20240425060626.2558515-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|TYSPR04MB7081:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 49bda39a-6c24-48bc-115b-08dc64edefe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400014|7416005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?kmfoWYPSXiUD8KsHUGsi3GpbkyrE3DONlnD6sh2urbhYM6aY1OQsoP4boevH?=
 =?us-ascii?Q?gtTDYgeY97NLcsgdsC4FfszCXfgNmTqIXRV04gFm4m06/oGx1pDitbAG9wV/?=
 =?us-ascii?Q?0RbHavulmYZjgH7G7zYmZ5A4DM7gJHkyw9NqiBajvYRz5HdrxunTU3VS1wMo?=
 =?us-ascii?Q?0j2vRpT8r/ObSlxfC0pUXeYCxtoLsA0861f9Mkd/X0Bn1JGTiqpYXvNRdOvO?=
 =?us-ascii?Q?lUhUydu0XCGJimEsunAQFWmeJYxEP5eyn/HmY2VHgBgpdDAcIhYAn4ihdyzp?=
 =?us-ascii?Q?A0I+oE7j3eELndJcfmTOZ98ryQMK6SSDq5QslqcsVgfZKOJMH4J3FTAm9dFW?=
 =?us-ascii?Q?U+C61RBwBsGxZvfXs+xD38e+Q5MRQc1UEJMAN3AFrnNwJot/t2Y6LEZkMViP?=
 =?us-ascii?Q?lcAjWcam1NiPu1Q3yz2rAbh9Yh3zRP0B72xXZud6ZDgNq66ykLKYF7gN7mBZ?=
 =?us-ascii?Q?zguKymoLv9GoFFotEuCpK0ReZdDM2fluuuu2WR5RaosHnvymhnnxrtgbm4Sy?=
 =?us-ascii?Q?saB89iPi0MVys2SyDgeJ5XXQJ8auZsRcXH361JDhhoSQe4dK7vbD1tDnysWv?=
 =?us-ascii?Q?WgwiJXBxn/v1lBMKDnjsMv7ic0YsbnnX/C62HWnICYL9o0zxDYzqA1PUPk8l?=
 =?us-ascii?Q?Nj7PBthJvZ9l8W3TRpG6KTg/i6lvovl10o/8jiFEvZCDYeuyuROaCdMsDBiq?=
 =?us-ascii?Q?V8pmjLxNGoIT3m/VdwgsudUmrD6yAUlBbTSG7xaGnVXskc2VKCLMqyOErZ0U?=
 =?us-ascii?Q?kPdO9+m9N/5+qfzOMCkCYKEWmPZ5fbMKUU7OZCbUl1oG/ZhuSPMxpL3qUH6+?=
 =?us-ascii?Q?sm9NJdgYEJJMpq/9UQ8X4wkEQ9aAnaPas9NOF4F6QY1b2n8UC3ikjXRNlMv2?=
 =?us-ascii?Q?J1X3Yb3UgGa1uhicjB8rqVKPzYB+hBbOgIY3nMIG7qoWyhxSiuyr2k03hjdh?=
 =?us-ascii?Q?xKETHU2tZua+2Whtj/N6SzT1xPL0NnxPsM+WL1f5BARaddV8m1gSonpLiuV4?=
 =?us-ascii?Q?K2uD+KGAilAsn2d+8DnwXxikM2DJ95Axf7yfF4zZGjr8/DIgjzPGpioCp0bK?=
 =?us-ascii?Q?l0cpD9AneKWuVCFlm4rUCH7vJOT9TYxmG3UGtVS7hZThq2/EJ9AMH4YuvMSX?=
 =?us-ascii?Q?t5oO/SNeX70pXh7jJdJON/GpuWv89b8MvoM1Xcma/8AZQwuqXg31eaDgZ8Ba?=
 =?us-ascii?Q?LvtWcAlqPnGhmo0JQV60sww/zxN3Q5Wcr1HhwPydZgf6pTcu6JPaaRUQZo4y?=
 =?us-ascii?Q?o1rdqu6dG2TJJttXIxVQ6lVIhVRCX5hGYeb6AOVJdJ1Fnmcw6Mj49MMWAz7m?=
 =?us-ascii?Q?5zEw8lgc1VNYK9n2TOZZaf1PS56UVbxIRUVtf1DnOLGaoUKBKw+OQP9Du0Ds?=
 =?us-ascii?Q?QPKIUFw=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:07:06.7842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bda39a-6c24-48bc-115b-08dc64edefe5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7081
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch series includes two commits that update the dts for yosemite4.
The first commit revises the mux and hardware configuration in the DTS.
The second commit adds support for the nct7363 device.

Delphine CC Chiu (2):
  Revise mux and hardware in yosemite4 dts
  Add nct7363 in yosemite4 dts

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 222 ++++++++++++++++--
 1 file changed, 202 insertions(+), 20 deletions(-)

-- 
2.25.1

