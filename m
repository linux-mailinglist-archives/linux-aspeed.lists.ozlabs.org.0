Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 84AA68CCF28
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 11:26:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=axxhwC4G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlN0y0kqlz791D
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 19:19:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=axxhwC4G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::613; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlN0C6tBJz3wHq
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 May 2024 19:19:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neJ+2hIasBh8s6wNgtjQwkcTUlzHUwNhZeRi7btciniOG+6r9+DHmmSoa6qOqi1wyaSKoTrkRM2P5x04BrxhFuF+eSgLCAGMcR06nPaUdakLGNKUpYhSqB+iVHk96NYNto+/r1rT9MdAsO8RqIffv/MUuC40r9cqABSVt6Nl7DYpnncsnFnkl+asHb5iYYZNgG5WB6yDTPHTNrrVpqU51LbsqP5Wg9K5qAyquXUVI8+R7HrqhSqm5y+HXA6rjXm+fMXd5wYmtyUfH98RUBgpYkv8SpBgVl8PCOVqvClhzgpvJIj4Cs1fp1Ab0oYsgHkMIUYTYyjGW8b+3Mn8C5sVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S11d+Rgg5XKlgMlTPsawAewq2X5TMPnusGFqrYm+mrA=;
 b=GNXwFbPSMcHForP9N2NKfbC9q3iMklUQFKTd2kY2ogZhqQ7Z7sabvt5YW/Y5kpboNNCE51C5jK1gD/HuOHA2ZS+NqYcxg0aalY7Ocn6qG1iyc1Ppw8sWin3GJPjCsu7+7j8J6BwL8RBUtHilfwWoeC1IJdA14sEI/3Uogsv5OP8TMmLZsikMyWuETVL3zw+qAa/oVTH4fj+IlqElEn9odG35djm9bt3i17kW49EDqpDLBf2V3UmQN61c7ss6+jZYXufrdQ66nCbQ5krpySoPWZcEo0U2ct0KaqpvMuKRerlKczwXPOdMktHNXlzZ4rHF0QFkPPFeh+MNssSQHDxuag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S11d+Rgg5XKlgMlTPsawAewq2X5TMPnusGFqrYm+mrA=;
 b=axxhwC4GXvwRCE3KoBEJj8mMwLeATvRWXQgo56Zv4butlh3/pPO1hyAoC7FBtaleYTBdPI3GUAZGRrQU0AAvMghursuMKxsi0xdLdQikolvvmd45w9TjwguviR5B1cQjEIjfv8XxgtAvv/t/ROoiuaXDMdraFe8sRR+hnlvp0mypZMB/SRQce1kv4z84MMkkvZBcCfdgxJ/Kj6Dq8XgmDgq68v/oFO08JTiwvFvEKvpaIClh1oFSB2EKLhJYQBqHe/SH2OmHK5eEqdLwsG3nSDd8NeT4CCoLA1XVboHSpGzvEGSQciUY5JF+lIo1ZXvKlBmPYS6foabUkJVfvN4KjQ==
