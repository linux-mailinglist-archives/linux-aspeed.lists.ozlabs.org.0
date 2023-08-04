Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F7B76FE13
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Aug 2023 12:05:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bJ63zLMx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHLtj3gkdz3cM4
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Aug 2023 20:05:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=bJ63zLMx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::610; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHLtX1ps9z3brg
	for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Aug 2023 20:05:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt7FPNI9gx/IShYAGIwR+H4xuy4UGD0dT9u2tvYBzt/JxjZYv/2t0qQ6eI5ZFncNYIcD7xg13GE2K9wOek7dEf5K5V5TLe5RR4XDBqcvwqZCLaJFWfsT80Xf217V+hOuHDzhb5ihm2jj16yWCstT8w2t5v8qWjf8VozTDgLBXLABesfxVHsJQdn7vOw/dzwtI9XPfS4BV0nstovrGB2tRdPVh3CZ+4bQ3qUMYKwj6vOigFbFFtbbpxbO6LEQZTuIX9SxGCBsV/P2zZ+5dzI9786rSwtkoFSLng+ekfZqyNHSyVTEOf8uLNyn7Na1QOtX/jvJ/2ny5Dd8qVBBSo40CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CslGI3EcBYmKKbHK4uoj2nZe/+uviADL4ZIfa2qQTQs=;
 b=PsmG5yzsE/1Rn8fMg+vzgeN0SFy4cUD2IPfYCs+FeaPZDjg1toDu7L4YFVy+kBPcTT74emOA3PrQDe7jX5uLQRzJLH/9Iy8UD5ELu/xSOH3CM4K7o1SC3AOFR9VV0oLELAY8lac6AMmuSUr372WuAuYMz14zrpdzXZ6gMjRuNoORcaeInCgOqrr8kAY2Q0QlgJvfvj5OITnP0ViFRmTMvwhKjOl+6MADI3MEd4e+8VEhrmrN2VBgjbxumprnfyl9LgCxIIgk5oTsku8KmO9TvrTOHHf2ZruyuRy0cGsMckaRRMLzdhdsio5dGtRS0cNndIBRoDWnI9QfkakMjgZ81g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CslGI3EcBYmKKbHK4uoj2nZe/+uviADL4ZIfa2qQTQs=;
 b=bJ63zLMx38BDsIN01hb/8fLr1rVP//kUXWD2njboTLniVPaGM9VWeX/XRj+phPIpOnINhdAIpxkjP7AXEnxFTmh7j7VTZ2DDfECdMIj6iNt7FZpcN0Mu3WLXq8CNHkLzRMakcMrK+oKPzYSEhMJPKOKWH/jRM+aLIZ8oCPXe30pix9IdPR28LKYnfLTaBSwWugt+zbGlVUoORMatPisMfRN37TffbgjS5f9+OLIR8ILxx3yDxPAHwZcBInkn/OqbbXFU1/E+FxgR/t8VNHKayDaiVFMF5p1dS/GuZ9vmdj4uNW/ekU6b737CIX8zVG3KGMsY8DaL9ypUVgtibyHRNA==
Received: from PS2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::17) by SEYPR04MB6847.apcprd04.prod.outlook.com
 (2603:1096:101:c4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 10:04:48 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::c4) by PS2PR01CA0029.outlook.office365.com
 (2603:1096:300:58::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Fri, 4 Aug 2023 10:04:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.6652.19 via Frontend Transport; Fri, 4 Aug 2023 10:04:47
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite V4 board
Date: Fri,  4 Aug 2023 18:04:35 +0800
Message-Id: <20230804100438.1983745-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804100438.1983745-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230804100438.1983745-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|SEYPR04MB6847:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 86a58a64-f287-46c8-5eb3-08db94d23c4e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IC4+23aCI0od+79UwgA+W2jH8bvUpL9MS57+QZdpQdOcF43sLIY6zy3WUOSQNlVLw6MfG2/RfSYm5wIILJmxlN8NcQG0bG9wfGI9zGGcGWnMV+/d0tW7ysFQzJ2eZhQ8FKDmKHVQpNrZ3mrIKCBZDIU5KrSuXM39fQw0Tq0uTLQqQcD3be08X2RaiEFiD2hojpK+2UNLhu2FPjPj3EcVFhah/3xF/JmKdh2lsKHMg8FC8DlOayMravRGQfdD8Yp6O7YtGEMmMWLtZ40En1fSadGaFS0I0HgVFcm5gbeHKzMwkpjK46/2d/XS8T6EN3zK5G6YKa+PDQNbKeqdXsrWZo8USPvOYGVZgYWBOKshzTaiohDcRiUIgAUSO7rIv1k9n+chjo5yWQ8QqKDc6pyuZa4IIsHuVDIMCi+FWAhLVKrSUTKqFCwooARhVw/duZLrpLuVbDRwuuRksPVPuGewy40qbzuJkjUpMKiimmTmcto+WDJRFQjiVDvTkqsuGQ6EqIPT1ZRLrPh1JOkhRB521GPsbone0u2k7jhOjbwbD6qYpkgNBmIvOOV9k+Rq2rDddCkOcq5vYvDhSTTRdupio0NZDIX16J+e8fL3rXpFWIb5jNiXgSLY0eI1sCo4RmnjVC561FpgXR1d++UdEEylzIQ0mGOklNUbhwy1qM+HoXqlbDdxCQpVsYThFsB2Bs0jIwgUuJasH/Qlsc90fhJ9nw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(396003)(136003)(39860400002)(346002)(376002)(47680400002)(1800799003)(451199021)(186006)(82310400008)(46966006)(36840700001)(316002)(36736006)(478600001)(36860700001)(2616005)(5660300002)(956004)(47076005)(7416002)(86362001)(2906002)(9316004)(356005)(81166007)(4744005)(82740400003)(36756003)(6666004)(26005)(6506007)(40480700001)(1076003)(8936002)(8676002)(6512007)(41300700001)(6486002)(336012)(4326008)(110136005)(54906003)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 10:04:47.6212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a58a64-f287-46c8-5eb3-08db94d23c4e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6847
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on Facebook Yosemite V4.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e0eff4c05879..2ef6821e3648 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,yosemitev4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
               - ibm,tacoma-bmc
-- 
2.25.1

