Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0676D773897
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 09:30:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sfr9YF8e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKlGR0Q3xz304g
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 17:30:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sfr9YF8e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKlGG19nnz2yst
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Aug 2023 17:30:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBrUm03GcR1TzQFGu2zYlRnmykdYPaPlC6BnaWHsHEVIPeuoRPNLHF7cVO53OMUOgaXKaPWFl3Y3XDdiuNFIOuXNAO8HfiRHJmgMQnBbzI7e3rs80Zn4+1gkl1kCD83ZrqxGRlZsIA55pa1XZETHrK+NhEYDkb48i5F2+5nh0e7yUNR/yiG8Ht6RSOY6piGo4+rvAyBIAdPrmskqP3QMJsr3XAkYGSxE8OJYYyKkM+q/grgkXJx2de3up2dEa1hBub+C/M67BGscwh11P8qm/crrVR2xto2F7JbFh3LDFbJdto89rxbC/trHt+fmABXBYuhjjsyZ8E+EZt/lsQ1enA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdzFodPL2D5OTG9eKwxiAlh/bkPXqGEigagFOAhgzd0=;
 b=DKm+ZHAMLQmXI0ovTijs8AtuYc3Jg9vNfhWrkKYtL619MQtUQPHrCic8mYCag7pnShBWiEb0M6FEoevKxPI1qmG5R4NKuAGic1y1UkKiTZ584EsubkfflmaZT32zkCE5DR7K77chQ1H1AAy0DCIGIokzlaOWrwxb/z3p8ukLhzv6IeGMRZxo+VazdCd/08gyNAkBhv4KyjDir5s1BiW3Mc11Sj425nENG9h7IVXWEH9qXDHGar72SRBOvJD2J4JNzjTRuEeNf+QGhpmM3gEWEAvN3grq/ecl+oXxPoeSEbn+4XciCi/qq+i+yzrwjbYJlHmzO1eTg5R/6JFKRTe2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdzFodPL2D5OTG9eKwxiAlh/bkPXqGEigagFOAhgzd0=;
 b=sfr9YF8eX0zMJXMcX7MFJADvGkDBurGfEG8xNh0YixpptN670bd0gdw5JuK8f6k+SQ7CY1iiTB4oJ9e/qRsJ5PFShrAD/EdwB8FLaGp9mqs0t0IwznEtMrL3DClR2Ow4OurB6wVZfKk6ak7gGkYo0SSCuTfsiFu5xXxTiTAb4rEq3cXimbNigV9wcIywXPmacvGg31W8HfYteWitIDQjxPa72rMrehzxUs2Z2k/KDaWquV7lGPVKSTwJcm+WMLq1ucwpl7RAaItgSUo2JL7DpOPbSMjV0ZTcm4FQgCTaQju+jYN1AwQQxyF0jTuJmAseDTcePJsfa1zAa8IEN6SjTw==
Received: from SI2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::12) by
 PSAPR04MB4120.apcprd04.prod.outlook.com (2603:1096:301:31::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.27; Tue, 8 Aug 2023 07:30:08 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::ff) by SI2P153CA0013.outlook.office365.com
 (2603:1096:4:140::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.2 via Frontend
 Transport; Tue, 8 Aug 2023 07:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server id 15.20.6652.19 via Frontend Transport; Tue, 8 Aug 2023 07:30:07
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite 4 board
Date: Tue,  8 Aug 2023 15:29:56 +0800
Message-Id: <20230808073000.989942-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808073000.989942-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230808073000.989942-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|PSAPR04MB4120:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d3d0ce74-a875-4c5d-0a36-08db97e14ad7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ADD8iuPgJHynyUoGYnlu52WRHUFBXkHwPH46ArMMnsF4sXai/TwZVBXvwwp7u+p0fZGYVmy9cwx6/hiwytRwvbndYDROqWFNeIyaanKgGHdxPmmPLpjJqUUVK/QhwrtIgT+v6kIW9QoqzdaG+gExzRDSqVClnFYGC+XS828uyn7BxMYATrRJHi1WDUZvF2iaGpn4bb6jjkDrojplwWKIA6JG62nJaerKyCcrnydlawysPlbj7FecfwCya6DoHdm5Wooz8yXMf/97I262948P6jLLVb4fAEW+tResviBZT37HLzezHXEiEVwme9ovRmQs9zKiHIkxC7gwgMGc8Mze2IUHuEyKet2WrbZl3EzZDe5Nk5opJOx+GLAaM4TEYTVe2JDFkgBaKqiiEBP4OKqPQZnujFAn1vojd/eaRxWEzavDRNh/+yiZY1MGc/zAt3ETVqwMDJUVC3J6O971R6ZwBXgEHGUXmP3lct6jeafme3P7JyysYN/MYzNtfhmr7t/xmNy4Gac9TwaSYj2/rXyCfZhWg6QIEuSp1bQ//Wqtb4QokPVQiM6Ckgk8PDhjYjxvQ6rSMumjyWX+DGOB9ScOqK2GZWhDH4sIeoeSK86sdnKSFRTsgfGC66R9jZj/eVvUDVuGOaok8Gh4kB91DEVqHK19ubSOdxP3FZcTCpF997g08D56bje5OB7L33nHtb7jSoQHiU0VEMpJZPv5g/U1ZhMqyMFuvnjNOaqaZz7he0B/TqOIzT8FcwqfYdZSgovYcQoObREPPRssbkUFvKKxcg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(39850400004)(136003)(376002)(396003)(346002)(47680400002)(90021799007)(451199021)(186006)(1800799003)(82310400008)(90011799007)(46966006)(36840700001)(47076005)(2906002)(36756003)(4744005)(956004)(5660300002)(2616005)(36860700001)(9316004)(110136005)(6666004)(6486002)(70206006)(70586007)(356005)(6512007)(81166007)(4326008)(82740400003)(316002)(36736006)(40480700001)(41300700001)(86362001)(8676002)(8936002)(26005)(7416002)(6506007)(1076003)(336012)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 07:30:07.9755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d0ce74-a875-4c5d-0a36-08db97e14ad7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4120
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

Document the new compatibles used on Facebook Yosemite 4.

Changelog:
v6 - Change project name from yosemitev4 to yosemite4

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e0eff4c05879..23ee325bfed0 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
               - ibm,tacoma-bmc
-- 
2.25.1

