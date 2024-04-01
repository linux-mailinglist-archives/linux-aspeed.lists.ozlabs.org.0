Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA5893935
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Apr 2024 11:05:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=KJ/RMJWN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7Q8m3C4rz3dSn
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Apr 2024 20:05:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=KJ/RMJWN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7Q8c5yH6z3bqC
	for <linux-aspeed@lists.ozlabs.org>; Mon,  1 Apr 2024 20:05:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1zWC3qntVl8UxJN4QTSlYJ891mYJ8wKOr9QVlHYaODlZaW/sYsp5OnDh6e23yBqzphRDeZAWYyOpVkX2dkmAorF+/MFCYr9yL+EwosbnzdpuQasxE8BO58d7BqrT0r5dSAWPZFMIgNUNg7wN+A7iYyoNk9rPgcn7+uSDibY/MICLywAVNP4cAdYIIibmaVMLVeCf53ckxGVXhIy/V2zAa1lwrG2mp4LGTgqZjqwouZBcD3LTq7FmtFDDeMNFPBiuPvCDfJiS/0D5c/tfmq6HP1X0u5dmUnTxD7043Rz8NfYfTReThpuL12mtdBxBZlQY+0TkPWiZhCXWu5Qf34xGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNaTRdZSUzm2QXrYxi3weRbkR/sAovtVLZcT9wPZtwQ=;
 b=LueT6kYDcZUuQB7PU2UeYNb2wRLE1sw7HkCEt3KvmzvYycwqyGGZwtVdhZBeY3G+sr4cHWfuz4nGu5OOgGbtXi583Q4z6VixLh9X5C8d9MdzMkuFWiR2i4MeYOcZBgFFyTGbPUItuysvZUaKvGToSHdwrCUMFQyNqHWExMGR4gQmZBjWcIGYsoFGraadb9+cRAk2QT7BHOqjD9x2i2ZriTcAIEDofZ1k2gPviBXMIEv+cBWr6v/GuHj37WsBzX4N21W0Icqj0OJAObfOHa7jMp4PJaFDLmzMOMXX0BL4w8+fFtNf382opHgXeC6GJ16PFnJ2DfVpnWt0A082KYnaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNaTRdZSUzm2QXrYxi3weRbkR/sAovtVLZcT9wPZtwQ=;
 b=KJ/RMJWNVEEVPdoN46LClsx3tYkT57hiTQ1o65MaVrxxUOBM327tkdc0G6e1WrCYqakTKpwIMKq6UpKghdlMMhNvm+WVM1UpmGxpykeRO3l6hKsYH9+6ZcTmXu/FYo1zAXmPOoxnahy7U+J68llZXjq3lNZ+3DSReV134q1JzoQCGJleb/MWDFzjZZFAGn0dY7Hm+bE1irb8RVTKj0SFSE/rYKPeyNtV3LYzXu5b+MZWaj+b9qnMPeNCXnzfzhaxs+u3PlBgvCi3DKDEIOY+aXy+zWFZQs3RHdSzTc7yQ0OdeYiOWKSilVbqcLMIbMHMOd/FPlC4iRw9QPNdixkZ5Q==
Received: from PS2PR02CA0026.apcprd02.prod.outlook.com (2603:1096:300:59::14)
 by TYSPR04MB7237.apcprd04.prod.outlook.com (2603:1096:400:470::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Mon, 1 Apr
 2024 09:05:13 +0000
Received: from HK2PEPF00006FB3.apcprd02.prod.outlook.com
 (2603:1096:300:59:cafe::4a) by PS2PR02CA0026.outlook.office365.com
 (2603:1096:300:59::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Mon, 1 Apr 2024 09:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB3.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server id 15.20.7452.22 via Frontend Transport; Mon, 1 Apr 2024 09:05:12
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] Revise duty cycle for SMB9 and SMB10
Date: Mon,  1 Apr 2024 17:05:09 +0800
Message-Id: <20240401090509.2338027-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB3:EE_|TYSPR04MB7237:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 59b18d5c-b658-492f-f709-08dc522ad699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8MLNlkeVbdHWI8Vz7S1WUYF1PY2IaPpPLsz2/3J/7Hsrnd2SSZYZA9TL3Nr6+j/ySk48LxH6peUXtuR6ajbigC1UvUcpJ9IDdMFfUnxfQtsIx172bz7IqsaN8+hv+S4W7Cfpo1TjYo+NK+sZrm80rupexoUmcu3M7yk+f28JwSmsp1DtPlucy8r3iqjQnCs1tpffj+X81WZmacgaf3tLobLz7EcvSz4L6VcsenZzTd3aOMJjq26Jb3VzIZQmwaTqM8HMcRXrN5mnqDPH7DGW84lIB+pwbZp1CJXj5Ei6kqey1rv8j9iMCs86Q8pHB0d73gqbyaKwX/9oYF+pADMzE7vaH1WAQ7PA/+aze7fIQDpQlC3Jv42WIOaJrdYnOwASnQCRIO3Ul28OE1cCFw8hA+e5W6kZP7OcNx8llY6csy0lDJoSta3I59eJKFaZMZfdzkrZ287WOJv9X1g3Jh+cFQBXw7/zv1XvmP4i3qMENDCcw11ueD54L0QbX5/M8++IaI5l3VL+POqEmnlWU8HX3q6fE9aw9MqWtBBeXBWOFSW/7WjBhIVZy5wy6BwL9h1DwqTdl4DAZrSjHdUV07gepqPyvVm7Y+e59shAWNXTsu8y84yAg6cR6ocYn8lRtxh/d+KIypF8qd+yyDoMrmR/CoMVyMNSusmUWJYa0Pux4PZJTMPdst1XHDRoO58R2ttIooyd9Nk/Oyd4xSTwf5L+GvIrun9Buxk2uxlEQwoN1UgzbV0IsitEoVhlQ1DIUxEH
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(7416005)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 09:05:12.0255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b18d5c-b658-492f-f709-08dc522ad699
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7237
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

ARM: dts: aspeed: yosemite4:
Revise duty cycle for SMB9 and SMB10 to 40:60
To meet 400kHz-i2c clock low time spec (> 1.3 us).

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 64075cc41d92..b3a2aa8f53a5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -257,6 +257,7 @@ power-sensor@40 {
 &i2c8 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@70 {
 		compatible = "nxp,pca9544";
 		idle-state = <0>;
@@ -268,6 +269,7 @@ i2c-mux@70 {
 &i2c9 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@71 {
 		compatible = "nxp,pca9544";
 		idle-state = <0>;
-- 
2.25.1

