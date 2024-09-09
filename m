Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA93970B5F
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 03:38:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X28cF0wQRz2yVj
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 11:38:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::60b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725845899;
	cv=pass; b=UpoJP2X+/9ZknAvcMYtxxzCTC1CN14+cii4T76sqwpcx6NKQq+UTesbUjPVCkwGdikJNmAU2s7OUP+WqU488QaLvpHhHrhAXfl7lf7UvE8k+9soELazdTxzPkp3huBoBqIJ0H3YWmdnZPHvaMfVg9zN4kEA8dK25+UQ5ptBrFtXg7DYvN76aO3HTqIJEQlmjfIyWhTpCYYd4kMhwloze0Di8MBrxtMsU+7R5bhnYm6dKE1oqhdADoTevPbQwqSUo8QtvM/D0VzABtwDNDZ9LW63Y25y5qkIZHlDiZQjvrcDQ2LtrEnZBp2dEWk6UfdNFL/V6iOell5Qkr3Dbd/BPPw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725845899; c=relaxed/relaxed;
	bh=WtOm1gxT8Gyb8WrQVSDmxu3qdMr6yZ1Z7qB5y9F9It8=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type; b=VE2WUmiYagMX/gZUMojM19gTFvyaL4T/UyJwb7WqnhnovjCX1hmAhz0HCevxyQGvAGqSApTBTFoJxKkH2zgdMzIdeunGX8GpKzf+znZ9eP+JcmVAuFcYXo+EV7icMlLqX58rYiknRmrxY3nD7iKyc+Zc4W5GX9NkYAnZ6UdWocbkuH3EwkCMvLU+dtD+hdeOegHdqShNpHHu/QkNTycb8L6fcGcMplyJDQNATYKyL4dB1rw9x7tRfRiPLDJtmvRLlJ3uF2egyg1EKJ/+vYiB/1TVZKmKmpnJnalw+7HDmpqO20wFFsW5Ki+YEvVOyZeHfRX7RXcMFL3KyfLWvDgRBQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jkfqgBLr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::60b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jkfqgBLr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X28cC39Ghz2xpl
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 11:38:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU+znGeQMSnb8rfE2Y3zao1ShXMC5Bi6UtafCXU2yARAfsgx/bKQzToFm9uq9jt/RDNipLW77ZpoDpCNjI7aBlAD9xwSKNDCmmuqyR/rJRLgTvxUaVqxMvHUTdIhYcLmi0Hm69ejOQtdj97TmPdkc96qtIIi2KGry1p1QUnbY424oOepFjNUK+AeV62lk4vadMXammj2Ip8/bwBPRvShN3WnKjcvx86BCkpbLqfDpAhGd1X/VVpRRZYqlYnX88enHng3LyKX8OKnFo0grlWDWBjkSxANLzJcV9J3MdoaPyMGLeQTt04uLgIiPWh3aUdG+WyzwxOavYJojdLzth+9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtOm1gxT8Gyb8WrQVSDmxu3qdMr6yZ1Z7qB5y9F9It8=;
 b=Szl7qpCOXo95aSZlgzgoc//0u7TOQvsVu6I4PPhwTwjsbaqpRVajqcVcyIAEB3vvd06Ks6ezHWK2gZb7RXTBx8AfediIrI4xFYx3xIPV/saOWm+jFwZukFi8LtXllxqTU/a0LVsFABCsapFws9JTjh1LMGLDpRRyZTc3yeLhw1SCgY/LvpQH2eJIe5bHluRSiHurOK58F14EJoG9CwkGZfhHSn13MKpKmkImvaHeajmZZt3ucbzp6uBXQwmdreZHaFLTRrXeH78A1ao2hKyTTfmdIdq7BRltEAcnHJDapEguKjJKRS1pF6xacO8qNybBR9J9TuugmMIpwu08JHL47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtOm1gxT8Gyb8WrQVSDmxu3qdMr6yZ1Z7qB5y9F9It8=;
 b=jkfqgBLrI5qMXmJjgnHILJJrRuPIO6cZGTk38zJ+XvLKjamwfciUzayQdksxPl5g99ux+eieUNLAQO9X68wHJBSDlSR5yQvyIQ+wOV5SucXQc3hohCFcxa3pI81bYQlp/rmUe1nxoYQgrTvLak1jObWKCDUbQyjSM84Ns8i10KTbkPoIZKdhmmIXOnV8mAFUf51obs2FvDwf3gVnyBSWapYEtujAG4Psalafw6oqSTdcYFXPv2/ySoFhX2DFxi25l5LF9IEVOeP5zOlDnaWKCfVrUP6F6lrjkKsXMG7TKEe66G+RZsReBcWgKlhiXHmBL+rCkBicUkeNAmQhkFnWNQ==
