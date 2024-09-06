Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4296EA3A
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:27:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0R9n3yWQz30MR
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:27:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604075;
	cv=pass; b=aQb4u8ftHPidc7Hca28yzphAIAaAk32vYJDNhlmaRYgEm5bhWnoHrjwhHhf2uulMBh29ttzi/NLnEDdP46AWeDBr8BW3pgbrIbxnpT1OVQRf9Etdd6QNs0Mvyd4hh97KeZqa23TW+oPwoIchQ5gcBy5nTG/xneMQWbte52mLXqsxnJ4fSrw5Khwua3+DDdGw8WnMZjnVp3rtJImXq5skFb/E9pZazDT6TBB/3uF6fgQwmR+IGv3YkSoJVFFBYayqSvvRkcGKJq/EwdPOP8hCt66tvTZvvbRACoq/FyAj4yskbdXsJGICwPppqnHzGpdVVwkqOHdISbsbH+TDBkC8MA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604075; c=relaxed/relaxed;
	bh=wTnjvURfXlo53+eVxwkhIqzweQBqIwx6vFyYMB4uolA=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=luGDoB7vwZwHyxw1+XHmT3qIo7Z46LFrS9+ZlQjPDAR+6x8ln1J3kwg6oMwFDahLyx35jSGjipQ6VML+j8ysBx+w1SVatnPfwayccYpgg3CA9ENFFHKS0L+2/uzdmsT7bri4M1Om6XZ9YiTUPvFAAmsSfJ5xrB4wp8O1KwkFyR4MkAvYFwdlSYvyVgA/r4AfBH6MngkNMAB3aXHWuu1Dhg8lbui1mO2UrjMoQNsaP3XAqRXhZJyyVcgzUAt1+lRbfdOGR4LonWwxK6wyUtzshgDPTsCfeoRLFZx3IuOF2+ZjhpFDTEllBS6PuH1z+BpEsxs8b2fGe5q0aRj9Uzs8Rw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=F3HPVieG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=F3HPVieG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0R9l3Vzyz2xvF
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:27:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiXTMqJp8PDO4c2R71Dxy+X4ckgZ8jKU4HVd0hm35kzHwjpLJsnCGnGa/+hbZPOdsTF4Rhtc7mNawz/QW3PL/RveDPBQwFaVfv+yu6EjabauFnXcwm+w1XyHPCAfNqUQDeeh7cWyi1W0W0XdPkDD3/KJXMUcsiVrkxymqqjkrgb+qR/W3rpBf6Y3U58Nkaxu0/OcYGi8SsSpuwr9cZwttaX8Ptvao4Nq8N8h2Ph28VxrkBHu+jJDSKPflPmCKDGIJAT2rDxcF/icih/l31pyvLvR8XPMy9DAM2/ZB2QaEDzcx0HP1fFsim5nmZOGG/2Yv7MgtwitAdcLlPiGo835xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTnjvURfXlo53+eVxwkhIqzweQBqIwx6vFyYMB4uolA=;
 b=gPidLckVpHUq7J8hnqL+0toQLT0/ZBSLq7hNA6b8jQS9Lu5vnfAmMRlZAt2vR6y1OMwTiakaDzpVdr40F80y8g3go783PFDVfjYIlwN1zLlTCpT3/DnKwT08qT8ZRR/QkfQdaO58EwoP+dd+ilZLEF4Nn3oeAbNnfIIPHpP3sL75UYWpAeRWX12JRTvKRuHZZbLydFoPXieYzjUeVOBF+TZyHY5YQHAPjDjHTpkzkwfsdTrNZNz9+4yYFJwK5yW94U1aiq/7gXm39ns+Lk7jsCpCkbanCYK6zkvB38QqQ79xPbKGdtVcBpvUDAVfVDNMch8wcMy4O0ZRWwrO2eE8AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTnjvURfXlo53+eVxwkhIqzweQBqIwx6vFyYMB4uolA=;
 b=F3HPVieGaquSL0LECJBniWd9im8SVOfYijN7jRb7e0j2n3E1c47wGSJ3p42yrx330YYm8XRZTBqMVZmk2YHGjZ5OSOsgKaWdjCytzISX7CVuQCIKAm/JG7OoGvzFvLPG42qc/yYSP0YR3KurQWUlnLLBdiYcXnTvVm7q2kxalhvurBJR57d0uZcL1l6WBK6QhqmUecUU1HGOj11t3pdVI8s7FCGOx56o9pKvOlDirDcI1mB/q9Tp2csqYliHXhJwTo1OEry5nkogw+0+MQdbS+GJ9SHu5soktc/p+A+IE69dtkc2n5JhWyiJpZWUWXzaf4PVq5Y92uy44r76zkAiYw==
