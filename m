Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ACB97BA6A
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 11:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7vCS6DWvz2yNJ
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 19:55:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::605" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726653315;
	cv=pass; b=A0xoAUJbEPMe8mkqjUBizlHdFnSjcFs0VuBdXXWg2ADi2etQplIopcSC/jdnl/MHer5qYOLmvxz5cMqW52two4yErIiroOaZvfzoJJcmbJOiH1ST7oJW+zH00dgd2RuBgSasNjeLQGHwfGb4A8mPDtytIFe9DswMiwDSZ2qwcS/eyn7kPbdxvFGIPSEH0wyA7P0rNnLuXWYBSXP/dAyDWkn2rbeLe/H93KmOQaoasmu1udHTiYQKEql8pWqJZAF9k+YrKKLDC3nRrrKgX0asZTt0/CXNHXO39N1MpdrdtjV6YcSc8YTXmkpsrkZ8Ctt/AX15ErQ522zFWhwjOwxtEg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726653315; c=relaxed/relaxed;
	bh=fEZHnYUwoxYEf+ntplnpkRMepWld0jZHU7odMeMAQdI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TC5jP2/Mh4H3ZdbZt6ZY51jvAJ7S772jXtuAYl+dWt1b7FmhNHAllL6vognjtRepVWwReUqc/tbkuw6oPEfZ+5/YpijesA+3XCSEa4BNrscJd7Wrdh75uLJt7GPK8bR0XvPFOoXKcJ3l97wFj6GwNrJN0lxC8wVeTKguXQCahueHYuNqJ0l1G+IhAmpYntN16Nbh1D58aIuvUc03POdv0unBiGH/NbqhwXFvaguMosRZJLWHnWRZw4ZG7kW5rflajgoaPdvFbX4QbqNmB9gBRB/SgqHoQAOk8+yZ1mFrNgA1oVZbflH93HBwM+0Fv9Zpl+QolhWGhN+py+J+Ao2lgA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sLwP2NGn; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::605; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sLwP2NGn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::605; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7vCR13hlz2y92
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 19:55:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5sH2et9kvuyUO795O34UYYdcv1SPi6qwDCBetpBArP6M3MIUs85T4xV3LG1PiQKAL9qW6O2TMs13Wp6ioJsTOqkIwzRsNXTkZ5sHxeXymkEd/jf9RB8o1CI6r4/EaWuu2Qw7NVUuH4YpHWEcmu9TWa00wroYussuskTY9wzEYfO5A9kpLhKjgAAy6OxhTIfGOgQt5l6qnTD8kZQWhtIues9w7ynCP7/8aWAYuX1/vyf76dBLMvc/Nh/v4G1qT2W/7XhQpa3ep0Uru1DgsWXAxMwc2SeE9gGMaoLSsV44FWUfXcLVE/Rx4U5geRSHS4q17XIEiJD+6jYRWZtxARLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEZHnYUwoxYEf+ntplnpkRMepWld0jZHU7odMeMAQdI=;
 b=aoE9cHS8GriidEt/bKdFbGyp/2NwRE08sfbjZ1VMDDQ8bJkZHmrg6ykOqAGj6bfWNZ8An3VCjvdsYgjOH88d5r4Nftu/1GbGCCiz+D8ogKa35AWVBW6r5cnvMGfe3BG5hTGd4Ym1AUR+g9yGDEAgcG5XNyrLGRkVdGXB7vXG3LUXfpbGAlPV2Pj9MQamO8Cnp0y19nvUQ3ProIDtAKFi1UZ2xwVi6kwE65ck68pWu3m+R9nlgOr1mR3cYdmyNuisVQ0OhW62G85f5uZ2faC7AXXuAZeihzjy7zFKo1a26jvYA3hFdO6g3pawwfyDsgorChmklQXObpl3GCqgD75PNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEZHnYUwoxYEf+ntplnpkRMepWld0jZHU7odMeMAQdI=;
 b=sLwP2NGn2RoKvYJ7Z39exloCCBHPO2r5QUrjMiDHa7UYr+/4MaE+nf+O3funbfzcWOSKN7WCGW/HYcFEpohQfBxOE73OjEz6Ep2P1M8DcQynDgSa/YSJ41OL07rxEwq7DfdkZDus7URDfOWy5A2fGkgUIQdq6hdhJKEtaAF5ZHa2z8/LwDcukmbwbah+CVM2eQIfxnNtc0Urhi+oNMs6i2YODmp48Fw/2TyDZnHPTD9O5WcgfApy5xRml6jr79WFS7lOLkzK8tZP2pzxn6bzGaUM84yFFXNtfcje+ut7nRxGsBwe6zsis3Kb/XmdBVEYf4fPWLyt+NJGSUJ5m44LRA==
