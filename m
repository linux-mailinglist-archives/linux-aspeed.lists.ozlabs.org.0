Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 942B08CCE03
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:11:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jMGKsx6o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLLM63z4z78l1
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:04:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jMGKsx6o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c401::3; helo=sinpr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from SINPR02CU002.outbound.protection.outlook.com (mail-southeastasiaazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c401::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLL60YNCz3vxW
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:04:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSG4YOM2fJFzO++2XKIaBssFRnd1XRepcob564nXhryA0ofYLhZFX/Y0+yAR63zlRQa85SJfPxKhh1B926UNNHiBPUV/nStGXti5CxBFW+Fqi336mORWcY97O5KE4vcLmPZzow+EgdtZ/Wh8aEZe3//AwpUfWXKIS5vtMyuAOTEbGGE8OgDHzqRu53Nx/UE+dBV5QnoDiUgvF8eEQbs8wu6/AjHPtOmoTk5ky7yGbgXlsiceWFzvJ2PiVKYr7eolKGAHvBlagBSkJJHk+eSadBmzruqUpcMJ0gNRYSi0lstnv/bPNAVvLiBD/7wElfghOlZ9MIFyQRm/z4BBkO8Aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+DlfI1otun1CAydzoG/8ZXnTLi77JYQ8A3Djz4rKnY=;
 b=DuHrnP6NLm3a8RsiEya+hJYMUZmppyubNejUiQCqJDir7c3oxN9/YhJIFrHqHo/Vx4wcP3ZD7NYy4yoQ2dli7a/yJZdqHiAj1oTichkSCpBqcTZhond05mQJgvpy2tPS8xtA9dv4wKA+Aet/Az/hCyv1vXyY5B/jV088IWIG4ze+j0exqIo1qvXvl4TvkGT0uJLypYkLvePwVCbsa5B9RrI2l3hZa1yyoMBP5WISHpiHzN/+qBFWtuCLos7bE97Y5AyIxmRptOhgUBwezDG53RmByZU6U6AmdVi073BQg/S0WJnqkqqNmW4fmZmHgAYm2eV9v74VP8nQ+Hn47z1IVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+DlfI1otun1CAydzoG/8ZXnTLi77JYQ8A3Djz4rKnY=;
 b=jMGKsx6oQ0NurBOFKsSisV0pzeyGwh+iACvNOc6QczjlF/+qta6KI51rYRSfpDrrooHj8pN7G8tazl73BZc0BSCUN+H+yzu27zM/dIdnlRxLxdfHC7pYNQewSbdLEorbjz4Cwbmnd6PH2JMjVVcvyJXP04yQtUGLsv+aUnujOhcrJ5ml4LR/zwERFjtseNfHaPgQ5YkG6JTKwSdqQe4vkFc+yftPWAyTQx0sAwm9mdRp3UsAcQk1japmkMqbCFkmE9t+t/iAcKf+mrxGw0WCuQne/wRaSot7vfe2UQC7+xaBMNiIiUKoG4n43lkUuo1QO6w8DHTUwWzscLofvLtB9A==
Received: from SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20) by
 KL1PR0401MB6225.apcprd04.prod.outlook.com (2603:1096:820:c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.39; Thu, 23 May
 2024 08:04:06 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::1b) by SG2PR04CA0158.outlook.office365.com
 (2603:1096:4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 08:04:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:05 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 04/23] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Thu, 23 May 2024 16:03:09 +0800
