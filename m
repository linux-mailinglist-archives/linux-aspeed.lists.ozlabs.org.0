Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73029881AF5
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:14:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=4U7xe3ni;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TXn1s8Jz3vYn
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:14:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=4U7xe3ni;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TX752WZz3dWV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSu0u4mYedv2m36Shh3iBWcES+TDAK0bswAl5adi3+3JzaJLENqiyGnfvajMLJcTGPcK3kQQ18kseHBfXHWz2+eqruMdEsbMPMgX6UF/Cah77JQPP8gZmo7H9maq1gIMx32Ego2cDMuQzs3EGaSnukupz/SMF+Zc2foOtyjl6ggbsivIHfkk9ZNa5z/pY/NypV5d2QzhO20mwUXR/V3lIaNKXV2IDgt+Mop+wei5XAKR7lTw7aeOtKAQNkR64QtMzzcR3+E4PLR6udf/dJRGPSDJRCYi8RIsFXSWH2GgKfzYiFzWtOiuIE90bh8PS/Co8JKuQlEjWr5NCY5IwOQlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXnpIj2eH8AGfWV6lrwwFZGZK/9D6DpLcSqQXWjnNyI=;
 b=QGcLf7F4YzrDWGjoAiGhnKztY9WIMDQBGIaPjB9r0Lm4Frlp5fKnnhtYXTqtJNYv+H9mlXUPuNp3SA2jBVIhsBpL3sMrixLyt4zEd8varI0mS4d2n2iFrQyq7kyMLD3FWfhwMGIK9dEZn1ikv4X50yOd626kv/Bl1hl80BZ/snANlR9n1nclyQOq1H7OGxVEjtgpd6cHpUXs3SggFgw8l8UiNHCC2IXeonnB+3JJ3NWSJjSuk+DyO4ozP29n0IHZwAv0xT2rbK9PLNFlrGYfwgzRwAsssIji7q7u3n9borJgf2rJOtbqXARE97j2xSa3L8gCSvih+fYMKNK1isfafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXnpIj2eH8AGfWV6lrwwFZGZK/9D6DpLcSqQXWjnNyI=;
 b=4U7xe3nivYty4gqunnAmwXuPi7br7U2PXxePTefsNfkY+MiWL8R0DlGi0o4p/j4vSFp2/BV/bdKcSQQejv0ggkb1dfa8zTt4R9H0CCrcoI2sOmzkoX8CoZrUbGALEDdZu8X9+1XwJwyAZVRRthPM7lcm6ZuOexX6bdjVXt2R4bCmtu7iHsxXXi4FXZCBh8acQjg9DFBtIOkQz/AsLYaJfLaNQ8UE7J4N2oFuVuvOC2eWEMg76o0i9GLfUll4QHbXoXnmfSRqZPdr0rZWFvJIdFi5P0gsa75E0oK5b7A0Myv9nY+eOC6ZdHcni3pyW+x4IpSEExMGExW0U882SKgiFg==
Received: from PU1PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::22) by SI2PR04MB6129.apcprd04.prod.outlook.com
 (2603:1096:4:1fa::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Thu, 21 Mar
 2024 02:13:10 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::a) by PU1PR01CA0010.outlook.office365.com
 (2603:1096:803:15::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Thu, 21 Mar 2024 02:13:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:13:09
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 10/22] ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
Date: Thu, 21 Mar 2024 10:12:22 +0800
Message-Id: <20240321021236.1823693-11-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|SI2PR04MB6129:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 06f578c3-0b9d-4014-6e40-08dc494c748f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HZDFQ1xqk04aLYFVQvTZHCALG0zOnEzKiVL2Ypa9Yq1ji6e+jogsX5p32Dn7O9k2z9SKXRLADcKTj5UTi9gDCXl2JSLzV4deH36ZiH/FTWitSHU4xUkFJkI9FXqyElwWINr10gU+2G40mSlXJ9R+HjoAcNYCpS0DohERW6znfQC8UrdZVC6XS1KMZBCMwfRd6X/aXeCPzjuYGM3QlLs2hSGe0dtp2FQJ1kU4Pmh7RMK2/9XX6hK4ZvG3T2E1UycyzYYmTcGYwG6NPPdc2p31yK5gwzQNqMspBGXe+LbTdA/pz3qQ3M7XWUaBRsy22OLxcT1yvCAagQSPJlHattyFPnG2ecw9i6C1liHUEA0dKem2ZReK3YBUMFOHm+Z5fZf10t9LFcK9Y4o85jDmS/dBZppUfl8uCaKZu6RFpyY2iCkOt5zMfUKVI55lgSQ1iw32ImMRvxlXX+1Th302pXLJbrFLNMbI2eiPu2/KVyOr+9ci/ys1zJhn3NT2vRS7eXKEHjeeklamlUoTHsrEnFMCodKOIE87F6pyb89725DfQovbMDWXKfbyhkbQLWtrDenWWhr+xCvHkdrjr4IjzLMa071q7xZqtrO5f32olUzOyKxgAjEJOFbYQl9bRjhpWW6Ex1yKwaErfAxyhpbZgNnkHY2UNIgJAf9gS8reUwrSBrlqBeAVJkPA0SULUUAkBEUj9TEzb95zoUihAQ958+Y0FZiMP5pnQbNQuAJhz5xFZ+l/Z5njpPn5CB8N789bUt33
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400014)(376005)(7416005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:13:09.9479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f578c3-0b9d-4014-6e40-08dc494c748f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB6129
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

Add power sensor for power module reading

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index d1ee5a6bd7d3..175bb5849e1a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -906,6 +906,11 @@ gpio@23 {
 		"HSC7-ALERT2-R-N","HSC8-ALERT2-R-N";
 	};
 
+	power-sensor@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
@@ -930,6 +935,26 @@ eeprom@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
 	};
+
+	power-sensor@62 {
+		compatible = "pmbus";
+		reg = <0x62>;
+	};
+
+	power-sensor@64 {
+		compatible = "pmbus";
+		reg = <0x64>;
+	};
+
+	power-sensor@65 {
+		compatible = "pmbus";
+		reg = <0x65>;
+	};
+
+	power-sensor@68 {
+		compatible = "pmbus";
+		reg = <0x68>;
+	};
 };
 
 &i2c12 {
-- 
2.25.1

