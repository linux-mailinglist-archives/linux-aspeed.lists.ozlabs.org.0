Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A8989AFA
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 09:05:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHBtM48G5z2ywM
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 17:05:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727679945;
	cv=pass; b=PecrgOVDvuJ2TmrXIawKjKAj6ThLTVzVf9x2BRKCqZwXsT7u0QFV6yJrsqt3sFRSLWWZxD7JuVdiY5m19baxHjHXVYeDpSNgv6ALt+SSVmlJm/Jf8loXUU7l4icSCqtn+fqmom9UgXgCAqByfc9qsJaX69nvqwY8psxmBITqCJhe9OsENoPV2MaQw8uYVe4ligMvg5IUZQw9wzhB4n/XBximUYRI5q7NsXiPhP4qYCk+hZWPhIKH+ZjepXp9zcNw42+B8H5KVI78k0DAqgmSBJLeXpLXUci6yb9TbiH9Itn02TJVGBtQEkmSUva9iDbRR2azjj44HN15tSXMRJbnWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727679945; c=relaxed/relaxed;
	bh=Rc5wNk6fN5oFtBkyRPurMpzUpnZEhq6lKad6bKMUjIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dRX1q/gznsfzC0zN7AmfPKlNEQNlrxUHwDlX0lymgUc+klhI8GrwNtIst2CyR2zkunT8iNH8IKbIImQ3m0AMHSmq0xGSgGQx9VLOz2Z5cKlsEC3lRonogDpjTxpKz2rfGaaW4bt3J/x7FDIvP/RLeDURsRmaxNa+f3AtAFO6b0cgWrAlqP4kU0zqaekkE5Nl6ZxIOvQy5NvicD920Ng1+QI/wQOwxiToc5pI1iiKbqg3ZT1AJTF0pRI/EIQOEPXbZA0n1Iv+4BKtN7YvDYC3cXjMYuOxRRw9S3tbxzv0pTShDTTHck7sAxFPd5QvWqYy5RtxqBcqaLMAXsC9dvVgng==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=EF1OQHw3; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2011::627; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=EF1OQHw3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::627; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHBtK23Zvz30K6
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 17:05:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDs3lD3LVGd2W0WdxawerSa3FHkPYWiqsY/IEpN0wPRpN5k3+/Ug/b8CcLG9ulmLxJ6d/d/8WfNO2lzTQD5MI2RZejK11MX+/vb4x/0zoR5Q89/ugosz0U6oj2hNvEFmXxNTdF5tuKF04+sxCoH3N21YBR76aFqxnBpegSim3ROK+6NhL5fOXg/2PqXJ6rlWj1+IGVoqA0G/LzQZvKlR4nvSi6exBZfS1wbyOfgWKM1gbBWlY++WoNEtGeMsXEXKxtYLugmM2w2Up2IihzHKTsI371oKLiAllPJrqb/23E4jX7dKEXqmIcqmri1ODwrZs7557SE7DH8zz568zpVu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc5wNk6fN5oFtBkyRPurMpzUpnZEhq6lKad6bKMUjIc=;
 b=CAMwd2nnVLXfUauKjXf2nXqP20BLJk9XHwppYl9SBb267yZ/+IdOZChDBk9Uuej1Wf7Oef1aDGfxUhKiguTbl51GPpcz1kafC/iea8vPnVx3O7PnoogmgRBl6+k3kjIcCGgXUet+3R2YVaQFTpY/nskAgu1hdITEtWY8JUkNDowFbzM0b85WUgCZk1pV4WuKb8NyQ2TI5ybS7ATCrp+lKGrpBdzXmuuHY2A0WCavNKraqc0AepbdbHITUR4YC+FfHV8/pyG0z8iV0QNZ1QOFlQ6y+aZZLQ8MAjN4RHhUmxLAzx29AVqFTHdxIX+OrD59vO8PBb66SWo9KoV24tVhGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc5wNk6fN5oFtBkyRPurMpzUpnZEhq6lKad6bKMUjIc=;
 b=EF1OQHw3PQAdZ+Ipgfe6Wcbu0AsRceeOwkruzp0UlMbXppgLnWumtIVii9Iz76w5x5+MKOzo4ig4clcKtHYwu+I3y6uzk2lrUtqKAQN+gHPS7QsteGnCNOusIyaHiyOznUbJlHuuD2DFK9fyW3w9tzv3dYG/ipkWip9I6sv14g9HBJCt0fWzbAz48tBY8CQ2oAE4W+92b8XPCE+0oRiQp3Lwq49AoseS42h2OTDsY1oDELXj5J0qs0UlZj++nMq8qY3HXMmnzWGSsxZcFWMGCviQASFBEdy8U2z/8s3giLLAtRw69HaBAvyhje+5Er3eP6xg4dQXTeY5M6uDLWtipg==
