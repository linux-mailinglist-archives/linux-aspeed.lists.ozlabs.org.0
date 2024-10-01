Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C02998B6B8
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 10:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHrWN0cylz2yNB
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 18:21:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::614" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727770894;
	cv=pass; b=EXESjlQtk+Vw4I9igr4fIv5JlR4Ej1hgHXWWYREgpI6bC1pTTgIAjk8Po6Mph5sThWBwUE3PWDzTZ1g2+OX9VJ0OHt7F2EfLE/OZWPGmJsV6bvwmhDna4ilhtYgpdxnBTU7lONh7EqhKa7ZObSTfReFNQh3wYBsWigUupKSMya0vEQYSO011j0knB8l3yB5/RgfHpMnnmu+k06ehjUPci0GYzKNJ30MrkJRI840UkBFp832gWEQBw3QOVQ7g4Mzx/mFwvuZ5an8OVj3e4XA/BYAHBWlj2FRe3ptwaQ+EAZ4V30ij/q+s8nZ4LjJcGxJ01vpHQJoGfUyCrTq5beAWkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727770894; c=relaxed/relaxed;
	bh=AOYVVAIxLjGzudrvHzxQ+/GQr9w+AadDtRwQ4kO0X9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cz7gVjU4TIsaRzIKJZj9LmPP8fmEVGtkCslOC0XfPN9WFXywLZJ3da9a2g6t2E3o//wHNpgDfE95TWxT+1hpdgyBWjGg0ilnxrQNYt2YUkbSt1M6YI+SwzfNlawbF2ElW8kU5JQEfqqYgEhi8n/mbsQ2S+MOUHVpwJ2vN9pWcw+RMP89nfUI2rpoH5wf1vyMVIlhPEJgeEV8urW8QVClc/zE9M6Go7pxxselxWs5Bt00FgzBCL69fKjXwfsVZn9jbbDejceQTF8nSJkYMR0gqdqFV1dYphoxkQjxv4hPTzwJga68B+DiAihTHR7lfvIoU3RbieVisFgdr6T/eFCiPA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=L9cDWfTX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::614; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=L9cDWfTX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::614; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20614.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHrWL1DNgz2y8l
	for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Oct 2024 18:21:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sB160CGjyA54PDg0T0vI5Bvi2+bm6k4F0o77lEnbN2N0nyMDiaZww8sfO5Et9+HvZLgOzCjXePqYrIbQOdaGobF2qwy7a5VHeHE8rVwsM48yu+Vyht8137syhS/qwWandRVaAEgKve/afUzB72IdbQGrqsEOs59tGF9FbT3/+mZt9Fss2DW+yP4K5gvdY0jxxN9gJsxnVRO8NTl4brqHJbo37Tf41UOJ4GEX3y65xgZdQ7ORg3Yz6rWUPc1WZ2q/2zwhHJ+vd3M3SA7TrfMaZTcEzgYis/FQ3Hl8POfMI+7gUajq27vrtWJtZUfRBnLQeM0bMdOWtWUhju0O5GSMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOYVVAIxLjGzudrvHzxQ+/GQr9w+AadDtRwQ4kO0X9I=;
 b=gEJSAxuhQ8amvqel/fCNi8fIkPwYtpGdd4vKAF7gksC5VanALw34J65RGeazZq1k9D325pihkphXQykqf201cozdlgHdLfJkaC93gPWyU1txj0pf5fKhuJZyTrmYnw+zG4gqBR4/DTbO2tGkOIlPWL5qO3Io3OZVOayK8roDbzUPt4FQM5SGznR8xgsqJpccgpcijY4rw9JlnyfZ7QigheKqfYDvANIYprpGqR6WcpOHmYufR9rAn7do/FMVSlAwfOdfh2WoroIMhN7KsvSiOgMC9v5Vxg0C0+imVPxdtQvSyK+jmdUzwDC3RpNMdgFOhQR3rglIwjyYE+4OH24YDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOYVVAIxLjGzudrvHzxQ+/GQr9w+AadDtRwQ4kO0X9I=;
 b=L9cDWfTXfgTbWWQxDxucbfm9ZWgkPSr4K/cPVkQNXPiUx83AlVMlU+wGU4qFE9ZvfVJFH8RPPJ3jo8thkBYAMpY4u3UilHdz2oGA8vHtILbvy/XcXReBbPgyzTEy3pZLAHzeUCO2r1B5zXL+9UGIj2D/I6lo/qeInZk9e+UxPMRLnLe5x38EB9/yGgingeC71IuitqbYob1XyCNz017lPvcNNX/7oIjUGFLmjY8g404qlEljJW855zRkBmEP6qiw0NZoNszS8NqlR5Lm6QwZG32xn8zIRr9jZWN1nAp4/v9tX1SyegVzlMPE667cgapsDGrSUQHtGbtprcvZPXIKfQ==
