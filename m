Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9227897BA68
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 11:55:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7vCN49P1z2yN2
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 19:55:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::62e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726653310;
	cv=pass; b=K7p/qQkzJD7SVP6I+M4LXYimkrvRvXgcUHBGQ7Gta9jGAsmRoHhPrDB2/izDssnzZBJvZAyUIfKwSN9AB+klm/H1hacofhwUdHRvf+gFu7yd+sd4VUZAeNzLyIQJuY4SSEQodsRlO6QnTpNFJsnkE0qjWOExs/GR8qcmoFBNfgaxGjLQQK5f1Kgai7lT3wHklQ3NL3ZI7pkppN5yfSvO1baB4QMBZqtavRbcmxQyGG5NGidOwyQjdQ3MlSTyOC1YjDL0cuDrOvoEWWqtgGj6OHkoZ1FMoXGVVysfuQE6JvN7tLoOaxUGaxcFbycX1Zw0oWzn2qA6wVVIfq8HVguHOg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726653310; c=relaxed/relaxed;
	bh=RBdAsQdX8AH9FC/6zaDseouFX2rDXfeOyaJtjKcsayI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZSX4dfHOpEDk2tAHu7aQkPV7riMSu2iva1/rL/L6tacxs9Yp7BR1hMrgtc+JigzPkOP5DbvGo7rSwyWDWhffLFecXMmSgGNNA8/A7EgxY1DSIs/g4UfhItBuT0KGsBKHzXpAyCbFLPtZ581nv6joMJNrJ0pKokWphn6+bcgvE5DjXR42Q6WVAFEdVA1dvXPIGgmgF6CE02ZarvuojWQVur72ACb7tHVb9HHKF/mB+9SJI7ksyjvT3LwvdLmzLqWz9Tuj/HaGJgj8ZwOBWv1G/JIpDuOemot8a1inRKzUS6VeO3g3A3YBWUuk8m4drnVX6bX7IimU3PripVVDr5VuQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=4ZRtxD/I; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::62e; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=4ZRtxD/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62e; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7vCL1M8nz2yDp
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 19:55:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptyGMVxvwPYreZf0rXMgs/9q6MLUhPoi34VbwT7ID9G+xBW+Uh6GttnrdBBwCHRIsy13BxSqNo/OzJCBDQLv3hX5YoNlkAd6E0EN4/9Mg2mWT22GNtkRvIiDJNL3TgoGysfXqDFN46TQCKCe6f4sayfdGZf4MjYflwD2NrEypYgBvAVVZdUJU6OPBqMVa7+RzcRPRYGLMnR3WrVx9B62NmwBi9JfASdoPaLgmOV3X6e62GOrUR34OXrbh1t7rub36pUkUlDjjScxZzLnSDoNiPiHQ2JCTd0BwPOTJEIE8zJ6Dplyd+ux0x3JUoSA8qVq2psnPIcXDc4MXfJKmOtLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBdAsQdX8AH9FC/6zaDseouFX2rDXfeOyaJtjKcsayI=;
 b=kAwzdzcWcm3jfhoAYsgM9nsIFizpH9FzSrWAdk9YgIoO2d293VUQFceII7i8dXM5jnUdw6yM0oD+OhcikZVB2SH0oPthKgnRUl+tkmB4R1IuCts0gVQ7j6M/QsGntAA/IT6gBXYolvUPXqQdkEli5cfSNLQvbkiSrm++hhEAHulhVk+NzKDJfkS95gpbFKJCGqSj40UuGJgQ8/6fPnHx9EcnI62LzMjs8i2hXnxyAm+FkbbUaVdNLv7cBgYDaXx7uf05f5Oa2Y+DBKyPrLMkzf6NvrKBqKkFxhrJLA4h9nTSb5jO9CCr0VxkDhioywYmQ2Jywl852yPYEgOqi9ZVPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBdAsQdX8AH9FC/6zaDseouFX2rDXfeOyaJtjKcsayI=;
 b=4ZRtxD/IgBps7tDQ8tRiJo5Ee+rgks5PBvqE/QIqh5l/28257Ur5oUCsmhhprLa14DHz38s4cAu59j04b/1BF5/HMu8kRpqlOIKLxJFErbolfC1d04qNUk9FaZqqcsuZDIApcqk/f/o5rsQmltOJi79sDUB1P3xhbV79Pk0WMl99t3lZHhIw1OLHO8XFIKv/+u0hSm3wGKvMtLPv3biNE6uevawQSpdREFaw6MKf72j1CNWGxtYsnss3A+HcsoUhIvHCM55LbrpMcq2xHRtXQqpPzTNDRxGswGMX+LIjOJpuH60ISAcfyjSpO250yl79HuFlAtNN2ampg7LQ3PjtbA==
