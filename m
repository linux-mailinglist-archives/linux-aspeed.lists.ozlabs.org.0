Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 243C5843953
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 09:42:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bdB2jLYt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPwXJ07qfz3bvy
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 19:42:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bdB2jLYt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::614; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPwWt52tdz3bq0
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 19:42:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZ4x6QZ7+nTbXS/DGo6YP42LIglwSUS1SRt7b3fWGDvNLSgD1XmEIq2Ixqc+0M/GEQSvWnnKNkmKJF/Nd44tiPZYqKCIk0n5/tjzjPUJSI5xHM75x481N8ZLIKhXaOmd3I6qhp45UOYshMGbQCNsWB0pVW09iyyOej7uNy8lShlnCjGuK0oe/zlRu+/JRejvW4HLqKZdIfAy104MMAC5vT8frxME2cAb+wAtn4JJRowrlAzndl1fvLMOI+nSLS57b3xPcXGWVuBVbk26PMWo3yNTmSlta3QFBUu1+kkm0fqJ6hpLtufVcWeRSbm/FKKGhAu1W2gN9tHyeFfA+HLE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+rCbKa980zvtFSL+aiZSLIdHmQc5ZtQwhUuhOWMtss=;
 b=abGlQkj8nLh0UlLkCmG+tkOyIF42pnyV9/J48eFpHc7quNGypT7CxmTSyoE3CL/yqy5feJHr8WVO7M/vmyYxaHtG2ghSmFfd5sO6Gdl23tDJ4msA5VaJIh1DwsiVSFIAFcfwrwZDl4xHRm36WROj4PBCoD8Z43rSOV7ZI4YGcPI0Hq1TXKXQF0JLAe491y90LuAnAOE3jMCWL6AR3fTnap32zYZ+oCVtJYBB6wkb/13yjIYIQdKRHPp5xXT0coq0vfr+39NJnCJoxeUw7a9ALojPZ4XfWrKVm62YvWbRQQYNwtvsdD1q/lPxSYEADXTk+E+n4rkYxkax8x7KPTp7lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+rCbKa980zvtFSL+aiZSLIdHmQc5ZtQwhUuhOWMtss=;
 b=bdB2jLYt1dSJvDREDBG1uXbXfLGFRUMvMGHAh+XzdSH5mz3MWlyAMIYnU+uYf+p07VLBi+a5+QMhPbpZMrmSUFIPqvAAUwW/GdO+MV6Y/+bb7Tsop/Z2FPzSXRdrqKUdc+POXXH0EG8cxqvGFgK0KtjTF4amKGeSfYLuoESyQlt0SlT4vhjW/kD/Gyt/F13PyVNDgVYJDStK5vSTNw93nY8mFEyHZLMAxT8YQ5sKQ27OHSnZd2ekUNk2x/4Nt07UG3JgCj79jgQtnvi/DbonHrvUpsyE9p8l0QCYY/IwIjfS3s1d4ieStZ3LkEEcRH9IgE5j5NpZpu2e/i4WB1f0aw==
Received: from SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6) by
 SEYPR04MB7332.apcprd04.prod.outlook.com (2603:1096:101:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 08:41:59 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::9) by SG2P153CA0019.outlook.office365.com
 (2603:1096:4:c7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.8 via Frontend
 Transport; Wed, 31 Jan 2024 08:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server id 15.20.7228.16 via Frontend Transport; Wed, 31 Jan 2024 08:41:57
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v5 05/21] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Wed, 31 Jan 2024 16:41:16 +0800
Message-Id: <20240131084134.328307-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|SEYPR04MB7332:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6dc2d661-3bd0-447d-25d1-08dc22387d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1pZwwgVIOYP3R1ptU0tG/XtbSZ4sE9ec+JEkkTj/b3SjDWB5JEuwm7rWY5Ru9uPLNW73oenDD1wILRXqFBoYpYktXsoATa3kvHk5IaMwXoP/JWgSq+Zbs3kcHWu/3JoL9kwUlv8mLWn4RL/l37HEWwfxoXi9RTX1WZdGi3Vz6M+JRnCh3pJUut5pObMubikPrVFUSCIIxCb/xNJtYptBGD0LD1fZqStYVLYBmPOCa/y2qjRXWnN47pkiaF1R+8ScFexh6ZTQa57xL8M7vHD+dn3vSJTkOvgXBVRhCrB6t6yVOB5RjK2I5AOgQIt3LHnHh5jLPWiquYYUJF5tEd1eCG8lhJKOus9g66myGrvDf6491F5C3Lwj2nPFKxuhoh6MfIXmghmSklRKpzWMywNbzyf3UCDxyOfn1yxAbHzDFkK9Rw2MuZtk1Qti3a78EjrtfRatCuJ+X6k5awnH68RUpSTSpkAY1HMVyuzNtov1p+wDVNmlTzq9ftigccMbi0Azwg6kkyGyBiXklMJX4TFmgodP3JVf2McDaHypjHnQsXHFZ3kugs0q80TdNrzJdRn6K3wRpwzzhP0ziWSkqixHlZC9IC8s/CWGBO3KruEzojB7ihmIrfaUuJGgmfyotReMzHMcD92KqKp3MY10anNlSKZNBJFvZELniHXJWbblTEJLJeY8tpEskpWmePVusIfdJMF8LsfF4Qe4XHV2S8uPCg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(36840700001)(46966006)(9316004)(83380400001)(1076003)(6512007)(82740400003)(336012)(956004)(6506007)(26005)(2616005)(36860700001)(5660300002)(4326008)(356005)(8936002)(7416002)(478600001)(8676002)(6486002)(2906002)(6666004)(81166007)(70586007)(36736006)(316002)(110136005)(70206006)(86362001)(41300700001)(47076005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 08:41:57.9887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc2d661-3bd0-447d-25d1-08dc22387d0d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7332
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

Revise quad mode to dual mode to avoid WP pin influnece the SPI

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f8bfdefbefc6..23006dca5f26 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -149,15 +149,17 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

