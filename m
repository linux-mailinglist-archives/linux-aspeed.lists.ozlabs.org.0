Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095580BF72
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 03:51:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=uUJInhVm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpR8f6v3fz3bX5
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 13:51:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=uUJInhVm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62d; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpR881nK5z3bcH
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 13:51:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqgwjrBMOvLHlGAVBWBZqlBTXC63khcIlLGtwUJQQs2fYVmPpov4aCATI6MFJWSvnfj/2FJfEo5KiR4R/or+NfdcGyVg7kelpzZah18Nno55h2FTi+wLGnQzHVUbVeEY4QjQJQzx87rUWj8eJQUPYlgsvIug5zjDkCU2e2z29XKpYeTjflmaMM+nJKTGF8B8r47tp5eYEu9GQu+Z4XZz5Ady+nAnPXSrSECihVYo8cxG5gkMSu9MkK2E3l2OtAz3aDY1MKgSVnHNwW9cGQ5GvkRXeH7rrekUCv58q1wDM/y1g4qVdZOYSgnNcMsyaAUn+ZX9F7avJ/8h8zC7g8YVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+6fne1Re0c5iybgDI2KYTmO9rvcCgEvLchvayrRRUg=;
 b=d8qHx15F7E54IXZFmUcFbCLQg/cIDqrNDVFcXTMylbs1kKN59D1pKp+K8O3AVp/FaLoGtsnEfL4ZM2nZzAYddbJaXyVZQGs4mJ7dhCo2n2rJvUc9bMZBhgEdRBtt/IZL3siOB3NT3c+INrNJJB4pGsa08t8e+uFaLWd3UugwnWxLpNhVfRtbQZD2MeD5I2LP27vCpFrb6uQuidBVGyVSJNuCZuXQZtgYmXG9vHJTqFrwikw4mWUjGgDaYJIVNGywDAhBnZIhq53B0LyI3MXpMvGyJOQZjTmiVxkRUCd25JrBJOs+7cCfHYBIf500qNzF+4ArHlppbn4lxEFaEGQzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+6fne1Re0c5iybgDI2KYTmO9rvcCgEvLchvayrRRUg=;
 b=uUJInhVmVW28p6yGOGnXaYShjRRqaIM19OSVhqT6wPA8HmI0Cyo4SqtJp0FzQ7f+sFSsDoDI+qsyGwZYzGugXXhSv6JwcekF4g7BOhMAMJmSF4k7yP4Qg71TCCWK3RHoJ1f/+2EtTVzT6IaDcF30Z2cd6hKlwhY+4VZdAYng/3xnU+3tpzbs4a4WsAPgnrLunfFw5nD0vDJfeDhcx5yx6KMN1U1URVZxXJdZpRWd4dGAYlfB/60J8OFXIsObcfN84YF/Vks+7mANzCBR2DZuzzUGrsbbOP4WzikyM8tV7X1DDfyUSztIJqsrM2RzZ+5K7N+QVrllJIrJ52NSUqlAGQ==
Received: from SG2PR02CA0041.apcprd02.prod.outlook.com (2603:1096:3:18::29) by
 TYUPR04MB6637.apcprd04.prod.outlook.com (2603:1096:400:345::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 02:50:44 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::a2) by SG2PR02CA0041.outlook.office365.com
 (2603:1096:3:18::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 02:50:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 02:50:43 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 14/14] ARM: dts: aspeed: yosemite4: Revise gpio name
Date: Mon, 11 Dec 2023 10:49:45 +0800
Message-Id: <20231211024947.3990898-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TYUPR04MB6637:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 86f8425c-1395-4044-b5e7-08dbf9f3f83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qWLPIfd7LQT79i9aiJ9o2/VL/MibVHQD6pPQP2u8dpyyTablqzEY5jIlf5SB2aQkT6uiIRwNPQBLYMFtfM/qhW8gD2HDpEk3wdlndFLZ9V4q/ISb2bA+GqhUTjly/KLI6LOUuEzwxM/akZpvhGqYOFCCa3kaZXb8iqUMU5ipLrdedKM6HGpnuYM2iDT2vdn3U+qo02xeiV1fuP2H9OgIzF6HFLZSajYt5aEUh5x4O2MCRlnBcUqiFWZrXB4fLU0/O01KTgkbc8hjtFGbTSepAUjzwa3HkU2QXS72W5uZ+Fh473WUtJiMtCD1DVug8M9i+QcnTCbnh394uQNmZjCwAHFWsamitMznbeKjTU+9Dk0ZPHutaJUuzaKMHbC0wapUoGbnBQYRr7iF2RBWy8Y+yHIRh1uTFEDFpjaCNUPQQnFfAYTCzEyIqSy7SymQbjrtgqvvcZqKum1kJ9WJlkBrjS8EPvAQ5ynby79NbWPTHyN4l0XPQHQazjOkc3nwVfSoFrkxTwzAqW2YqOcyuXx23WuvmspdLlfwPUqDMACc6Uc/FJSn6auqiUIwbFNE014EaNqNrPCPqRe3xGihQlbwCnkIL2I1avARQe8neHkyerCo//ZLr+SC7hMIQ+GbtXkTLh3KnR2qWp4rd88/0zHoqeNfuWTQfYBiRbX/4uZ93ItDD7B7EvfXhin7mNcHDd7jUb2c/4FMDYKiCwxXQUpxDQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(376002)(396003)(39850400004)(346002)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(46966006)(36840700001)(41300700001)(5660300002)(7416002)(2906002)(9316004)(6512007)(6506007)(956004)(2616005)(1076003)(36756003)(478600001)(6486002)(36860700001)(47076005)(81166007)(82740400003)(356005)(83380400001)(336012)(40480700001)(26005)(8936002)(8676002)(4326008)(86362001)(110136005)(316002)(36736006)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 02:50:43.3592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f8425c-1395-4044-b5e7-08dbf9f3f83c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6637
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

