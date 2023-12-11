Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F380C0E1
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 06:48:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mkbTjHRX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpW4p1ckKz3bl6
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 16:48:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=mkbTjHRX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpW4Y5J3kz3bZ6
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 16:48:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neTfNPK3Hua720SAsdmB6y/KEy0C4VKOmgGYu6Oa3/t0+1N+PzmEdx4IPBbOxJPpiH7OSc5KvQFFY7SbvQ7Sq6JnwB3DiSVEk2L6V8JfzDqtc8EsSsKmQORWGlyKLOrdiDY+znkkM8skF9IJ0huwGMkSvPk1pMpTSniHiDCdoTafupoR1tRPlflRQCL3TNdfr1tJeNjeJU/CIihB1gZR1TuBNxpZJnBnkBe2kK/zTan3RVBXBbjo3saSSnRyXsTD/aD7azMzj/+YfzxEWC/OfCKxuh6CLdBofnxZ962jOIN5ML4G5nJF5uT6qALAvgOPM7eZw/Mha/xifidoW59gqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9hJP4cxinrgJgR2dHN8WewCHihh7cN0JE99FmSA1C0=;
 b=BCSLsbeV4IvZ1CfiPQNtH4RB5dYioQUqIoB0I73x99D3cXijGlrxlcAQlWeKpikN3t6fVxG5dGR8hKovh8U3tDBCKiX5RpPsks6Tt7HdPHi1+g13OaxF/3xdIsyqBCgd1/wYCQYmINV7LtXg6wgA8BJKtbGpBQjhiXe/8x/htdKh5Gn4laMqlvIgdMUrCS+U0Y8iEuZ8/IkwaeNk3ugDIZcm0rCMlNDV0wKFogP9JP88UUR+jvR7I5g7W7yoxFreA48HcB9c1+pQ2JnGrN10K5Z8JzCwfbB3VH388PJ8qsvoiTWZvV0ZGGRUNR2EVPhDlvOPJ4HLiyShIc289QIlKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9hJP4cxinrgJgR2dHN8WewCHihh7cN0JE99FmSA1C0=;
 b=mkbTjHRXaXvXfcXyNLMg1U6kNwWp/bD5SYBRVplzjBta2fXsBMlUdI/41lxShyi6EA6Hb6hEDD9MrU+pEk7YE5SJTLJyjrx8I5HMg6v061Q5J67W27HWgEcRmRnJrwKuWXqO+mtAA2Ah5/q78No7hrJOJ8ZWjupTolP+e2ZlNZLnpQtu1GNLm1vLWONJdeIMMxcdZhpxmJCi/dGBYar7qhMkeobzENaA+o9PTivdZ3JbFzLiQPWfxz4yQ4RvfCeY6BNzLzo2FBNnoQlILwbvikuDTzLBedFrl8tZZQ6VtXG9kAqQ3jpNvP3r9lFaktxZIGgeJ+eB/G1cqx6BAI3mRQ==
Received: from SG2PR02CA0065.apcprd02.prod.outlook.com (2603:1096:4:54::29) by
 TY0PR04MB5960.apcprd04.prod.outlook.com (2603:1096:400:219::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.31; Mon, 11 Dec
 2023 05:47:52 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:4:54:cafe::55) by SG2PR02CA0065.outlook.office365.com
 (2603:1096:4:54::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:47:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 05:47:51
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v3 05/14] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Mon, 11 Dec 2023 13:47:20 +0800
Message-Id: <20231211054730.208588-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211054730.208588-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211054730.208588-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|TY0PR04MB5960:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6e5529b0-8dcc-4a7c-2366-08dbfa0cb6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Ta21x0Kq0FAXoFQu4PDQmMh94LcWoR0/kIlv9rvzbTdp6/gYoUH9ucE7ZNVciIvAlz2fdOyXmTQrm9523aXOeviKsDSmmpCyENSvMX0DadmHr3EMfDMXlSMKv8TJBOj8uZLe1usOknstfOkKw7btSG5R9imoZSDonYe70ieH9HErD6Au6CAzcOnPE451dNHCUW4AEzzPpi+tmr4tRE4n5Bp+C5a4ukxv5osH4zA2fbQb0hJvsjBFJjsIyyOhKeC1wP57eOv3uljjSqM1N6PLYCJHYfjCwH2QXl7zmKymfDEP0dV+vlxXwG837tV6J6iSk5DTnab7umHorS+S53BgzHIlRvnmcLyvMri2hQ8kZvhJiLRL7z4QTlpzajDRZpsjqLlyEX1JejuOSWIp3AQ5j8q81Rmj0T6jRHq24PxFVKkMDUjGpYm/15QGLFp3brTQL0Uwi2tKhx4N2lQlBHSOgTrD5bEI757wbpDsDprCtvE6JzDHwnCYdZCsOpOuNCAtuiFaSwsxgswdcRQZ4q5RJDvqndgkE3SiU0KgxVilB+gmhesm/dqiS++ESP5YQVoaSh3fseFXF8bE4hW7YxYcOmuZbWaxb8AT3wMBRBYlPawE7mJ0bwKUZzW4hqH2yeiZxAVNav5KxHcEXNW2b5K8uVlvUs/0zhxde2DkP2rQsUBhAc2F7LEUW4eVW3jzU5veaHcr369yStT7+7+YC0bHiw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(39850400004)(346002)(136003)(376002)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(46966006)(36840700001)(7416002)(6506007)(6512007)(6666004)(2906002)(36736006)(70206006)(356005)(81166007)(86362001)(36756003)(316002)(8936002)(4326008)(8676002)(5660300002)(40480700001)(70586007)(110136005)(6486002)(478600001)(41300700001)(36860700001)(82740400003)(47076005)(26005)(336012)(956004)(1076003)(2616005)(83380400001)(9316004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:47:51.4383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5529b0-8dcc-4a7c-2366-08dbfa0cb6ce
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5960
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
index 0e9095c83a59..7fe80ad271aa 100644
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

