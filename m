Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E46827F3B
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 08:22:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=MUIo8EyD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8Mnd1TqJz3cMH
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 18:22:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=MUIo8EyD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8Mmz1DP7z3bnV
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Jan 2024 18:21:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XImq2nXgriy91eUw4LyKqn/phfQASQ6pophF0Tme1eo83XBgNGGFintRy30j3//GJEln1Z5HLTlDKVmJPxQGWWOF4xyALKM0vEU5HlOvLrn0ocMwVgbS+A63KCweVAVkGkQtae/Z7wNHlhygJ+UcqzFeR8fQ9SjfFAoT23jl3p7z21pMqu5C6XXtqQneB8wBwxE9DwakM+H4wOt88VbfdhSlJ3SWcJ/BOUsk6NhKUW+txRY+B20RHzFQnW/8YjiKUwiMwgcDv4xPb6zFQ88/XZV3ggcipMgownu6XTRbP4kDrUIoIvjKk71mDGeoqw7oZNJeg1xjoacs0LSF2loN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLNGMUNrdX1hlgNVJ+IEvc2cz3VhRE8IbJel5r3BG4U=;
 b=j8nqx6rPXMQAvIFPT3hqZ/MdD0QBltDtq6A3Tpk0riC02kRsuWkPbNKw91EKLtzYo7RQsrEtNvQp+9oX1LV3xfIQ9v7XEBvBmf93RBnGpi0yQxONwGGM2NUWO/iOPGWKHzNmYmJ3t4Oh5JT1WAFUxDt9QTOT4UAfwfhM5+bjRZcBVQGJCd3AcXPgNKI9e5ZHYgfq9Oxi11OKi2pfYuMUeKdTvD7oiKhDUYDUBC2Qh1yqn/esUmu50Wt7kOuD7LTA7nizVEOFGZJTKjaUsCcefv+XjiySFbyZHZVSLm6537C/Qk50mIowjGT+tzsHuP5CrHbXSMJLZ362R2KZUxUZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLNGMUNrdX1hlgNVJ+IEvc2cz3VhRE8IbJel5r3BG4U=;
 b=MUIo8EyDyzRGFJMFFMiTIpLhVEjAgh9pp8zVRCjZvA9ao6z5AwVbTTRydAkpuYi9FMGUx9j9X52CNDemUEluzHciUGukVmtfSTqg6PolkZSMKJMFLjEM9GM19b6KUFkueNGNQDAIxCvMdAvNnyG3/lQm9wT9OmyTtH8bCkqE8rgXdYBsdwmD1nf4JOjrbNnrfTRQgH07EIUZF/REGUpBD3OPnQYb658gLXG60bFhN2NPmyExhDWnxlguFtUJrVRhFzllHwpHKdilZNXioma+iV4aFXi2uYVooXFFgnJI/NdJKphLdMRZG4wKGNIq8D+Bg0SKEKleLCN2IbVT0gDcaw==
