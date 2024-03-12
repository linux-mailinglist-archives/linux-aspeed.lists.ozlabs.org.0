Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435F878E9C
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 07:17:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sfllnoIe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv3NM0dccz3dRp
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 17:17:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sfllnoIe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c401::3; helo=sinpr02cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from SINPR02CU002.outbound.protection.outlook.com (mail-southeastasiaazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c401::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv3Mf6pvsz3dTW
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 17:17:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYzxYx9in4MEMyVK3N4Y1XVBMneojXEbD0GqeyCS+HA0cVQpg23A6aXpXktqDvplG8kchKRxxvzt854CqntTokbhlFt8EzKYsulNkFNf8vMoSpB6Xc63lON6jw1DLZoMtBEp3Bv9gdGl/dKH/pZLOxsVOcc9ZkQuMSE7Du+gbe3VYXdJ9NmaJGwWbhNMlCOKb3ieim/tg8els1Zp7XWT2wU4Q6zHXyq73UwmHDq0sWmIeH4i3gck0aP7Rg+QRDKGkT2NWajUdOXACBSlvoFkX9wD6Uk/3YNIs71vzRFXFHed+sVGrXIEqekmFWzOF8EgBbbwQADPFhkGTtUspasn4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUNtvQ1Eth8qm1pnxm9kajQVaK4SrxDkTRzAWRlpwnI=;
 b=BuUSMo0F4VujlBBPECnwJZLM143AtkXZlQyWr/kw0/tskcOVMBYhBxOOZiWhQhrQRt54QADpiR+uvvYDfgsLAGbYg+WejVvUr4iN/ewZp6WBwSjLWZxbbW1ZMamSNzoL16tvcJq1LjJtZWI44J37kjm43vvEUXm9lWfo1b/Lo1MSOTMKLOs3eENWuPO4s/PjDC+XCc/u2qvOqZt6FCQZ/t3GthXuyMVA6Dho+uytQ0so+6PbweUpuBPUwl4wLJBZ/bT5h5831tJQPq4IGknN2RKbWU9L8jGwWn/93t77HMpm+UUQwsPS4X8+YAAuj6VTfyjZw1vqMY4SxGTEvzVQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUNtvQ1Eth8qm1pnxm9kajQVaK4SrxDkTRzAWRlpwnI=;
 b=sfllnoIeXHMYRCKwIZf0hts2h/tzPN2Al81n89Pp4FakF9nMHkXhqX3maL5uomo4oZ5HEfmL5F2x8pz5+IdweW98V74bHVSCumtgtrXP4DQsbmbGVQ7B8NTd99xunKHsH/7LO2ARds1oWXQXeggHjRu2Xxq2ZSUfI02kO1ZI4Oj9GseuGRWORedo08MOZPYpxXSADNK8DLhJetcUOdFppbDioZezv0yMDwDUeWxHp/IJykh4AJjV1EjMyS9H3V3vAE9tL3vlzM+8b+NMTyJrvxwj8u55/iw9kCu7L5o7ulfkHnkeQNE1wLMSBufsEcJO+3z8zSOkJF9sKt6i5JSPzg==
Received: from PS1PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::14) by SEZPR04MB5874.apcprd04.prod.outlook.com
 (2603:1096:101:7d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 06:16:52 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::8e) by PS1PR01CA0002.outlook.office365.com
 (2603:1096:300:75::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Tue, 12 Mar 2024 06:16:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 06:16:51
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v6 15/22] ARM: dts: aspeed: yosemite4: Remove idle state setting for yosemite4 NIC connection
Date: Tue, 12 Mar 2024 14:15:47 +0800
Message-Id: <20240312061556.496605-16-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|SEZPR04MB5874:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1411db4c-5dc2-4940-e137-08dc425c0210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4spmlKYp255FLw6YZf/ULNoGaHOCzUFTrkuor9OGxnVfLHeVs2dpcyq60KrOTEVoo5mXKCpBopGuf8hWUemQ/cuP+DkoKqgSjlSkR9BcCd84jWMvpiXD49d2vQZGW21Sk1/mYXdbHPInq7MH3I6inbVugLalxgxAEMT8m2BK/kWBiREhOSvD8+RVR2v++YTSewLU1iQlbKhZIJ0y10XxidT4pcmaG5XBRT7FHYNuqkAMW1t2tNgAf2N/xhxI0kFEjMfEfJPygGW9XCXFw1n9Z7Vj8qBGHQitubNO6ASFA/k4dVS1LSNd0frnUCBqjG1+9946o5y5nYvUFeo0fIib3X5PseVtFjZUS/aZ9oHeAHcIstcSI+vasSb7TOvBWPQPZhRv/jI3QuP3JZX6JocZ2wVyfOTR+Vo7L/XtULCIT4cRxT4STD9GzTHhjss/0utGBQZoDq4Rm2rbFOfDRX9SMIqunThSJf8WRfJW8hczDt84rQvZBRth4FWHekH2cM0xYgEo5rMZS1iTq/0diUWFiOkNSDCo5qkK1+vaoSBghGWlPlDag+4N8EIDt+qUVWkzfTQtgrYnlTGBVzjxQBqifdv/ImEYDXmaPEvOILg9yuAzRY6yzFlqRCaS2+VDF8W7Ea6kq6B1T9t3HD58Bvhh9zDTolISy6HYSt6ziTHMO0MASrF+RH5F7TH5MnIWW/3vSRBe6qAJlHID7qIhAboO9jATevhTJlJxPCgBQoFEw7pp24PUqcUKBL2bl73lIlHV
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 06:16:51.6665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1411db4c-5dc2-4940-e137-08dc425c0210
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5874
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

Remove idle state setting for yosemite4 NIC connection

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f0e93c74003a..6d5710e5753c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1227,7 +1227,6 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		i2c-mux-idle-disconnect;
 		reg = <0x72>;
 
 		imux24: i2c@0 {
-- 
2.25.1

