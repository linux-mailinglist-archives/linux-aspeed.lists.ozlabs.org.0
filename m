Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62424B1B75
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Feb 2022 02:44:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvxJ73BMdz3bcK
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Feb 2022 12:44:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=b0HZArv4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::725;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=b0HZArv4; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0725.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::725])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvxHm2xsnz3bV8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Feb 2022 12:44:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWAwhuyDfcezz81cpPxgE6cQd5mvgem9VlFowM0+d2OfaYUCFDgL/ryr1/hMkgdZUPecn/bNIyvXdqzBE/XmrtlUk+n14HDGMQPH5bFh65lfkI/brrb4oJIdYDPZQ2WF9dMYoH+t3hSIl4w5ojCdkAIGHnQwQH3EJ8VLWai6bX/kBwOQ6BpnV31c0SDnaiXopSeXvcNW1Gf4POwRme1CRJ2DquKAlzfgdoEh8piX027sNZj3LpaGIOTs8802UpPE6p+ZA+fRzRo7U2qsVruCO/+7wQTx7ikM5WXjJcW7mhzTDUc70rGRWqPCp58+gZsK/p9xY8+sukkeFhAQqKeuKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Lt3iNPXKIzzi2xs+5EMghw6HXh2oB6hYycNYkBAYNo=;
 b=IlVnJLTJLNtlgk2unTWvz1n1WQDMjSJjynfPV3IipENiHBcYm8W0bD5jFKBU/rFHd8EgbFNQWdffq4EKKf/Cnz1iFioWq32P18jt8cUoA9xzL5dtR8iQLRcqUODyjx9UnGd08NGRRC8yj0z45Ghw4tN635nY1Sq5/NKp7oPBWMrMZtxvZScln2mPngBjYYtd+lOHA0px4A61Yn19hS6PACcwFWbNLqoRErKiTc1s8o8t+NDnGr9YmNq4KL0E8+aTHkC/3f+pngn3ztA9EpDmzofPVwiBZSkFNUkH5LUSw+jPSgvgNG3W5W6vywqcFZmiuvWKUHuSQt4n4ttyoOHAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Lt3iNPXKIzzi2xs+5EMghw6HXh2oB6hYycNYkBAYNo=;
 b=b0HZArv4YOIlTdRZhGS+0iGPru3aGiYmvSOiD6DHmAOFW8dogj8hwFLg/sg0yYLNeIotYMtyW99svlJhEgZ7zfEIZNPxAfRnmicOmfPVj7i7mEFuz7NnquTjcGSg65MCFhZPJpQ9r6OR8C797wFKr9qDAoQer0UOW7TsbO3PDl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SG2PR04MB3577.apcprd04.prod.outlook.com (2603:1096:4:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 01:44:15 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 01:44:15 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 04/10] arch: arm: dts: bletchley: update fmc configurations
Date: Fri, 11 Feb 2022 09:43:41 +0800
Message-Id: <20220211014347.24841-5-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211014347.24841-1-potin.lai@quantatw.com>
References: <20220211014347.24841-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0143.apcprd02.prod.outlook.com
 (2603:1096:202:16::27) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9023826a-1a38-4b33-107c-08d9ed000273
