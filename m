Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCB5827F33
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 08:21:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=WJ+ecfaJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8Mn90PWBz3bZN
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 18:21:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=WJ+ecfaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61e; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8Mmk4NXzz30Jy
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Jan 2024 18:21:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asH7b60wNHj6DtXkyDaFsYG4VejE9s2QiBKZ0ArojJXIkXShCaP+FKyMrH5IJraD10w7pZ0tH+Tn8bXTc1T+3Ooh05Knlpq6WHfL3n0iCyuO78jKX/bH/CnzRultXM+lWImKEcIoXxLi+bhydsJVxtSw8Zh81+c1aJmvqoE8xfYScHa6/YuMY+WwVWh9RXz7H896ziEnu/nOzasd4Dms+q+3bA4hOi/ZuslZqmo7aVx6RJtrgsmxSeT/wn8dtcQGAEhkOxtv+7QUVsGRysKKx65ps14/dWfQIiaBn0BtKifZu3MA+oEL5+89IuFHgWVTyZMCY5Jmo0HpvNyhcT+NrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5ns+z/bWZune1KJ9Uhx7h1a0Q+DT0TnpkyUTwFsiqA=;
 b=ZoDoecVHuv7CkhOcyfavttpT6FIg6XnjctL/yXdwhGV/gFzDV4mkOURvKsKRPXHtM5V0UkOOWBRlbqKyLdERhbObZ+MXqPPU1j35TLjGkE//nMnp2OzzzejSvNirY0j0KZxeCeI425sbNskSm0UcbBKePm6CT+7hMdDgmReL21d/yNxU0Z0odOiq5XNWfCLuDc/a3vPHttmTgq8zcRDRJrm7Badl8x7Sck4ksZwv7AM4wTPqKNXQyvv1jr7+RQ+UJyoASpLmBRcTxUcmWebKhBYetklqscSayIq8nDUR0+lz6y4b/XVDhw0YYPmpbFJ7Fe45Yc90QsN2VsN8axNXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5ns+z/bWZune1KJ9Uhx7h1a0Q+DT0TnpkyUTwFsiqA=;
 b=WJ+ecfaJxIq6s1uqyPiv4wF2f0gPuGU4S5cpClQcFiwmqi1AfH6Zt5upMsvTrQcxM7wuBKWwA6g40mYFnLeQfcmyUaBy+z0VI7HehGmUWxvuuzX8lgEWwwjrkcui4YEpuwf/wDU83HP4m7E4m74NujBBO2f223h3s/ADqA/6o9ZDmExmQN1IsMAGQ9ngqk9OffV1kJ1ID+nj3NXSZqjno9Rp09eLtJh9gUubCKaePuVQte8BUqpp1GX6u9WzrL7AQWiSwOzDCbgLFPB7NajqWRbZswCKIoTtgyCznpXzZ57Av9llCZ0cVt2juucPwqQ9mlevwNCTfjdIP+REGV67nA==
Received: from PUZP153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::21)
 by JH0PR04MB7372.apcprd04.prod.outlook.com (2603:1096:990:50::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 07:21:06 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::a7) by PUZP153CA0006.outlook.office365.com
 (2603:1096:301:c2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.8 via Frontend
 Transport; Tue, 9 Jan 2024 07:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7181.13 via Frontend Transport; Tue, 9 Jan 2024 07:21:06
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v4 04/19] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Tue,  9 Jan 2024 15:20:36 +0800
Message-Id: <20240109072053.3980855-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240109072053.3980855-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240109072053.3980855-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|JH0PR04MB7372:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f77c426a-fef4-4dc0-8e32-08dc10e38b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hxnhqCvxlHx5rywOCf5ehGVb+pCAdgPcnhzNzOFAvP1NMIUNPN3XYH0jACtADJrw/1v4/WScQ7J1nikRmg/fPX5mo1TTPoh9Nt1nA2AWy7gjBfgXY3+7f+fr9HfJ4zn4gEdj00OCZnMSmYQYtvCHpGyBkdOWerb9A4QmQhzWHtSf/Vdvw3FypSjKpvBdSqVKwPhJ2LCM3M+0nS7LX3a7SFzYRgjvCF9q4Fp2PVkGv5gf2nZuuKocTX0Yip4mNf67qf+e83aTrDwcEPCAM5/CrBOGqNMA0aYz+RL7FSViXFOlVBK6mbeMTPVf00cOVEokQJKhs87vtJKUVGfpUnruZzXc20u4NqqjNboMdlmJDriTNd6DmD//6FXMxwrOLIOQ8lQLAxz8KRS2y0e1k+voMWRIR5OAAF2w4+tE0fhJ+RZGIpoJnQpC1n7J8tHHcvA9N9S9FN+lj+XHtcxLJnU6PPMer0+7IEzL3hPV5xao7EDMm4oiT2BrviKwdEMdKqe4524i50hPjMcjT31qxEVI7dW4AiCf9hWFQqHUUBWMfp5eJ0vykDiwtrjntNmVT5mgOhXaIsu5JbKT/b2r9QhcZUcOQhXJpfeAnNA/9FSdLC+yx8E/BtZgX6H17qfIOm0vQqzwGyPqzVrzDan1qkmeucvk3zWrVjxe9QNb8OWOiL5c4n1VqiDkaZUpNxwolZqXDI08ovfrnJA+NMH3QLj5dg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(36840700001)(46966006)(336012)(26005)(1076003)(6666004)(6512007)(956004)(2616005)(36860700001)(110136005)(36736006)(82740400003)(9316004)(5660300002)(47076005)(41300700001)(4326008)(4744005)(7416002)(2906002)(478600001)(6506007)(6486002)(8936002)(8676002)(316002)(70586007)(70206006)(86362001)(36756003)(356005)(81166007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:21:06.1946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f77c426a-fef4-4dc0-8e32-08dc10e38b82
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7372
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
index ea8fd3ec0982..f8bfdefbefc6 100644
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

