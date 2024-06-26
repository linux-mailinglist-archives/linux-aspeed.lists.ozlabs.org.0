Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94024917BCC
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:08:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jQkG7QNX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8G8X0CjRz3cT1
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:08:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jQkG7QNX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::609; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G8J54sGz30VJ
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:08:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=It/51S2Mz1bW0c7IAMwvVH4ULKRm606DLq1ckLsHW5lx2nwYKHLoPzi/fFreReB2auKRLRRCv/WkEVfHpKVRM3OlLd1CLNBTZVKMExSPJUaSdJT1SMWA5bP+raYZxsEUBJKULBx2DXv+K9Ttu58jMo/O4CMurTOBaagrFSB+DkJzdxTNzto8uhpRd6ZDtga39uHEbsSBZBxhOaAKD+HkJLIcdaJcEcrgz7h0rtY/lxJmVxOLoDK0fPiPd5Jcqle3/MTsyok/XCBwAkWt3L4/k4e/FEQ7NCo60QPW5i8R5PyVUfXrdgfG6Ln+GYmwga6WCJF4/OjO0OcK0OUea5M+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+DlfI1otun1CAydzoG/8ZXnTLi77JYQ8A3Djz4rKnY=;
 b=ebMZv7ttIERIX11r0iBxI8iYbuRMmJlTJiUcCJ2rux28ApVBPJEtEuqE+5rTXN2H2Czp8s2DfuKnItnYfBEFVObvDD2CN0U0XnQukyhWYsjiXtxX5QhO1CGNyr+2atOJ2PKI5EtyHdWMcr/DaqNvDqNe6Sa9AmtVOftgBkx6S0WCwsgHIx6toDtWhF+RV8/Syic0pqhjKAw1Lja2D+wEoS7wFUgl8fDnLKpiDktmvNi+cvIkXDTryFjx29o2j1KK1nhj5GybzMPh/QeYozFM7ja/CT8UbuewmZcY66qJN4PAYKRcQmFudlW4OcSi8arP+UQe4F8BxPTPMuf1ICr9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+DlfI1otun1CAydzoG/8ZXnTLi77JYQ8A3Djz4rKnY=;
 b=jQkG7QNXWh0L1JYcPdeul4xt1Xzsm5K20ixFVIHGiC1L4PnKGkSj3D7zRcvFzCs2p8rsCnCY8Ut7IEgpvEmlNHexRzcIVWVR3jfxqUoK3Kyyw69IdJcQXcSIjohNvOV+CNkED7yAmstbZvBH6UwI+0khLK/TW964BWk5oLWGaKsx3acwpLsiqOSEh1LI+IPXiWJwHsxWVmU0ywhzOT4sGvmYx6j7Z/DH+iMPYiWPszesnmzyZFSbiuSuf4POxJF6M7o4CkfoWIyafcQjDk7JzXkpSAIJlJ8Ao7VswkoieB7AltgawQ61gqUZ1RKCDsKglOlRR/jXOVg6g/+TUP2DNg==
