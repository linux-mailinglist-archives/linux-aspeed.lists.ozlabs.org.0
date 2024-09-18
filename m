Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EBA97BA6B
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 11:55:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7vCV1VqYz2yXd
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 19:55:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::623" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726653316;
	cv=pass; b=ZV1lgFR/nk2RvFkzRunFVEaonx3uF7mUZghZS0wYCbIp8pNUDQNT0YCO95yBhHWxvNg+5cWT0d8QKgAqTGEuQUCaj+2RSMeFLT6ZTfu22bme2+VPq8K+HOprR5XEsvMyeHpyKjz01/cGi25vCX8j65tkXqdfJXQSUeTUYngUWEbGXN7D2/YqvU4/ffHAVMbJ0Zax+UjJDvMvRHZ9mrxvPURlGAJHAzfu6FSVhiOZlp5WK2UCredn6zmKdQ7MAyqQR7WO9/U3nTZiPHCLdTsYxLiDkSVAvLt8LIYmeE2kCFfdSvtdXaFxYd22G4sx1OaAWIq2zV8fsjcbacwfPzTk/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726653316; c=relaxed/relaxed;
	bh=82UjMnDviUCfoXJpruXdvSFIJEpdlnWeojGSnk0G3CI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQ1V2BWJsGrvOaitUqydAWGQgEYcgILnYQuiNBeUllM2UXXl9KvWmeZpDnUbe3UWn0FOxhx4O2hc3OjqwIvwOeSjtlY0a2ZfM1xHw9Qt35AGKr/82oOYFoDJN5viXSR6b3M/aFZajfC7yAbPK9J4qxIKEUenmlBZhPUwQzIxMqjuoqpc6KNWRdylwH68IfsAxYUKCvgvzQVBLoQN2lCYZE7CMtYimCK5LO4N04n5SkhPHIhkYGueTyOF9eWeVWvxd9gsvVAA9bfC0nzlS8wQDIa9QzdbM4xGvJ2jf3Igce9W/SBmJGouEBmLZSzzxE3aXvAv2paHfDCdbr+q0/M3MA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=NVx/Be0j; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::623; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=NVx/Be0j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::623; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7vCS02Xzz2y92
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 19:55:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoShRBzApfqe6hvPlsSp7J49HBHHkD2tyVRqtwR+oOEumBkLXvkrh1CofDK2Rjcs0BDcZhofMfb54uzy2mzX7uZ7bgUo3v/pmyl2g6gi/mb3b8TPfzki/4mUZasPR50YpuhE8tqdhWym6Sdphg6T99ZiTSALsrX0DAIrapZvA1XFXnZtuvxYuxrArTZUHKmBgvX/LdY1fxr3K31VuvjJy1vDtdXAlPOm6lXFnr9B3PWBCpvWjKoL2YHyvRLj3oMwp5XJBBAe9USaWjWIkWg4zwHNyJkG4e9QQdy9uh2QWCjJarPzvbt0rTxrejkMca3/D5DlOmtEMXy5Tz/xxT+0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82UjMnDviUCfoXJpruXdvSFIJEpdlnWeojGSnk0G3CI=;
 b=sVIftR+mVjKQwdgTGylNGnpLnpNJGAOTJIIS3c8RWCXi+pqpm7rlkAoNU5ZB1a7N3kYX9W4c/0FMT4z7DrvU2loTOkVdDeWYF3KWAhPCV5PlFyqivDCXnJBY9+KkC4GVJNJbCEI7RI/e6dTq/xCDF88WixGYSRhKjO+LieJS2AQhC+b/Die5AvcaeaZr40OVJmP834T7Xmzwo9fLys086yGGKqgFmf0NlpH0KGpGh9KiYxSE83NRGP4wJByQDPx7t8un8PJSqi+bPFtfKPHmLtFpM0x14YXTk8tHLROg18yhLiNgXB/2v16ggOMbsXbMJJvywPO6IhH6auJItw3iig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82UjMnDviUCfoXJpruXdvSFIJEpdlnWeojGSnk0G3CI=;
 b=NVx/Be0jCVjU2EJ3DlppFWKvQiHb3LAbi66f3E3ScF3r/TSQ87wG1pqqbeEe77GYhZXRNNpdIshc/wDFFlGfDJc3rFLf3/8NCx3oeFLzHOjXNC4Gniz7nrC0zj8lZOtlAkQiIdZ5Lhk3D0jeSJkGmvjruSoh+SYn4GUiz9pF9b/i5nAw+bYjm+2cGXi6QZU5XWEjjKB9awd9lUuVUPXiTTzI5G0cfW4xE0ApKmTSzceDLGV6NrF6StEGA922Ii4DNl1IFaitWxpNegpPIltbFeWjWHHSIIqAE8U354wQGuI4PEnVUK7lSWRcmNBtIMOWdiUALXSugT2INE/O6g6iMQ==
