Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC28989AF1
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 09:05:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHBt35Jbwz2yRF
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 17:05:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::618" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727679929;
	cv=pass; b=mbwmmjFQmhZQXKag7Qp1PysYpZRF+3kyV19YCEg+cYSLSqWSK/egsEH1rm9TXMWwqr26GKwYQZmFxhKHecatEOxfXvQS87lPHFv2QmN8CHAr/bYy7GvyvSNElo9fwmxxyDEO9xv7/TOLzaPeIZm87glnd89O0KDb6nsjHM20EjqHxUIDP1VgBNW4ZrbfxaTGqlhCJimDzj6lft97K/10YCBCSqrXcHKiUc+WqCDEKTsTnYoCSUk6ozxFnzyJrBvPZA/+Wu3FPYXqfTaKStGa7jjDT1YAc0IkgrP9nfBW/D2nWqf6QWlG1740AeckbOV2znbS4pgxvL7+os35EDYLZg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727679929; c=relaxed/relaxed;
	bh=Jad9yqazVWLzcswUVCuoYq2t+dpwI2Q452FqFEEzgOc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=eNZ09MJcOb0yN4yaMnI1uy4XiH5rRKMj5HnWaucad0RNRjdTqKqHv+sPmQVMvsFVM/78Tgt6jitg8gm4fS3kHKPq1U7Xtj7jjdb/Cfiov0iCzMOo20EdAsCK93Y1qe2bHKdlWEO3rhHszuQ6or+UDK2mBpHwegzq5U1UuhmuYHLcIZwm5/8GCjescFmBixFu8bFL48CaFJqXfpN8UUxF4ppU/N/Y2zekBCJ5cvnADveK0tj08jJx4MDUoelMI5w07g0exWKDp8thGYNqFHogw6X6+tg71NKR/vWTRuOowlnPFp7q9uRF05Cse5c3qHWKSKrZTKKKx/eCKtBQ/ajbNg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=hbtWR99X; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::618; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=hbtWR99X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::618; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHBt113zJz2yJL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 17:05:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5CUQ37buBxW7w1IHHgfY9gb2/IqjoauqZgz5qxmao8t2d119VXhh4oAPB3sLg+KJOIolfBP1sssozdGYo0rk5kqoe1eT76r8cuAtl5sQhqhEMAOR4mPe2k7NU6y4UwYZV1UHHvQBIWef8bri4FtmNlxeZ9suhkHYPkTeZ7hQknZjmhem2ZcAPtSo7Lal60TxjUCm+iHAoiql18Rg+RkdVwtZHGv2t1qcKEfEW1HkvWD2B+FikOq02Wyz4rZbxlV7LkZUgNnd5JRIA2XdOpLhBw37QTGZhMiTQ9CFxXnkWMdty4g9udCIYFkLMG/ICBizjMSdtNpyDWhspJ5veEy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jad9yqazVWLzcswUVCuoYq2t+dpwI2Q452FqFEEzgOc=;
 b=TGF54oqcX4fSU1gnrR7SCVYUGfuaNhpCfh4hZiDIqgZpRApvQTkvR664+kokg9NfLhTVxiDmTLyEbzUEZkOFHjSoZ2UWI85sqh/gvxvhxXY3k8siUy3G/7dKFbozYhzBQYWt1l3GMMCUDywv5HiEBjbqn6ZqejCi0ndulfhT9tn9wxlrFysdmMbttX12iFbCfBj/UlcIguF2/1RiQitUQ2fsKOs/Zyr8hs89P0sVUxwHF/0yHNEml3c3LtiRrvYKNSCrRFnuc8xhqv5M3B9p/n1jarQIqOKQr9Lq0SedU6UVDRR0yIRvzaaMHcA2z7CWcPX0hirKV7qbPd18Rz046A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jad9yqazVWLzcswUVCuoYq2t+dpwI2Q452FqFEEzgOc=;
 b=hbtWR99XkQNfRnOgbQFWwZ0PzgsYlNYD/WjqjyIbt3vMZgSNsUH0w7EWLavHSRVkbWPZ/aNna7cFaGRs4LP48yDW5KXsm4TEnK7kH4Y9DLkrpPJuJ5BTlY9g37aXCLPONrqecOgMO5vYb0BwgZJzZnrcSLgEimctN4P7xWXTxEYzje0T5qbvxVtcUvBM1Rd9FvC4zzQEQgMp3ZyUkCAba6N7Z8EMPB6kCoa6MREUCbxhWFjAdNtWh2pc8sjFnTtHCMxpRKSXLIT9Jif6kh8IEC2oBAw+f01Fv8HE83Hp1ihyJAgibcAlIQuxpRw9Pgl7xsZe2yYunS5CH7rpqQRBAw==
Received: from SI1PR02CA0053.apcprd02.prod.outlook.com (2603:1096:4:1f5::8) by
 SI2PR04MB5773.apcprd04.prod.outlook.com (2603:1096:4:1e1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.25; Mon, 30 Sep 2024 07:05:03 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::6) by SI1PR02CA0053.outlook.office365.com
 (2603:1096:4:1f5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Mon, 30 Sep 2024 07:05:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server id 15.20.8026.11 via Frontend Transport; Mon, 30 Sep 2024
 07:05:01 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v1 0/8] Add I2C mux devices for yosemite4