Revise gpio name for EVT schematic changes

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index fdc33bffd467..8c0ee53c8bee 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1414,7 +1414,7 @@ &pinctrl_gpiu4_default &pinctrl_gpiu5_default
 	/*B0-B7*/       "FLT_HSC_SERVER_SLOT8_N","AC_ON_OFF_BTN_CPLD_SLOT5_N",
 			"PWRGD_SLOT1_STBY","PWRGD_SLOT2_STBY",
 			"PWRGD_SLOT3_STBY","PWRGD_SLOT4_STBY","","",
-	/*C0-C7*/       "PRSNT_NIC3_N","","","","FM_NIC0_WAKE_N",
+	/*C0-C7*/       "","","","","FM_NIC0_WAKE_N",
 			"FM_NIC1_WAKE_N","","RST_PCIE_SLOT2_N",
 	/*D0-D7*/       "","","","","","","","",
 	/*E0-E7*/       "PRSNT_NIC1_N","PRSNT_NIC2_N","","RST_PCIE_SLOT1_N",
@@ -1432,16 +1432,15 @@ &pinctrl_gpiu4_default &pinctrl_gpiu5_default
 	/*K0-K7*/       "","","","","","","","",
 	/*L0-L7*/       "","","","","","","ALT_MEDUSA_P12V_EFUSE_N","",
 	/*M0-M7*/       "EN_NIC0_POWER_BMC_R","EN_NIC1_POWER_BMC_R",
-			"INT_MEDUSA_IOEXP_TEMP_N","FLT_P12V_NIC0_N",
+			"INT_MEDUSA_IOEXP_TEMP_N","PRSNT_NIC3_N",
 			"INT_SMB_BMC_SLOT1_4_BMC_N",
 			"AC_ON_OFF_BTN_CPLD_SLOT6_N","","",
 	/*N0-N7*/       "FLT_HSC_SERVER_SLOT1_N","FLT_HSC_SERVER_SLOT2_N",
 			"FLT_HSC_SERVER_SLOT3_N","FLT_HSC_SERVER_SLOT4_N",
-			"FM_BMC_READY_R2","FLT_P12V_STBY_BMC_N","","",
+			"FM_BMC_READY_R2","RST_SMB_NIC0_R_N","","",
 	/*O0-O7*/       "AC_ON_OFF_BTN_CPLD_SLOT8_N","RST_SMB_NIC1_R_N",
 			"RST_SMB_NIC2_R_N","RST_SMB_NIC3_R_N",
-			"FLT_P3V3_NIC2_N","FLT_P3V3_NIC3_N",
-			"","",
+			"","","","",
 	/*P0-P7*/       "ALT_SMB_BMC_CPLD1_N","'BTN_BMC_R2_N",
 			"EN_P3V_BAT_SCALED_R","PWRGD_P5V_USB_BMC",
 			"FM_BMC_RTCRST_R","RST_USB_HUB_R_N",
@@ -1459,9 +1458,8 @@ &pinctrl_gpiu4_default &pinctrl_gpiu5_default
 			"","ALT_P12V_AUX_N","FAST_PROCHOT_N",
 			"SPI_WP_DISABLE_STATUS_R_N",
 	/*T0-T7*/       "","","","","","","","",
-	/*U0-U7*/       "","","FLT_P3V3_NIC1_N","FLT_P12V_NIC1_N",
-			"FLT_P12V_NIC2_N","FLT_P12V_NIC3_N",
-			"FLT_P3V3_NIC0_N","",
+	/*U0-U7*/       "","","RST_PCIE_SLOT3_N","",
+			"","PRSNT_NIC0_N","",""
 	/*V0-V7*/       "FM_RESBTN_SLOT5_BMC_N","FM_RESBTN_SLOT6_BMC_N",
 			"FM_RESBTN_SLOT7_BMC_N","FM_RESBTN_SLOT8_BMC_N",
 			"","","","",
-- 
2.25.1

