Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 62CEC8CCF2B
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 11:26:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qVSr7FMf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlN0P6j6Tz78l6
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 19:19:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qVSr7FMf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::601; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlMzx41m2z3vYj
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 19:18:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdYcBMHWL9oGaBvPYqC0BxUwjkapqh7/wLhccuGiUs/k/isxO3DJ0SGYxWxmXQpeJcYfMWrnP+JVDFwtoJEMmZKAx0k/xdcJbcOAAKuiwVhRv8h8q5v1m1+xUZv4kCQ1kLSKyRSOCaO9REjeGb89SUY5Mo8j8JCW6OBPPriH1g5BR18/sy8llSPntLMtvucya9KUIH+eTLQwZXu5RSAALey1gqdYU4pTN/1K86EJ+Ec7hGE3oB9XhdmZ6n1vGrA0N6f0evcPoAYmwzIRC/fUz4+KRh7l3DQMFA8izNy8AzRJ3skXICMSvlGY/OTIi+GfVkX34VQst2DbKkHGi2CYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/dqJuii+ID5NkttuzvqI67JF2qX2ZPzbFRrGdWVquY=;
 b=La2oelQ9r3M6WVSjWyVptS8Xx7E6LGMoDxQCm1psrFiRuxI+01gYWnu30q8mBWdLrWzIjjGLG5zeeA6zDBPd8Up9whXmxqhTmv7ObeMISmc66HFjXjxLXsleGNVI/epOuNaAlLfzI9l+HPsrg+VLmQxP+hyTMC6UNgprM2eyRFMnTaYiUStNH76nPBpjUDQQT53VImiagvhCpJAdP5v2WgHPQoW0sseUSFbNf/o4AgWdKtW0PBrhAY+Wqtpf0ISzoPA7UCUMcONUYDrUrIspvghjZqNCalT7aaR+fgOxHIWHYPOi8jVqq77dH7xogi5Ix7Xw22xImKLtUeXgsj5JDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/dqJuii+ID5NkttuzvqI67JF2qX2ZPzbFRrGdWVquY=;
 b=qVSr7FMfcHA2Vd/1+Gtv4oq7V5BQfRmpe6jUMUHiX95Ni7Q5KxTm+UGGn12Vhy5PhKVeF4cZ2TVHOarx2NhY2H+i05LlR0vd1+h0HoSqf4UEfaccfuIcuhqcXvJZEIluhhoGnq8A0QW7aM20CxBEMeBqocxCpd1Slc6zSqpp0GRWv375KFPW9G3/bU0jdgRIU1WLzQ9W6JmlFIbAzCV5Ue7q2XbyJtFITzcKRre9B0uo/l4z7Z7jrCUGqqTpYG1VYBfxYMZmAkVF60LmEO/fhHZBQNywOF25yoWiMFr78LjY0ek5dWhDKy9Z/Wf5vTv2KYMYscg6CX+0HZcUJDlMVg==