Received: from SG2PR01CA0123.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::27) by SEZPR04MB6369.apcprd04.prod.outlook.com
 (2603:1096:101:cd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 09:54:47 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:40:cafe::8a) by SG2PR01CA0123.outlook.office365.com
 (2603:1096:4:40::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Wed, 18 Sep 2024 09:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024
 09:54:45 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: trivial-devices: support pmbus compatible string
Date: Wed, 18 Sep 2024 17:54:34 +0800
Message-Id: <20240918095438.1345886-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|SEZPR04MB6369:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: feb08758-317b-40e3-df57-08dcd7c7edcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|7416014|82310400026|1800799024|376014|32650700017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Af712vtEwleV+ldPW3yQsJr/0B2SmN5RAsibtyFCZtn2weJuXTsA/yCpWNqx?=
 =?us-ascii?Q?vxdxiye11fMrAJV+5XSYwBTLK9MkQSIhoQHaWbjFSYNOkF1dXv65CxuJ8Smo?=
 =?us-ascii?Q?CiCiPxqeYloy7uvZ6+AkvxWc0RixXIfKjFhNWi/+X1CPnH8V7e9hbO3zQOeo?=
 =?us-ascii?Q?bTO02P6VtJ5DfWLApClcarrbuMhfzOUqi5euQ6HouyAqEqzky66wjP3QLWUg?=
 =?us-ascii?Q?/6XeIAbvjmMiAp0oab/z9asjQpw1N3pRCjWcQ3muKazOq2blJGzoZHT33qvb?=
 =?us-ascii?Q?OpPAEKXvMQYhO13lFLlWAJhGCvXChObp5wUZwrUrroJ1O1zIFw3UWqImdesk?=
 =?us-ascii?Q?mvGiGCgvKSPhpwvOLJZf1Nnob2RjwCltXuBVgSCxYgFuTTNzOQXYgQQffRZW?=
 =?us-ascii?Q?b6OhXnY5snyLYXNj5D2R1O1HUp/cWdEv46g20o61s1+kwIMBFRVGd4zdp1I7?=
 =?us-ascii?Q?mabG1Nu88u/BXKan3ZPX8MFoir+G/y1KHv84hTAcrM1xZt1d97nSzOyeC5hN?=
 =?us-ascii?Q?gyHxebtSsKSAewt4qHIyMH3kp/yud3oTujVAJmZCDNcjBdWDBi+cHacT0fIm?=
 =?us-ascii?Q?Um2rsRr7w2K3PSZ0EBEhqLsHn5CJ68CsZTAz5LHxIQ/CvcH8ZbfrpKA5+FJu?=
 =?us-ascii?Q?gzBKkpADPGURa+y0UElLk5qlD94GuiO5SDiJYoEwHTkIUjp5bsdmeO/l15YM?=
 =?us-ascii?Q?xyXXaoRiwdBF7XF5IT4/9GYwv6ihzpe+DErYwB2WCd3bvLQ8TYh50T0I6Brg?=
 =?us-ascii?Q?Pg7VzZpt2Y9eaes9ISlw+dbf1SV1kqV/G512DxFqtMg/AgWeH7RdIF/ZfRSH?=
 =?us-ascii?Q?NlaTA62Q7HLqquORfkBRulIEVylMp6SHsj+xsSNNHgSqy8TJHp6q1p6pDaRj?=
 =?us-ascii?Q?36wsQKHshp4xhS/lh2Vx4SM09I9EIqjRamDtWZGQ3nN9vlUSVm9IiR4uIy9e?=
 =?us-ascii?Q?Q6nJN0X86DnOq/rxNjlWAEm+U9cN7lpsR9q3HqJt2o9qIGecHGNM97QtA8bw?=
 =?us-ascii?Q?DUgVWKdPg0ewxrr0j/iBmIbx6Nd1A8wrdoRde/hLg6UVlzbQIo0yHA07hYmw?=
 =?us-ascii?Q?fz58TsjIIl+TuC4d/kQAcZUgq/llJ0tW0CmBBux/BCEFhj2v0pO/2UKLE6Gl?=
 =?us-ascii?Q?3C2AV2aKcVnr1yuH0NK5hGaNVAR4f0wehlTtkjQPyC353Pli2l+FUmwloGcQ?=
 =?us-ascii?Q?CwDOju7vpgQ7AAjxrOmPj4r5WUIPaM3//NblNegv/oZzVByxl8f3rcAXVzXz?=
 =?us-ascii?Q?2JpJ8ppPlFChpSzGK3eK8KuOtQFIHCZJGPPLTzx3T7JRw9wu6D9m4e8Cm/5D?=
 =?us-ascii?Q?xMmOmGD5wtiU1N+ZynjJP5QNnln4rOlm/eK3Aj/Y9imv+AeyIJ/l5l+A2drd?=
 =?us-ascii?Q?g5TjSZu3igu4jftSoAkwDLGBT6kgxrjNycjvkvlUAZdiv7OIu3zJ9u31uWCP?=
 =?us-ascii?Q?wvjQ8owC8eFHBQUERgZZjXgwAwCLRLoo?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(82310400026)(1800799024)(376014)(32650700017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 09:54:45.7480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feb08758-317b-40e3-df57-08dcd7c7edcb
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6369
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-aspeed@lists.ozlabs.org, Peter Yin <peteryin.openbmc@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Noah Wang <noahwang.wang@outlook.com>, Lukas Wunner <lukas@wunner.de>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Add pmbus compatibale string for the Generic PMbus devices that could
be monitor by pmbus driver.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 8a9a00705b23..cbb9b94e5b3b 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -320,6 +320,8 @@ properties:
           - oki,ml86v7667
             # 48-Lane, 12-Port PCI Express Gen 2 (5.0 GT/s) Switch
           - plx,pex8648
+            # Generic PMBus devices
+          - pmbus
             # Pulsedlight LIDAR range-finding sensor
           - pulsedlight,lidar-lite-v2
             # Renesas HS3001 Temperature and Relative Humidity Sensors
-- 
2.25.1

