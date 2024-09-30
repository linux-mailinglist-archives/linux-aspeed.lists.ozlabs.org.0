Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E1989AF2
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 09:05:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHBt66wWlz2yhr
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 17:05:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::61d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727679933;
	cv=pass; b=Jn+pMUARC5WzBFXJqHo9ZqllmDwU4W0KEtHvBoN5o3UOaKjer5qKPeuDaHgWnQCagcJNleVbsa5ME5lHssRDB7JUAaMvsp59FsNtDVevMf7vCcBjMx+OOzSvhUzVrkVYgc7/aVlnifF1509OpVlbh6TN/POXUwsuZiPgDAMX3t/h36zjQTRaNjC6MfPBdhBaDo10ckjHvRbT2qgSgHy55X6tQzcpBKXNnU4xe3ioypn5zyQnmJELKrkt1u2BMAlGsCL9Smhtr6/7Qr9jOMWDrFmw+oaXTUal37MOAy6DPYDvObUjvIRI8Trfc6+VhMSwCUG9w30mNygLKEPDMo1IvA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727679933; c=relaxed/relaxed;
	bh=G4TnwL8e302OeGu3LMGeH+f4Vbx4ULsswRUWS5OFeNU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kOLgbhYmTawRtGITMqEP2nx5BAVbYrYzClBIRjLhh6Mlow/rXNw+1s7m+TYeOyrbII7B/uJy0E6XC32Sg8cb7tu7KCzcetAOxVfLOhivhMYUntpV20c1uN6WgIl3z/a08je98ITDRf0FiFYqQJP9KiAUSxYK/A4Tm1Nn9JYw3Gr9VXKcfOpN3xk2/1NDQ60xQux9erqbNnN09VUCtsJz3FtjMqggucJmQb8cfo3SPf195bqY2wVkU0jJAC0QHDycSMtL9Zc7r1g5LlRVpLVzHHmXgGPSDPDMqM8UlCwhcNQkbYQ7If3chVkQZDgP0eqfVxNfJfj+oB+DtIw0ovrh2A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=t8usJxHf; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::61d; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=t8usJxHf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61d; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHBt50Cl4z2yJL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 17:05:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7BqMBdP5+tAIquhllM5BntR2VmTTeCfniAyyucTkpXAGojevltuopCIFj7dcG6Sb5Wp/h2MlFEmFAobVmObjYQVlWsg4V9th4yVzHh7MgkaG1kTKVF3LGvLHOuDA9kt0nijJc7AKPBaj83qEzBO6cZuDhniXS64hRDW1PNWRKbDymKtALE9e2Hc4mod8iFoIFqvm5HY/oqk3k23AySB1JpjvaghYip04l9pFEEYlEF59Vg532M8ofvlE5EaVDqEG4ZsBrraa7///7hHWn+dgbBvSxLfHshGGkAZgPl2YHd3Aj2xhuraJ1JH83FwYoBjMoI0470JBB9HFC+d30mzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4TnwL8e302OeGu3LMGeH+f4Vbx4ULsswRUWS5OFeNU=;
 b=gAmJ3gfwr8ia4pjHYsw71GQA+6ESinu2w3eomboo3Zffu+D7IkrvEHoaSM6bOwZ4R13SeJ4hCR4f/J9x9bv4bby8hUDATTCnnaoombVRspItS6uPHV1jMXxlvyNM0TCMFK+3vMVGNm6NnmvIilLkzA5a/cBvs7jsjS9PLCxYjyV5IEDTHFhdHyxQEiPPKktimoo3aBAPngVgvAY9qaDE05TGAexyfP7keXLlax2PBDRXfXid5NpvMnTNscuKqehkfwpasUhL/tFaAdFWzKaLdkmMFRfhObCzU9oegjSk6HScFk9rhbc+Rvr6/Yf4KF0PnbZws9hWxgT+RSpI6L3QtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4TnwL8e302OeGu3LMGeH+f4Vbx4ULsswRUWS5OFeNU=;
 b=t8usJxHfDkGBy9i+sA4pFbJkQGX7Kc3WltTEMIKc/f0QKjDtUTTVHs9eUHk6+XV0P+D8uflt2XHRtO/9/sYFKo5HLJsKRflplUIICRsDcJKveb8x7bzCTIRdVRDkw/l6qt+oKHyne5vqgsWUxG7zNgP828gFpixp+BUFW+Jc/pwI7+7aKrBAK543qPmyoKvdkuFjEIYnj914RjnzM2shfWDKGeYBCxtgdCRJF6nxkQVvDmXs5aySogCeoSl83GQ67laByvYgny+zHiDNBp5c7rYFtfN6u9vkkYUy6z175rVTcYkIAC0WYX28VTNf1qfNoQnh3d6IqtYyjouuF9NVwQ==