Message-Id: <20240523080330.1860074-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|KL1PR0401MB6225:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7f69affd-1b43-4753-70aa-08dc7afeeaf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|36860700004|1800799015|7416005|376005|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?WlFRcyeezYuUZeRExFEYBxkc6dizW3Dr0HJtat9qp1hfwKuCfnnPHLXKJFxo?=
 =?us-ascii?Q?lPQoPV7xcwMVfnEsylSOMUTlbVEHqm1WQoztE2L/R8anE0g2Jdn946/KL3zr?=
 =?us-ascii?Q?e0Gaf6ODX+n9Ofjq0fUaeipZPS8d/MUy3YUZXbOasyKHv842teR785WuQkxi?=
 =?us-ascii?Q?zuQvChsbms5Z20TQc5Ln6pwfdaJHjfkzxEdBudteqQW1FkzZ0uuR21RycgTV?=
 =?us-ascii?Q?d99agyf16zoFRsTQBGQellFi9mNWFQRFr5abNbbaSG1Dk09NyGSmpfq6sIYG?=
 =?us-ascii?Q?MS+tQZSvfyjHmVznYrDYOgVJ7eBGCjFa0YmM2d2EG6MuajgIHvo3gY8rCFf8?=
 =?us-ascii?Q?X83sckC3qTrr6Pc9vQYfWYMTYkbz0oCkoikPBVmEo5dV6QelkdOVPh/CGTQt?=
 =?us-ascii?Q?NJ5H60S85LrvHUyFqDiDqo48nc/uuSn8UFVmgrIQWHR/bUp85wQ+iSmzHiFu?=
 =?us-ascii?Q?3cKQp93Q7N3jvnFcM/iEkYBiHhH1KeeeYlBxB80u8dSiNHAG914MoALgGF9P?=
 =?us-ascii?Q?nsxHbRaqORhlczZTXC9i3JWLJnKcYUN8iSuo3Fb0H9TmMZf5MlP8UV6Nmk1E?=
 =?us-ascii?Q?fShBWKh2a3RVMILUE5bT2c+bvW/9Q5Hr/NHNYtUqjU9s4BPU878AV9ouKyzS?=
 =?us-ascii?Q?Sh10uh2eDwVAkg2YjezsK+ymsUU7pLFsb9GzCd06AQnH6mLvw9RoZkLrO5gn?=
 =?us-ascii?Q?tTiuOIY9oXnv1I1VV2LJaaAkLTTRp2f70DvHc5hLcf2vpWYucC0+4/ELds5E?=
 =?us-ascii?Q?xf6T1JQNZhu1hp7uIA+2OtdS+t6Q5aZsloLlElgKQiEtcOY3aZpASHWDh7w6?=
 =?us-ascii?Q?EYGOGvWMMWjAqUwQHP5BCLlPtyXci14vZE16549e0aB+xL4lOukb71g9PEtB?=
 =?us-ascii?Q?QGJlWfKyF5KY2eyK/NdTSLBpKNNxv9R8n4CNcPDDl4Y3WuFokom9af9H5C7w?=
 =?us-ascii?Q?l0nXaAJmgjZOMURl2gEEZ1E6V3+ehpxcqMFSTB9m5HOogzF1Srxag4aTXTQv?=
 =?us-ascii?Q?NOMumm7HVZIQVr+lD+I599vqxeeJqewh5A7q+SQxkuiSoBf797U0BpTvHOa5?=
 =?us-ascii?Q?omoH4uzdTTHqXdAYRkPUHw0E1vDY4JtUCGBjZ6I/MusDMGJP/Ne+UdXavd5+?=
 =?us-ascii?Q?nvvCWWezxpCx5+neaSoRrATD5sp3Rpi1sUv/M+IE9wm1H2fPJdLlv7MwQh5j?=
 =?us-ascii?Q?MS7P9UfP79yVtYPWW2L1gLh5imHegDxAzxLfylnFArNt3aWaYL2EYrx1EAnp?=
 =?us-ascii?Q?OCqP8Q7ZzsbXIfazszqeTiUii9q3EI8+d3w17yGnnL/4Xl9qkh6oBQ2sFs/r?=
 =?us-ascii?Q?TJHm3M5qsTxp9axkCewhxiOFhQZxQoEjXjaE7+m1fm73qTsbE7vfDlOLY9Dj?=
 =?us-ascii?Q?imyLkfw=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(7416005)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:05.5309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f69affd-1b43-4753-70aa-08dc7afeeaf3
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6225
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

enable watchdog2 setting

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index effc2af636a4..b0643e8aefee 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -120,6 +120,13 @@ &wdt1 {
 	aspeed,ext-pulse-duration = <256>;
 };
 
+&wdt2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst2_default>;
+	aspeed,reset-type = "system";
+};
+
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1

