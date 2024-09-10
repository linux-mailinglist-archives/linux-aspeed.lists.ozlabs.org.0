Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D5F972C65
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 10:41:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2xy81Z8kz2yks
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 18:41:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::61a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725957694;
	cv=pass; b=UJPGgYblXCpqbHsGgNWo5+aCvsxTeiJ8UHaULb0yHYnq2ptdwz/uS01K5hrVM98GkPYrpbV1S9j1u4JzqJj5XkJlRq02U1jyZeXOqM1kX2fYewWuC+jNMrgfv/LWSsI76X5ITGqIG+rOThF6LJMNMt8HignbwpKrji8taksNNdm5G3zci68VuJj5W1bV5uKoRniAoXXtV+QQcOfhr/oGQYq0pv51J5Y3uRMcMYNjLUiRfqGs3HDfsZ+pDPk2JVe1wfe+lcw+FiqJSi4CADywRjjEvMYww/5uaneFTcc5axgRVOy+r5/YzJnlLcFPMD8PRg0nMostIzB0jHlC1hYTCg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725957694; c=relaxed/relaxed;
	bh=NZ2MMSRPMIp7S0T5v6dauvcCf9kw2fsivDjeJnxpNI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=efj3lade351dwonXU6fYcacHMUTlqzA47ytj4vcSjxNBgwvYPieepVamw4n5PCAlSntYK83Z8hyHIsgtX7Ymg/gme9RoMcSHC7bBEAm3Q4Sgka6gpRI26s9H+nOkvY+GQusanh9j2hKZQWNd8ca0qMTwpsT+iKc+rThk+83TITBem3wNwbiK50RYsWWdgqtorllIhEwEkBK+SLayDDoKfbuQrYynR7JTSW39c1I3dnJA0KxOqblv/gj5h+T8mNwupOMzhrJDf+fZUVQb7B3kBM4+/n9VMIjFnWWoNoiGMQOidBEpq8EJbAvaW1lkq2GNEXgEFJCF5V083uFwhsoSBw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=TeykFZUH; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::61a; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=TeykFZUH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::61a; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2xy61K17z2yRZ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Sep 2024 18:41:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hd8jaIHX7/6oretVxZKt4K3+TJ/1koqEm62gDiD4iGybSUw/NbNVvG4+9Douffav1mfv2acRrAOxocNN9QXTi5EiS+pJTsXkguiWeAgeoVGq6VZFxbwSc0pES/9SWfTrEbpNYJ7/tvy3suaEkVAYlxq7XPO+kqH6UIvZo96Epq1notL1dSAinSkWvl6HE1fTmr1dWsI8bOVOTK0+JKtmHuVuWNJU85XwDHAUFoMylCC4LRh+JRHf7Q1zNNMSuOY59x0xliOB0QfKhRLpe8DKjo+pqGrq6lHsFhCGhm624Yjvg1oi8B2bkMqOC4iQ0KUKGE4Hmv7yADRfEYz56FKSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZ2MMSRPMIp7S0T5v6dauvcCf9kw2fsivDjeJnxpNI4=;
 b=uSFNzE/+U8ZjVuooX+DLhDRc3rHu46jzosL6WmdGZ/pf3GzKMXsNjYLfMbYCFQFHsBC9opxgCwSvrnq55j/0QurG4Gal7aOp95nU6W7rAVxAQZttrxcCY+UhGMGAI3h/B8v4h7ChLPhLEQno3b/OUEF1/m86fuWsVTTuYpP75X/TcQlL5HxdphGDql2vKLS9i8sA4DO0sclAw8VJ9SR9GbmL57fgbl/zrjp5Ke3lU5FLEGjGzQpPA+QvV9jD9A/864zVFySjVia0GcTP1Sy7vl1lIMFf+NuZoznBor6zdaQgZTughm9Mc67TZsAm9MVAgr/fnN8mFcfThlL01JwSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZ2MMSRPMIp7S0T5v6dauvcCf9kw2fsivDjeJnxpNI4=;
 b=TeykFZUHe4X8vHQCNynSwxYZVNRUZcAeiF1OR60mjK8udPYdszrSzB4ILsAbWgcuvFufZtJjz+fKxd09JyCOsiQv+KpmcbuJMkd+Wmvw8X70psfs483qvBzxTtZCxcaoHIL8ofvhG2OGkPIoG+skpu4mFaKULc6/tlCcs8UOTJ64BdI+L5HeFMnKE1jOpRvSnorVuHoSjtvP+4CYyTjLhSOp994IpFaZ9M8VuUdHq3P+dTVrOKh6TECdKuuAihAXNIY484nN0Wt5sMUovQZxK4zlgrWVoUWv0k2/tHy8tzIJLCrhA7Y+UwhYydABtrJrV6w2RFjSfqiPO+voGyudFw==
