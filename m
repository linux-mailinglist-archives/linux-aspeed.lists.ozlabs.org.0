Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1668596EF10
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 11:25:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0W6P0LW2z30Dw
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 19:25:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725614715;
	cv=pass; b=DE+Bzr6bXM1rIBRVUbQiXOfDK4//gxhoxqNkI4tv2BZaB6hiZ6W4w4eZYAMC9P4VRDFEJYOqKpuQziM464v4LBpVkYvs8nwi18pP82h5xRXTCrMRRmTJOkXH99ngDGPrugjW49RHItE6tvXBzXrg9mKZx2UYEsCpTBh3+QXGL71DaRgDI4vwVye78bp5RuAJmpEPY1X55qlTsn9dqK7JxxiBANNFxrmG8b1CNtLEwBQ1ukoL3yb5mVM/SKdfdKkHGzDCgM4mfbtf8hB34SmW91WTCGZ4XNgzZC9LKWfV5ZurdXk9206rvBUgyZk84/ts7P2iclUoge/ETg9FC9Yhlw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725614715; c=relaxed/relaxed;
	bh=vK1CZ67tbESXAFSt5cUXs7bqD4h7ZJeDmdQmYlqAfWU=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=HumiRrreUU05Py7TX9Cpo9ki9XH6skb0MFrHSsUXAVVoV5GqZeO/Tmpw5ka+cnN2KgtAeRgFfDA8iCbOOhQqq9EjylBr+0xoAxt1GM7o1wWRaDzuvxguSmZmsWgx9joDcjRIxu6xxhFiN8Hx5r17F2BFPjoXFJzhU2Dweu9kcYNysCyOmuBtotYgfIt/8nh53r2Qh2W043+9hDz6x1b8rBBXeaskP3WXmzwJU1AUgwTtkWAnwCa9h1Dkbd9ueMjKoQyPz0kp/LWKbdjp6WxKdoQyg7VE4bbA7oXluHHyBSEpdIcUEnvYL0isf8TLuDQxfw/pAYgb8z4/aYU7J9hfEA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ITLjExHF; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ITLjExHF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0W6L6hCmz302b
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 19:25:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFXyMhUbE8w6NVe6QStgWPjxGxJzFxBJT2UOcmkXvl0SLETIdQMLCUT9bp+rZu2wzsJHuoI59OqzD/T8PMWiGiqGyf1l0UIPSaZpxhRUdicCojYDU/eNn9beObS7mOSCwjAcrZ9iuaKlfUUx3+/XNHRWKNarqFcy4k6ZudE/aRyyjzLJ5upwEXMzAWR0y0HKxnzlWRwI8LqRcqc9IWR+l/GQ4tm8+dzvyxJFydh5bllBSD1IcPm2+ev+avM9PjyT4Hr7RGZOMNOnlP4WQVwEecoTXgghOUnPyWLzoj8CgR1Q2RX7C6zt4+E+mn4P82ayUhVXvD6MOCK5aKBgcCPAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK1CZ67tbESXAFSt5cUXs7bqD4h7ZJeDmdQmYlqAfWU=;
 b=t06Yu5PfhIUGIOS0qCdyquTSBzG0FWNSLGx8YBtPZ00/lPbnvo4T4qFLg6eA/zCVyRjA1ZEnnR+/zRbMu+MKtbQp4JjTSi5r8upuA1AeLpVMx1N0oxM3E3jOXYGIde4zhZmY7a13E9qiP0xdAbYk6t3zkj1sj3StYWwCX+bGen6boVXt7MtUINy/eQmgrYkRBxBu2VNsVv3O1dQ484+l6kBI9ndhDPTVPkgaj9+H04tF10FDlmpP5R9G/JFcBB5wDoTR88VBcJy0j7IJw4l7piLYMhibLW2ar45UkG7O5DaibkuJCNZcbY1FCRbANmOQO6H1AQS3x7L4+IK0xxXXrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK1CZ67tbESXAFSt5cUXs7bqD4h7ZJeDmdQmYlqAfWU=;
 b=ITLjExHFQVs5z0ys5FwcZARsdIFDeIeCraYWR2eVdv18LGQ21hflrRNrE0VrKumIaUg/ACQ9e3YjGt0aHxwpRvZCKZlnX5eBAKfIcTyALlcWh0Lz+8QUJLpZczlRgOlW+CiUheofiOtf8xXTb9PvzqVbH5i6SMQcm/PW8RXZLy8FyTKwfMA0p38mJAQHHF0UBtgYYlnBFi8m9uRKKcyEWOIhLqZSFeThwkqwKHquelAnyZpHB5mheqJOqJnpfy3Jg2Cx+6U5Ip4BkKVG2UlhbWSjlAu7FucEJtJ2ixLsfqxNUCZCFcPjgT6652JvAf/5WysN6tIN1fhHEIKiE7pXsA==