Received: from SI1PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:1f5::18)
 by TYZPR04MB7577.apcprd04.prod.outlook.com (2603:1096:405:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Mon, 30 Sep
 2024 07:05:26 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::81) by SI1PR02CA0049.outlook.office365.com
 (2603:1096:4:1f5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Mon, 30 Sep 2024 07:05:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server id 15.20.8026.11 via Frontend Transport; Mon, 30 Sep 2024
 07:05:25 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1 7/8] ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Fan Boards
Date: Mon, 30 Sep 2024 15:04:58 +0800
Message-Id: <20240930070500.3174431-8-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240930070500.3174431-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|TYZPR04MB7577:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2f099954-2b56-4799-f325-08dce11e429e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?pNQ/1kEEWDBv36Ae3ePGCedFwEHT9lBJPfMLH+D7qMjxw7NUZTSG9WWE5zEQ?=
 =?us-ascii?Q?/05QlL7brisEOclMSrXLq97rdDBqZLzA1p7Bo20xwJR+pErf/7JVzwUmeaUg?=
 =?us-ascii?Q?bMP+/hSWCNaHidZbOdONL/jEKiE3bKzo8C/8WSYwq1nY5Xex0wYaSAzNOev1?=
 =?us-ascii?Q?C2Cp3mSruQCFf58QcTIJ11KpNJFZQtjOw2r22ir2KjofY5fnK5CQHlDYBoSP?=
 =?us-ascii?Q?xEV9XbxEnH+3g3mWHfmypHxwJrNiaCK2jFZeLQiwtuG3Dlmu1lbmiOtnQZsU?=
 =?us-ascii?Q?Yo1pqGnfWcvFw0a+1iOFmZvCoA1cEtoWOFZJa+qC2A28pViq5Jvl/OYRLJI/?=
 =?us-ascii?Q?cJtYpURPvfcnqRjUTKE9zvdJpJJapw6Ivx7l9RibDR+6YDRbmo4L5jpqRh2S?=
 =?us-ascii?Q?xX6NPB7i7rViuumNGizvbZNQs6RlLVUh1eqMQoxNeyTrw57K5VgA/YDwg5aN?=
 =?us-ascii?Q?iCv7czL6n9TZdk/2AmDFQjLytH1E63ieteExuD3huJ+pjf3LLnZF1UuwZOtj?=
 =?us-ascii?Q?HtrACDWReA9RBWg340CMDWkuAZgIrf/19jkYnp2+42iD2AqFoiygLihYjS+d?=
 =?us-ascii?Q?XZ6Xv4fVZPKoFwcNswd3RzhPxSPv1dzd5tSmZc3cA9Hjng+pkokfPZjXp6Iv?=
 =?us-ascii?Q?ooKVgt1ywolrbx5irUOvORZf2BfIHuiEabbe6vX+0sC7yuSMc2XrrjmnSf3i?=
 =?us-ascii?Q?OCwazbw9B9PGi0IzRDAlpgZq+K5nm8SkcSqy+ZYBPh4204rfdBRZY/MSJYD5?=
 =?us-ascii?Q?RlLdgZUDAHrFguF150GnEqmqUUYZGZ5+0BDeNeec2+ifGBUg3Vp7SfcOIVhK?=
 =?us-ascii?Q?+pYKXYGYddm7YEZLQLWi3Ips1z0QCBFuaQmN2D3XF/pHmFiyM5cDNtP72qD5?=
 =?us-ascii?Q?0uzt84FWm+hsto0IrrMBQP81BQC3vpDHPDcPqZoApxq6sUcRGP1nKnNUe0fH?=
 =?us-ascii?Q?N/8ON7xBv75yn2eU0TVyhd9/7k6Bo5cNobrbOq8ZqZbzMzNXLnybq2JDQLLf?=
 =?us-ascii?Q?Y50+erPVmImWWo/X5ChwxgOzwOC25vd4llvPE/crpPeI6TRJFOoByFNYjjff?=
 =?us-ascii?Q?xbE0ODd/3pSgBw4RUVcc/u1R/rnVO8J83LEGwlMH9fqHOF2YjJ7TeHmWUv88?=
 =?us-ascii?Q?Z3yvwHZo+TYiRYeR4bwDP+oCUWSEr0gmkNRGZrX0nmfQhmX1zWqalPHGyPkD?=
 =?us-ascii?Q?J1MnKhNynxN2mptS2ab+tKHDwRhtydkCM6fC5vdrjGlAjfING1/yAIy2Aztr?=
 =?us-ascii?Q?vh7Mt7ooR9n2hQpDJv5mzO4q11/73WUyitZYBtxEsyKpHkmsQ4c+FFqQo4eq?=
 =?us-ascii?Q?4GkgFof2q2aE/fqHhw0Busc4zjbE3rPxUG+apcm674MGgkJbAnD2x/JajWNo?=
 =?us-ascii?Q?DNtVRwxQgp2zNRHu5yPjP0ceVWkJihr7iFJUUaGSpBxxqPWnq+yQjlYzrzs8?=
 =?us-ascii?Q?SpdQhutLdn4uAdEjwxqxQuemTKulK9M6?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 07:05:25.5405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f099954-2b56-4799-f325-08dce11e429e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7577
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

