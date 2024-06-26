Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134F917BE7
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 11:10:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=3aVJX1fR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8GB16ktfz30T7
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 19:10:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=3aVJX1fR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8G9L0Jqsz3cPS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 19:09:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfOtLJePcirg/LMPSevPPUI7D5yG16NyJtEzkWOu9L/fgAS5S95gw64POpPHGuYSjckkt/i3Qi9e88RuMq3FBFSaMR7gBBvs0J9mJigTv9POq4Fw66+8kMi0dP6DNcHXZJE9GsdPsnS/rs7btolgL9nfsxH3ks9W4qEBCcqaWwUL/3Rvutv2QjETQGIvpO8le+pn5xs9qajhgsvGrPONfQDPEcwT8K3Ex2fjywDJo6RPJlyWfiRdYNdGlRD3t+fvRT6cIcjOT1Ct8Zr2gQRwDLOJeqePSH8ZPdkhznsiEslpqKfeQZPRcsEqESQIQabNHIiy5VoehvMUQJmk+XpRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5nLOGzr+7KZfcZvwMsTgIEus1J7dxSLeXUDVhNOLW4=;
 b=KS5nPmpog4CP7utB20eMBsrfYI9p9QSlkqMktunPJLCj6RTJVuKvuZaEujyIT/decHxeC+vyXB03paUXFI3/dli4WvlQ8hw3Wn088SWumNY8bNufodP3ZsO57ZzLg1e6TTE1izYFVdRmBtf7Tiq9n5K09hKEQuulVbAX2ckMXm5Op6TkRl1ol30AzYmaNoOHQXvchiKUqrNKUahLix0+6HWlewMLMf6D9aAY7IcSKPa9LjKDlxchVfaxbM8Y1dBDFV7ycienZ8wT0mIB0Shq76NO6ik8StkfZUnuiriIVs3Gukg1WtDoeoa3tPtGndOPizcyBCNaDVeI+Mbu5OIZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5nLOGzr+7KZfcZvwMsTgIEus1J7dxSLeXUDVhNOLW4=;
 b=3aVJX1fRv/Ibkj2HnlUSEY+isqbLK439MMVU/oY0Nq8QEAPSa4ZkkAMZuyPJzPjK9O/r6EkmQta0EexZskn4Iu4ylT3TBJXyMjGdqgaaV+MltgTu3Y0T2/+lpwEdTd6cESxjPO6OlLbCkfbDud6340+uOPOjYzSpCwkLVDCzN57saU25UpmiAG8hvILh2lN2YdXIqhgiVr+cjdmTSJICdSwAZX9yZseqm9cWB5UJaidgfyDBddcTJoaafTCHe28rNhMZUCjCXc8jn8oB7VfHA5z0BzisvW3wzQ+6vPOxZKn0n6bpcWWNNZeW0/ywJ5zNtX2jRI5olEL1xYsYJu83vw==
