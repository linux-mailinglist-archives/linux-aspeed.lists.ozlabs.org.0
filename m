Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D574D98B6BC
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 10:21:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHrWS6jN3z2ykx
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 18:21:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::60b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727770898;
	cv=pass; b=gpgvslSKKuM7d6YOUw0je8hyN6f4IPBqqvgXIdGbmQ+U+cJp2Q8R80G/01v6A512XNJNEer2JJQgsLqGzVlZHOuh7OZGYy1ziHYuZsmV4l0CgY9r+AgNsHO7OOyMDQC1CAJsmRIigOwCejnBgzJNdmcY4RppGHRpKsKLBGbjSQUTqsLla0SkvubFYTL2FpJS4ghvIxysh22RIM2ASvWzpSwOVL2Wnh7XgemCn6nq/0ZAfvbplpQuwx7yUGYQ6gJT5Cpz5Q5uruy+75khQGcW/kIRax90/7onxaW4Hk6FjeiUQRjEqsNc5ut/efXeB9XQ41Yg5HbG04+Cgsk0V6N1aA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727770898; c=relaxed/relaxed;
	bh=Rc5wNk6fN5oFtBkyRPurMpzUpnZEhq6lKad6bKMUjIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAnUOHAXuVcjIEWykgIm5zkENxey4uKZLKonC3UuN1iPOVHaLDcRkN/4h5b2SwSyrnRYdZHapZMuGLTwJWmY0IlTHrMgtpV7b77kQzqMKILV0m8DbvYtxYHToEHYbXa6xk4DctiGBuU65EaZWTutOJbWnCX3XreJMCeb1T25GJC0qQmRIw//n5Z5phniAVVp5wFcRjT2+NK6wwhdieYWZo+4FEaP/zoQaAklIlNS7zdKnSTusOhBuv0lo0R4bnwEoidXr7A7a5lHUU0B/i7+2g5VR9EIqPdxXTe8pX/pb5WQ67myw3xWFViSYuo3xnGxqoX2KBNjVpNYPA4hpDdMsg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=cwTEfkVH; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::60b; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=cwTEfkVH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::60b; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHrWQ3zRmz2yG9
	for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Oct 2024 18:21:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi0TotaFKTT+zNsyT1Ce1tFaO2BOC7LwSKlLtB2DLwnlauGQHrGG3yVWlmWEF/SRlsI/9xulfQA9O7l/H8enu/1C1VM2BMGqygGsnpoEVq8//eqA9VkUngzBdi/1Oe2tcNwKXzkM/RSD8pP1yqc/wEPVchhPd8S2n5320X38F8KBEuhOE0p+gXe/lOYJdaRwAtJdVYOupMrtYfdgvpRFUmzOSxH3d8kjrySj3tkzhD3/qprDbLH7dUnHh9nw4jbn4UGi5N+dwDMiMMrOwYxb2ka3BGv8rTVftWBWtLDhhzePeJIfAif0oAXU69aLdx6Wu53+pexwTeOAscjmPxQj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc5wNk6fN5oFtBkyRPurMpzUpnZEhq6lKad6bKMUjIc=;
 b=HQg+GVqbCO1z6SNM6xh+4WR5dnvc3V4sLj3XpU0oF2j20OVRpRudSFm2y+j+tbgWGOu5Tv8ZQZvtZURB6MTktcMg2ew0TmgyqtagoEnV4ib13Hl4fBivA7PG09Pa04/9XQodY7BZtkDNcyk203tnNxHTTbDWE5rE11j6UrDPIFFNyXpvs/x5zexjd5+UGo+xKupnSixzzuVL0dJ67RDEwsvyXRvYr7dhLipl7nUy6TzLbMFuw1wIu9CtppdYCsAyYT42K/bapXVOP4Rk/23eF78KuuvnO3dEU1tndKTAOEL93bNfmM12j7uNDBOaGKNVhlmvs5pq+ieGcrqIjoEm4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc5wNk6fN5oFtBkyRPurMpzUpnZEhq6lKad6bKMUjIc=;
 b=cwTEfkVHi5Kcuz4+897VA104eRVakzfGpsmBy0+KmqX9Xk2K4lLgDQv35kVvulpIhpEWezlA/n0IinsRVYUPTMsydNmYbdBUEwT81mFWmw1bA3HNkuLTBfaMsyC/FeCoYH/lr1egKsUY48YTmHc9tkWSpPfHoPmR4INw2GmPZZM3JM82RfoK44N89e0g4JHz5Zb/WrIHzupU+S1AsKNLCFm5wnl7l7jo0U5ZBGmNTPSsedztcN7sMcY1a1sfP0lmf/2I9vKwTHhwI82/+ElpegoTJ7zsrJPNND+xBGVfZcSLrbGBk/GPHun6YK05cwZPms+po6eNN0LJJ0u8AHy7uQ==
