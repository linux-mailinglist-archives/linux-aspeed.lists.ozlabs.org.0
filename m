Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297C80BF6F
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 03:51:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=GsktXv2G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpR8N5mvfz30gJ
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 13:51:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=GsktXv2G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::616; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpR7t3ZRVz3bwR
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 13:50:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEpoQX2Pntv35E1b98/m9yKXJARZZ8iDLeKqq21g4nl8oFfyEdjRl2qJV5LuqcG1WsSageFiPobNnWB8QH/WbMf3AR+mLwUivXkgWhnR6KvbasfeCSU0nMFgoGbpLG8tvyr4J4XBFG18kz58v2iVMlVpcJH+LUF6u/rWaNqzZ9/N04ucch88xRjrE9SGNcbcGiWEM6STYfnL9duGaZ7Ar27H309ry9qo8Rdhfw/6QFsCA5+r+fmZh/wH57o+1Tqh4Kx4u6BG6MYMDmhWSMYJXtI96ek47W1AsXonQKVIUnhyX3n8czP6EwPwy4CdXzLEcNci9Ah4MoL752/GEgIbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGTire1khymAurDE24N2Ga1RZMcRUKvih7zqhbJUcjI=;
 b=B4X/eRb179iSY8iR6ThjfbyJQZEsqP8s7R+f6T/gkddnvyggL/U2Crl7jEkTx2gnne6pTN8UuA9m7mcJDpfFCdSS0b142h8XYCdFnB/Z3XtMmfZ/Joypy0yokUU73sb+kmEsA2e6zgKt5FV2aohd4gK98GwMX2sb3GWCkQ3rJzALWznXVSg1XlDoHRnYROusnUGi2UbWFaT5O2lNwT1dykXvXUJ6y5Wn6U/hEn4h/vo225pinuR+e8NAy4/sw32H+r/BcuCYGkkd6wUsx719Hopnaiowrh7+PXM7KcPg1apEbDZD3f+HJ8YHWkLx2UfPg+OECwYUxFjO3f189epWDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGTire1khymAurDE24N2Ga1RZMcRUKvih7zqhbJUcjI=;
 b=GsktXv2GQ5NNyCHleHywh+lzM2jjG9V1FAx/YIaRPOm+tu9F20VyZ51ofR2pol4aoyO3UFl4IwxnsX7/gtlscUZvxJL/lf27CC4X1HWPLu5CqwQZGTiUup16DoRJROO4Kzq5XCsznHDuKDwZy5hSkAQHdoNrA3iB98BOzyrG/wapqrd/LkglL7hswVWR+5fQeyqgqF7YzBF1WaLkw+iygCeP9fdo1N5ZoFVbOs9iSdaI68t3TM3wLZ5CfM30Qo8Ar2tVOeqCIMzKMzseDrTjuGjBAydXv+elphxZSiaSpkt5HnQCJ8JcPXwkh2wRUGmry/MVFpFwQXNozNYZ5k0J+A==
Received: from SG2PR02CA0033.apcprd02.prod.outlook.com (2603:1096:3:18::21) by
 SI2PR04MB5871.apcprd04.prod.outlook.com (2603:1096:4:1ea::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 02:50:32 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::c2) by SG2PR02CA0033.outlook.office365.com
 (2603:1096:3:18::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 02:50:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 02:50:32 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 11/14] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Mon, 11 Dec 2023 10:49:42 +0800
Message-Id: <20231211024947.3990898-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SI2PR04MB5871:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f25e8903-79ad-49f2-1313-08dbf9f3f188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5jx6G0sN6Gt26PiasXgBCawpAVsCSZ8b+58NWbd2euuJ/ENPJ+AUdLxFrt5FeHRXfZ6I5jg7jvJ4IcrGo4Urww/xfZDcV/ycRRCq4/yl3r/ugsOUe7l5Wy0gmWv6KTtJ953GZKzkIHT0h7fmVFkdR4mIM7RRB9ZJrfuwsITpG6+mNRc1L8Vt+DieSA5pf+/BqnOf8/ouJNj4eh1Oj0wKd9tbUVH4gn59mOPcLoGco8TxtJiPZKAiiSdsafp5tkzEpi7bbCYp0apiubi5jxSjwjRCr7V9Eigq2FiQ6A4/CBYeNtDTTZZMgojoV8RFFW2br/3xbT0A/VymxZUVSSQNYEMdEeMGHjVXbNHTmWZ5tOCmlHu3q4z6Qew1SUMmMqDYCz20za6FlUbq+qFnKbWtTmxK+jDn7yHJYH+zkYXRbvwWMWZT1srTj5PL97nyhZ8NspzZ9ttGxFAJnp8joNGMIpzDyKUGXYuNkJn1cQesGbpNsDRhapw0SoxMA6ceON3/At03O+uB8zqtA5/EyY6rOCDX/S8dUrXu6jRtMQpO8MsjEiWRGVypiXF3ZJ3cAMDGWIVhUT4VR1iKbnoSAdkvHcyfN1RedPHODZalTwxPO0HPsQ3aWpCKD5v+E+CJLfbPLnCyMIg0vwItk5/o38nw+6B+Z1KRtG1Offk/UF/zM7vVz7aSsxol7XJiq0kNX7QAXHw+Ye5Kbruyo9+3W6HDxA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(346002)(396003)(136003)(39850400004)(230922051799003)(1800799012)(186009)(451199024)(82310400011)(64100799003)(36840700001)(46966006)(6512007)(26005)(336012)(956004)(2616005)(1076003)(6486002)(478600001)(6506007)(6666004)(47076005)(36860700001)(83380400001)(7416002)(2906002)(5660300002)(41300700001)(9316004)(70206006)(70586007)(4326008)(8676002)(8936002)(316002)(110136005)(36736006)(356005)(81166007)(82740400003)(86362001)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 02:50:32.1090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f25e8903-79ad-49f2-1313-08dbf9f3f188
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5871
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

Revise fan tach config for max31790 driver change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 48 +++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index eb3687bfd632..073f27f1e35f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1095,8 +1095,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1108,8 +1118,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
@@ -1145,8 +1165,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1158,8 +1188,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
-- 
2.25.1

