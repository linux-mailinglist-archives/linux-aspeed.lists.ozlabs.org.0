Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 811F18CCE08
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 10:12:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=xhz+jW1V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlLLq1xhZz78xr
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 18:05:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=xhz+jW1V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlLLP45Klz78m2
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 18:04:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+tFrr/bKb2Vv6dMuPYULJq6oDRTM1EGQxzKZl4KPfmsXckPpn9jfxgBFYV0hKfzVhLqPoqs/2k5dB6j4J2ge2HdzWIKyHoSS5JqHl0k7HjSHoxL4APUqxQ+f1PgX8Z17rDWQnB/nmMRi+YwtS7dhvtSBGZ29xuHcArM8Z4qOI5eNHZHWPVN0q2gG4Jfausepn9omiS/St8V2rL3vgJsqSwIp8hNeAMIC6OZ4z/eq20hV/vqgsR1d1TnxpI+ud8f8E0czWPSoJEIOJLfyhvKrFKN0LstMTglppAthB2Q8sYCNDtbyveQcLN5BC3BhH+fzdx771fEERyKGuVcIAr0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S11d+Rgg5XKlgMlTPsawAewq2X5TMPnusGFqrYm+mrA=;
 b=kI3bKMDPLWbk6RBYcQiHjwmNUCucfIproInl3Q5WK+gk37i2Zhzvp3vIiJIURWAzltTcMqe2+Ul+pCAufffgu1jQAmaVdjYUn4xJDqXREnFC2PHuATNN4zPwdU3cMn516w6qyMD6g/Dw5YLduM+4S9LJ2dLkWcLbcDajh6TWo547pPj1u5u5U8idnu/tyrKrjH6vq41zCGcaD+8VhAGoF0qnOK/cveJRGOxXWs8eMhX0iOn2qL0ivHHRCkQiU1E+CW65gMCQxMQAcgzQwSX1bTCRdaqexFHEYbdh4vclaKWdISvp9uChL9OSNOP7eq9ltquLJIFjZd4d95cbJypCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S11d+Rgg5XKlgMlTPsawAewq2X5TMPnusGFqrYm+mrA=;
 b=xhz+jW1Vk0KyOkRtjK0EqlBrwKZbXfPYL5MVB95rgC6gIHAJ2je+WDg61W2DMsOL2R7z7E2Z6/KkgYylvpIn0yvfTC9zwy8s582fK++OrVbKyMHKfKNdNX3xo/U5dtudERezNhUgPlZ9HFrxkDnBCpeQtgCiACBzKLrT2ocKiVF3Sys6oKUFV2fg8LBj5SRrkL/qVgH1uJVXWWL3gXI8ucbkXrd8zmTuEK3V/2ow3xKJ2xqQEEMwdS490bQb162YZlGzKBrGB4+4vU4y037fMq1f51FrtdmZNaW63F5l7rdnHEOaZa3vSP8oae0ypKclnaGtb46GqzJ8iN5DSHxeYA==
Received: from SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32) by
 KL1PR0401MB6210.apcprd04.prod.outlook.com (2603:1096:820:c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 08:04:26 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::73) by SG2PR04CA0170.outlook.office365.com
 (2603:1096:4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 08:04:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024
 08:04:25 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 10/23] ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
