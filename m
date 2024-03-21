Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D9881AE9
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 03:13:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Vv8rQnCO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0TX94Nvjz3dTx
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 13:13:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Vv8rQnCO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62d; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0TWr13s5z3dSM
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 13:13:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VryABaB4vDB6Zsl1EqhrGXZcz4UuUi4ATFewvqLdtk2V9J8Ts6d48vx4j2Pn8rtAMTNYM40o+5l7iGhuhNfv5VeL8+Cl5Wf6lCHfqA88qkqh/7l7kAEUe5qsDz7sKENkGjKk2fjsiqzqPlSQPx+EBbxFAzNTXCwyP/q0cYcK9H/WTdVt48Xx54gfoBZkcAAm6OHE9ewo6h9Xyziz4aHfiDYvP+1qOxHPDsaPjtnmoUwq+J/S4FfYuqVlKOZD8P1/+pIWzZpjmLfKHcpZytROaFQZDWhDJ9kjtVER96QA5i9c7z69ZeTJxMs7u+Hh5+ILcoDJBRGrQ161DBkaUZrWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5ns+z/bWZune1KJ9Uhx7h1a0Q+DT0TnpkyUTwFsiqA=;
 b=URy1cOHJ9RFPJS95vPYj7XnsLYNr4P3Xqn2r1iTZ9lGRl6F6XRE/jgEykQyqEegtkgjGpuau5/nbrQ5d0EuqT6zP+w6vBjBLRneKBTecoHGSqQN3T8T7kCOYdon9H/KtqtNWRUtTtV5K6dyR8qCi8uXnsV8LSpfBmsmuqO4wWGe4N23cQVq7vN8cE1vNfm/EcLomueBRb5320kRF65RhGmblHHkWuONBctBYO+lRBQ8WP4SQ/VttwZB97S+dccl9EhevPvRI1PY8uFKbmW5zRbvBqYNhFt4SUPbTkJjiu+m9rKNOvog6i51LlX3apGPzFDrBY8WR7O+F1XIpJ9QLoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5ns+z/bWZune1KJ9Uhx7h1a0Q+DT0TnpkyUTwFsiqA=;
 b=Vv8rQnCO98aTS3Aub4wl0pmuACCIXX2lEVhshlyNrEaN8JP8VKWEBucUy+s91fVLZsi1LUMuudO0P/wDl/Wzps9GDI3Sh4tIlKgWCSrmeSiPEdG+c4Jd8CjAuT0WxgBSS9i5Bxe3xUor+PIHN6dviYUc46DPhcYnmQaRkvNKX7jEFT+v+8EeC8owXjUR08dx3BLv59vVEBThar3KxulY5DCdKV3la869qiTJPXGDaenxxGM0BuoRStNQBNYoTdCQTNmdiiJ4TrbCjZPVdVYrFZwvRuSNumQc6wOaHh4P0MsMyvtevTBNTbHmd83C0ELfeyHqmFqJeig5/V2OLr1STA==
Received: from PU1PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::13) by TY0PR04MB5741.apcprd04.prod.outlook.com
 (2603:1096:400:21f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Thu, 21 Mar
 2024 02:12:53 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::1f) by PU1PR01CA0001.outlook.office365.com
 (2603:1096:803:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 21 Mar 2024 02:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:12:53
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v7 04/22] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Thu, 21 Mar 2024 10:12:16 +0800
Message-Id: <20240321021236.1823693-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240321021236.1823693-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|TY0PR04MB5741:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f810ffe2-61fd-4669-7ead-08dc494c6a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DIhCaaKddddgCmlyI6MhVINBfIaP/AJb/yYAccS6sETV768bHGsnGkogMcRDcIazAu/YZ1MOjXyKJtVytL9XkDl6pHpZP6exgKazgsnCeutdmyA9FryyJNeH+N+t0cyzGJ4L2Zsr4yh4WpzKcg/hKdaWiE3U1N1U5+of7FY5j+//aMflvsFI6a5RhhCyw+cdCK8C2xqO7RD/sL9uVfzYS1j1aT5rct+YC4TV0mdYePMZv/92K3K7Q5qxtYwR6KBKXAQONAIvjebycHmxURQ996PQBA8j5J26slVhphy6CKtgrPwEBxPHV0Tst4tNkxAMfSlppzcoCEqWk0tLAfqTBJAX3GkfUZZLjWGthNtb5PRDDzkJWDoVF4zkfdI+RhmoK2otffBy95Hg2M+Y6dfPoEFf6sJ5l2zuk4EHUCuL3kG44XuVsbBkQjRwKEKdQlZOU0hfWu7wZ8xcLL/qTui8fzE3KAkS1ctuZzq5UbwzDaZLEKZpB5N6QqSLk+SavVuG5+UpyksH3dB89IhrMXhd9vx1NexaTOgGWI8dp9JOHqgauJzNPUPTO9nRDagCmBUYNgCuHMIteEV5MAYOns0JjSzET+jIVG1n7JOsmI9v6to/DLlw7Dgtp+6+vRp4CIiPe/qola3DrxRiCMety4FoLor82C4r9C6fFLkk7LkKelxY5Xzzx0GyWjvlGeZnwzvScXDrKB7tfEUgh5gSQWfspzzGMVFjqwUwRUBbsurDqw2WfaBY0iXPAoaSP9pUY7dd
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:12:53.0728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f810ffe2-61fd-4669-7ead-08dc494c6a80
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5741
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

