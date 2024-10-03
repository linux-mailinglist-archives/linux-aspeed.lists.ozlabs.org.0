Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1F98EA9C
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 09:43:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=VeV30Vh2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK3ZQ38ztz2yks
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 17:43:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727941404;
	cv=pass; b=lIKCXyKYQvBQ5cUJ7J55fPs+tlA149sDRZnV2NjCxHdroSlZHIQKddQlyAeP5fPIDHa1QEqRVTcaR5pleWgCDarECzKvMT77+OqVPXVy056HHlqKhZmUSHYtpVThhXM7v0+vjR4h9BSclKbMVQrjIHXn0We29yRtbeoUD3d6sqjRjYShwRZ4e2iO6zyywtxmGoFJTb1QrlvWztthCh2W/0Ivvd/CHVtSW6VlnaQFEByn/LfnEZ5e8DX/osPBrqiKNNUwspFIKQyqBnsHTIXOMBMNlNIlH+mVK8qxvbZZuI7yldEh0+lJ4AZbUlhjFBNJSi2a6zN5J4Idd7v3hw+HJg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727941404; c=relaxed/relaxed;
	bh=F47+lFr35OElbtxQgaskMYGMxuTeq9ED4Q9Z3sufvu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/YqSgjVIVnGAN3AXN6LzYFWNAn8Xnjcjc18w0Y7gFI79DIZ/ULDvUT0BWCfoG5Yy2G7IIiCau7Hb2Epaf15JFYtHIX9mfT5a2nGod/kPVBUGJFS2/ABiOIyAhwJdYGgv/B2xunTafZzvGs1EkVjCbdljbXq+hc9rPT0j68uqkI2p00ZgIAV8UQdYtSBzgSzxWekAQnkteabdLX14a7L4XpdbFliAHPzEEnaHI6k3E52yhz3OdIT7LO9TB4my8ktugHRjOujJ/Aqelo5Foznb4+ya9plnKc3tyIXvKkT3ULlFlhWC5+KJfh9cIkehb7FbsMSA3A8fTXJ5S4hohDlTQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=VeV30Vh2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=VeV30Vh2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK3ZM6sVTz2yVZ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 17:43:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGUDw2k0zx8+l/940bTJcuC4nop6MuyytlRndbOkZTaUxy7zFw2RbAaXvP3H6Tybg9GE4a7j59ZtzcRhlCtsCj41tobHJkmDm8hHYamNNdHoVTcMABvAYDGTGUJnHhtPYoO7dBX895NdOoeR6MdUB8hpQlEXKNwBcwQe+/p1pQuKlNdEjWNMcfXrS95dua6DCxHL8ytVq9oq7vbvz0o/TlOqtsVXSlzGb8vWi9SDPUP7Vr1Hr+XDy2k8IdYB1b+k6T74YaKpoo9FzoAwbjDUenON2a38arKWc1swHo0A/BXlfHAoUedlc8P0ygCIjS+jiL9OmYSEAolTT0bM5sxDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F47+lFr35OElbtxQgaskMYGMxuTeq9ED4Q9Z3sufvu4=;
 b=XsArM+ODnjjbzkJ2wh6cmBkne8Am/sqnVgsNk2/zZVg7LC8iuATFS/pHYERJtruSDaR0uQwOtDhBU6FXTXMkFqUxhKyC7arg+dI3uKoMvsR+AC/JhTArrn6ELx7k9HMP0ncC5/QnfRru6eAOELHbwMfhyeNQ+aVtlR9IMgT1ygjVAE7oLQAZHjJYm9QiZuYuCVlPI/bNI1bPem8AS6X4palS8GaSuOmOv+XyQKhUF69hHxEJ85r0D088/+Zu5mDaZloPXj83HonGxatX2IPZ7gQ3q8KOPPafEIcrJz/asEhD1Ql0fwwio5wZR7w6Z7yP021r6EhTlvKcxyb2LwD1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F47+lFr35OElbtxQgaskMYGMxuTeq9ED4Q9Z3sufvu4=;
 b=VeV30Vh2rxkcZ1q4M5HO2wOkvUeQdqG7xLCywjRJiAhrgmsp2y5chK8M+yQ7ax7ygvCBM8MnDDUdXMIjWXpNiYppbFi3+voUK5mhmbvTJ1i6K4nhqju9aTHQSKWVQiunnkKWM6kx1otdbXVGGtcP7E/LYgVI5UWmvRpxHOOCzYC+KO/EuewcRPjHk2JmWQAZ56w4pym3rncaj2+g7mFqRSRGFRmbMDxVNS0lNAgPbZKar5acOs8M7u6XUIMwqd/PdjVUK4zgozGRgpOvCxtzm9oOJjvbKNhDrIB5SEowz6tAKJjDWL0RXTRXCVsIt+x76GO7ChaI2k3ftW86BdC62Q==
