Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD96D98EA99
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 09:43:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SKAuGt85;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK3ZL5T66z2yjN
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 17:43:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::625" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727941400;
	cv=pass; b=QlYySMGjhZNm301SBdUoZflGpLC7pSEZM1UWI4TOys/Rj5T8+Lfsf7pGvjxYxMMU20/hwj5MiSoQx8Qg6jEnbSzEpJQ3ryxjs76EScEnLy9ftqtMM+o5Lw1+zpgg0A8tijya5gAdB5vkpSo7tyAwJOj78LWZ/DrAvrUnHIKCw2W2VXHxEshgzlNmMRKP8iWPT0TkysA28CBUvQoIUn+J9Ked8C0pIkQ2q0xa96bZ1oLok6xlvw59FLYLpkO6vyKiwoyjK9F5lBtQkThshluIqgXFsmtyA/ZVzA/dTQy6yZozDwka6YyKlhSjTegZlMzDIF2XMb/vWBv94i9qZaU3cw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727941400; c=relaxed/relaxed;
	bh=2M1r7OlBlNgE4G5byha6fFDgwQAyaYccrjhKFWHNQF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dwX6lpuVkoir9NMhkm3eAIrTScR2FHIJ4rqXjcVYhn4yTB/ASJV+zb9+jisoS/D1MjG/U7qi4l+ReKIX8zRGrP7KiBK53kevmxFuFOO89C5T97N6CE2dP6S6RqmKd/WNJh806LXAcDmoKRdDEVCeIskb6W+83YPTH2FENxn/lKBJuO4W8oMdHZmp4nX0QRT9Bu3oaliA42CnrLk7BkBO81k34vcc5eprwwxebdEKOqmFTdma9LH2esxywE4cjM29EH4w8CDn4zLrC/2MlzQ1KFyMqJNtGVtJTMwkB69OIWL9Qog02HD54QtpGIhxA+2ZO2Xl0IL63nQmQxgIwj5GlA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SKAuGt85; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::625; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SKAuGt85;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::625; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK3ZH5tNzz2yRZ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 17:43:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkRzD1wCWcEgR5pAU6I2Xk1Loe0TYe5EtXzJS+O2wOUPugj6j3vWu+1kjutgb50kMfSVlpT3luCk7hnf+MhZ9OmlBS3xshRr0npsFLGFeT3PajM7isQXJ566V9UyhEf1UnARkTUiYPE6lMuagtV612/i8jDjdTOiyadwYHadGEpK1togtWMk5qas0MsC+NXqwA1+04IllwoPg2zTja14EwxIaRxqTjYSyisUnG44j5p7UFMoLKW0IJVM0s/NLRvMfgxiXYwPTkdgggQAUwG0zhbUkaaKIxX4iRLIRuvh55N2gEtr0tLke4PzUkeW9ROuXW6dJe0YBBrzoAa+gPFLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M1r7OlBlNgE4G5byha6fFDgwQAyaYccrjhKFWHNQF0=;
 b=Ikl7JlZjQ+A1o2ABqHHT8rfoceliYyP+4rgvreRY753gaZGR0vv4jCnUZCSgO35uLC+rt6b5XnNxTMROGIgZNpINZe3NSe5/AMuw/eN6bg+dARztXRj/rOqrLfvyigS4pculToKylstgNrngGOgPWY6Wrb3hHWxs9EQrfNzFsMCy82vtCzdzRzjpJG8HxLi32d+p0XCnqAMdaDHSW53lcFImWwMlvPrvhh86xg0I1yq5PMUfamD+PvurlMxmzAoumop1b/ML9B4Jz4vVqmzLQhx6nf4T+o+VJBwjj2qAJ0W2rMoSjLw4xNFt8wUQmF41QhE/D8woar+Nomhp24C6Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M1r7OlBlNgE4G5byha6fFDgwQAyaYccrjhKFWHNQF0=;
 b=SKAuGt85IzlyvailH/3M7nphxERsXBr5NfaqZfHgqqkArGnct2CCLwbUO/jzpPJctNlZGE30IiyYReMXrEVp+kCD9WKmkO3dMQ3lTd0dQT4o+a6YEVTODRr8KB53v06fqsB4NyN4a6GHG7l5OCMEeu8ifTdAK4F9jFSAWOhi1lZqBTOvLmDsxFJHTWYj9MIG1jXcJ5mM9ByMpJG8gNljp31cYsgNjLbQxzSQk4rVNuMQv8fZb/Dv5bvUKIcQey5UmI8sU5YoYQSYw+54QLj+4FlJoFmpdPI0/gcH3VAUDzYGtElE007DrSoI7TX+SjdhJISOkSiNF3ytPuFyycZ7tQ==
