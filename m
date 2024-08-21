Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFC095974C
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 11:43:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WphGg5gMZz2yMF
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 19:43:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::61f" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=u7satclP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphGf0NFNz2y1l
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 19:43:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZzTxTkfWY3ArbUTcruyDRwVhAej8TgTZGejFK1EgxGBdiTHIjdFIY+ZrKlEGwxtmZB/wZaHqpBw7Z0LV1PkpbzlT+CIzvjqVZr5QdnXQWnnNNPTXTultXH0m06rZaoheib4IcIZooQanJ27v+5B0c9jPBfows3UzeW5SEF3qpCgYRrbJAjJkCU4o0VIqVZSn0+ivCf1XK1Zah/wqXJh8eyg4KgprUGl8eoSnyi8GGC1r4pGUx2Zawrc4RyBQBvxbPAnaAiHHxq8Xn836124JocaLDeNCKTZzCjAvBWjtdqfcfIqclRqy0JnceF/uFv4ODD8CjsblOzv6uY1EZXeTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQFQ2bKjxnUV6R0l0iLzwvLwa8mKW3x6TIVY3QTprt8=;
 b=CAEMM05BuuHzzEVMl/D0fl+7dfYhRcWFFnJqyfuB+2sFM0NlKEPEe9aQ5OYL+zRvqkrRZsvGmqwBmfHipZgsEa9PgC96MdIkgWC3M8Yw2df2W/3WFppTo0xWNnElW9qJLH/yMY0b9aatIjYJsLri6EwGsk7XV5nfiJXM8RALXXc03O6XnW4A0+EVkLetsRo5Vmqtipl6wfvX4wR+oHtjtCQjqKXzXGHpJbjB96NPPGCALBlY7b74+CWjtJWpJfiZ3V1vxmbYk3eC3nsYad6gdpBDPbBU0rpNHpQE7DvyIp/5qPG6OiIh4QqVOuGtugCzi+r1B7ZX4HX9nB6MeQyp6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQFQ2bKjxnUV6R0l0iLzwvLwa8mKW3x6TIVY3QTprt8=;
 b=u7satclPGZnJ6tqYhACnPGVZxfdizVF+LPxU0FlQu7xyItnvObjdYWkAlydXIlcoM0n8R+5c0F7HcaRR5DRWRl4zKAvxspfDwwuhu/0JpXhsT3H0jlTp3WGGI4TTI2e9lMH0VW3vTV7Zz1sQGSOCC883DpleK522LDiDCTynSxgkd4qX+9PqqTOobIxFecSU7hRJHNL8RmGTgF7XN0TQ4tkxw8yEN6MfCBiEYHXNn2c5jOA0Svf271sZVEegXrB6sOp4XA30Jkt9K5M0a4etFXp5zCcJo1YnGhNeyLVZ6i3VEzFOgaaj7FyGLErrp7Iu7KW1D9KsU19emEFEh3bumQ==
Received: from SI2PR02CA0024.apcprd02.prod.outlook.com (2603:1096:4:195::18)
 by OSQPR04MB7876.apcprd04.prod.outlook.com (2603:1096:604:29d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 09:43:03 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::a3) by SI2PR02CA0024.outlook.office365.com
 (2603:1096:4:195::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16 via Frontend
 Transport; Wed, 21 Aug 2024 09:43:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024
 09:43:02 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v13 22/29] ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