Received: from SI2PR02CA0002.apcprd02.prod.outlook.com (2603:1096:4:194::22)
 by JH0PR04MB8065.apcprd04.prod.outlook.com (2603:1096:990:9a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Thu, 3 Oct
 2024 07:42:56 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::d) by SI2PR02CA0002.outlook.office365.com
 (2603:1096:4:194::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Thu, 3 Oct 2024 07:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Thu, 3 Oct 2024 07:42:55
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v3 1/9] ARM: dts: aspeed: yosemite4: add i2c-mux for all Server Board slots
Date: Thu,  3 Oct 2024 15:42:42 +0800
Message-Id: <20241003074251.3818101-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|JH0PR04MB8065:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b9d09091-1323-4fe7-4d77-08dce37eff2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?hplh5HOR5W62UeCBqhNEBZO60IwI/9LloX4vmIc7xsqnp+77HDwBw+IRzVsJ?=
 =?us-ascii?Q?RJPzQ818O8tBAWr2vnC/wpMQow8rr7twCPfs5QqtBdshNIke9KqOp59hhLE+?=
 =?us-ascii?Q?QfjIFAHqgIKidXo+QxjdIeCjb5mMDra8hgJQm7JTrZbI4cx7uv+XvfZORhz8?=
 =?us-ascii?Q?ImsXP5QUyWclS+aLbBFb8DUjBh+f/g7yOGUqzBkwedFLvbGxZx+2pD0vnePv?=
 =?us-ascii?Q?6UsAD4x4xs8VtdJFOGEVxJtkSspyp4BYmWfw3xSNX+kkSS//1zobeyFhktAh?=
 =?us-ascii?Q?rCD/nnJ4d7rtIRaN48TdtPt1qGZBR12KRQME+H5ktSWXmukYRs95VjMn0JY1?=
 =?us-ascii?Q?6GgXT1BJ4o5ZMeER4LJWS8o5i0QR5pUm61jZi8bRX6qjAhrY7tAH32Ciid1S?=
 =?us-ascii?Q?I+KzDyPQKD5FL89m3h35pkIfS0vi913ZeFLm5craOQvIn2rDxbdyveCP5Mwk?=
 =?us-ascii?Q?c1yG5r1YteaTgVT3lsdNDm9lp0UWezNt5r5s0QyDC/VCpvmJp0GETvrYQCYO?=
 =?us-ascii?Q?jNC16Cx98yybdg6NzHgUVDBRmj5PyDj2SnSlbgvo2cKGzh1fP+dE3anOjvi6?=
 =?us-ascii?Q?XsOljrQfiuQcZq3HW/Jx7RHzRRFjzsuHAvMr49WP189BOEZP2KlnvL+BWR4u?=
 =?us-ascii?Q?vtiDiPAcvmcrSuGg+qMnGMkwTY1Cx35AWKYqdaP46uzXhGtX8BitdAOApMoE?=
 =?us-ascii?Q?20qhIoCKd2MdjIBRlkW4ccGy8L5xPGwNUKTywfWcaZuGolUn04nPby1qezIT?=
 =?us-ascii?Q?dq0oRt7pXVvByCRXWEN0s4YvEJng5RE+0AT4eWXaDfIxLAAfSiwJdeHqByTa?=
 =?us-ascii?Q?I4OAt8hW4JD8ekX20ta3zqio01cAoGBCGCyIowH6JXxBqXETAcNN+za/fsw3?=
 =?us-ascii?Q?FF8ebO4rGpX3nbooNA6Bwl92qt2yl/nwvK6qeww2TYxCbaaokeJ3mtKxoY9K?=
 =?us-ascii?Q?LxYXjA7pejDBvp4aWXTVUWHf7ppR8z0cHQh4fHWrbaJxmPI8w2UMr8OC068h?=
 =?us-ascii?Q?0zwk+cf6aU92JNZG/tpXg+zh6+Qb8Q61rWaQyixMpK0DKR2jy4BQ6FSEgand?=
 =?us-ascii?Q?6GXyReB1/85lnHWfs98vuuw6AOlIIvSXoXjgP6k+JCaLaQwq9DF1S/ivhdCK?=
 =?us-ascii?Q?gbOPrFDoRssO5bFXy68k8quSoR4bwaOoAeyo1iBdGGCy/iBmC0ZzwEzGJ/6V?=
 =?us-ascii?Q?JwWbzEMfg3MuSXh2td4n4KyUcC5IHHyh02/hHL+EgLT3h64pyC+QDBXzMxi7?=
 =?us-ascii?Q?GeqgVmcEIpTJeNXFDNKV9QU/aqCIu0aAspkdv6ywPBS0baCTTcdXJAaNyIyU?=
 =?us-ascii?Q?cPhWL5lVKCkXeJ5tCba/kZcpZkj6l09Xqbsk9JYbMT0yyZf6cxHTBihMWB2Z?=
 =?us-ascii?Q?Bzr3uhs=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 07:42:55.8992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d09091-1323-4fe7-4d77-08dce37eff2b
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8065
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Add i2c mux to 8 slots of server board and add the io expanders and
eeprom for the slots.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 238 +++++++++++++++++-
 1 file changed, 234 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index ae2a2ed603ff..5d623d0355df 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -18,6 +18,14 @@ aliases {
 		serial7 = &uart8;
 		serial8 = &uart9;
 
+		i2c16 = &imux16;
+		i2c17 = &imux17;
+		i2c18 = &imux18;
+		i2c19 = &imux19;
+		i2c20 = &imux20;
+		i2c21 = &imux21;
+		i2c22 = &imux22;
+		i2c23 = &imux23;
 		i2c34 = &imux34;
 		i2c35 = &imux35;
 	};
@@ -517,24 +525,246 @@ power-sensor@40 {
 };
 
 &i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
 	i2c-mux@70 {
 		compatible = "nxp,pca9544";
-		idle-state = <0>;
-		i2c-mux-idle-disconnect;
 		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		imux16: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux17: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux18: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux19: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
 	};
 };
 
 &i2c9 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-frequency = <400000>;
 	i2c-mux@71 {
 		compatible = "nxp,pca9544";
-		idle-state = <0>;
-		i2c-mux-idle-disconnect;
 		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		imux20: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux21: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux22: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux23: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
 	};
 };
 
-- 
2.25.1