Received: from SI1PR02CA0030.apcprd02.prod.outlook.com (2603:1096:4:1f4::8) by
 TYZPR04MB6474.apcprd04.prod.outlook.com (2603:1096:400:282::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.28; Fri, 6 Sep 2024 09:24:49 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:1f4:cafe::ae) by SI1PR02CA0030.outlook.office365.com
 (2603:1096:4:1f4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 09:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 09:24:48
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v16 2/3] ARM: dts: aspeed: yosemite4: add mctp config and sensors for NIC
Date: Fri,  6 Sep 2024 17:24:36 +0800
Message-Id: <20240906092438.1047225-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906092438.1047225-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906092438.1047225-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|TYZPR04MB6474:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 014ce49f-7fcb-4632-8c3d-08dcce55c172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?i8ypBBTDzs3lO835Onog24u532io9BnQyjZmntTZqWOZFDJFU+ETHOAF60ad?=
 =?us-ascii?Q?AzAYMbh3gmxyXajxECCR4RqPo6SFGPOaJra5aKQmZ/payeryT5i0zce2XclV?=
 =?us-ascii?Q?bMBL+VOtHV8tz4sbqnI1JOgC4fuYp2b405AsDi04F/8ueRDjrzVTsMUc/G6w?=
 =?us-ascii?Q?db7FnNAzIyZC7ziLhhK/4xqtXNd4U5tN0khWxWAgK3svhx4vBrImDFUP8UAG?=
 =?us-ascii?Q?MUq/hgJFmOd9Eq9EDlPGDtB80Z9rdBsoHh4fAWPfiJYqoWKIv7gbmhmb9I0R?=
 =?us-ascii?Q?bxAEZU/fpHWtzXjvd21uwal8Ty7aGmXCXEMatCQTlcl1YYaBVn4mHm7U+ZrV?=
 =?us-ascii?Q?HshuJLvpN58+LtWLRerzEwt956CVJtbQfAshw4Sx3hV2XbkPDJpK3sKAmnvA?=
 =?us-ascii?Q?fIbhS7YlUFf3cuZn5PjhzhaA/yE57xJlbPU31RjfdOg5DdptJDzoSY5d3RNo?=
 =?us-ascii?Q?k7gHBJsQyiveIMnGHWEY6gi/oIpHjqWQJgnvxp+5G+mra9ZHrnPIjx7LIBOs?=
 =?us-ascii?Q?aTiOcszhU0WrJpd/1HakY/tnyoru+CIRyFuTUuANh585ZeYHt5+Mx68Wdk4C?=
 =?us-ascii?Q?Sy7kqB8f6USaGg5x5zR46qQMEu0QAkZhJ8RR9159ktphia7WCYoZPrn0ORPk?=
 =?us-ascii?Q?qN3Bl6kSF7GVsG1lyA8dPt6hIwWgizdjtSNXZMuL1d5U8uOnSFN+NCBiMNiz?=
 =?us-ascii?Q?l3NQiDyYr2MqZ8Ta3/UKffltFPAmtbr3UBo3reXCt1OzGjkFwXXxQ3tP0m8G?=
 =?us-ascii?Q?jbOqPL5kK0lKP0Ynp+cWAlny7wwSafGa7kJ8tf3Ii4sJt7fJko583sZefU74?=
 =?us-ascii?Q?bjF+l3ALyXYQHoTOu8LE9CNH3he23HmNOdjX/0ygIDlbsPVNlz6GCoL4+WzP?=
 =?us-ascii?Q?LLYuf1A3mHuXmPmEnCzBVFLtVBnnVhyVgj1qnYAa8ETU3MRgXv2UxIihuZhg?=
 =?us-ascii?Q?kp2eTyr3Z/oOzFHvR60wJO0jmIm5bcRvzQicKaanT86J6X41jAlW2RQyqrqw?=
 =?us-ascii?Q?5T9Uo2ZWyYjIjZNvuluD46CLl29m+VFmyjNDok8y5gZC+ScNY/874Au7ETdP?=
 =?us-ascii?Q?dbA6QvUQh+5NA0kLys+CrQpfQD10882MOXds4znSFxAlAXqZBmFO4JnuJjz2?=
 =?us-ascii?Q?RuA7nKV6LxlgEb9P4oIlMpk0LIDMxdZ5Zz7oyXZlmjQGs/T6b6g8R3HHgOf6?=
 =?us-ascii?Q?KjRp6duENea0rOduuls05acm+lKz8UaRbIa4P9wcUzG0ovCZh8XQwPeAME/f?=
 =?us-ascii?Q?eYQgbSRIOG72xAc4cQwKiQKGDk3wUVhOlJFAa7ywCPdVBJyCrEGE3tbzbArR?=
 =?us-ascii?Q?3G3h+koJe+XQpOj3fDrwLN/fF0brXYF0IMWarWwYvyT/LbVPjDrf1GdmWYY0?=
 =?us-ascii?Q?wvojrhWt6Y4mbUhNbMSaL6OLGJ+o9yO6e8Widp80eLWOHMwn2a7G0VFPgLJx?=
 =?us-ascii?Q?sHKgzGHJnIrnZsiDN1+hD0fJOXpXlwYt?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:24:48.6100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 014ce49f-7fcb-4632-8c3d-08dcce55c172
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6474
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

- Add MCTP config for NIC and remove the unnecessary MCTP config on bus
15.
- Add 2nd source temperature sensors EMC1403 for NIC.
- Add eeprom for NIC.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 96039ffbf8ef..9ddeccf650cd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -918,7 +918,6 @@ adc@35 {
 
 &i2c15 {
 	status = "okay";
-	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
 
@@ -936,40 +935,88 @@ imux24: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux25: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux26: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux27: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+			mctp-controller;
+
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 	};
 };
-- 
2.25.1