Received: from SG2PR02CA0021.apcprd02.prod.outlook.com (2603:1096:3:17::33) by
 SEYPR04MB7776.apcprd04.prod.outlook.com (2603:1096:101:210::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.28; Mon, 9 Sep 2024 01:37:59 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:3:17:cafe::7) by SG2PR02CA0021.outlook.office365.com
 (2603:1096:3:17::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Mon, 9 Sep 2024 01:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Mon, 9 Sep 2024 01:37:58
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v17 2/3] ARM: dts: aspeed: yosemite4: add mctp config and sensors for NIC
Date: Mon,  9 Sep 2024 09:37:43 +0800
Message-Id: <20240909013745.3306365-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240909013745.3306365-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240909013745.3306365-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|SEYPR04MB7776:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 73733825-2d96-46cb-da45-08dcd0700960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|82310400026|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?LA0vqQKh6D2Y6B/Z+ORWwWYUjpXH+FXIb1OQb6E/FcZ4bgfb+SL/4VLRuCVo?=
 =?us-ascii?Q?GN+TOxSqGz4atjzKoDDct9TEFCTjXa2PsN5MS7pymZ+F95ApArZ1JnK+jq4u?=
 =?us-ascii?Q?inntrMsJX4U6uhqzwBv49xEnrqNCJVL2PmqTb0Db23ZybUdJ9sQ7qfnCVjkz?=
 =?us-ascii?Q?GYtOWRtGqiTszl6gJC2pWsX3X7cCYcSWJ7Dllbzk/MmJx9x9GUJey1ODg+u5?=
 =?us-ascii?Q?vnjwz6JnLRa+uoFKCQJZ5Ubp+uHeTAodKZ+zcwh5Ne/83re3QQGN/vfDtX7C?=
 =?us-ascii?Q?eiK9Of9k0KKI17hs9Lg+NulwrWxudGpKo/DWepG1ePrymo9tcm2Obq8yE+Mv?=
 =?us-ascii?Q?m+FK8BaSmPxuCv62QRCCDiAINAQ8ueyjP2oS6enhjfC5ZY0dEGGuyqU4DUhf?=
 =?us-ascii?Q?GgDWAEKurfiweEWfir9ZJhNb8hkCdMrE4ZQmj3LVGQ5Dhr/4+QmWqq2DwSOx?=
 =?us-ascii?Q?YBT9yaopq95NtQ1I2e6OtjiHr0UKnlIZLd61thzihKxMXrlwNTXvkxlzu2wf?=
 =?us-ascii?Q?lsWOVHXyLSbAuIeF/w5MsrBnQpLJMuNjsQS0morapWdXSUQ5u3ShtcAikuQN?=
 =?us-ascii?Q?Oen/yI/iTaxyzyjdYLRZlaC+W2qMuXfAV1va/ikXMexn6qvcFL/djERi+uAW?=
 =?us-ascii?Q?LMXy3hmdoUzAK9rA00bm9uMJav4U5bjoNGOkqXtHc4nekyY3lYdlRdz2bqFp?=
 =?us-ascii?Q?uTxUEdxfVw9uTaImAqOZwN+Tc7oLmghZQYEypQl+WbCmZlFEAUJDfAK5fo/p?=
 =?us-ascii?Q?lUuIt7fvndxUMPrhYMu43OvvlLRc+EHaH4Jsp4ls1Pqg29xOvtrrFVLJn7IB?=
 =?us-ascii?Q?xF4c9LyG6RD3rsHf+2Z0R2OlrFaQNcVGVgwDAlrclHA56axv/shqPCIYXUiD?=
 =?us-ascii?Q?nwf0NbzF6SWhx1A7mndibgZyCZndRlSmLTwmgB2SfeaLCWpjWYno9lQ80TPS?=
 =?us-ascii?Q?utH20At2Je/cF72MF1mZgv8tvyp6KuwuUkMQMAK9DUsky0xPc+cSBtZfVySK?=
 =?us-ascii?Q?Z3cBx/bjX/9SpBQTs6xvwCH6WoaFzKNjmq+xA0lTkKXTzIDB0RiDrnqiFbdD?=
 =?us-ascii?Q?Wmru8iP5ALEwp9vMD21pyoXaWvq/iM/4tw6N41c+veI3znLuIcuQVMHGPeAn?=
 =?us-ascii?Q?dTAvrxn/nvzJJrDBxwxYIpIBZ51wUUPSL7GWghTy0a7Yw1gmTbWuALnr/bVl?=
 =?us-ascii?Q?9xXRYA79RXHB04ho6NiSY/nfmuS4d7kk5mxTU5jdPQv4kbfJ1sxwz9w0k2UE?=
 =?us-ascii?Q?FCUPlsQ041+rMrVG37LArvIkohQni8Z0/5GeBhvPcCwRm0fL0it/CP/9nq/Q?=
 =?us-ascii?Q?kcA0n1sNRjg9mS8FwFojrcoddJQt/CsEM+6rlp2S3BypIETN4ucTZvCpNJbL?=
 =?us-ascii?Q?BDh0ByARyrfIczXNYpAQels9BxTrLG+l5Q5Q8fJ1zU+NoExOKwC2OaYySBCu?=
 =?us-ascii?Q?2u4MSPoZt9nJode5b/o1U2zbSi5pXOPD?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 01:37:58.5305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73733825-2d96-46cb-da45-08dcd0700960
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7776
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

- Add MCTP config for NIC and remove the unnecessary MCTP config on bus
15.
- Add 2nd source temperature sensors EMC1403 for NIC.
- Add eeprom for NIC.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
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