Received: from KL1PR02CA0004.apcprd02.prod.outlook.com (2603:1096:820:c::9) by
 JH0PR04MB8105.apcprd04.prod.outlook.com (2603:1096:990:a4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.25; Wed, 26 Jun 2024 09:08:15 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::d2) by KL1PR02CA0004.outlook.office365.com
 (2603:1096:820:c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Wed, 26 Jun 2024 09:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:08:14
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 04/26] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Wed, 26 Jun 2024 17:07:20 +0800
Message-Id: <20240626090744.174351-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|JH0PR04MB8105:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b283cd1-13e3-4e36-d145-08dc95bf831d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?6S9tPCSJ8m4DyQ8Jzvk97sfZz74ZCjkWKcAPFus3S/TnTmnHxDv6X5/cBGuk?=
 =?us-ascii?Q?1NLf/8JRtyTMqa9CkRjZlwb6fwrf3iA8K6HTO7cDEYf/XYSn2OTlcq9lG3RZ?=
 =?us-ascii?Q?EbqEtV9oyrsxyzWhRw+jyLoSlAdxC+Bs0DgUi0okp9Y2FLwx+KUhvAbf8MTS?=
 =?us-ascii?Q?/74yuz8GLtw4Ylc+41JgvpEOffy0sfV5XJBhYq7BB/fLL1Et8qCqtXZYZHdk?=
 =?us-ascii?Q?HrVLZ64xyIqa2Pr64ZYZkEY8vaMiFvlER8ouI+AxUrOaQSxSOqUp9F9KmdMp?=
 =?us-ascii?Q?WbRbFJtRXeFdwTNe3JJ4y91/ub+Tie6sdL5JlrBPpdXSKWwLr1LCQ0LcaTaV?=
 =?us-ascii?Q?FQJ+inOs1ZFV0hYin9qpgNp+7RPFbPar7sl2teSZLQL209tP+xCc+/Rqm3Z6?=
 =?us-ascii?Q?JZ1wlboRGnU6dKirwSWTqbNOEW9WkSP7ha4+ik2mDvEECqyoFQpaMFgeETKs?=
 =?us-ascii?Q?73z2curdGZJlKUgLVM8ewjQGCdy36tEOHHZFZRkK6oQqUYP9D0Vbc2OfNBo6?=
 =?us-ascii?Q?L6AUpdfqKtgxIiuWojG8Jp7lPGKOrHwCH58osqcOQ0DlXg3zOrNLNk99cAJ9?=
 =?us-ascii?Q?86deZNMydHFt3CyVJZm8weIrzooT+dPmh5Yw5HR6Kdkp6A4AxCyl3Sm51vcZ?=
 =?us-ascii?Q?XoU1WaWvvGGeACki3DHNetd844YHhz8JBlM1SYA/mDhfP0HLc0w4RCZ0cJhg?=
 =?us-ascii?Q?Smewq/pigundVT/pe/eutCOIPd2cnWcuHI9Cx8CD4XxfsrQ9k98vstwICsTK?=
 =?us-ascii?Q?7imVjaicw5lIjHlWBrGOcDCJzEEOj4efPusNuxFLiMx+QmQv7JybOhBtk6mw?=
 =?us-ascii?Q?IPfvtoE/trGxNqXiqg+BVhaGFLFkGat/WySvGt/dQd33fWLHZOEMcz8cySI/?=
 =?us-ascii?Q?oQ28RXcSE4heDVhnVvPeinmuLsCcjvDYUShYAvQYMjlsRI2ABph/DwTuAk9g?=
 =?us-ascii?Q?Ju6IWeDaGzEAlG7jK91ReEzyWAqmzVkDaFRUbMhYqXIBVQI+wCbb4zo7r/x2?=
 =?us-ascii?Q?LHz5zh5bS/+JNuu6udB6UEOBZJo4+7G3MsUikkEngwh2eUhL5sNy3W3LXnxv?=
 =?us-ascii?Q?HYf6oUnBfGDci34auR4wdnJx4PwHh9YAvrHhdxJOyLNTp1j+IKJdZDSA8ftC?=
 =?us-ascii?Q?aSByiwdM086BaRNo7uCdQSiB4+Un+wiQagzhRWgnXkK30s4gHnuELlcf4tNJ?=
 =?us-ascii?Q?ZrI31nPtzWyc/tTQ9zO71tOWxIle2XJzDPnaPmC1oA/LbkjCjLLFye0eMpaD?=
 =?us-ascii?Q?E5KWbOAGnFusv4PLn2428zTvxQPwG4kAGcOEyaoNS+okHmg7tbgjFeXE7pHg?=
 =?us-ascii?Q?CuygzS1hd8TGQAyAGi9r528WmoVj+PHPaXUxyvE86YT9A6RkbCK6Cl6B3V48?=
 =?us-ascii?Q?mwGHs7N91glALGsLMkVKZSRKNwEjjZAxKW7tOxkGWZYXDPlaooYBBH9wFbv4?=
 =?us-ascii?Q?0sizTv4ngyulJIHpnrknmHumy0HTjHVP?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:08:14.8641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b283cd1-13e3-4e36-d145-08dc95bf831d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8105
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