Received: from SG2PR01CA0115.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::19) by TYZPR04MB5608.apcprd04.prod.outlook.com
 (2603:1096:400:1cc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 09:54:55 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:40:cafe::14) by SG2PR01CA0115.outlook.office365.com
 (2603:1096:4:40::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 09:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024
 09:54:54 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 3/3] ARM: dts: aspeed: yosemite4: Add power module and ADC on Medusa Board
Date: Wed, 18 Sep 2024 17:54:36 +0800
Message-Id: <20240918095438.1345886-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|TYZPR04MB5608:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6c87104-e1bd-43a7-a5e0-08dcd7c7f2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|32650700017|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?riBDxNBfuY6P+HW0MJCzSZvDWwb2yoUQH5AJV3+HnJkUg5Qp2NQEoybUn+1m?=
 =?us-ascii?Q?84gPcrXLxUQHOc/A84ZHO4ff7Tb6hlNCNL2NOImUFbQHlTg2OMONTikPUqZA?=
 =?us-ascii?Q?/MW0XIxCaxuuwW/Yxh/YRRfFL5KZjr9vLX3239zXTEeky2lYXepi4PC2T1at?=
 =?us-ascii?Q?/vL7rNcZycvY5pCq+F2z0KcyGgFk6nMZRnxOrxuddPXKY5m+0Azo5qqIW9lV?=
 =?us-ascii?Q?9ugKtwtEgC6ynuD0Xdonvvq1WoMJvpAkfTa/ShDWO65lKS6mdonthDvA0gi9?=
 =?us-ascii?Q?d8fwSgR01X8IRqD3tqeDwCSLsCCpACErK1kz/9tus8gx24UVUCuv9moYRuHo?=
 =?us-ascii?Q?UwB8M7meU2KrfZ6zZyWwD+9r4e6KL3O53oIt6V5Z1118mbeuNGv9LvWJwgxl?=
 =?us-ascii?Q?gkjIQ4+9R0nPItWmzeVVntfL6dYlBmTJZLlsAMt2HDyT69pUxa6Eob18bM2b?=
 =?us-ascii?Q?hqicHw1c8vw6u8866q6NRAzw9OyLbr9VriiO6JuRw9890N20aW6/nCu3aE//?=
 =?us-ascii?Q?ZCctluYOeMopEaMZbWz2jj+3SZIhnOk7aSZAH2XsfLTPCmurNhdqtCk/utD4?=
 =?us-ascii?Q?EzqduVFFS+ir6bdnZf67PRiKTu7LQ8xCQOaWi7ZenqIIlcGZChA8hiUK+rr+?=
 =?us-ascii?Q?iA0ZjLJpdj3No+xpo94ghEYAsylgo3d08H2Tt22ZT9UPfmaSbn3gYCdCNZSd?=
 =?us-ascii?Q?eV/g4lbYYUBeNIXLwNYauMp6OlFWsWCMzRlyYD/8tDdsmF/ZURdBdVP7V0tD?=
 =?us-ascii?Q?KFF08pwYovURm861ztxvHe+WYhWleI0YKrUVox4PcwoHRqeXJQCT5tQXhphz?=
 =?us-ascii?Q?g87G1BrfI7gkev5fpw7ygV9G6Mt7MLu01bSDdHGakEvowrPFznhIj/opWUyY?=
 =?us-ascii?Q?ChyNC/qvj+UCKUnOQ1qL6+inUg33ugVHEZGnTqfqthJpa3IggsuSFuB1t7+J?=
 =?us-ascii?Q?1ZTvGbsBFmBU/t/t/7L+FS21rst+zxfJhyUiPeHzg8q2/zIFEsHEK3J5WpBZ?=
 =?us-ascii?Q?SKj7OR0c777sSk4O4QHFHpQoqSBT5y8GgyV7UPxNGVdLQO2nlJ1KcRRxkHh1?=
 =?us-ascii?Q?/5z18JiJM9dPvDUNigvk+MUSj88X2PMatAIjq1GVOmmjvP45TfE1eV2FN7Nh?=
 =?us-ascii?Q?7PvpxybWQS1kAHYq9iMsX3kQn7OhFsaiF0C/qmLOujKZlHKX3dmA2O9oaaj+?=
 =?us-ascii?Q?LrWaNxQIK1Yqo09FNJ3QRhngr3eofGYhJkxmZsSruviJEu/Dg5XKSHvsU6xI?=
 =?us-ascii?Q?lbSwY1D5RtgOA0TSET+6C1DH053qQ5UrUOOZguelLaWSPbgZ/LRyRZaJ5MWk?=
 =?us-ascii?Q?LhcJjPMN4JVybPjfKcdOCtoUDai1ocb/ULdq0UmAx9MW0Q4NhKmM8UjHqMSZ?=
 =?us-ascii?Q?MqhZ6qDmCYb7lOjjfYyqyUxfQiEUeCr0UGtyIKlAVCr067Qk/7xbNrkLxkYP?=
 =?us-ascii?Q?Fz5luEZDo3keq+ZA06VZ3JUWr6cl6jF7?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(32650700017)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 09:54:54.3262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c87104-e1bd-43a7-a5e0-08dcd7c7f2e1
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5608
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Peter Yin <peteryin.openbmc@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Noah Wang <noahwang.wang@outlook.com>, Lukas Wunner <lukas@wunner.de>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Guenter Roeck <linux@roeck-us.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Add RTQ6056 as 2nd source ADC sensor on Medusa Board.
Add power sensors on Medusa board:
- Add XDP710 as 2nd source HSC to monitor P48V PSU power.
- Add MP5023 as P12V efuse (Driver exists but un-documented).
- Add PMBUS sensors as P12V Delta Module.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..e486b9d78f61 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -284,15 +284,25 @@ &i2c10 {
 &i2c11 {
 	status = "okay";
 	power-sensor@10 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x10>;
 	};
 
+	power-sensor@11 {
+		compatible = "infineon,xdp710";
+		reg = <0x11>;
+	};
+
 	power-sensor@12 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x12>;
 	};
 
+	power-sensor@13 {
+		compatible = "infineon,xdp710";
+		reg = <0x13>;
+	};
+
 	gpio@20 {
 		compatible = "nxp,pca9555";
 		reg = <0x20>;
@@ -321,6 +331,17 @@ gpio@23 {
 		#gpio-cells = <2>;
 	};
 
+	power-sensor@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	adc@41 {
+		compatible = "richtek,rtq6056";
+		reg = <0x41>;
+		#io-channel-cells = <1>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
@@ -345,6 +366,26 @@ eeprom@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
 	};
+
+	power-sensor@62 {
+		compatible = "pmbus";
+		reg = <0x62>;
+	};
+
+	power-sensor@64 {
+		compatible = "pmbus";
+		reg = <0x64>;
+	};
+
+	power-sensor@65 {
+		compatible = "pmbus";
+		reg = <0x65>;
+	};
+
+	power-sensor@68 {
+		compatible = "pmbus";
+		reg = <0x68>;
+	};
 };
 
 &i2c12 {
-- 
2.25.1

