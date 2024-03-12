Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71367878EA2
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 07:18:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=09Fp62vz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv3Nj1crhz3d26
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Mar 2024 17:18:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=09Fp62vz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62a; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv3Mv6L61z3dV6
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Mar 2024 17:17:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StSVDf/nCcqpbpZt/XrKAkjmz+TGcU6PpsPyvOQ+bnkr/NmvQ51N3nuDlJhOw8tlQE7XANc/Jc+76pAQDt11xQ8Ch0do9No9MJzwyRHrPo6EoBojlHpXo8RH56DZdk3kOK0PZV6yC7mJw2yySwBKhMCjERhZBK4FkjTYOqBldytF4XR+rFoZoTgmy++BOj/sql5jIRwUuLLsDO6SHXIhmSdlCjnr37hLM8zCrUlk5y53aUY6CdpIC7Mbc4E0kqJyXuPMtfyr5+A6GwrOSk2FKFOvxZjpxxP0zDeTKp4SIcFPnw+aoZ64MQqbpZ2nd+vBzlc3QikN/lKbOEdPsvu8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rd3HIM5WyL6SNThkdGueerfKvyKQ76+KUnD7777t0BE=;
 b=ct7Wu7Fz+eazeLW9mXk3uIGP+CnmkBd0Nlq/dP6e11nrHFICwldbHlmGCQQDs16Wi4gKDsT+gwM/OivPDEuhAmnQoTHt3dTGtUDVShXLrX0mpq6m6eROaWeCz1z1vDd/FZZPLy5HMtR5/DtyiyFM2tloLydwAlIMR71GJmxzrrCalJXAGNb0BFQ/1Cgf06iw9755Hgpac+Gvz5IqU7qb565fYldj0LB3PL7u8VVEtYwhHeXG2jKk4XzGiFW2SCuE4djmgluVnc6EdzP2LlrcIolVPGKxC4IRPfv3UFmObePeO/buHkmbdh+bBv6WUNZBQtAlOeltqJMAWuzvBs7EZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rd3HIM5WyL6SNThkdGueerfKvyKQ76+KUnD7777t0BE=;
 b=09Fp62vzEN3WOhYUn+B9ghByBi/8V4hKMVS6U9lemX2PAB2h3vFsAww4osAawFrm2OemyOXjGgLJp71p1hWIBOET9bdCrrcETfcgfvVveJQuMHb46+C/evw322Qi0djiHgk7UjfnAnebBbCaK0JTOBGFt4GSCdyJ5PhPmx9Nm0YgAGvt+SkK0S/QuXNkWkuL9sRFvQVo2qU0M0zgRQmQOQmXK4mVU4cJ+DQG43ujn7eLOfXGy5PFGPDfSBAjEEwGAlImhCRGshcTFFpxw9zUq8igRz2/08ofbSRg7s4P5ol2D3JqTQTqgRIAwfSVatSBEZEjig079M1HoDyYRuG7AQ==
Received: from PS1PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::34) by TYSPR04MB7637.apcprd04.prod.outlook.com
 (2603:1096:405:38::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Tue, 12 Mar
 2024 06:17:13 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:75:cafe::ed) by PS1PR01CA0022.outlook.office365.com
 (2603:1096:300:75::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Tue, 12 Mar 2024 06:17:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 06:17:12
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v6 22/22] ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
Date: Tue, 12 Mar 2024 14:15:54 +0800
Message-Id: <20240312061556.496605-23-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240312061556.496605-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|TYSPR04MB7637:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 417a07e1-91c3-4b54-8de9-08dc425c0e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aJDAGWvgIafchb9IisdcirFuUVga15rQijMjQYWnQStNjWvDQ3adJ50CcgA8IdIbC1D5yUYzc04b29HBlR4MRZE277/2eJrcdysolkMjPl1+E82AMH/gLYcNnqXvpCr/mA4ByvrwPa59YHKYfi1MB2ahfh5xEpTZUjWRM6w9CEXjkxqWHRp6T2vAquohwcQX2WHIFUrzdY9ydBU5rBFoTW/uDaAba/0KIAXuNeEWmIU91/RXWogA6oyqPTo5lVkq6mXpyQwefRMNfH1qAapcVDO3Fhp/ojZXoZQDrbHwWelqtm3qJEM3fWL7CYGKERvtHVUehQht/8/4zTr28H8Cc3B7sigwH7raZNuPdU9TruDN/DmHjEiJbgO4S55EgboEsUFnV9lTu19org7KIBFjjbmD6TArvFEBsGkVBTz6y1GrCnVIppJQLkAwg5VDe08UZG3BDe/GAkOJiC8YV/b72MF5Rcmuf+un7osVEgm6f+LOOvw6dvsKaIZNN1lb7zJ6ekoYYrXEb26tRIp46Cr7PIEtvLHgM1jBb2Z8RZ5msh0lIxCAQH6sMRpoWq9udmBquviOQO4kC3jXkkOmv/oIfoJ3i14zthXLtfxbq5h/A7xKQolfZUY2Ur0zbgMdvwiF8QH0q5yE0jNnwQoGEnJLm/10ZUSUX7OL2vGLdxuGUAL+izhy2vo23xsJ/4CCgwY82wBJKxq0ixIxrvPMWRVHriFm7UnTVSEW4PUp0oU0Bkxm82czb1QP9I2pvfFM5Ggm
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(376005)(7416005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 06:17:12.5104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 417a07e1-91c3-4b54-8de9-08dc425c0e84
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7637
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

Revise duty cycle SMB11 and SMB16 to high: 40%, low: 60%,
to meet 400kHz-i2c clock low time spec (> 1.3 us) from EE request

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c2d184b21567..c86e4a5397c4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -761,6 +761,7 @@ eeprom@54 {
 &i2c10 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@74 {
 		compatible = "nxp,pca9544";
 		i2c-mux-idle-disconnect;
@@ -1306,6 +1307,7 @@ &i2c15 {
 	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 
 	mctp@10 {
 		compatible = "mctp-i2c-controller";
-- 
2.25.1