Received: from PU1PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::22) by TYUPR04MB6763.apcprd04.prod.outlook.com
 (2603:1096:400:350::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 08:41:12 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::33) by PU1PR01CA0010.outlook.office365.com
 (2603:1096:803:15::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 08:41:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 08:41:11
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: Change eeprom for Medusa Board
Date: Tue, 10 Sep 2024 16:41:09 +0800
Message-Id: <20240910084109.3585923-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|TYUPR04MB6763:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 66952d2c-12a6-44b2-0c0f-08dcd17452c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?bz8ix8r0ELABTMVtHC5ZRVv8RX/weueCHfwawWupsjcmZI8IoJoWlrcWUD0P?=
 =?us-ascii?Q?qzNhPAOgpSFCjf3qJNN/tUht1vS/IBkFYMjYqL7EVnm3c3eaJspj4d2z2WZh?=
 =?us-ascii?Q?MAcWqkNpsnHQ6t8AbS6sJ8y3mJ7KhCQcAtvbExYTS2pB2iWcUhKlvfVQSBt4?=
 =?us-ascii?Q?GiOgZA1LBb1AszfG6W6IswlYbFp2xpi1rbJIpzO2smkQz+z5Tg560zXtfghY?=
 =?us-ascii?Q?ld+NG4HT9jiCY73c5jCoZ7NfXEGL6B8dAvAKUwzBuDhsySbQiJ3vwIZQWxgB?=
 =?us-ascii?Q?fGZSmSsbYC62Ss0c16tQ9XSx+5lb9AjEVKydui9zdXqx0VnkMMdBmyTP3zuG?=
 =?us-ascii?Q?aXpnlRrqYYFUUvk9Bit0LAwI7kErk8eLG5CVcDPMQ/B44xbkd83l3upObfFm?=
 =?us-ascii?Q?2kLD1FccE3tTWMF5+d8/Q190TlzZ5vovSXRcWPVSpkHoubyyE07fRp5FNidH?=
 =?us-ascii?Q?jiuxglQAgEPcFTkdwCVoJpVfBDB9GooSrdBuxHl63QifsjPhTLQ0PaVZhIuF?=
 =?us-ascii?Q?4+jSKcQuD1LE7oc9oDb/XnyjFoO3VsHnFDtX+qPKi/mq6Ku9nwaQJCZFyUV1?=
 =?us-ascii?Q?WzZYUcIm5VEnp0W+HkjtQMV7WhtqYNlp6NH62i4yRyBJR9Tr8Qy9bIlDOHTL?=
 =?us-ascii?Q?n6l3NyA/IFjGbN6oGaLI06enYsQkfEHXVa+w8qAOSCaTumNt9DyAhJHdmcnk?=
 =?us-ascii?Q?c5zQIWwONCoZhLZuEQ90QtY/OXH0a7DG6Z5qy714UuVgGidLNaPfn7piRrZ8?=
 =?us-ascii?Q?tG34aewVfbJBV2CKXwth8nzww8d60NYO2UR4w06Qpx9wyBEQ4H/N5so6BbjQ?=
 =?us-ascii?Q?v+YRzsUbG+mD8RSsVj7E01mgP8W6JQsEVYa4oAVcalNeP4E2Sxx5aTE9QHly?=
 =?us-ascii?Q?1z9FyN1q46JE8I0a6tRpHN6NG319RUrvJSkgRIRRZo3JgF8og5D9ROAZza3M?=
 =?us-ascii?Q?yV87u6/vayg8bykaXnPIrX14axbSDe4Ao003Rgrj/KahcHyy08Yd+EmvhjFS?=
 =?us-ascii?Q?Qou3PlefIfx89cWhQVW8NL3CHrVeoff37jJcMTG9FKrf/SbYoJMc+evMR9jB?=
 =?us-ascii?Q?OvwZtJGN/MxlAf3WmCCjGtbcSaLlPksWtgNZrpYY+Og+Q2WmxJwSJTPNrC2m?=
 =?us-ascii?Q?b6jm4B3HyxBAhGPGZWJpAge3TgYr+XLDkbdyNfTRhaM/VJ456H3HrqcH6AYK?=
 =?us-ascii?Q?5ptqQ4Mnux5PP4ID6dt1gOWNK3Ku5RyMqfV2WZViwMJvyaYgYFZenP0vnN1h?=
 =?us-ascii?Q?roAYKpIx3gWSvZ+VvGqDkcqk4HoPfM0VFzQxKKtRySh5r6o3IGZOSXPtVnTi?=
 =?us-ascii?Q?sGa8wmLeV6a+YJZWWCx6qy8wsrMMGwxk+1VLXi932umLLt/6NYyIqguYcnVq?=
 =?us-ascii?Q?r5UGSM/rv1Btl1ifqs+O7ULPZkdh3e3cOCZ2605JOGRwdQEX3i2RImWfXxYU?=
 =?us-ascii?Q?rQ+iKDstRNbGytsjBhCtzOPMsatz4Uwp?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 08:41:11.2480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66952d2c-12a6-44b2-0c0f-08dcd17452c5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6763
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Change eeprom on Medusa Board to AT24C128 according to hardware change.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..398ffca58135 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -342,7 +342,7 @@ temperature-sensor@4b {
 	};
 
 	eeprom@54 {
-		compatible = "atmel,24c256";
+		compatible = "atmel,24c128";
 		reg = <0x54>;
 	};
 };
-- 
2.25.1