Received: from PU1PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::28) by SEYPR04MB7330.apcprd04.prod.outlook.com
 (2603:1096:101:1b2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 06:27:26 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::64) by PU1PR01CA0016.outlook.office365.com
 (2603:1096:803:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:26
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 05/32] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Fri,  6 Sep 2024 14:26:31 +0800
Message-Id: <20240906062701.37088-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEYPR04MB7330:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eb4b04b0-4141-47d9-1b31-08dcce3cf9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?PGZy8xe4LSJD7EXFNJ00XolQNcoMEDqt4i2YLJeGSBXsxacXsZKfdltR2Yp/?=
 =?us-ascii?Q?pzy76NkQZsYmJwJRLfe9dt0EIN9U4DDnYSw0cAjVKCOsJ/hKwu6NvZY3gS8c?=
 =?us-ascii?Q?tKY4OFPQQPGsgejHBd78dDN3YEYSacuL2tJRp+v78i/iOyCjxCeUCfMiLi5L?=
 =?us-ascii?Q?CI/0qnWSnagCCMqvPxI6Gf3JPoDTJMyNQR3xcrhg0+d4oq+V8g4j6IT77W7x?=
 =?us-ascii?Q?tCp0u1vn4D0R84YwfvYe1DJYdi4porBvVz34ckQSM0Cjd4MuoimqyONx61/j?=
 =?us-ascii?Q?Tc5SIWjFzBMJPaHGZhDvTriKZNcZoHvC4meNZTwI8+0LQ3pFaG7CWnYzK/8W?=
 =?us-ascii?Q?W4cn6R+KGBy7TXLDzlB83ic7a/hiIlQW8X2C01SU8WR3bZprHokr1coQ1R1d?=
 =?us-ascii?Q?cqUa212AuZiQBL1YNMQYHscRXf9fkbKso9lcqwUFtuwQ8ks+HAwZXQtvjTrP?=
 =?us-ascii?Q?W/j1sLIi9XwTf1hAEyWq/gpUbAmUp6da8EIqbIPbGttlJ9sjxyjXeemYdG08?=
 =?us-ascii?Q?1LX89EM++ZnFIYY9OMzKT+dMYoQbTjwBMcGWW587jIuuAUyAGb/3/bVx+A/D?=
 =?us-ascii?Q?vgZiP6LMzUAUTH8UVEDJvGXpvxZh1O8XQzWut043VpVWRiBUWiL5FgFaRy0D?=
 =?us-ascii?Q?hFdgbL2K48QEnAyjFpb+9qiW3Z7xWubyMvyTih2yQ11S/YhMQxOJ1npbVRA7?=
 =?us-ascii?Q?W6VP5QghULGgmfIzHUZSr+UagZXppoGNXXM6FGQnHkTxQ2zy69gB3mFVAeGE?=
 =?us-ascii?Q?XA1iF0Cxvb9YqCmSDJxzKL0AI8jtooP6F55J7q6SSNIK64ncubP2cXMA05rw?=
 =?us-ascii?Q?59U9ZjvtOlq2CjkodEPwJGL2Ye6Aq6qPsnLYqK2RvdOK94y8zNcRd2/LRq/p?=
 =?us-ascii?Q?EzbnJt/4H1BJohlIoYWY4XkmsN/SHAjecXhkBs7CCaM1fCkVpZdIXsE+Hhrc?=
 =?us-ascii?Q?ThAm2mny2nC4QT/ZbJrMdr+r/6yplpKlE+hWKDen0du/TOiDmmeuRLcIXNMd?=
 =?us-ascii?Q?hpp8aRH3DuxQqavCMhqcf9pGAY9GXw89CW1eGkE2HjW/+JHclaa4EAXbN1fz?=
 =?us-ascii?Q?F87XwXx38BHOZFzKWYjsZ9HJExpvUOmpJmwyGOtFZgkvtS8Jg5YS8wQpaccO?=
 =?us-ascii?Q?/NDjWKgA2nyl1rJ6JwwVpuvBpHb4d2TSLJbHR9+Ivt4bzYoXDX/WJEt4WkjL?=
 =?us-ascii?Q?kFXOvs7EQ08ctFqNeyUrJmpFOQzYfBRTxCZbArQRZOZtsEheMolgsEEU6g7t?=
 =?us-ascii?Q?mTTfJ4HCaGHqIxCcgo0v0kocTtH+BWAjqr6QF2HH8+Q2FNgJnFxtwPmUD8HV?=
 =?us-ascii?Q?iWpWebAw1DBbt6J7QSv+6oEPsSm9kxuipEn/NPmlgjU/rEuPbO5hdaYkQQhq?=
 =?us-ascii?Q?xrcrHEiwiPO7EycxZTmTGdSkbIj9RXzP8jmDUNnc0hxBESHnkxZipdpE/ZPb?=
 =?us-ascii?Q?7b0PfukFxldkRZLXnG84TlnOGhLXKG3B?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:26.0063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4b04b0-4141-47d9-1b31-08dcce3cf9b8
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7330
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-aspeed@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Revise quad mode to dual mode to avoid WP pin influnece the SPI

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 51b4e9ae13cc..e5354efbb903 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -149,15 +149,17 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

