Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFCA4B7026
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 17:32:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JympW5TZMz3cJS
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 03:32:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=jnx9zFOq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::705;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=jnx9zFOq; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::705])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JympR3X9Vz2x9M
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Feb 2022 03:32:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTvkgq54ZBdI5nerCkEmiWj5cRGQDcqjLLZLf4jqSIkb9TQFnMIEl8joHj0dP4qrKD3aKfgGCr5W9/BziXIM2pNzd5y5PmbWRidUihqx4VjfaZ+F7pPBwHiJ4JLPOZa9t22Q76AfQhrdjJv3VhKS77Y8knb5VumiYqSaZRLgeYt9ZklJK/mFpT3VWJSwYs1xA7ARdUC6gS2mfFUDFhBxN1T4/lFRr9G69lKQ7kdjiaIJDtsNgvObTmg+IOwmnGm4/fvvtra34HWr5/UwSEZ3SMVAE7sAN9W+VK3DcGUaaDVSPvr1DZPQJ3FVhmKwDUbrbBiIHdkilBi7PEwV50bFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkc4b+GAsp5S7whUqw4Uxmql5q276mZk4wtcrC4q11A=;
 b=bJNjNQaXs3qKTOOCv/gEjNl8QAcbVrEGhhly6Vkxc/yNqWw9IJz2PfQbpaQZ7JyWzVzdtk3wWa6Delr4tEzaNfpIYs+KEP3jEFsVUNMZQTwI/V8kmbwMH3vpI1cRo1hBpEQ89fJogovJsmAb0btfzs2L4N662Y5V5DmfMwg2U3cSka0NNJwxKQ2bdLe+jFsz4wqg+l0s+DXBPjRs8pEBR0DqKxMPp+KEJghG6PqlTp2xr7LhNDeakNsA9w3RSwm58baujKpDA3gI2dHemBtBh1kGFs55yZ4QmSPxAzeZJl3LUsL2tFOEd+zQg+3zXFymJQTPHNJK8Eg3RTcVRdkRAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkc4b+GAsp5S7whUqw4Uxmql5q276mZk4wtcrC4q11A=;
 b=jnx9zFOqTzPl1ZBmpk1uAdIZOounJ26cg9lTXHsmiDHhwQE3iPsnK+G9cy6y5fGj6e/lqKwEInrOe/GPaSqidgXdlJcM6rfp/902HMsrZa2lteDTiNQnLtzofUvyOcof+eiKSb8ggtmthNn87hHG63y1Y9Rx0ZoL9bUMkYgogok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB5695.apcprd04.prod.outlook.com (2603:1096:4:1a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Tue, 15 Feb
 2022 16:32:08 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 16:32:08 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 06/10] ARM: dts: aspeed: bletchley: add interrupt support
 for sled io expander
Date: Wed, 16 Feb 2022 00:31:47 +0800
Message-Id: <20220215163151.32252-7-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220215163151.32252-1-potin.lai@quantatw.com>
References: <20220215163151.32252-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0141.apcprd02.prod.outlook.com
 (2603:1096:202:16::25) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cea83412-2a14-4ec7-58cf-08d9f0a0b567