X-MS-TrafficTypeDiagnostic: SG2PR04MB3577:EE_
X-Microsoft-Antispam-PRVS: <SG2PR04MB35775009183D39F3EB7FCA798E309@SG2PR04MB3577.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/DT1gD/jHOuh0B8taFQucjuVZOH3MXKuOV7bmiCYmZjkmCrTalWmfkcP3OXBUNbo0zriwpvLPA5bgFsZ6/80JdxoCbtLmT1lDTvPJl1Wcs7gY6k8DjKiIBaJGs//LFescRn+fu7u8nD/nWpiSrM8o5HPn69nN9WkoyTg/GA9B3XKOwYPMoAyxTalyAJiFhaQN/0PDMHj69QGUP0mpGL/jp7QSHJY7NboXTBqET1hNDk2u7LlNO65rLHBa+buvTjRkhJaIaT+9ydhEF1OwukzlxQAXm3Z5+bIemmW0BFBBhvNPbG2/lGkTzwhoH6PON0dQezJ9wmRynjYuzsCi80DQCUFedB7nOZMaMEOTCsAKcfKQL2outMaoWWJ2TCQhdhHAtQfj+jKTUdfp6u5R2bmh6A7HG6XPBHeyiQE8foOMsYFJr1vCPl/Ew3yrX86n+wVP7MseuwNjO3bqPy9BPj4HMH0CS1svNtEDScm/W5HxDLNrjLRgS6DCfv5Wcx0/eLIN/ZDxlNJ61ZhGGVNrEmsl3vJTm00LXoUWFD2wnV14KQgZXQAPcClK8suWywToL+OVi23LrCkd4dfqsXPXH+EqUHyvgefS7200mjTfP7s4qlJASTkjhWgRayzASGvyLJgmY7B9mBwjg9oCr3C/0BUsNyrCwveuQIYxSB/uppMj2U4VlzXvxzHxcnggKpyYCGgkIBKM62Yq1BWfEQiCoE/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(110136005)(107886003)(86362001)(54906003)(8936002)(8676002)(66476007)(66556008)(316002)(66946007)(186003)(38350700002)(2906002)(2616005)(1076003)(38100700002)(6486002)(508600001)(26005)(6506007)(6512007)(52116002)(44832011)(4744005)(6666004)(36756003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MH/CT3t9uTtSva/cZbtTZsMEq1W+51Xw17T9gplTn3GRG1wdv/7pUEMMD/+/?=
 =?us-ascii?Q?W7uVOTMTWEOsFLJC2jJXjAkhj+fGojvnjM2YrfYZwUBQgmOCb2l4pbS1Q275?=
 =?us-ascii?Q?xnJE6ncnXTxlk0f1pBlGnAetFhx4nb4Czkc/vkmwBuUNUSBNX7z6lwNaUzix?=
 =?us-ascii?Q?XKGRkB5EMbtptv74XnyqxlY+G/4fE2CTjyev7+/oS9IISVtX0wuo0tArMQq5?=
 =?us-ascii?Q?Oy8Rxtsmk4ZtD4tfHD87SfNV299dNnUZkMUTTdDJ46uXksprIvIuhRUnbXOE?=
 =?us-ascii?Q?pCjaSMhX5scB8s0xXFDAdBjqs6LUpEvacD5E/iiayIa0ZKLy4mRi0qKZNgl8?=
 =?us-ascii?Q?JmRRQiv2piH4ZslKzTg/1QGz57v7B8hyRt6rCj9A9O6/Wm1XrOkGQZUuxzpu?=
 =?us-ascii?Q?cZaRf6xa9KGADwGD2KpP5Anm7d1hfhua7dXyHOBWSWHT4sBFtGyJ84ulA4bz?=
 =?us-ascii?Q?HPR1yIxvC2q2k2VHkOA2iyLAwvB+JG+WMgwQdx4ngk5WwAmr3o24mzL/RZo1?=
 =?us-ascii?Q?HW2AugesnEDA7spFIamNnOYLBY1maUtYbJF3cPBBAZqKmMoDMTLpNcU2u80c?=
 =?us-ascii?Q?kKfVvLoMEXaVBO68Qa1ZVMZ/Qi6WD9BC52NxkzLeFb2cjHgnTM8awT+uwFXO?=
 =?us-ascii?Q?k0Gl3BqBp0bS/yibnrasNMd+0Tn3hSjgFunGVXr+umU5+xU0Ugzh3OPazALI?=
 =?us-ascii?Q?drQpRuinNAt1Ld3LiIULUhLFtCOVx/xA5GbyrDok8tFLp+i8mkNE6KbxiVsd?=
 =?us-ascii?Q?IGY5y5tYFvmw8P5J711sda6clU/XVfKD9a9zgT46cgb+0/PixZvAvb+Au2cz?=
 =?us-ascii?Q?f1VJ/TLaDZNBBPCl0UrQnLTFpyxrTQVXhL2ULtpisgW9RrF0gkuScYxxEA9V?=
 =?us-ascii?Q?PtJNn4ZpPNGxol9olyiA2SQ9IcnYxa04pUzHG/m0EVlUTjuWx30QiF2e3c+w?=
 =?us-ascii?Q?WoqxP8MYNe+Mp3MIBjH1ttIFP/Q/bx/MWhBxqDcdPyB7lrNWm57cdSGJt5gH?=
 =?us-ascii?Q?zAG9ksrV/f9v7WpUxp8gf/nVciqlVAuHJn+h9bmYqkJEvxzHWhU7KFzenvyD?=
 =?us-ascii?Q?4/w/VxzySEWPjxnnn5m/0nGZKL3CPPu7jT5WO6FQRnsGupdxoZCd81yMy6Tt?=
 =?us-ascii?Q?rrUfCMkX0/vhXi2idhsHe/oBDqvnU40s0iP9Xr8iLyuKQkb+uxOKU5JCGkf8?=
 =?us-ascii?Q?kCcSEqAgXiqcFQycIYQ1RRekPsyBtcc8wDNGqe5igNMzdRDdOjVqB9WNVaoI?=
 =?us-ascii?Q?dcHE+AwzL7bp6v1bnOux0MT8oW1nm649eUNiwmxh4WG0eCQvYzKwi4OXk6IR?=
 =?us-ascii?Q?ygBbZ4oiY1ukmFvfrns0/XquuclUsXvFYjCrnvwvJaJ50hHzjXeK3QXBR1Vo?=
 =?us-ascii?Q?T0yKtx9rZMyHSufHFt0Ex8+nAuelqx6pHgnvXfpMvaBiyqjZM6N7dBAb0N6I?=
 =?us-ascii?Q?GNo5+qTo5YfQYUNts1GjyYBGOHOVEnWx6ZZQoZXklA7oFgXm/P51MKdd0OKe?=
 =?us-ascii?Q?09O+uOYA/gPvC0RsxjvMJtmZdhpCslj6+Z0Y3dgJ7ngcYKla9sMI/lYLH0ol?=
 =?us-ascii?Q?z7UY5L6STzLqnoReM1PP4ZchtfLIBvhDuAEMeZikyD0A4fYInDtUqKaNQjpI?=
 =?us-ascii?Q?QJxvknXSN3dzC2FO2rEZCOk=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9023826a-1a38-4b33-107c-08d9ed000273
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:44:14.8076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe1yESh1xacOHZh0cIlMt4ndD4cGpVX1mB/Sv3LqUWSZ2RG8PycotLQKUodbH6/xD2DLUtmx06wX+eCa7I2aLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3577
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org,
 Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

add flash1 in fmc to support dual flash module

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index fc0690ccdb0a..b01f1e7adb81 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -217,6 +217,12 @@
 		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "flash1";
+		spi-max-frequency = <50000000>;
+	};
 };
 
 &spi2 {
-- 
2.17.1

