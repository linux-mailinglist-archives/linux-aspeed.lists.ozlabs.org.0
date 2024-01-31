Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6684843951
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 09:42:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=INfMeiaz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPwXC4YS4z3bqQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 19:42:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=INfMeiaz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::631; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPwWr72BPz3bpN
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 19:42:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmdG2va/k9fU1mw6CclpYi332L+vw5C4Nl35On23A8ftNrzyTmFxtviiMXNUoaV13OFnbMJeDKYq4WgDZrf+Mzv3NPsFGdwGOCURhmeCpE7XjMXvjQMrKGRNCArLpD4b0K1ph29gWWFyxdp0O0Y7yjA9jsEmYZhQFryEFESvJ0YqbtIytMwiUXS95kdo/Jig6B4iJ1tkbmASZmSf/FpAwvt5iJ+9AaCe5nCZJ4eTA4cAo5T2O9LQaWotRNEF6Kvl5riYJ3dwytJ2QDfi86W86Ye9ML6OSCvNVdpE1WH/TW98tQCKH2ioVwAfyg8SPooALsmuUPdCMaNB4vQj/jDS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5ns+z/bWZune1KJ9Uhx7h1a0Q+DT0TnpkyUTwFsiqA=;
 b=GR5iY9baaKnPZrTTclfNi62QykODhvwRbqhMyUHYEOHWsE/CGM6XBy6z4n3Lu2BQ1Z10p9kGQuloH63aE1TDsePClE2usVuqjzw8umGuw/oLbJBh6/Q5BsLxO6uj93njEAp9P0+HlooTayDLFhx4gg9oqQFNUTKLMJRMBGgEXL8Y9xYzM51CsLakv0tVrM18hHR5RskzmvNExYv+4PXVoSsSDZP45WANfcw+CarsfeK66gF4x/ksVb5u9u8UsMaJpBXrVNMsGQqakVxrGZ2wJ1tqj3/mbtjUs09zZWcVyHH7HmB7lcZ5watoCwCo9VzDw1KYnDTWQK2j0+HVCh7K6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5ns+z/bWZune1KJ9Uhx7h1a0Q+DT0TnpkyUTwFsiqA=;
 b=INfMeiazihkmRGkBkTJTPnvd3vBmInp9SEUppRXqiRxUCO3cQ2QVq5ai1z9zE1y3kDambIcUGH/ffiIYdJBV17RxKsoApmHrfOPNaNNcwqzXCg0OzzNDHvFYMYrRx4vcyEewREOvgLBRV+xIVu085fy2iEmx6CaYMKCO+s/JrxjgC0OkLC40uRlIZWT9mp3dP6pidETF0J3KfiWNWSm0TzE9h4AAZqqGYJTLj72Z9JSY2FvP1AFmHTd/97q/oLx6ehh1RieAMDu6ec1OaIm/agm3WacmzqENclJ4AGP0lGjFMes7ud89ikDhs33mfD4MToAOxyl2YDBlGIad8OLoPA==
Received: from SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10) by
 TYSPR04MB7713.apcprd04.prod.outlook.com (2603:1096:405:5f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.24; Wed, 31 Jan 2024 08:41:55 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::a2) by SG2P153CA0023.outlook.office365.com
 (2603:1096:4:c7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.8 via Frontend
 Transport; Wed, 31 Jan 2024 08:41:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server id 15.20.7228.16 via Frontend Transport; Wed, 31 Jan 2024 08:41:53
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v5 04/21] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Wed, 31 Jan 2024 16:41:15 +0800
Message-Id: <20240131084134.328307-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|TYSPR04MB7713:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dba8603c-7dff-4310-0639-08dc22387a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	j3d+i25zkKGjJRtbNsNllnEQCs3Xd+MVZjDuTcVPCtEh3GgyXCpTjjb9TtXh8buN/kCiIM01AS7Eb2QwBSdHmcjUGqnO3i8euBMg238hoRfuNNkhvFoLkQiBDGMEj9L0GDdEc5xO9RYuPfqVx9l1WrEKwVW0jXpzXwpLI++OgJoeCf7JGYTF+ka/nacVyhADP27aKe9jSVTHt6xOtB6IoMfg/wfBZ7PB6Xm8FCCjYn2tKzrHDSEB03QimNYx+IJReIlmgj5323RQp81tmTbl5w5S9AgPYW1TvMdmPMIL9nKVm4DVkmOj+YaZGYDkObPpddKRIizF+ju7RgGsxog98twVir6J1T3L1kof0HDDKLSSZ+O4m+oYULcCT9FnmQqiKj/4iSIvLmgEwHlEl3PIQcbFqF9LSlZfwg1N7Poy7fwv4myIp7yrUs6apQnPD94Vt46ug+nctjJjK8sPEZMQFR0Dc78bx0nwglAPO2pB796xd6qcZEL3W39GcWrx1qrYQXrGwCGbvSqAtSr8xTTbA5fXPd1YlYnPmhSyO1QPsJJXrrjXbOc5PtgSMeOL9aOlTvQ4+RRSrp6QVM6mQM1viUSfvCupAyGksmeHc4j87ZKzRO/FwW44quQetGxuYhPhWn1UJtf8nEKWx6AST9FNFoenaTkFsB9N5kGo/qjKbujF0Luti3LjK14RoAw7TKiO9aYVozcMiCN2T4r2CnW70w==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(82310400011)(1800799012)(451199024)(64100799003)(186009)(36840700001)(46966006)(9316004)(5660300002)(26005)(7416002)(956004)(336012)(1076003)(2616005)(8676002)(4326008)(6506007)(6512007)(47076005)(2906002)(4744005)(70586007)(70206006)(6486002)(110136005)(478600001)(316002)(6666004)(8936002)(36736006)(36860700001)(356005)(81166007)(82740400003)(41300700001)(36756003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 08:41:53.8012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba8603c-7dff-4310-0639-08dc22387a87
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7713
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

enable watchdog2 setting

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index ea8fd3ec0982..f8bfdefbefc6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -120,6 +120,13 @@ &wdt1 {
 	aspeed,ext-pulse-duration = <256>;
 };
 
+&wdt2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst2_default>;
+	aspeed,reset-type = "system";
+};
+
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1