Date: Wed, 21 Aug 2024 17:40:33 +0800
Message-Id: <20240821094043.4126132-23-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240821094043.4126132-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|OSQPR04MB7876:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5384d37f-3042-4a22-a429-08dcc1c5a71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?9yZXBm8K/i0HGTe8Sqv8fqoERMKyfHMON0tGhry5uIq6JmAKqC7gPePgkQhw?=
 =?us-ascii?Q?/Z2zMa5CHyrn8XT0WsvS8RKy5Z2NzjhhpR3rli0ttLV5ONzGwCsPqiLpTZ16?=
 =?us-ascii?Q?wnhWgix14t5HMvGf6XEC6oBcrzKxk4/qcQdBrRKE8AVagIQBT2qP9NQ+o3hv?=
 =?us-ascii?Q?gxU/K1T9fp04h4ZFXSWX/lnsp3qpnG93zKAfO0dNf4d/3IO6tQ15WhDxX5Di?=
 =?us-ascii?Q?+v9t9ONjSxlopJw1A7iO1LU8P0m8rlKAbmCzRy7VGi0qND+BvUPyCCYNKkCl?=
 =?us-ascii?Q?GVzlqPopufBAdTf0bhj1IP7cfEWl2e4y0nDXFB6ymnW9/bVq7FDQmCGCqa/h?=
 =?us-ascii?Q?3/BRKqZ5C7PHNk4tbreEkwE+zydsCM+SYD4901eW3j5vSO+dB2xO9DcK4VU+?=
 =?us-ascii?Q?RAtkhZGhUlW2vZN/fx8LC65LIQkkweiQbou/tknKhCItDs8KaFQ2iYWcpL2u?=
 =?us-ascii?Q?m/Y7V2CknnlFSSDy6NUWWNv3tQ43v7AYC3O+LbRMUT5OdgV7riZC4W5M2IvC?=
 =?us-ascii?Q?tDGNcSwYUOiYXCpb3N+fNHX2qbaoMm19sFA5crXY5TemZfurrRixDhyZy92n?=
 =?us-ascii?Q?TOY94akKh4G2IgooV9ovisuLAN0gO8yu/IMwJCafrErGxfO3zzH0Th2aZi/I?=
 =?us-ascii?Q?dbyaNtfN6n1HlwrE5z7yztzt/mlh3zILCZAHzuulqTIiEeRmVnfhZtYWs+E2?=
 =?us-ascii?Q?DdJ8jXuTa0ZZl80vAL4VnUwIgG3j0J/3OJXJu4qcHaJovbUC4SYObTh8iW26?=
 =?us-ascii?Q?elN99tSODe3gw9PgW3LjuQKC5MZOmARofKzfSKyu26gWOnEQVFIWIL9IYvvs?=
 =?us-ascii?Q?AIQSbSpyvgzj7RGEyKgYFWyarEskRQHNnoBc5XM84AEwideG/hA1S86bvYVs?=
 =?us-ascii?Q?goxMKIFXAFLp1JxLi+9Ij2imMl2LSDwwpTDg3DT8NE8mMaslOwIVZBQf7QYy?=
 =?us-ascii?Q?kqD9SnliKtTtnhnOK/bOg+UDPas3xV3pbzKNwCyZELT6ufNql5TBbbJSKhUs?=
 =?us-ascii?Q?ll/MUo8Jz7Bneoo5hNep+SbPk0Iqzt5z1lNKAO61mW1y8CW38T3SHVU4Or+S?=
 =?us-ascii?Q?Ead/Dh4O+OysVVY7CgeUijadjohUPvfrpfPO5sxvPfJynOSN1eEUd7+5/0xr?=
 =?us-ascii?Q?LLweA2nvx9fe405FgMwMajmKmDCIpwGZ04C8xkJYWdq3SUs71hdGLxmxhvqt?=
 =?us-ascii?Q?5r+H+55USzH0B2wFp2d5IePicMYV8dP8oTyxrY8warEnAb6lzdUTj77aCxNy?=
 =?us-ascii?Q?KWJkm4Lv4vDIDoZuVAc1emltkxZPeR+fotlWolDSGxYmFOxkLLnhhPOjwlHM?=
 =?us-ascii?Q?rZE3ivYD3H0DHAbUt9O3go1GhF5ZxtxiB+xQ0Xs5gU5MHn1uRK44Y3i+1PzB?=
 =?us-ascii?Q?O2jvO1m29rHdVB/vb4JiUPF8RTeePyWoC0ndixIM84LNL8/dtNkBS1mZu7Re?=
 =?us-ascii?Q?Li1qxJYzxh+QqM+e3gcT7P8vie1uROEs?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:43:02.9817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5384d37f-3042-4a22-a429-08dcc1c5a71d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR04MB7876
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

Revise duty cycle SMB11 and SMB16 to high: 40%, low: 60%,
to meet 400kHz-i2c clock low time spec (> 1.3 us) from EE request

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c2994651e747..c940d23c8a4b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -761,6 +761,7 @@ eeprom@54 {
 &i2c10 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@74 {
 		compatible = "nxp,pca9544";
 		i2c-mux-idle-disconnect;
@@ -1314,6 +1315,7 @@ &i2c15 {
 	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 
 	mctp@10 {
 		compatible = "mctp-i2c-controller";
-- 
2.25.1

