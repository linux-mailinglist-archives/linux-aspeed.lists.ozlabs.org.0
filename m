Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1842E989AF8
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 09:05:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHBtK0TD6z307K
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 17:05:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727679941;
	cv=pass; b=A61gQnMHQyOtB2pGbMTccgGtTw+SqluylAZFry6sYurci8ubf87aIy1fCv1FC20JvsLxZCgPQqW2r5U9E4Abhubu8taPNLEogLh7Mz0zhieD8iR8cvYhtb5bDI81ivMYX/vkqt803M+i/3Eok12MSt2sOPOwfb/EGlc527J80dTNkiyxq3gfmQHADkbx7YPPjd2SxpdalBiTwZDTVlorcG2YeQFm6GUbNH3FCinDdPJokzGBK4f+RY5tzUnaN3VAg4W6UPHHDqrJyCwa4sj91k9w2w/yc2uETFQtzNy2PeJlrzgfF2MC6gvVk2enJi7+ThoR+rWi9zWCmB2WB6sPdA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727679941; c=relaxed/relaxed;
	bh=QUGE0c6dj/0KvOdqbYZVG4+GhmYitlAvvfCAtm8XrEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YUSVK062sy9DIhagg6qRzEC4x09Qv4U5P8QUUIYYMOxolLKtet76dHREbAuDPDaq+3hdGwEiAa3gZnq42cUm1ARsjOvTaLWi8c+VWc+kHFp6tZrkyeOBgM7/s1j9XAqLAL88Oer4Dt3C8WRcsUqi10LyL5mO9W6tmXLUbuBLxxmrLwbOyzQKkUZo7cHhUEvL6vK6SG9DlyTqZKfigrRnzbhtXVFnRl4TtsP05n1+1iHJbg7PZvBtJXTCRZBwwqftw7MzvikNtEEUZc1sj9GTw00HVxVINao4HauNwAxF+CuBFra2RQx7Om+QQU+jAoEQcB0k/6Mcrm4WBdv0J7GFWA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=syDoFcaG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=syDoFcaG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHBtF4tzDz2yLT
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 17:05:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8CWMCxvRPKIlO87wJoSNyc4ZyGJ3Wo/e+vYWLa3gFhzYG78b/oOqBcADCeRuslOU/xE2SE8GjhC7SPLVnht91+0mh17zb0Q3twkrkCob/Vk7wV0c1JA3J8xAS3SLOwexi3rj8gUYyu3xbbPO/cMGTkndVyZ6HfxwiWtB+kBwk3NqMAwLWQX2Nv0aAaNNkV//TaZ5BxVVb6zqPC+8ByzjNpreyKqxxRabcIWK13JiBOE4gpWZ+Ykj5izeGq+ofSeYYqv31DPIKio2G1UlZ7Bx7O3f+Xa5c1RoO2yt6yPuYxoRll1OSQPgMH+NcgYZOXaURvlIoS78Yc7UluOmS5Jkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUGE0c6dj/0KvOdqbYZVG4+GhmYitlAvvfCAtm8XrEg=;
 b=Whn4vlnLEqUONp9ir2/ZctrRCWAihRqmTLi4pJXdGF0y0hmMR01gQyLbNUcjEGXGKCvjYgJZVJUhZxxLk2rwVGRJMFEHxMjbct6YJ8ORboORF4gtoy0f/iEEXNir7iusnQpssBf+XofRPNWQH/3vTBnJTTSTg0vJqXOcOCr+C1lBaa69VYRg8fz95A2ECBCNidT5zBI3SVtSiRFhPpZ1S/Hp/FklYAxyHwB7KaCgQC0pyAS3xyjcz7C1SYcC6Za3OQzcn5bNRGChZhkKd+8V3UD+I/zYNTD2ktkcq3ps4vHlOwkjlAGEBE1lTRzUVRIYBKzeiBYf1f7cbeZt62oErA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUGE0c6dj/0KvOdqbYZVG4+GhmYitlAvvfCAtm8XrEg=;
 b=syDoFcaGtkZDI7KLXZ6qqOyjq010eAmiyS9Izwd9FzCENwi9Lw/MjmHa/oaxpwo1/6C1KVBBqm1Zd700VCtqZiZqIdm4aVIQa5838O9kp5vRbFIEyvehWS7H5DQ8Ui7mJLC4Xp8VSpUBJA63S2OkpeLhZwSYulmMlQADIBviZQ0ITeWWr0fINS2yMROUr9LDGzg2tb3alT3rNX9gCTAPbt8ODjZgQUOp/nWCzNBydk3F5Vj3yws91y40zmkq8JvT2SfSmoq9OCFRJjDmVpElT3V/qWGh/eEPmqjkorjyysIs6Gu7xMjJq8t0MQxMcYvEF6aVviiFZxCmN+e5kKeoUw==
Received: from SI1PR02CA0058.apcprd02.prod.outlook.com (2603:1096:4:1f5::9) by
 SI2PR04MB6619.apcprd04.prod.outlook.com (2603:1096:4:1fe::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.26; Mon, 30 Sep 2024 07:05:16 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::44) by SI1PR02CA0058.outlook.office365.com
 (2603:1096:4:1f5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Mon, 30 Sep 2024 07:05:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server id 15.20.8026.11 via Frontend Transport; Mon, 30 Sep 2024
 07:05:15 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1 3/8] ARM: dts: aspeed: yosemite4: Add i2c-mux for CPLD IOE on Spider Board