Received: from SI2PR02CA0006.apcprd02.prod.outlook.com (2603:1096:4:194::8) by
 SI2PR04MB5694.apcprd04.prod.outlook.com (2603:1096:4:1a6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.16; Thu, 3 Oct 2024 07:42:59 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::95) by SI2PR02CA0006.outlook.office365.com
 (2603:1096:4:194::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Thu, 3 Oct 2024 07:42:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Thu, 3 Oct 2024 07:42:58
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v3 2/9] ARM: dts: aspeed: yosemite4: Add i2c-mux for four NICs
Date: Thu,  3 Oct 2024 15:42:43 +0800
Message-Id: <20241003074251.3818101-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241003074251.3818101-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|SI2PR04MB5694:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 680ec723-3c7f-4f4c-efb3-08dce37f0090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?L6qB+HxneqzTgRgl29g2WRJy6UI+WErBoGsvbMBjMX99dxXV6Eap9TyWPJDS?=
 =?us-ascii?Q?sazGGNred326DVCctalaDft9O+diH94I4usJrJCPCn7H0Oqp9tMhrtZIshCZ?=
 =?us-ascii?Q?IJti61EV41krZTdy4Yq04S10pRw02ZFsJTDl5Mfwb16Cfam7GiFijg83sQVw?=
 =?us-ascii?Q?K2I6pn2xhKqLmZvFqlEPf3OIDNk5QgQOuVp+A7eLYOe1gOGd5UEdM9h2zzNd?=
 =?us-ascii?Q?iXj70XmYkD9XYvQhX6VZ9z1fIatDj8KZLjgmj2gAXRiVjj+3Aap3LvPInoz5?=
 =?us-ascii?Q?pxR/9r4b7I7H7/KnUkKkQNmnpg/jfwguinQfwlAyaachcx+ZCzhmPEJwNyoL?=
 =?us-ascii?Q?fht02L2dZEZH1E+c88MxDOvq6XWPeGJeDUKWBZ9WWiMNock0ZPMbo8WQnVuq?=
 =?us-ascii?Q?jGKbcJfThBljA3tNOi2KUwU7C/z3PcCbWeLpU+yNYE71tAId6p1L3lUtrh8J?=
 =?us-ascii?Q?9hvO1fWiZFdw/JRy3kExAXJ5BeKrGaRkcTu8KYvetT4B5dZXsiYJpS4V1aw/?=
 =?us-ascii?Q?KNkJBPDQriF3OEj4Es/8YI+rjuXaJBsDB8cBk7SwRaeA4J3RdCNVsmQ9avL4?=
 =?us-ascii?Q?Mr6HiMMB2orofwsXQ6nVvrNA/MY44t6xDJ6chzFPlkTUGccLugDMkKoad5g6?=
 =?us-ascii?Q?Vy+WSqufIrGIwmiOjpYmO2xGmLBhIfABUyigc5XBmE8t8BbJLFmruQuAru6a?=
 =?us-ascii?Q?0zZZyniC876SuuS/NpfQ21XYrFvC/b+lubG5yMoN6Ei0pdeUCT9ysHIFRlGe?=
 =?us-ascii?Q?dhsVUva3C5Jyhh7v4ucw0X0OGl4phBWH1Q9dGjaW+tvUuWTWDDoPl1L0vo3s?=
 =?us-ascii?Q?v/Wqmx8hV5fTKQEG/iexschfg6rpjUWVNvB6HTxw7nnHuS1ja/FISD7loC1m?=
 =?us-ascii?Q?K7B8ehAhA71K6h+IfkPKULVMxFE1u3Y/W1ubb03dhKL6qWKjt94Dsrjs5KAZ?=
 =?us-ascii?Q?mYmi88+52WMHjdew1qP3+WLBclz/xXDGBwU1tQwe1Dz7Hs1uWlBiax/Oq+0V?=
 =?us-ascii?Q?8fAoaTDKWzh7NxJStGqYVoeS4R16YTIAmSyWXtZlbFBs1m3O+h4PWngtFFpR?=
 =?us-ascii?Q?/1CdmdPjexSzJxAnM/gRFEH8HACQoBSd5dPnqICUIyXXHV13XeKobD86ng+j?=
 =?us-ascii?Q?cmmskrq1pDjCUYMQU4Psc0MBiKpW6NW3JTdg0+HWd/QLuCw7MZEuH8kA08CI?=
 =?us-ascii?Q?sFzNkn+qIQJvI4JyKMnBrQgmD13HnKsvnvo0s9hn/Pvn4puvYqCUSZi9q061?=
 =?us-ascii?Q?GytqfXTv/45pOmOfTOxW/96Nfg1L+1SdC4lbXB+rbaBw1hxVOeNKzrj1DPfi?=
 =?us-ascii?Q?+UQ2lcecAUzMdl3KqFfYbTfS5oZZshiEFVtn/o/1VgT0BO9t+m0thYc0sqp7?=
 =?us-ascii?Q?j57ak/V/SkeKExGFbkW7Yc0SdUui?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 07:42:58.2430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 680ec723-3c7f-4f4c-efb3-08dce37f0090
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5694
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

Add i2c-mux on Spider board for four NICs and add the temperature sensor
and EEPROM for the NICs.

Also remove the mctp-controller property on I2C bus 15 because we need
to add the property on the I2C mux to each NIC so that the MCTP driver
will ensure that each port is configured properly before communicating
with the NICs.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 75 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 5d623d0355df..fc8af704fe20 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -26,6 +26,10 @@ aliases {
 		i2c21 = &imux21;
 		i2c22 = &imux22;
 		i2c23 = &imux23;
+		i2c24 = &imux24;
+		i2c25 = &imux25;
+		i2c26 = &imux26;
+		i2c27 = &imux27;
 		i2c34 = &imux34;
 		i2c35 = &imux35;
 	};
@@ -1168,8 +1172,9 @@ adc@35 {
 };
 
 &i2c15 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
-	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
 
@@ -1180,9 +1185,73 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		idle-state = <0>;
-		i2c-mux-idle-disconnect;
 		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imux24: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mctp-controller;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux25: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mctp-controller;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux26: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mctp-controller;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux27: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mctp-controller;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
 	};
 };
 
-- 
2.25.1