Received: from SG2PR01CA0116.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::20) by TYZPR04MB7193.apcprd04.prod.outlook.com
 (2603:1096:400:451::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 09:54:51 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:40:cafe::6e) by SG2PR01CA0116.outlook.office365.com
 (2603:1096:4:40::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 09:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024
 09:54:50 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: support MPS MP5023
Date: Wed, 18 Sep 2024 17:54:35 +0800
Message-Id: <20240918095438.1345886-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|TYZPR04MB7193:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f3df9b54-b045-4abb-fcba-08dcd7c7f070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|36860700013|32650700017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?onQzMi35+ljb5+BL/QAxJHxx6oPeJ7KC8MzKYSFSdh/8ZTABvj2+KktMg++z?=
 =?us-ascii?Q?kRm5jvwjqkQvCnbZfhC++JsMX7bFgrq0NPRH2MtJEM5fdrrVbudDzycK4aQV?=
 =?us-ascii?Q?9GNhAavfeXb1oWNDmZVTDXsYZBAUY+J6nYoaUGMAa2w+M9xHuocqT5AJeS1i?=
 =?us-ascii?Q?s1fS50TU18C4XpBHhLvfTHVsmX4ySocRtz0gCeTdDTgXNFsNpto8XyB8hlvp?=
 =?us-ascii?Q?evM2KVJor8vxDdF3PwWgBJkHGJhygTOkSmR3ZfFK5PTbTarRWdZe7U9esK3l?=
 =?us-ascii?Q?/TXCuf4JzmRqXdIO00s9bxBOy0n7dCtmVr+AJPhoLIg0GK3bzL56TMciucIv?=
 =?us-ascii?Q?6AiSvNY8rrfclec6rV5RUb/d+IoG+G8ZkrWAVyB6gcvWCdZZdW9AUSzhgMUz?=
 =?us-ascii?Q?O30nzI0k1B3cmbEDmf25hdbDQwTQonAgLHWFzBtnX865oj5newwILICZOx2Z?=
 =?us-ascii?Q?MIDi642pgcjyrHHfQTYHmZxXYL6Qn37K7jjwHd/UnafO3jN00PqLxyJeYPwA?=
 =?us-ascii?Q?3Mo1WbY8GLUuTpaK017l59QNVypoiKtDuzNoBD/kgR40CXgLAbnAAyhoreq2?=
 =?us-ascii?Q?f0VsPPnMH7GCyOFoYcwjGvJd0K8ASY9fzVnTsS/ajJ/2RYmnTZGjDFtYrBY6?=
 =?us-ascii?Q?hsGkMJ4+SzJvh8xQElTqlFZF989EdHNKY5oFtYmJTemjZJXnYnxtWi/MTN9c?=
 =?us-ascii?Q?aMmLT6c0A04lveJSaJXm4qqkMiOcfPEMBAkSkQBb4i/IN9Cpwpt9lxEuHVlR?=
 =?us-ascii?Q?ditaxqNVWwIkdfvElNEW1AXqkV0ErLd+Tn4AjQlv5CZKN717JgUHfY8t/i18?=
 =?us-ascii?Q?nS/HSq4slsrm4KtCWc0WVwRMZKQhT2UHisbjbZcsdDcNGqS9VUWZ8T2gRMvj?=
 =?us-ascii?Q?Lfbajte0qLPTV68RlBbEWOZVY9szEeASR2yJ/OMfSjIyOvS5CYD1EwujmpEi?=
 =?us-ascii?Q?TP97XZzvgEErktUob6n5hWv3YaOLwfVzqMYuwHcv+C7JXLq77SgSVC98+rHZ?=
 =?us-ascii?Q?MTr3muzh3Q0RhkaCPBcT09fnef8zqSFaWmDciqF2l+GPYSvBBVza1LSN/XIf?=
 =?us-ascii?Q?QlZVwvilR3Idnj29o4XLA/5SxiHIhrzDWyCDnrhr+z8bg4MUk1hlUXn97eGx?=
 =?us-ascii?Q?i23JGsifbTjidSGz7bsMTl6FErBQDcPlGpC0f5g0pZEbSwFvh3vgII0Iw4tv?=
 =?us-ascii?Q?RXauN8G5vgemgVW/3PEnZ2vQm7+aFMkm+BDnDTcMnvEM935vvilSE/CXaobY?=
 =?us-ascii?Q?tNf+S1Z/quxCrISBLOloQ4BAmNk/DKshbayB/ZEORDKyXqaKkpLdqQTDRdlz?=
 =?us-ascii?Q?6/8qp9r2gyYt4Lplt3WeTLKDpCO3ROCk6inbi48lTH+WncIdnvRuRgLFQgE1?=
 =?us-ascii?Q?BbI61jfkwOXh0mVxkmJk7NOi9idp5PcECWLwrRRgRKTi4OSkM4NEd5VXoB2D?=
 =?us-ascii?Q?Uohu9J46ytkBWYifTLQ/zmbhTN0h29jh?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(36860700013)(32650700017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 09:54:50.2011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3df9b54-b045-4abb-fcba-08dcd7c7f070
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7193
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-aspeed@lists.ozlabs.org, Peter Yin <peteryin.openbmc@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Noah Wang <noahwang.wang@outlook.com>, Lukas Wunner <lukas@wunner.de>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Add support for hot-swap controller MPS MP5023.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index cbb9b94e5b3b..c3253ea389d4 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -296,6 +296,8 @@ properties:
           - mps,mp2975
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
+            # Monolithic Power Systems Inc. hot-swap controller mp5023
+          - mps,mp5023
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920
           - mps,mp5920
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
-- 
2.25.1