Date: Mon, 30 Sep 2024 15:04:54 +0800
Message-Id: <20240930070500.3174431-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|SI2PR04MB6619:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e88d7ff7-069c-49b3-8732-08dce11e3cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?8zMOeNKK9/82WUPWSEtYdP+UWQ7I4Ya6Xstv+/pOrdIMYsZ3My4N1Lc4rS6W?=
 =?us-ascii?Q?/ZXX/1d6pq+wDMClnMkKsO4fapmUl7ATPLdaHPDbBSuklfi0NvYOn6BQTSFZ?=
 =?us-ascii?Q?Dz22V/e9txVhRboN2mJ0DPm11aa/5gdYXHEcjBoN6et/Xn1+ePf9OJSM4v9b?=
 =?us-ascii?Q?TJqjBDBiE34dkt1cgtUA0yYnSocYEkW9tEjQTK4O9BYPffdGl+/cSj7+ZykH?=
 =?us-ascii?Q?wRB8U9Cu+UIPqu9gzljxV4w09oQOci9lXq4c14lkEFXwAeJKCqd3ir17Quri?=
 =?us-ascii?Q?T6XyHf7Dokq+Hdx35DFvkIfy3qSf9YE1SfBSkPDpF3uKDSHII0ouZkRoeY6a?=
 =?us-ascii?Q?9d0UkkryaZmGry1v7wCqibECTVxQPk89Uix8c196LPL0n8cd76ZatCRY0ZAe?=
 =?us-ascii?Q?6qt3NaQ1NPND306G7SH6eIc3/PrhB9tgPRPfwJp0HJWQ6kmkkhTcwXdT4lKb?=
 =?us-ascii?Q?lmhMsOayORCBpQuctBS3Q4LBHOy1b0+fVvTzb0nXQVq6OWeJztAb0ah+zjND?=
 =?us-ascii?Q?VaR0R/MxkvjJyVF199rnX/qwEUuoyvV3UlZHN25zUY15tNxl0KJ743UZNXY0?=
 =?us-ascii?Q?/DYrb1j2PXgv8g07Ar/sBxa+cE6dmvToICykdYq1TsOm3Bs1KBcCKv+p+w/d?=
 =?us-ascii?Q?+J3gEF/8pSJkvcTkRy04c2MOI8/wjgY3BEYiolveIHrD/dLxBIBXouCxLKeS?=
 =?us-ascii?Q?esXkupEJ9B3L7YTXSgRITuR9F5v92YeSCoQPJoMbHgAxyL1owz04c0ltGwcc?=
 =?us-ascii?Q?dm1Nskz9mHnwXMp1xDYP4AHs1Y4UHgx1lajDNWHUcwnosng4TDdAiDMmsvT+?=
 =?us-ascii?Q?d76U9HesLaCxbVhDlOAptJTiio8C4LZJWTBoIB+/bm3DwL2RaRXqn7pR5cJM?=
 =?us-ascii?Q?XA7EA2ZO9z7FXqkhuYOwK+kSY7DL8CE+g7L7t8JzRf37gIEgNup5lmUuLRmJ?=
 =?us-ascii?Q?Qt788Ic7PGDxVfu53RBacPJZptXAp6+tsKTREE4XoAra+6fskbafhpT7xttc?=
 =?us-ascii?Q?tDOyeKieU+YJZtb9kFwLDddRf+wm4FBnGQL2s4Xn4pOyLGrW5BI6QRFrF9Y/?=
 =?us-ascii?Q?5k3r6J7u2dTT6CFetbp/hzM3dyF5AxaE4t3PPpQBzCKJtD+O9EylG5wAVvKO?=
 =?us-ascii?Q?dnsUVIJvH0cKRh3/A5c5vjNy6Y+BBxQwnzRS92dt9MkSPEeA6xXJsSNuOox9?=
 =?us-ascii?Q?ulAUc3/R8aw3Q3zNkJQHHEWMk1Kq2UO92sLdenyFVREjUOXsYxzx9LQk5aRp?=
 =?us-ascii?Q?Mr1DmS4wu5cQuw9aS8QgNIy8FQlP3O7zA2kHDtB6fkjOmTtrEUcfnM1iyPNO?=
 =?us-ascii?Q?0varp8hDjRDvp1UplF2Qc2ai7+HvlNjVjZ9X039yr+fAT/zssAuxerwJl+y7?=
 =?us-ascii?Q?EQYjv4ICNXvyHZzEQJFD++bIE1F4?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 07:05:15.7436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e88d7ff7-069c-49b3-8732-08dce11e3cbe
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB6619
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Add I2C mux for CPLD IOE on Spider Board.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index b813140b3c5b..26e0fcbed8d2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -30,6 +30,8 @@ aliases {
 		i2c25 = &imux25;
 		i2c26 = &imux26;
 		i2c27 = &imux27;
+		i2c28 = &imux28;
+		i2c29 = &imux29;
 		i2c34 = &imux34;
 		i2c35 = &imux35;
 	};
@@ -773,8 +775,72 @@ eeprom@54 {
 };
 
 &i2c10 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-mux@74 {
+		compatible = "nxp,pca9544";
+		reg = <0x74>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		imux28: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gpio@20 {
+				compatible = "nxp,pca9506";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@21 {
+				compatible = "nxp,pca9506";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@22 {
+				compatible = "nxp,pca9506";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@23 {
+				compatible = "nxp,pca9506";
+				reg = <0x23>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@24 {
+				compatible = "nxp,pca9506";
+				reg = <0x24>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "","","","",
+						  "NIC0_MAIN_PWR_EN",
+						  "NIC1_MAIN_PWR_EN",
+						  "NIC2_MAIN_PWR_EN",
+						  "NIC3_MAIN_PWR_EN",
+						  "","","","","","","","",
+						  "","","","","","","","",
+						  "","","","","","","","";
+			};
+		};
+
+		imux29: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
 };
 
 &i2c11 {
-- 
2.25.1