Received: from PS2PR03CA0024.apcprd03.prod.outlook.com (2603:1096:300:5b::36)
 by JH0PR04MB7175.apcprd04.prod.outlook.com (2603:1096:990:3f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Thu, 23 May
 2024 09:18:32 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::91) by PS2PR03CA0024.outlook.office365.com
 (2603:1096:300:5b::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.6 via Frontend
 Transport; Thu, 23 May 2024 09:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 09:18:31
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 05/23] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Thu, 23 May 2024 17:17:52 +0800
Message-Id: <20240523091812.2032933-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|JH0PR04MB7175:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4926de34-7d8d-4d0a-d54e-08dc7b0950c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017|7416005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Wm1FPgvtuXmPAcPsIldGRRKzvN5WLY8lEtuIB9UmvHlFogBmWAnrdURazsJ+?=
 =?us-ascii?Q?lHZFEcduaMdB69aa/loovST1iFQ1muVIt8ewHZKPC3M2Zj00jISBK9Y0+LbH?=
 =?us-ascii?Q?KUNNGaxAVp+WhoKDQ5t96ufC/p8+FHEe6UfeNXKQggTrPAm/wYAyTHzHz2k9?=
 =?us-ascii?Q?OE83W9tlq40klWRyKnoXYntfKwLNtlwhJ4Rz6Za+LIBMhBXxPB41TwQttjnv?=
 =?us-ascii?Q?+E418XVNuonCLSLscw15FXd4iC5+7Os+eV0M2R0mA+p5xWgqak/w/JL0OjWs?=
 =?us-ascii?Q?l0TaziP5igH3ZdOjmuvC075zZi65mgPW9qTzNGgp/zAtmz5Jesl8t4VpLP0T?=
 =?us-ascii?Q?5V0giWuaiWszI40Fa7ZBdLPvckZpGjg2czGgI0Gl4rg50OG7vyaYf5gOPyJf?=
 =?us-ascii?Q?qlma7502GWjzCIBPoyP6zdQ27+9ykfVuGh26HR6PNPW7VEu0Rn1mfSM+yksJ?=
 =?us-ascii?Q?xKQhb6yZkp3C+QzlIpxs+ccL6d2yythBDtQaF03cauwk8tuGnSK/OPLQaOYw?=
 =?us-ascii?Q?XLI1mhFzDd4K24VWUFvMyLDXr/z1Zp8u00FCpJKRiTa2T6A+ALkxvcC47AMc?=
 =?us-ascii?Q?1SRFFNuHv5q4Zf+E3xgdPAy2Xi9Me22nm1hHZuP+uZywFdpdWx83FoGWO0RB?=
 =?us-ascii?Q?zGlLoaoAMSXQvSrg1LwiYuvaciAZvEPThLu0ktMIFPeVnVs0l4y4T46KxKTp?=
 =?us-ascii?Q?xbARBFQaCpCMOHMRe5ewrj2QzLC34ssCaTkaRDfoqp6P69ZsCdt9f8VozQct?=
 =?us-ascii?Q?Gv4Cfp8Q2HA34X9TZDB8ShScCBoWzZQpvEXThFe0XBmitpIDzV6K4yvLiT3k?=
 =?us-ascii?Q?nXs9M9ZrdDQOlaDZQ9EMeMfMeYWp6auV0nz2ht/wRni8Bv1HZlKiquy9UoW5?=
 =?us-ascii?Q?LI5TN5gKvLyv0aZ1cI3LwsxGUjh2OTFrFLU/l4m/A5XeVanx56sCARzDe4Pm?=
 =?us-ascii?Q?hIJNJXyv0nfjWLqck9p5btMXrtPvdke95xHcydIxwErggvvv+AXJDPvl0dwj?=
 =?us-ascii?Q?vAi45JKQSbpKs/B/iulDp9EfDQE6khh5QkCbSxeybPkN631A/gODNfkYm5G4?=
 =?us-ascii?Q?e0DJ1TPdzU3IXOhmXpbnQMITYVHU7lWrhKI2yzudAJ635tw0jwoRSgWQeKIm?=
 =?us-ascii?Q?f4IYY4MrCkQCojrNKLteofyKoSKwk8/g7suab3WIyI8iZllXMcHVtr3N4mYE?=
 =?us-ascii?Q?k6SPuvSXTA+FfHLeN/F4/jkVBbCEtqt6kdfY6TY6FR7C8QHGB8xWbKNa4OO8?=
 =?us-ascii?Q?hOXTz7HKzs8CyEWiDLpSxxZr8J/eJ5XJp9OE90cDVhlijpSFb3iYqyFOgx3R?=
 =?us-ascii?Q?gXCaYEEQJy7Yv24phPo2N4B5eDWwn9GW3m1j+AtfC1/U/gRRDK0ed0yt/+CP?=
 =?us-ascii?Q?WphuSpKPJWKlyGsWhlFTw24AFga2?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 09:18:31.7513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4926de34-7d8d-4d0a-d54e-08dc7b0950c3
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7175
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

Revise quad mode to dual mode to avoid WP pin influnece the SPI

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index b0643e8aefee..a708e56b7ec3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -149,15 +149,17 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

