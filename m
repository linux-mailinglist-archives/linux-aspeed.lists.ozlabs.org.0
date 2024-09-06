Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACEB96EA5A
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 08:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RCG3dRdz3cQj
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 16:29:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725604151;
	cv=pass; b=dzrsvjeoM/kEj1yajr7iX7nsyXfBTpCS9TC9lcNCz2uKCyCEackaOPu+qhElMFb2wL2ZqiAOB7NZskml+Y02j4k97oyUePlTElS6WCTwvtd/7bd4+VhmSSVFPEP5JXN/YZ+4r7PlA1yWjjfIjT6C0hzkkswu956TaB5hRFZ2ASBuzTFpz3zvlIt0sOGd0RbV7oH6oAjKL6FaDgtktyfXp8pr3SJKe4Vza4YWn+KY1nN8EjCCqP72TiCfzz3pFsq7WDIM8fjOgtbTZQDnziHUxfBp1mA7ZqipbcPh7Vx5ayUedVLSoM+hE+eWEvN8Ru4CVJ8PNkGn4YzjdFgMQaCrYw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725604151; c=relaxed/relaxed;
	bh=CE8IuzdQZjntYqD6nUPQnwn7C+BubHdv/yTEbKi/B1Q=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type; b=Op88D7KavXncJ8V9AdvQO2xzraSLdpQqLgDdEv3HjtpfPQMqF9J5NYdorEgoIjEEZKx5U7WgnCol6f6Zsu5A+2XLqeRdS0nLV24bomDmaZbE6Nmn59GKedwNiBCypOF8KdA/cTl5hxCvEuau6zM5EyzsmvV7O8HJr4Q7mdzJMsGdef019iOjDIvgGly59POTr2fiTQYjBSwhF4cryXvldCuguHd5YEZ0XQ/l1VomfheGKWkyByB6iC6HRgyC03LYWCB/6Mgvvaj9ORXBd5hI3UKUJ2tlwxPQiKstGTcBxoCgfS3Njzo4LRsfP7J840NHuvm8DPBhyInfpk6jhO8rxA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ksb6Kt1j; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ksb6Kt1j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RCC2YLlz3cP8
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 16:29:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQe0gl1tux6ENYcA7lftH9qHCyIbkAky5lsRVbbh6nIrj1XnARzw0EM6VzMr83EowPAXMZ29SNoW3iwSW4dkNnhplqf83JopP+RhVRAw0t9dIGXng+WDCvkK3KNNEBSq6DyiXKtDUzOaY+gE5UUq3nPK2oSgqfpR+7cf/Qq1q/bYmztViuahJr0F38SzwOMFgcxkGZGQsZkTzfTIIYQImW4X9RQXyt8xYJHj4a4ZJMxWQu/wvtztuOpCCE6bs2o3J2sP986G0rgv6HzAlhXC3XZUzfqWvHLzI0sXLkXC5P5x7cppgdmT0XMRQVW8n5MaCdIQDICLYYP11sSzxC5tzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE8IuzdQZjntYqD6nUPQnwn7C+BubHdv/yTEbKi/B1Q=;
 b=PvxCOFCWheLihD+irnmzkKQHR7b/Zn0R385S1K7v1Jbs7U6XFWYHs6am6AdhWAFs7YgT6Zw7JsVz0BEECrDjyFfV6wW8FoUIap2yBVdXGR6KAfnRZBNE/qHwkUGfDb28uu9X6v1fNXXPYz2Ax316c7LMfiybgRjHNyHQOrcxHogb5CKPO3WROJ1FIZPz1gkVallWxhHCZ7DQXviOjiOFNx44ARrhsZDUrNUGu5qLTKCtIpIZMoefdIrPRaktctNHzMfdv6N47a9f4Q8Vub5/YzrB0Wp1A1xic/N/DK3N0u5dALjWy4uwhX0WTdeuLxLUtybbrTxE9XyC6+zHsHJc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE8IuzdQZjntYqD6nUPQnwn7C+BubHdv/yTEbKi/B1Q=;
 b=ksb6Kt1jgX0O4RqQSrG8XZ7kBSZ3z7PR8qH/2Aa+hmr8wTnGunzlYw5EmK/ie/w42GqfPa9W7Bfq7+HYit8mAf8capVZo/Y+0epXQU2TPltfYIDbhTfkeAWOAt4tfQ3+3SPhqU3ZJuUbBTDChrAqNUpLoeXR/bQXiINnuR30DMO49X66ic3UtkK1nHH8Rx36rgxaej5L6b+w92qJjVe6a+rQ1i6nWj/GYHqSyUJAx8QQspikF7jQFeqk7y+13EcU4QtPYSXUELQRVEXmNrmwZut609co75KyqkVbJZsROg+67TTwsry+Lnrm3Lou3PHZGEZHp1WJfa0971PNaf8NsA==