Received: from PS2PR03CA0019.apcprd03.prod.outlook.com (2603:1096:300:5b::31)
 by KL1PR04MB8143.apcprd04.prod.outlook.com (2603:1096:820:142::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 09:18:50 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::a6) by PS2PR03CA0019.outlook.office365.com
 (2603:1096:300:5b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Thu, 23 May 2024 09:18:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server id 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 09:18:47
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v8 10/23] ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
Date: Thu, 23 May 2024 17:17:57 +0800
Message-Id: <20240523091812.2032933-11-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|KL1PR04MB8143:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0e2f95b3-bb63-4a5b-0631-08dc7b0959f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|36860700004|7416005|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?z34dsyFtcSOmYVgntdMArFMYSsJ+mgbXfj/SFxHmIgPcnhVITcUfDwg4i0qT?=
 =?us-ascii?Q?ai8hFn8hn2H1DI62TE9AjPndaEOaRJWdP8snZTGgLeZ6mtUqJwTGDcNul0Nl?=
 =?us-ascii?Q?rh3NHFxBXZaYWwxp6Aa2D7mhDTa2ycBAm4o5taGakRRoffqUYRWu3j15+3sR?=
 =?us-ascii?Q?QqqtlDQtkxgHypTAJO/Z0MD1DwM0kSzV+JMPZ/g8N2lhYDMWKLuJYNVRNVBX?=
 =?us-ascii?Q?axKoEb4yS8OMPgTO0kmkBTbBW3VKkoahPjUrWXnIDURFDrsb0PVbamV6Rn+N?=
 =?us-ascii?Q?DTXN81EiFel5zOiu38FudCHPTRnh3lbudKQpoNAnFrqaEnQye3pVTp9u1XPa?=
 =?us-ascii?Q?eYiqHNFzeuIZvADyCHwTV9yzTDSiDu7i9JYbATD6iXwThLy12gI0QRuvXcr4?=
 =?us-ascii?Q?qyDaAUTSZmvxnyaVaaShwr2ILgF1P2080CXjsG0DhJxjmrK8ALkj7y+oGpxI?=
 =?us-ascii?Q?Dhd0M+jvWbwojTLbrzjF2/GfYOVJL2Bp6MKv+qKZ7fokPGLyuFbPXY3/MIL+?=
 =?us-ascii?Q?652kzf/JvBIjcEauMsV+E0ZyFpkfk88ewbhIAQKOd6KFUYPMtwpeZ/JPAmeb?=
 =?us-ascii?Q?AVUj34+hpt5/x0fegJuALtFjazD7klKliNkxwZcJznXcX41gdpjqwu8ffX6y?=
 =?us-ascii?Q?ii4sZ82mlarbl+HNHtacsM2qb1vNgHnDbeNJsNnOO8UZ5NgLI+BF/J8l++pi?=
 =?us-ascii?Q?L4JAZ/rcd9YrK42q2ANY4JNsIEenp7I4eK1s5YHK83HU+X7mB990U1wqlk3n?=
 =?us-ascii?Q?kF3UbhkVgAFbgN6oFjYBAky10Jt7rg+hnsXED+xGia11si+E1ZnNqkbIblAy?=
 =?us-ascii?Q?W1gxzv03SHRaOIDQyREcIHvyLioDdc09f2iJk+uAUzFylJTABSCmmq24zf4W?=
 =?us-ascii?Q?edo5OmUcs9q6A6w6TmHwtnVUsFpnLUaylgaWw8tKpf1s/KVq2TwpDIojQDdJ?=
 =?us-ascii?Q?z9U9PVlIK6CFC5HV9EGXX+U/ZmjNnf3PDHGRnq/wj2LEUY3cca4GpIwMCtC0?=
 =?us-ascii?Q?n+pMKYmERkn0Uo9BNuKS7W33QmN7eurZ6i1tmmy2fHxincpPSVTxbDAN3q8X?=
 =?us-ascii?Q?lIEmlrOEU///Fih3z/+CzZlmbeWvAAVmeMZ5TO/9A3ngFqOQGcZBPEPNl3U8?=
 =?us-ascii?Q?b+p050w4qnfIYYbrrRYGnvXr+KP8LFp/padDmGI8H/LVpKT0nVuqSczenVaM?=
 =?us-ascii?Q?qZgmJy9elpZyQVqzRQ4PClKcU2GCiqrvt+vnK1EJhj2YepazzwWvGR3Wallw?=
 =?us-ascii?Q?QMM99DzbnsF/rnns+SX4ZahK9+W8movEN3MkycwHp9WLw46hCyME77Y7sD06?=
 =?us-ascii?Q?LNKRHIQtMHb8stbaz1WQ4IxrxdWjYYWczA9C+BrYIqPTAaN9OeTkNT39qd0z?=
 =?us-ascii?Q?6CN1GY7EGmHAZY0CN+laBUMsGyZZ?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(7416005)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 09:18:47.1732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2f95b3-bb63-4a5b-0631-08dc7b0959f5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB8143
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