X-MS-TrafficTypeDiagnostic: SI2PR04MB5695:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB56956492B3C21028777754938E349@SI2PR04MB5695.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x5kc4vNgwwtDBSx6D/p7l+qWIcSMEhzEbbicQ0SqCTBXIKILrq8hO5xw+fqTS9GkP6bnLLPCkKiP5cNV8EPEbCseQdKbCZSJ05/fM8KFhkx7XehPZhSr19J6jCrjzs9dEOXql7GsExYK5vO9og+LFKEawuikdiOhW5xxnaYhU0BwI0ZJ0VOpbVgcKGhjaDoK0gKCX5SvK/Z9Kp67POK019DcSSJXe3ZSV4LjH7MHJ048+xcPF/5KpCHf7o1qHKaGry3Y7LR8EzdfNqX/ng2VsYwhjsPPVbaEDfQ5KvpD0houTG0OhdqPCQOV+wMZsnxhDf2v3Vzu3ebhMT4vTHqndsagvFzvtjAM+xFxs+ci+/e7xOu6H5klsHf5GK2Xd5oAzIqscOftRYDfmGFaQYZNviOeiQodUo12UeRVa7udXnsUwF80OoW6Zzy+2CzlF6jiP2MB/TGXUDh/sQYnekZByg3pDzvKCkbbMi0f/v1qEnkTGUZVAc1cArjhnJsZyG9M1sCrKQtxBlSmLDLPHrxoKlaYiPW9Cq52DRJVOvn7Irhx3kyF5OW373LGMK47YNXhFsqhLHgbLCXXXDALA0d2OD58dKHw+PRGqPZGhRQgIwUWkeRWO/nImOig4CwkzmgHkKz212Sfqbk8+ogjH0g7G6ONiE4mudP3TTI4gYZajBOSUSA0HvhtS8FpoDA3IiIsBZ8tjfymopRG6Bf56QG0dA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(6666004)(83380400001)(38350700002)(5660300002)(52116002)(8676002)(86362001)(2906002)(6512007)(36756003)(186003)(2616005)(1076003)(6506007)(26005)(107886003)(54906003)(110136005)(6486002)(66556008)(66946007)(8936002)(316002)(508600001)(44832011)(66476007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8z93ayjRCPCCOHww/GhmK3PswGaQoVH/e+N/aKCBNDEEpXkKceehPzta/FoZ?=
 =?us-ascii?Q?wPQziZWo0+wPNVTmVbP1a3I07lbFh12rkrd5jHrxDouAoTDS+MT+C8bYqmXB?=
 =?us-ascii?Q?vbhrnechDG8vlwL2cKnOgajh1DSs57zhY6z0nL2l6NXq5lwMZ7g+kboa7inX?=
 =?us-ascii?Q?wsOxOYG1dNyu9abNxu490Fi62dvHvheITXQlWRz5/TYZKK3mzO65RCpclOkR?=
 =?us-ascii?Q?LsbUIE9jiIh9bE2sO9SpgTRGj+unjpVI/Jqlj58ChQHPK0CAVRLS+PJxqEUO?=
 =?us-ascii?Q?X6yR4JqwurGI2cdil+Gn4g6zrkmF5mJCwutXbJs4OBZU79WtxnVGYUQXA3LA?=
 =?us-ascii?Q?xhrV3ZUjwV748ttkWpCUnzzVTFwWFX3otzil71jtWxGaTg1qdjFnIQHbEVuK?=
 =?us-ascii?Q?psPHV26QJYbpcE+QssaKKZ1ONXovcYm/ecIcjdTX/yd1VJymnCf+DsgHKqXE?=
 =?us-ascii?Q?GCdVCLD0tNaiOLKnk+wApn5mZxq1rYCta6XflD84CCzY4DZXSOKUqGte305Z?=
 =?us-ascii?Q?687J1JNm+9Hbh8n1qDShKq/9amDsp9PdHJrRqF8YI1TGg0FXn/4KtmfKfL5R?=
 =?us-ascii?Q?gOT1IUID0njV7LYGAOv1YZnlpvGyTwYaKyrZ+PHgBuxMdg7jeaCLe73scRZX?=
 =?us-ascii?Q?UtuSNh0PHnXmLl1TsdIKMlDAsENMANPRPdPlzCUQsnwxAeZRuXxoVIHJmP9o?=
 =?us-ascii?Q?ndvJDhhisEF48k2p3SSnV3Ocl9ssDrxePy8v6sSdpjXZyqXO1xPlw4HBC2az?=
 =?us-ascii?Q?VsnqQEF/iGNTyQxsMGd1gn9lOXdmOksmUJ2hsIizoEYK1rEHaxZy1v+qh6py?=
 =?us-ascii?Q?fY10x5/1XVSJHPeg4Xo6xHLymDuZi+tQ81pkK8YgCPC/nMgyUfxM7esV66Ug?=
 =?us-ascii?Q?ro9n/Xnh9hDVjrvKOW7NUy0B/WMyzLYdLGgk2arVopKEbn2izGeLPhGbylKg?=
 =?us-ascii?Q?8bbrOET5mmTIyoAuVSijT7pc2UjMhbVp7HkRN651bNoUniWIRRdnzgxphH3/?=
 =?us-ascii?Q?n4FMlinsVITilJd6y4rH1xzLBLt0jaIjGch1684MxoYao1HoyHBOMQQ2EVdN?=
 =?us-ascii?Q?U/dz1gPisDVgt5DLV74yGbEQD9GYhT7RzkQWg80EACBmRNf9UBIVBdW66CPf?=
 =?us-ascii?Q?oO0QIqYfz6thJcnEy0oWE498imCMHwI3GaGH1r4n+g4kKKfQQ4UoG36BAyGq?=
 =?us-ascii?Q?DhQdrDTPgFk5BvfZMVnrwV4p6TUM+1kHkdXxB8TYXQjg+Ew/kJhgtBMJ2KJE?=
 =?us-ascii?Q?sfl7Mz5yT2/VGlvoNVpCLP/LdYsGXvAVy4BTb7UnkrL3Rq01rHB+VRXUJxE2?=
 =?us-ascii?Q?CBGay0p2nuf54hQTdbIXpCm13r4502AVowQty8lCaFIC0O5Hy+jiH0muM97n?=
 =?us-ascii?Q?ARoBbeN7caP7Mxwu5oXL3PvgwK0vOCtCPF7d6oux/CHu7caFPdBA+LzF2OZj?=
 =?us-ascii?Q?scaSDgf2XzBkMNpsYzvfow9+vxOsxd5/oxiIZhqIIF9oSGQHdDG1GW7QQW7d?=
 =?us-ascii?Q?3PU/u3Z3nP6euj/7QG63JjHbO0o9anTjo7TS9fHHddeEzX2cps3Gvx7A14th?=
 =?us-ascii?Q?YTjMezG/sK3EMkMKbgwpuqp/wZ+nHOWeUDIRaVsCKY5SIg3EoEasb8B25bJn?=
 =?us-ascii?Q?uDSfz+Qu+5B54yzDLqLVX2c=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea83412-2a14-4ec7-58cf-08d9f0a0b567
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 16:32:07.9299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icJli7AobAu/jzsmKmnd66TtwkT0cF/WEK5LdB884eFUiPe05uQwaYt2zV50e0ogKlNDynIQ6lWDqc5wtPXT0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5695
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org,
 Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable interrupt support for all sledx_ioexp, so userspace can monitor
gpio from io expander by interrupt

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 08fa4c7b5ed4..ba9ac01cc585 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/usb/pd.h>
 #include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Facebook Bletchley BMC";
@@ -267,6 +268,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
 		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
@@ -330,6 +334,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 1) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED2_MS_DETECT1","SLED2_VBUS_BMC_EN","SLED2_INA230_ALERT","SLED2_P12V_STBY_ALERT",
 		"SLED2_SSD_ALERT","SLED2_MS_DETECT0","SLED2_RST_CCG5","SLED2_FUSB302_INT",
@@ -397,6 +404,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 2) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED3_MS_DETECT1","SLED3_VBUS_BMC_EN","SLED3_INA230_ALERT","SLED3_P12V_STBY_ALERT",
 		"SLED3_SSD_ALERT","SLED3_MS_DETECT0","SLED3_RST_CCG5","SLED3_FUSB302_INT",
@@ -460,6 +470,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 3) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED4_MS_DETECT1","SLED4_VBUS_BMC_EN","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
 		"SLED4_SSD_ALERT","SLED4_MS_DETECT0","SLED4_RST_CCG5","SLED4_FUSB302_INT",
@@ -523,6 +536,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 4) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED5_MS_DETECT1","SLED5_VBUS_BMC_EN","SLED5_INA230_ALERT","SLED5_P12V_STBY_ALERT",
 		"SLED5_SSD_ALERT","SLED5_MS_DETECT0","SLED5_RST_CCG5","SLED5_FUSB302_INT",
@@ -586,6 +602,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
 		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
-- 
2.17.1