Received: from PS2PR02CA0075.apcprd02.prod.outlook.com (2603:1096:300:5c::15)
 by SEYPR04MB5619.apcprd04.prod.outlook.com (2603:1096:101:5e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 08:21:13 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::8d) by PS2PR02CA0075.outlook.office365.com
 (2603:1096:300:5c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Tue, 1 Oct 2024 08:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.8026.11 via Frontend Transport; Tue, 1 Oct 2024 08:21:13
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: [PATCH v2 07/10] ARM: dts: aspeed: yosemite4: correct the compatible string for max31790
Date: Tue,  1 Oct 2024 16:20:49 +0800
Message-Id: <20241001082053.3455836-8-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241001082053.3455836-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241001082053.3455836-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEYPR04MB5619:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d69aaa6-8bbb-499b-f247-08dce1f20372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?G6c2qxm6AnqCvmYG+5xLy3+qywvh52tHR9sPNOHoDeaMtrPXSe5ynh4fSseg?=
 =?us-ascii?Q?soZ5/XfFSWBxZSCejYB4vSbYfYfwU1WdBKFxFkQOULIvp4Ba80h89woOKSFG?=
 =?us-ascii?Q?I5xUsm/w/NoF/RrNW8e8m5Ympte32T7rPkEqDQHT4EzhewHHbux8Z+bhToPF?=
 =?us-ascii?Q?oabx3IGMZwR+EVZw6zL4hMAVxR7rZKvDnYbKE2PhsWNmGBBLUQ5Tt8uAJTlZ?=
 =?us-ascii?Q?zuQC/WUK8b1DyWP52ngAzFwVm0qwDCD54bxZSTCA1B/+0kuKTK3DsKQexWI5?=
 =?us-ascii?Q?fmyZtXIvU7kx/bUiO1A3lBCQ47HgjvS966w8NCrZrd6qeBGxf/We8VczW4hD?=
 =?us-ascii?Q?VOBQmm/4b0TPTew4bLqHfm8UCaMrL+NDv8cWLGlRurDrS2w3gzsNrF8Ov8vY?=
 =?us-ascii?Q?tjSFBVccOYE3CfJOb7bQR/z/9ddLZQnBZf0SL1A60HKYQKAG6ZduJzbZrFt/?=
 =?us-ascii?Q?ziQeMyNECnVbNP+GkGBR8h8xg3Kqm3Zuthjb/HdXQQDaoBrzDxanbp8Sl944?=
 =?us-ascii?Q?IVHcKmYRxXW9eNUgo8DxlEwHWk7XIH6g5FsnmTAnA9PEKREXHDNxcBhSegIU?=
 =?us-ascii?Q?rzqJBZqMdxWVv+4xcVgl3E06F1xd1DxSFExviNglAgUh2F5mdvIrdITv1S1b?=
 =?us-ascii?Q?KkWKcaNujSvwO2++PfUIiRdmk8cvUSo6mQLv+vZmTrDtNUL5HWpKe9a3HdxJ?=
 =?us-ascii?Q?QjhA1P76dIGiDISlxUghs71gdjmiSdkbRhHScODlPNGOYul+yRIraDhUE825?=
 =?us-ascii?Q?GD7/KpF55oI824K/uTSGlW8r/hIm7n2BpDzHSuWNg0FM0kZeMUUUDQOJu7WO?=
 =?us-ascii?Q?45cpw8K+j+t5BHv9r4IR2ZfF0XxX22k1Lk+xSQ8QRYidtkih/tJ4xtYqcwUG?=
 =?us-ascii?Q?H7fzF9/yMmJqc/B4DzRFNfrkxYdOE3SUkCc8DKLa7eHCkp6x4fcvlgcpfacn?=
 =?us-ascii?Q?RY6oWe2Mp6xYE65UFSQNlyHmUtepHd1RGpNZeXCX8+aJ+g/I0AHE+AzNdsPH?=
 =?us-ascii?Q?TqYX+IpNFkVJ3EVY4woarP5KMTzow9OpoTQMTp8CSmv4RafT3cr1ElBBVqGY?=
 =?us-ascii?Q?OI+z+dMvV7eIj+R7oyWTrbHpaKZ5tEC9zFAWUI5cmySvVBg2mG0CnVlY4psf?=
 =?us-ascii?Q?0/Wp6Cs91KhZ96DJ5ureGlsRiYJJyRGldutoHECoY5dCWALdcUlhCVsjZI5F?=
 =?us-ascii?Q?A3Ohj12u15LSRNAkwNDLD9NIkh/yabVIRf88NyG9MwHLfv3K/8qopNOhQO38?=
 =?us-ascii?Q?jJAeOhznquTPohx/OhmLL63JQqUhOkeOS7ZtRy5HRgCLB0GaBVfi4CkJo8rk?=
 =?us-ascii?Q?DBakUpEU54Wg21BiUvBVuxuEer2DFmVEkx8lV5qErzhNW4BM8dPi/PAFC7rj?=
 =?us-ascii?Q?IoBpQ0XKA69V5co9kYpN2uuFIfYf?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 08:21:13.3624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d69aaa6-8bbb-499b-f247-08dce1f20372
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5619
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Fix the compatible string for max31790 to match the binding document.

Fixes: 2b8d94f4b4a4 ("ARM: dts: aspeed: yosemite4: add Facebook Yosemite 4 BMC")
Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index ecf012c9cbbc..01ee455c41b0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1177,10 +1177,8 @@ adc@1f {
 			};
 
 			pwm@20{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			gpio@22{
@@ -1191,10 +1189,8 @@ gpio@22{
 			};
 
 			pwm@23{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x23>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			adc@33 {
@@ -1229,10 +1225,8 @@ adc@1f {
 			};
 
 			pwm@20{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			gpio@22{
@@ -1243,10 +1237,8 @@ gpio@22{
 			};
 
 			pwm@23{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x23>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			adc@33 {
-- 
2.25.1