Received: from PU1PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::28) by TY0PR04MB5768.apcprd04.prod.outlook.com
 (2603:1096:400:205::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:28:46 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::81) by PU1PR01CA0016.outlook.office365.com
 (2603:1096:803:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:45
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v15 24/32] ARM: dts: aspeed: yosemite4: add XDP710
Date: Fri,  6 Sep 2024 14:26:50 +0800
Message-Id: <20240906062701.37088-25-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TY0PR04MB5768:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8379bdc6-5833-4279-437a-08dcce3d2930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?cZzuqxWRXxL7dFenqZKAdflxH+iyOIXd2DD+rfiBurNz/JVqvIiXxQdI3SrT?=
 =?us-ascii?Q?EDeGp+mUolBwUmu05/b6oa0hUHCh2V+iPtfxJoOZXweCIaEBbYAObYY/wu3J?=
 =?us-ascii?Q?pCkq328uZ0SmsZpmdtHB8shzQsKYeiGj4zD0w8PJGP+nJLEk8GIiPrcz8KEz?=
 =?us-ascii?Q?U5ssmZgSiBHjERgMRE1oDIktm+HSAxKdClCNhU0BznX9A1YWoLKSgJfxL8tW?=
 =?us-ascii?Q?VHohaG6bQem/KksoY0+QpVXKw2TTewglOp/NefoV4jQk9RoHmQgHTngzRdJO?=
 =?us-ascii?Q?owWF7WAkcJ4FLqLix4EJhJPmKxPOp6R5+SI7Mfr6agOW1UyLGC4pyc8oHIpP?=
 =?us-ascii?Q?1YCdCsRgZBDaZ5K/DwEgh45JqfNPUR0PNzt55RKH3dIrf/iqwVl4rNqfMZkl?=
 =?us-ascii?Q?Hf1KcAqKf8TRJuedCQeKw+Sv53/jhkUcc9qExzYQXt3QB7PcOohAiE9ggvx4?=
 =?us-ascii?Q?IWosYGpOWU51kwZRYFtjYXDqmsPoSJpYMFQWVcF+b/ZDG+bBnBF/Pu+Sfh3l?=
 =?us-ascii?Q?87k/3MOns/Ag0inqOb0W7mVftkL/tYNYWv9H8aUvrbJmeAkU4aQBwZeHl8lb?=
 =?us-ascii?Q?4uPXwZas60AJ1UpfPFzYP04p7vBJGCXENGUgf249HiDEex5PX9tE5am4p7t6?=
 =?us-ascii?Q?9ZVNYQkm0AEBuGj4sELHKJTp5eA4ABMqgON9af/8PkirPGrnzLWXOc8lEnOb?=
 =?us-ascii?Q?I/AjtqqNc2IIyI/c41lhDOEZuoScTDoD1KJa2T6jlhqb6wnRseB9z6SCmQQi?=
 =?us-ascii?Q?Q/GrAZIuRVlv0vnYXbVix/6OPXSa0LNk8lOFDwOnIjnDtBDVzGNEBd0L7fED?=
 =?us-ascii?Q?cmB3AazVaw0ZV7D25vYi0EeiY0wD+AU1MvfMhGQuM7eksx0ucCoeFdr1ESVL?=
 =?us-ascii?Q?4LSHdAvG+wYMTMxh8/EeFcAK2OJlMUG4ExOaLUdlfTWyInutMfDCEuVVFnqL?=
 =?us-ascii?Q?fLVzTwBt47TGOSXdyVZo0Sg3P/lJEOHRBqUjHXeJcpWNZ9/Bukqnr9hgdyCq?=
 =?us-ascii?Q?OyiPZJ0AJyEsOmUh90s4tJf/bfMNWMQigmR9R1taYJH77VGG1CeK7SSd+sds?=
 =?us-ascii?Q?HBoHwlcddNtm19TQLb8RlUzWeMbbvtjDzyifAPQgL6sP4lZFS1uPebk9n3rS?=
 =?us-ascii?Q?TChsmJBHPgXux0XkI4FHzBXGGAiYnPzWkOLtZNu+EWA/dQ0mBzljXfpU/jMl?=
 =?us-ascii?Q?5l3D+5cVvXeV3S5LRQ+j6vA35Zpet87L9SCWGpkRgaw5x4ZGY8du5/h19Iov?=
 =?us-ascii?Q?nmxl1Td1F1H1xOedwpBzG1HSAf6Pm9ipR2mq65UK5GsDzvSqOP8obflGgFnF?=
 =?us-ascii?Q?ZhZxXo8yK0iAHO1ulFk45Bsv5K+PW3Eurf0drGRIUjuUzcPttOS5XsBw5Iyp?=
 =?us-ascii?Q?TqVThMEsC6MiMnMkpChQtJ7dvpnh9Sr0Oe2gCqhiBaM1fHk0HI3ZHF9jlikc?=
 =?us-ascii?Q?tQSZPb/MfsPsEre6NsERtuyIADJjIh/i?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:45.5842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8379bdc6-5833-4279-437a-08dcce3d2930
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5768
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

Add XDP710 in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 2f4e9c5edd5a..f73719b3c2f1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -978,11 +978,21 @@ power-sensor@10 {
 		reg = <0x10>;
 	};
 
+	power-sensor@11 {
+		compatible = "infineon,xdp710";
+		reg = <0x11>;
+	};
+
 	power-sensor@12 {
 		compatible = "adi,adm1272";
 		reg = <0x12>;
 	};
 
+	power-sensor@13 {
+		compatible = "infineon,xdp710";
+		reg = <0x13>;
+	};
+
 	gpio@20 {
 		compatible = "nxp,pca9555";
 		pinctrl-names = "default";
-- 
2.25.1