Date: Mon, 30 Sep 2024 15:04:51 +0800
Message-Id: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|SI2PR04MB5773:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ee6bf39e-335c-4434-9935-08dce11e3474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?nNJGMyNqZS6WKrr8jxK+tOQ8hfwXcqCxYXbUwUd0uSz40P4TEp9/eui7hJgD?=
 =?us-ascii?Q?hSG9sjpqH/jnFo1bqgAMcUHW9WwjS6iRFqCMra3+ly1yvnRFWEAJPlxEFl4H?=
 =?us-ascii?Q?P2+TKWJRgm0uh5aWKK9JvS2HNAezZH4rnxs66dkiRmBDJ3ufp3MmTk+tFuKn?=
 =?us-ascii?Q?3gWeyCoyTlyM2ZHxmc5iQnFmwbG8FdH+ExWvsSvfrqaEpBJX8WBdSnQsQr5r?=
 =?us-ascii?Q?jeZiqF2SxKTGZHHSWuXLyatr6m19MUE8roMZOJDFhEKAVtVCKdiFdYUNiI8Q?=
 =?us-ascii?Q?Z8rHO0mG5at7TIl1JQlB/cu4uA2FwmNg3oJYin4Sgx4MRqENbCUMv39qJTG2?=
 =?us-ascii?Q?+o9I77CKrlol3dpvmRZCiOIAC7DpscpdHpsBU/DzEKx8uwuaewWlTi6WabTQ?=
 =?us-ascii?Q?b2AtM/PCjfh3eYpjXZ5ykNzDjagEe0neI1rBWWGau+Uzd5raZ8AEy0nwptxA?=
 =?us-ascii?Q?xYNsldfh2Sbxl5vaoe8DaovGJ5fHzCz/71VYqrYr8D8SHfOz8IzdZ6o4AG2O?=
 =?us-ascii?Q?gIZg2lIk/7usV7byH5oykxGJ/hz6RzeHPF0+rRi80q2stmS4S0x+cCKtuVCR?=
 =?us-ascii?Q?ImGFFDlu4Skwk8aFJ+CnsLe7FVkQPkjkTDlCyluy/8YP9mGIA/ZMgG76w2UL?=
 =?us-ascii?Q?0NYIX3Wf4WZU0KQMkDGYIsS/jrrcknmeHu3YDMNjbkF7TapZP4uYXYbttTYh?=
 =?us-ascii?Q?3tZkBBhUMeiTSq+ZlYkBKbFsuzwfQQuy7sMJ1wW5qn/HuoHWvHrpB8bDxB/w?=
 =?us-ascii?Q?7sfBHcMWILgMub/pehIVbEEBF7Y4XrM2Q6W08jUXMpOItyW72WdCu88kP5MF?=
 =?us-ascii?Q?+6qPHuXETS7YemOwOyxW+tdGi6F9s2vbT7iIQXzT8W4TQrqMqylhUQ4xPhqd?=
 =?us-ascii?Q?alz9EYy+FMPt6os2aEOpoabjbIO0kHsyFMRsbACgLvXiJUuiVihaQhCmB6rT?=
 =?us-ascii?Q?vDz3kqyLa6dCpHOd5mVIFuVLfh3zlMe0L6HrfikuzeAqTd1bMua5Ieqa7oua?=
 =?us-ascii?Q?8UWuPmZ28v9FfgW0ki0wGbWzyyf4XrapcBk/a3993dXD+AhBqOFDGWdl0EXC?=
 =?us-ascii?Q?IrCS4WgNzTloQoU7kg5XYanOi55ngI6nHxuAXrepcZq9LEtYubPZ0wXdG7+d?=
 =?us-ascii?Q?wMExTxQVvkSeAS4ppHftCSrXIkQ0500YuLDoejWSK9eHp88WCUQyhXozc0eB?=
 =?us-ascii?Q?2/iOGk0U+W3YlJKRAH2taxyCr/6jsknsuBqWZ1oh2oO4JqIrX7vQDqW1OW+9?=
 =?us-ascii?Q?r7oMu+75zm9nlatfJCpVy03d0sh6tcgIZuFyvTrcLpTXUrapsoA4kl5wc6MW?=
 =?us-ascii?Q?irKmjvDJHzl+8bqwmz/wat2AKSGZ0Y0csfXw9KvKfjSAUAZwG/tiNcqamvOf?=
 =?us-ascii?Q?3DDWVms5Wh6Bjmav+iOf11LjYJGuD/XOQOOfbgm9pyXzNtlkobxqjUFZcpEJ?=
 =?us-ascii?Q?rbMTezeevaYRjIHv9SU56z6/9ullBluN?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 07:05:01.8686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6bf39e-335c-4434-9935-08dce11e3474
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5773
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

- v1
 - Add i2c-mux for ADC monitor on Spider Board.
 - Revise adc128d818 adc mode on Fan Boards.
 - Change the address of Fan IC on fan boards.
 - Correct the compatible string for max31790.
 - Revise address of i2c-mux for two fan boards.
 - Add i2c-mux for CPLD IOE on Spider Board.
 - Add i2c-mux for four NICs.
 - Add i2c-mux for all Server Board slots.

Ricky CX Wu (8):
  ARM: dts: aspeed: yosemite4: add i2c-mux for all Server Board slots
  ARM: dts: aspeed: yosemite4: Add i2c-mux for four NICs
  ARM: dts: aspeed: yosemite4: Add i2c-mux for CPLD IOE on Spider Board
  ARM: dts: aspeed: yosemite4: Revise address of i2c-mux for two fan
    boards
  ARM: dts: aspeed: yosemite4: correct the compatible string for
    max31790
  ARM: dts: aspeed: yosemite4: Change the address of Fan IC on fan
    boards
  ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Fan Boards
  ARM: dts: aspeed: yosemite4: Add i2c-mux for ADC monitor on Spider
    Board

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 483 +++++++++++++++---
 1 file changed, 422 insertions(+), 61 deletions(-)

-- 
2.25.1