Received: from PS2PR02CA0075.apcprd02.prod.outlook.com (2603:1096:300:5c::15)
 by TYSPR04MB7661.apcprd04.prod.outlook.com (2603:1096:405:31::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 08:21:18 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::4a) by PS2PR02CA0075.outlook.office365.com
 (2603:1096:300:5c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Tue, 1 Oct 2024 08:21:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.8026.11 via Frontend Transport; Tue, 1 Oct 2024 08:21:17
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 09/10] ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Fan Boards
Date: Tue,  1 Oct 2024 16:20:51 +0800
Message-Id: <20241001082053.3455836-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241001082053.3455836-1-Delphine_CC_Chiu@wiwynn.com>
References: <20241001082053.3455836-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TYSPR04MB7661:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 89045c61-d0f2-49ee-3861-08dce1f20600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?+FGpGAjhYgPbfSYMrTkcGhkDuZXyDLMkChYJkrDKi513FfJ/aaW7750iufBg?=
 =?us-ascii?Q?1pZffdo2dTKwcH31jd+q+4qteOIBNCjS7qMrV+i5+UUnLlsOcdxnxp0auqAP?=
 =?us-ascii?Q?rwopXS2T+zgXEibF2p9eFiOFXLu7FKMvhDe/BV4LcdN39a9efikTW75TD6PB?=
 =?us-ascii?Q?ow/xF2zhpZVrb3avIp4twYY7uzHI/+iwWBRyjV1IZRRh+olAzwBoXcXujhbx?=
 =?us-ascii?Q?meXqK9SWgs6pFqAeMWMeH/YkEpXyBPvucdr748x6rmU0JSkSDgIF/BXGvL9O?=
 =?us-ascii?Q?fiK4r12sSwXciVVxlPe1r+TW9k3xqlR7oksm9xqVvBrbsHEpZzMOE1EdTS8g?=
 =?us-ascii?Q?yukW4wMJEa1c3hMbVgb1pv0iBbMRBxfu/nP81C4N+Gx+1qr3P1iJZGkNQlw3?=
 =?us-ascii?Q?tygnR9UnkmCW22yP3hXMV1IUWbRGr0gfyIjcW9uvSjXhrhWdVTewj0RigyMs?=
 =?us-ascii?Q?XUKZXpuMvRirlaM8aygs4a3NoihsO+Y74xlpKaEv6SZGrQ2M7zhdjifTwc+z?=
 =?us-ascii?Q?tlXI0LHgvcJhlccCIgrNbv9yi/SaF2aqQZt64Lwlou5tFSZp0ls+wQa/AGun?=
 =?us-ascii?Q?ZWZpF0Hp17H/gnOpExMsSS3Sq14oQTqjP7hSog2sueud2GiWOPBjaZ+S3CLb?=
 =?us-ascii?Q?lAkE2zKc/pZeN5Iss63Kr4VLW33VpgFypiOv/DGqDmjcXyxlleZN6a2q12P0?=
 =?us-ascii?Q?IV9opYRlX4M1aTvU5V07xKanTGyrrIveFBnJKjhdsHyyC7+N3RN7j6kv75Ny?=
 =?us-ascii?Q?M69NMFuZYCd+Aw9p04wM8tPbfvJOhvWnEFKzt/wIbUgSB/xYxBFJnlPw+tQk?=
 =?us-ascii?Q?oWF/dPkkhIukyvWZr+qniFoPLOFHK0g1HwIpy6yJhWLkXwd/1IStBWSjUB9g?=
 =?us-ascii?Q?XjNGCbdefTjhioyrqBEH95J3GAtUoxTOGORx7Nnz4Xkub26nemPStS4tGM2D?=
 =?us-ascii?Q?Mo63S3FQLRPq+nqKhbkjdjUmxs7gUpcy1jdSWqdwMmjHgIsgJYYHw0nhhKXZ?=
 =?us-ascii?Q?zfofo8P13wnNQBckRLikJbUmRGVo+vfIrBF0Hp5qkpESg3LRZcU9dxsD5qVL?=
 =?us-ascii?Q?GYommJB0Uhy2zjoFsSwCwrNX64AhOkPi1R719MJgxovY67SmJITn8/CjCUzF?=
 =?us-ascii?Q?W5eTZFqGh7f1FCaxJlFp7dpFdwyYTzYb4dJX0OXkoxwN8aSPGjQHBJRrtfme?=
 =?us-ascii?Q?xyP0DNI/nvqcgMuku5Bsu66siBf08UJ6GwfVX7H3df7nsQ6iIvKYayPSy5QI?=
 =?us-ascii?Q?kZAo/eI7nrQORkhISmN4sG6IApzOVFW47bKKV0fPRdSGSXmYdeDKcabPufec?=
 =?us-ascii?Q?MLSn/xiB+uxyzZwtVyumDr8+IFQRj+qI5AoD8V4/vdGgFT4ILfp5BCua53D3?=
 =?us-ascii?Q?n1+xRidY97HyfDxd9aMr5OjJX3htsnEW4v477bPnD1ZLifbBtOCKD8rQ+5SG?=
 =?us-ascii?Q?ZYfLpnov+rZlwxuPLEaCHR4PnjCSSZv2?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 08:21:17.5655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89045c61-d0f2-49ee-3861-08dce1f20600
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7661
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Revise adc128d818 adc mode on Fan Boards according to schematic.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 6a1dccd23225..e235ff7c7a9b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1173,7 +1173,7 @@ imux30: i2c@0 {
 			adc@1f {
 				compatible = "ti,adc128d818";
 				reg = <0x1f>;
-				ti,mode = /bits/ 8 <2>;
+				ti,mode = /bits/ 8 <1>;
 			};
 
 			pwm@20{
@@ -1221,7 +1221,7 @@ imux31: i2c@1 {
 			adc@1f {
 				compatible = "ti,adc128d818";
 				reg = <0x1f>;
-				ti,mode = /bits/ 8 <2>;
+				ti,mode = /bits/ 8 <1>;
 			};
 
 			pwm@20{
-- 
2.25.1

