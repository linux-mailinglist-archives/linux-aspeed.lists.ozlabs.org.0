Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226B764471
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jul 2023 05:35:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fWqUP2JZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBGcT6HQcz307y
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jul 2023 13:35:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=fWqUP2JZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::621; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBGcK5r3wz2xpv
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jul 2023 13:35:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQjumIzOj7KeLm00IcVw7GORbr4EZTYMeI72AulWdURxKoodEI4ZVAVuAnVxW4FLk5zYGDSJPZooNb/Db4vq5VT4FpH90241IwgJsVBD3zqLdYQsY97waK5jtHIQmrBuOwPIsztuXJgkSJRfRA02etke1zrSR4QSp2956mvFlUbmXAjNKHoujzaKc6tZxmHgO7eFqTRac91RaqPLahdvlrdGkLaE4VE/BovuKTRCnQlqp+nkHi+rYc+DyKOnntqAB47y2y0e6F5Xt4eIuOeMx0qxnHBSK7n1XcZywkgYA5YwHWwQYFEwGq/pNU8aypk4KtahKEe5LxxszWrsvgxAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvwKzWDypqFoyT/5pNg4W+cTRPm+3P1A9+KTXwD9dYc=;
 b=jWUMy1/fdBAyFp5HweyjvGfVNWRwDfjCKS6V+TCQiP2OpUpjdnVDykyNbvgZ9x7LdRXdip69dISElJZq/nRbNFLOUiydZpekladRDpvNQSGdDXB8QVeQBMEbF6LnmUo8O2+oXZWRnzB0OHb3SHp6YuBAbUk6GuBwNpzMRFbU4X6WA/BJOL0r1FwTD19nGjHE+WiiCp931SqCq2zovkvzVTKQPoybLndeFHVOmrL0c6ajcxYUuVDiX/GObzaLsIPZAQDXYaJ7/rBsIc6zYhkVqchHWi064US2f7woq6Ovc7RZ8G/b0p4iuaR/tcCIVX9ceoW5+DDFge4Ew6oZLTrzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvwKzWDypqFoyT/5pNg4W+cTRPm+3P1A9+KTXwD9dYc=;
 b=fWqUP2JZpPxufR2fEHOwJwx6UNEkzI3GwCaapzMhM3hxtzBp7jFMudC6vegRUzeZ7LmTxvaU139ENOFk4B5ulWcBs7sPnrqKYTjkSS7sAv4/mpqn8DZNGM6tgsuuzwatK4FT9W8gMtTDp2+KsMN92fqpt1vTDazgo2PLQcIvyC4XQFEnn/fnG/dSsf+8OFBILPsu1g4XI2T9VOk9y4z/royp86H0H6Sjq/Psp8bMx9jsyew0/k88eClMQKwbNCT1t7VXK+TL9Z4tjLmz5I/+CB/nrivdJX62bXghDwKOjXPN2xroXyRPDLUtLxJtAp1GssFtEMB6kwFCXfvDHFEiAw==
Received: from KL1PR01CA0068.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::32) by KL1PR0401MB6609.apcprd04.prod.outlook.com
 (2603:1096:820:b7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 03:34:46 +0000
Received: from HK2PEPF00006FB3.apcprd02.prod.outlook.com
 (2603:1096:820:5:cafe::30) by KL1PR01CA0068.outlook.office365.com
 (2603:1096:820:5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Thu, 27 Jul 2023 03:34:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB3.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server id 15.20.6631.24 via Frontend Transport; Thu, 27 Jul 2023 03:34:45
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite V4 board
Date: Thu, 27 Jul 2023 11:34:32 +0800
Message-Id: <20230727033435.1904180-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB3:EE_|KL1PR0401MB6609:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aa38e969-0bd5-45e5-f487-08db8e526c6d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PbRn/u4NZdFO0OSJlYJa7QpEIO2rtj9p692Y5q/YkegTBZcBRtWqz52aMOQX42blpA5GT5psqyiGN4spubsgCJLySuvhwzrI0he3TJuiuCF01I2rIn/qb49iPoOHIHnSu2tf6/FVVLkvXHK1SFwu9NrV4wOiFIfYJvFmK37XSPQWABnPN9lexpNWflVGGV9fJs/3IgoIyiE0QZTyDOlohVPfmCNZYzVB3UdY4ybJb1TL1VKZw6NCMW2Z6yD4ctZ1rQEpcfmgwUK4MXa+UszEAPusDIeJZjoav43EIzPK7SYHenKwV/Atk5S+pYUrg+Ywi0MF9ZUvZvNyGp/iVYnbamcjgVbLuGosLW+SRDzxCBKVYbHVxG0IWFtmYWt2n4Y8ptQsBat74eMHiltcUmJ17Nbw4I6J8ZcXlsUYuOOoo0OcrKJFI+Scwp4w93fWej1jatUblFsfXqeESAk98tMUbcWPBAwy9RRQoO7O9L1o2d9VL9rV4eoC6egt6LgugvYxRBjWcsf/JtDgRn5ESHe6ISQ28ByonOLwZ3eXlop+SJcVnaz5M3axxyCLRd8SgnYvFyR9BZZYqYEWxf3Gs+CUZtGqsXqASZO9LJo5rexb2gay6z1+lW2IVNYFsXF0HjPC7dStHpgy8E0YwErBgQDDH8LkVVPZwIoLrHgwVpn9IJXyydm2tqmj7Iia2zaF2Cs9xHVla0VA4Y4+viwb84XEdw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(39860400002)(136003)(396003)(346002)(376002)(47680400002)(451199021)(82310400008)(46966006)(36840700001)(6666004)(6486002)(478600001)(356005)(82740400003)(47076005)(1076003)(6506007)(26005)(6512007)(4326008)(110136005)(81166007)(70586007)(70206006)(186003)(336012)(36860700001)(2616005)(956004)(5660300002)(7416002)(316002)(8676002)(8936002)(41300700001)(36736006)(2906002)(4744005)(86362001)(40480700001)(9316004)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 03:34:45.8321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa38e969-0bd5-45e5-f487-08db8e526c6d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6609
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

Document the new compatibles used on Facebook Yosemite V4.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
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