Received: from SI1PR02CA0050.apcprd02.prod.outlook.com (2603:1096:4:1f5::12)
 by SEZPR04MB7356.apcprd04.prod.outlook.com (2603:1096:101:1a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Mon, 30 Sep
 2024 07:05:07 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::a1) by SI1PR02CA0050.outlook.office365.com
 (2603:1096:4:1f5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Mon, 30 Sep 2024 07:05:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server id 15.20.8026.11 via Frontend Transport; Mon, 30 Sep 2024
 07:05:05 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1 1/8] ARM: dts: aspeed: yosemite4: add i2c-mux for all Server Board slots
Date: Mon, 30 Sep 2024 15:04:52 +0800
Message-Id: <20240930070500.3174431-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|SEZPR04MB7356:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d8940809-404c-4993-e3c0-08dce11e3685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?tG7o3VmMopb8iWjiqi/2PEZK/rJBgiBtwElDykvhUkGk6kfIzEmpf2wgKDUL?=
 =?us-ascii?Q?kynaVqVfAXxTE3iRiU9FfSUlQ+FL1W1Oxwixx1oc3D7Pv185scQ9arXPlVlH?=
 =?us-ascii?Q?bsxYWt7CeJEEFgEauzmq9S7AEXDsdbnCIef6DAfSP/o2QzGKW1PlM6u9easl?=
 =?us-ascii?Q?ThuA9GcAZhlSEtxba7budiRkZgitn09ZudQ7rn7Qiy+UTzToBp4W95LXN66g?=
 =?us-ascii?Q?YG514Z+riI2nTGvBb/R8NxMVoOTugEFHjIg9fOzu9pDbjDNGTkqFb3xjNLoE?=
 =?us-ascii?Q?495uIUrKsc0JtI93i9Uk8tYrGP/4BpMtkS/f2SX/nPQKa30y2C9pH5X7f9GA?=
 =?us-ascii?Q?voIjgFQjPxsbnjHjCH7ueqawUZPdx8Axu0PUX0ZpykT2GG6vF0nEQL3xVoBL?=
 =?us-ascii?Q?z2CALskIHBDA0e7TKAOnkYw1oUoI4Z99xAJJmUxn+68sbeRUorA5fix0saG7?=
 =?us-ascii?Q?yquj7Ypjz42CBQ0FWpMrvTjL5VseoeU/giVAAU9v4RuUk082OEhce+x0BFot?=
 =?us-ascii?Q?KrLCZfjT86E+wCstD6JYqBhptKEx7JY1US26ZWJhVOjVGWEiuOE16TXoRae8?=
 =?us-ascii?Q?4Ysdkxs+4Vt1Y+M4twlrXUQ4EJmfiMAlhPt3ZtozF5a7XbuDEJMXf5PuLtDT?=
 =?us-ascii?Q?VOXvOjqWJUvOD8fmMYFSkAADkdMUtzZ/b+jbH4wJYz9jNp5Mgm+5cmDCQNXo?=
 =?us-ascii?Q?ecF+s9l5twvCKFKa7YKpleNKv5YR9Mt9HnTGF8wWhEnzVi6iTXPwsv8D3iTi?=
 =?us-ascii?Q?zFh5hmwUGdgpTKIQkMBB+y7A7WD0mNwQSVzJAJlIZ2VHZ4q+CYGlpWPdT+o9?=
 =?us-ascii?Q?8axaxupAeIdK2ZO9AzDofqbMG1lZMrlpe6fvZ2mPK2CYe/+Ydb3+NHdjtnkJ?=
 =?us-ascii?Q?edPq4/Z+wfHCOYuzHIkJRXZIQsfME202ad/uDtyhrBIm5CAPQS/9Eu+Iw3qG?=
 =?us-ascii?Q?3GAN/Vb2z2wM/Bl5pZIGjx8050VHoFW4Gm3wa3bpNHDR7v3MY3Pf9fsLkax0?=
 =?us-ascii?Q?gAIVtQKYpCJCbS1T0YyVEQ0PojhCamKneQ7sgHgqb/P0uptlLlds4XGDsANp?=
 =?us-ascii?Q?mpX64YYlG6wmrQfUOMMrNNHJg8UokNrqCANolqJsOV2qbzmojbTuVDMHXo0v?=
 =?us-ascii?Q?C80L+YSA6ucLItHU8JMf10XseVOAiOMS+Udg+LUlIGEgcCgYkSwBdiQXvq7k?=
 =?us-ascii?Q?AjhQTo5F4yTIiE+vsQkUnxTKMyrPWzhg9keHU2DQ6IgMtAD98VPKmqYSyeJc?=
 =?us-ascii?Q?DI+PizNxcQXs5s15jiG7OuIv3T1WVMp11YkY1zZYvpLmEIFv3txvhoRH1ehA?=
 =?us-ascii?Q?JCssxjbdja8ep4Bn3McMZgJCe9GMr/37W5ZTFqsx4nRlIHvCunq1jwyP3MFx?=
 =?us-ascii?Q?LWRELAo=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 07:05:05.2905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8940809-404c-4993-e3c0-08dce11e3685
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7356
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
index b6566e2ca274..dbc992a625b7 100644
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