Received: from PS2PR04CA0009.apcprd04.prod.outlook.com (2603:1096:300:55::21)
 by SI6PR04MB7829.apcprd04.prod.outlook.com (2603:1096:4:248::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22; Wed, 26 Jun
 2024 09:09:10 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:55:cafe::1b) by PS2PR04CA0009.outlook.office365.com
 (2603:1096:300:55::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Wed, 26 Jun 2024 09:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 09:09:10
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v9 21/26] ARM: dts: aspeed: yosemite4: support NIC eeprom
Date: Wed, 26 Jun 2024 17:07:37 +0800
Message-Id: <20240626090744.174351-22-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SI6PR04MB7829:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7e0ac197-a433-4b5e-311f-08dc95bfa424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|82310400024|36860700011|7416012|376012;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?SLKYgDEPE9k/kiYbD8ch4sRQ1IMocFSnnzHcfCxcqXeW2VnWg1eVx7/3ueiO?=
 =?us-ascii?Q?Cqv2GEGP6sJkvsBlabAzz5a8Z25iUz+rKir2gEnHgdb7GMFwpOawiZRVPqyS?=
 =?us-ascii?Q?iLlmX5o3t82V6nftdZeE026k2ERjXYV/32rm67z7smnuodp6fivIUOl2/CQ5?=
 =?us-ascii?Q?OX4HnAjuq0zJqM7VVt8gAaaYBjBEtqZ0E/0Ns5TiGMIS9j9tKG/FdV6lsMcP?=
 =?us-ascii?Q?sqDC9PJVThDG03gq30kVYP7GtXm3lwIgXmtTtQyCbFEN9SS+nrZMp8OT3TGY?=
 =?us-ascii?Q?QbASbsd8GHvZ0e5LG8MMe4hG849RXi4AY0YvWqb2Tj7TsHAYzZwgY5YEAP+5?=
 =?us-ascii?Q?uv/YjLmSi3O5AGarIflCp6a9T5ToDLdOQtmC5KBZ/wfpTXbppeUN0AVTIKBI?=
 =?us-ascii?Q?F+clro/00BBVBF/C6nnhiXfPdgQgetAbaFySUAoL5g/aeAXcMwBZPZpudKBl?=
 =?us-ascii?Q?4JPErk51PGGYrecyGuD6WWQQ+CXt7uKZnh0hmxJuO/pkaGITH6HiDlPmxLbe?=
 =?us-ascii?Q?w0dbyziyHKZO4rr0vomXeyetCIYxBVrmAtcR31p+YIIknFc+UqF36R9MXDlE?=
 =?us-ascii?Q?oNQ7Pj5WuWyOZ0wI3QOPjIOYmH2EyXH0G2VKuEz4dQRVl461Ee9uieiGpm6z?=
 =?us-ascii?Q?EaiK1E0J5HVwEZECkmY0R3OSbGNE5/TXQOsIbvXowQvOH2Mmr46MnzHiTtNj?=
 =?us-ascii?Q?gew7bsAOApuNot7MuMtUykvt5B9Tc4Se1WQ8IrOPIh+4Dastj+Qudjy6+dLB?=
 =?us-ascii?Q?iHxPCcZR9pFS3Dz2CGXDwxjtiooYBYMmThI0mOsgBtP/q52+qLGcU7TwsYlA?=
 =?us-ascii?Q?/I30YkFwx8DyFF3Yl2iFJHCsBg9426c8UoWsW7qdx5fQnRdPnXpsLQv61l6l?=
 =?us-ascii?Q?2kF2PGch6M//XEeTy9f4yJsRkvWBtpJdgMIU+r7Ta5lwId4Aw/FihLgXz3HT?=
 =?us-ascii?Q?k92Nj6MklKL5czUzRFVVv0vVYNfIQrUFWIPejyKwZ5Qof+H/TNxpdskdZRco?=
 =?us-ascii?Q?/iVv6ZMbwtC1siv8izL0h37Y9ySqmC11/wDHSObNKgmOkhwFH8qFufU4Yg3u?=
 =?us-ascii?Q?n8Uhx9kVteGdBo22WueTmQg9gneIcUSClZwbrFDwnsd+7zCeVxEny01EZkMI?=
 =?us-ascii?Q?m8UnG5MoSm1d2Dn2qRWajPTcqD5Pd274G8N0eUpNlGz11GLiZm7BTnVI0djB?=
 =?us-ascii?Q?l6Ch843PlBUHRcYKPuprQNykTF9ZnqBDe/WW2KVP6rKjbsbAy1x3fXAMob3Z?=
 =?us-ascii?Q?DJ5poZAhV7poSnCQV2ZGeqpegLOdDytYqDiiTqmlwvQlYEKUX4L5BHX8/cqS?=
 =?us-ascii?Q?IVpK5YB5OvkCh+Qy9JfTzjbzPjkOkbKkzZBVWqWYhpHy+BZY3KFaCbJ9HumI?=
 =?us-ascii?Q?6MK/001pg1Rlj2dOQXhK0tL4VXkJ3YtMPmDaTd+5ocrA5WiRXA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230038)(1800799022)(82310400024)(36860700011)(7416012)(376012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:09:10.2552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0ac197-a433-4b5e-311f-08dc95bfa424
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR04MB7829
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

Add NIC eeprom devicetree config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index bacaa2208734..62dfe935cbcd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1338,6 +1338,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux25: i2c@1 {
@@ -1354,6 +1359,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux26: i2c@2 {
@@ -1370,6 +1380,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 
 		imux27: i2c@3 {
@@ -1386,6 +1401,11 @@ temperature-sensor@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
 		};
 	};
 };
-- 
2.25.1

