Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD7884396B
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 09:43:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1BZrRPaS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPwYg1W2rz3bqQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 19:43:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1BZrRPaS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::626; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPwY43Q2Bz3btm
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 19:43:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JS/pm5RrD4R1+rY1vhLdeTo/OA55G+Zv2Fpgru2jTxr1mL2s5WH2bbt9OBwfN8wZricWvaMl9eoAhoBDfd8CU8Uvol7/SxEJG9kuNm1yUFN+Y54PscVWnsLcas2U6tYv+hz4Vv/mg2v40Q5KuNbaQ07yJum2L/gBD2zz4uCOcYqZLYbI1f2pv5A0IHr4OXiqK/JL/BDHzSzlcnMePPShhZQ46U89yPC9IeP7mRMIznQVm0qICQrnLB1ZJqmJ8oMyz24k1GmuqRPXkYVyGhJhsxqSu1OYXPGIPVJFCIua/COiOgkvCk4ViSOm9cCetzu9P87Vn+qqEBrSY4dOnwPkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF3i3ZisZaXoChi0wC4IwWdNkvj2IomGYSaRQhudy0o=;
 b=Xq0LkwzjC55s2gbOLGPFA7FRkg9eOs/XPJRzrXRYJOgve8S7uB2RMVKHmegcK2et7miFUamex9CXbLoKyHzcI1vgUbfYNXpw8weBkbL4Fj3XkAv2WHRpTIr6r/Jv5criL3KpsWHCR6IB2loU+L9kzF47d8cax9X4UnvOiZdRe0RHxOB2WZWGcWxx4PVg0s2or4ho1zoxEFGOw/UNgEgLuTdabrR0uYVLVXuM1XAQqEIG3qh/LIi3uQ3Hi/TEJ1YrFlYAEDUgMX4SSJH3JLFI/PVjQ1qpzryLR6W2dGKBd5bTmuiHaTXI2VzetHYk9S9O9dQBy0fqa7DISTiF43+lBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF3i3ZisZaXoChi0wC4IwWdNkvj2IomGYSaRQhudy0o=;
 b=1BZrRPaSQnvSwbqLOCozZxLa4v4nZnfdgdjl+Xq+zzjG8m6ap6+CZBkM+j0p7xleENtannOudqMnqO6hIS/iTZIjIXSBrPR/J/onbNuXi/+l0UoJIP0Gb/hHM+YP1oulzOQwshvIGVvr1RkzvihISzhE/GStsb0iwFpf7gqDaeKkrGlovOvwbmTFzdjanxgntWvS7PMJll7yqNaxsv+eUdQUiY3a9YozoNnLduAzPKXGmus8kZf3/piguXO3rjpiKX6JIAS4xTSnplbweeJMri+Y+rZOz3aj6ORkoQjUE3nVUiZjZEqLdmYmRFyFXCFsGt/SEkwpbAUAJ3mTReWgww==
Received: from SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13) by
 PUZPR04MB6559.apcprd04.prod.outlook.com (2603:1096:301:f1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.34; Wed, 31 Jan 2024 08:42:59 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::44) by SG2P153CA0026.outlook.office365.com
 (2603:1096:4:c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.6 via Frontend
 Transport; Wed, 31 Jan 2024 08:42:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server id 15.20.7228.16 via Frontend Transport; Wed, 31 Jan 2024 08:42:58
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v5 20/21] ARM: dts: aspeed: yosemite4: support medusa board adc sensors
Date: Wed, 31 Jan 2024 16:41:31 +0800
Message-Id: <20240131084134.328307-21-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|PUZPR04MB6559:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 55630c41-fef5-478f-c46c-08dc2238a0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MgRStRi7HRnSrTtW35vdUc1Te08TKJOITFTMxaSbMUWhT8rClrL9d5DxeWCd9PDTWUQurREPQra+9reUMLzTGobHRU5W5G6ZPruBQvL/ZM0zquDNHeJk1JjIMsSILzIbMJFyFEhPaD3femPWX4Du0TddThmbIowF2AzLKKh3f+uPDvOu76zux9uAwIoiHGQLaE3h/Sr+GSZUUhJS3ED9083Dt5SLVn/iNCmecfb+EjCiqSRcslflytU2XZ/jTnQFWHi0BNENsOssHO9jExK6N220FWgoR5jGT/2D8ygFhD+RZ92eJHr3OthfMhD8QFVNa3QazmfAnwvIn0CRt8sFTLS34HxGQ7MFsCZSHruhe+f31z1avux7McsT9c2PycmkbYs2QMwAB1VsMKWjAPAQXpkcukAIIIGMPayBqy5X281khj88EN/ZW9igNJyRLheq+/hXWjX6raJjmefvg6qcq7R/jeiuerqwrWsQWOSn4DoJvNPA4mtNw7zeYS9TvMx/6m+ue2rfAsCizUkoWg06KNDOpGgSDO8Wnm2lZecT2nYpCJJ2PdM2wqyOu59tB4RSwST4q99c8WfCu3221r7reeI4hzYESz/WS54rBMHXm+UKV6+7ULmLxNcto5DJH/hqqm4rs5oIlLZ7oVu52QEhzgaiHxrpBLMM4ypd6Crts8AWg1X326dkxRxPqEa1GZnZ6DaDVEcLw9hMSWvvnKuYcw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(36840700001)(46966006)(1076003)(336012)(26005)(956004)(2616005)(41300700001)(40480700001)(9316004)(316002)(36860700001)(478600001)(36756003)(6512007)(6506007)(6666004)(47076005)(356005)(6486002)(82740400003)(81166007)(5660300002)(2906002)(70586007)(36736006)(70206006)(86362001)(4744005)(110136005)(7416002)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 08:42:58.0833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55630c41-fef5-478f-c46c-08dc2238a0cb
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6559
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

Add ina233/ina28 support for medusa board adc sensors

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index d97520860f4a..bb0dc203eafa 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -915,6 +915,19 @@ power-sensor@40 {
 		reg = <0x40>;
 	};
 
+	power-sensor@41 {
+			compatible = "ti,ina233";
+			resistor-calibration = /bits/ 16 <0x0a00>;
+			current-lsb= /bits/ 16 <0x0001>;
+			reg = <0x41>;
+	};
+
+	power-sensor@44 {
+			compatible = "ti,ina238";
+			shunt-resistor = <1000>;
+			reg = <0x44>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
-- 
2.25.1