Received: from PUZP153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::7) by
 JH0PR04MB8210.apcprd04.prod.outlook.com (2603:1096:990:aa::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.23; Tue, 9 Jan 2024 07:21:20 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::fb) by PUZP153CA0011.outlook.office365.com
 (2603:1096:301:c2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.7 via Frontend
 Transport; Tue, 9 Jan 2024 07:21:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7181.13 via Frontend Transport; Tue, 9 Jan 2024 07:21:19
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v4 09/19] ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
Date: Tue,  9 Jan 2024 15:20:41 +0800
Message-Id: <20240109072053.3980855-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240109072053.3980855-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240109072053.3980855-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|JH0PR04MB8210:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aeeb4f4a-2c3c-4c20-625e-08dc10e3932a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cGWKtyI0YHsoqUSMzZlCIFIxI6afE7niTgvXw/5Bw8bdomOJmEaSmT02tTePVgKZloagbbLHzeCPFQVsiC1NozDO8mYwTChaUuZC1w/z8MhSfh1vODTnn5GNFsy+NR9tSbQz7q7JwBizHPjED0MCvObrsZsWp3To2qGdnCsRHCzIuhm7fnI+bgm2kcCf0xJeThdevuD3FoiqNgUSy/kQk1Y9l3uyT3po4ajWpkrxeFoRZEEFNPhV7tnXYuqVDfj5+JRqP32L+7yCSog3vLYeRwNTRBcuuCWrYZgh+9P0DTWp9GNPqwbRWWB6xAh0waih0/QEZ0GOgPfkNMTxbF/seftt6VhRK64NvyqhQJINkKDzNuG9Ctr1vH1WFyJAuyXGDTspFGT6LTYNDxErb+WIhK7AKtO0vs8W2rcuDAUqRoQbVg/vkimAzhpTW1IXdB6vYZN6Slz433RQR0GUqeRYDOrrsCCTfxUIV2QDofBVCuJDIwICto++Xx2TLrqs46psOPx1HcBdYzNIugSIbB2Oje3ArFisW3snvN+JzBQZHmhaZv37Vom+u0w+Hle7rx21nPeuqL1VhokwC6ZpcRajbNneqHepcyudKpT/R7kf3aZ03Hv7XMV/O6O4PaUw2b9e+G8pRu2jStWgFvQzODw2gQLvTepZk60D2ZfMFU8UYIZvBHYFLIaKdbzWm2ux7StWjX+l2Hb35jcYEwsqFcBjaA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(36840700001)(46966006)(83380400001)(6506007)(6512007)(1076003)(336012)(26005)(956004)(2616005)(82740400003)(47076005)(36860700001)(4326008)(8676002)(8936002)(7416002)(5660300002)(2906002)(6486002)(6666004)(478600001)(110136005)(36736006)(316002)(41300700001)(70206006)(70586007)(9316004)(81166007)(356005)(36756003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:21:19.0385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeeb4f4a-2c3c-4c20-625e-08dc10e3932a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8210
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

Enable interrupt setting for pca9555

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
Changelog:
  - v4
    - Revise device node name
  - v1
    - enable interrupt setting for pca9555
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 56 +++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index cbf385e72e57..4b23e467690f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -832,30 +832,78 @@ power-sensor@12 {
 
 	gpio@20 {
 		compatible = "nxp,pca9555";
-		reg = <0x20>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"P48V-OCP-GPIO1","P48V-OCP-GPIO2",
+		"P48V-OCP-GPIO3","FAN-BOARD-0-REVISION-0-R",
+		"FAN-BOARD-0-REVISION-1-R","FAN-BOARD-1-REVISION-0-R",
+		"FAN-BOARD-1-REVISION-1-R","RST-MUX-R-N",
+		"RST-LED-CONTROL-FAN-BOARD-0-N","RST-LED-CONTROL-FAN-BOARD-1-N",
+		"RST-IOEXP-FAN-BOARD-0-N","RST-IOEXP-FAN-BOARD-1-N",
+		"PWRGD-LOAD-SWITCH-FAN-BOARD-0-R","PWRGD-LOAD-SWITCH-FAN-BOARD-1-R",
+		"","";
 	};
 
 	gpio@21 {
 		compatible = "nxp,pca9555";
-		reg = <0x21>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x21>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"HSC-OCP-SLOT-ODD-GPIO1","HSC-OCP-SLOT-ODD-GPIO2",
+		"HSC-OCP-SLOT-ODD-GPIO3","HSC-OCP-SLOT-EVEN-GPIO1",
+		"HSC-OCP-SLOT-EVEN-GPIO2","HSC-OCP-SLOT-EVEN-GPIO3",
+		"ADC-TYPE-0-R","ADC-TYPE-1-R",
+		"MEDUSA-BOARD-REV-0","MEDUSA-BOARD-REV-1",
+		"MEDUSA-BOARD-REV-2","MEDUSA-BOARD-TYPE",
+		"DELTA-MODULE-TYPE","P12V-HSC-TYPE",
+		"","";
 	};
 
 	gpio@22 {
 		compatible = "nxp,pca9555";
-		reg = <0x22>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"CARD-TYPE-SLOT1","CARD-TYPE-SLOT2",
+		"CARD-TYPE-SLOT3","CARD-TYPE-SLOT4",
+		"CARD-TYPE-SLOT5","CARD-TYPE-SLOT6",
+		"CARD-TYPE-SLOT7","CARD-TYPE-SLOT8",
+		"OC-P48V-HSC-0-N","FLT-P48V-HSC-0-N",
+		"OC-P48V-HSC-1-N","FLT-P48V-HSC-1-N",
+		"EN-P48V-AUX-0","EN-P48V-AUX-1",
+		"PWRGD-P12V-AUX-0","PWRGD-P12V-AUX-1";
 	};
 
 	gpio@23 {
 		compatible = "nxp,pca9555";
-		reg = <0x23>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x23>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"HSC1-ALERT1-R-N","HSC2-ALERT1-R-N",
+		"HSC3-ALERT1-R-N","HSC4-ALERT1-R-N",
+		"HSC5-ALERT1-R-N","HSC6-ALERT1-R-N",
+		"HSC7-ALERT1-R-N","HSC8-ALERT1-R-N",
+		"HSC1-ALERT2-R-N","HSC2-ALERT2-R-N",
+		"HSC3-ALERT2-R-N","HSC4-ALERT2-R-N",
+		"HSC5-ALERT2-R-N","HSC6-ALERT2-R-N",
+		"HSC7-ALERT2-R-N","HSC8-ALERT2-R-N";
 	};
 
 	temperature-sensor@48 {
-- 
2.25.1