Date: Thu, 23 May 2024 16:03:15 +0800
Message-Id: <20240523080330.1860074-11-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523080330.1860074-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|KL1PR0401MB6210:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6edb7e3e-f13e-4f04-3941-08dc7afef6fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|82310400017|1800799015|7416005|36860700004|376005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?LweRbAPssIX6HxSnSjguftoX5+vR4D2KIibCJYMHu8tnVQtUzRXcvsQTJYNm?=
 =?us-ascii?Q?8uaHh7fqMmmUVNmJqutOpd7yuEC+5z7yesKs3YC5U99fHY+vWF4po+0VXPdz?=
 =?us-ascii?Q?PHuxm9tgZpNaOHkS27rH3URzMM5+nMxWLFmtsmVogsS+THc+MiWMOkQ/2uoU?=
 =?us-ascii?Q?ciXpUj2jOh6QnAr2mYoKcTZqmUP3JrXQUFwBiCPM6LaKAV4FHn0emIsdzc/S?=
 =?us-ascii?Q?b9ko2b5Bn6n/wQRFDdScEKtbaEVSFQ+Fp0ITMBb0XqL9d322vDzyZoLzYddq?=
 =?us-ascii?Q?/uM2R57tk2zL4bpV9pN81Vk3Z7WuCillNrDrG6v5R1wKdKuzaYM8Cr8o+eSY?=
 =?us-ascii?Q?JqUa0yLj8zm+/HUmFw+quVlwGgLF3bsK/OvJNjW817gM8kPZF1yPdZJ1SE3X?=
 =?us-ascii?Q?DfR0pXKlmcfZmOk9QaMnLQd+bQCny/GHfjsEPucHwxfkJmmAgj4KesLWpucH?=
 =?us-ascii?Q?gu2oq9uC/UDRwm4V6ZTKYWeUe9iIuIZ/Ux8X7g86faC0+7ZoOTMVfN9u6Ask?=
 =?us-ascii?Q?CP0LYEuSx+cjtw5N0zS3JNaHzmxEzoshccaluiXdKlmSmGqv+ZgNpz0DM540?=
 =?us-ascii?Q?Ee9Ad/LHgcvjgl9CXn96RC1CZxiEp48ppH/TqW11vpROSSxfgvmdPwObWX1e?=
 =?us-ascii?Q?dlSBeh+AdReU5pytuN5qoTs8wzAy8pHC9oYTRRZOKQhM4gurEBIzNoLtglpW?=
 =?us-ascii?Q?Uld6uwkjaRUxBzLLHJY9KiLa+jMcSVzW0YCpVMw/yBzag6nDYxu6tk2kXX7z?=
 =?us-ascii?Q?lWp2iVII59aeI85VEXIv/rHIS7P6OiNw8uW1sYPl7jOaGFa+kaJ/mQI6aeEi?=
 =?us-ascii?Q?TMvrsfYjNA2ZLIOjEPbxS2BCzPSdDpt1Rvos7W7iTQhMiE8MVBH+gmPKEwNb?=
 =?us-ascii?Q?TjDz/Tvlvza0uOp3puixt2qp5PhKgX1lJrvOuSBsCGu+q/wavCR1N7oQsChC?=
 =?us-ascii?Q?aPpnW32nU3cKoCwCvV18H1HW7WPwbXhELq/tSXlScjAd/CMcHNcywvKUfv4v?=
 =?us-ascii?Q?rxOt0ZOyW5au5bDjacEOJ3NnaTh+EqAAva5Qb358TM8/ynCuryBuiTWqy30+?=
 =?us-ascii?Q?OaZHBxZ/SF04HcyneEMPQcS6TraPD4GR04A9d4Od/uz2OM4MVd1QETdVO6w8?=
 =?us-ascii?Q?PIkklYKQPwdUr/7uIFQm9u79sNmV2a/+qeN1ugkjWAKAWRAhmM7F4yUYQOnC?=
 =?us-ascii?Q?rKqcHR0tO2TztxEmYzlqIFtSUVCaeDDKCqbBo/Wn7aajPlV/XS/Y/hX81693?=
 =?us-ascii?Q?4HGZCks9rCCtMCp5XBT2xSY5GpcS/bSKUL6WpnmjqdnYgOGukbKw9a8fFk+G?=
 =?us-ascii?Q?rGYbZnsWWoxU9wljxKQPRwx3F2uC5QlFyNXJQu7ARG4AlAIdPe3kNrTwzyQF?=
 =?us-ascii?Q?90p6jeo56RA3Wo1BmjvklhwXKJ9F?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(7416005)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 08:04:25.7342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edb7e3e-f13e-4f04-3941-08dc7afef6fe
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6210
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
index 92733a8ecf0b..2ac872878acd 100644
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

