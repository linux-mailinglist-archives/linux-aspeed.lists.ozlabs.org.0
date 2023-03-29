Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B02756CD4A8
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Mar 2023 10:33:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmfvf239hz3cKv
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Mar 2023 19:33:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Dyt3nimU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::616; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Dyt3nimU;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmfvS6mT8z3cJY
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Mar 2023 19:33:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwO4Sk9P9ijVBOrjyKBQc9AiaoarfZ9ZBlMuZUzJoU2Eu5uD1jTc7tzVL1eZZcsCvGeePn7oQ4F5n7NAmLpLV1+FjocXebjaQ67qh9iROR0+1cy3LkzwZVgyL6Fu2VAm1S01HFEuOeWA0qLGkOgk47vL7v3pXGi6LdGaclqXoeupCV9PeO6LnFHJ+/TtMd2olpyCl0jy2oNPivEXTznsU4+Iv81VdC9Xa5ENIW5oGiKwbyoK96V2nEA3EDAR42cyl1osJWZmXIhYz1IxtvlGHGpCCbBDGD5gfF/9lc/HsX7IWYmIdjcvoTwSMMfgwE/QTlhMwQUPU21QqbNivXVnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltN6HTkQakV41s9FhXQQFBngy3//SeX21FGoaO7rt94=;
 b=UK7kYKcLrWWuyIFtTEfAc1F4Jn2plD6l/IiEZIKEPuEg8u14s4T1Yodc3YszE7XDpcKwAZnL1ZAuMP4D8d7t1iF4KucJezEdsHuPCf7kQp2HAhdZolNMg5V0ucOeomNwiJAkWmCWRSFeGK2VFP/csVTlKVDbOaaRNnxDEGLmtz50No0L5c3Pm1E2MBcvHD+agDH0CCmNdwQMs4Wt9wj2B1taHCDuchF+ErRxJOpa4L63LyHtEdetF7pa8eBcQcDH+VRzmyCoiooUTAU6m1DKqEPuc2yUxFobOJIH1hHFaiybrdUae32wZrWlO/5iftSL06/LGzm/hlxRXNtU4Bqkkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltN6HTkQakV41s9FhXQQFBngy3//SeX21FGoaO7rt94=;
 b=Dyt3nimUDOLmB5yl+PB4K60KUets+ZGpdrBaJItS5VewIi+AFVn/RWl2OJy+aPt4g55u/7hsg6l//CgZTRd8G2GKTk0WmI+RQ8W/zIYT6qVuqsJCEW4vvabomhUz/SsIoqIRq1HW2gmlpNOj+sPYQ5p1O0xzpuTmh9/SUNggCja8i2getGYls3NN8tBxJ6M5TLFZL4s/xeUhGIptGB6yW64TrpuIRUcpDF0Z91h3M5A5UC6YmINhRXZjgSIkg2hEVi+LSNsyK5bqNo0LlRQarrgLGjt7gWGso7ZEPM5HFgfM9frZDWB/+pfTiawwUvnNcs0iug/B6u8/VgLnNy2qrg==
Received: from TYCPR01CA0096.jpnprd01.prod.outlook.com (2603:1096:405:3::36)
 by SEYPR04MB5859.apcprd04.prod.outlook.com (2603:1096:101:6a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Wed, 29 Mar
 2023 08:32:46 +0000
Received: from TYZAPC01FT042.eop-APC01.prod.protection.outlook.com
 (2603:1096:405:3:cafe::4) by TYCPR01CA0096.outlook.office365.com
 (2603:1096:405:3::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.19 via Frontend
 Transport; Wed, 29 Mar 2023 08:32:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 TYZAPC01FT042.mail.protection.outlook.com (10.118.152.183) with Microsoft
 SMTP Server id 15.20.6222.22 via Frontend Transport; Wed, 29 Mar 2023
 08:32:45 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v1 0/2] dts: aspeed: greatlakes: Update Greatlakes devicetree
Date: Wed, 29 Mar 2023 16:32:33 +0800
Message-Id: <20230329083235.24123-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT042:EE_|SEYPR04MB5859:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 257a01f0-8454-4cd7-0a56-08db30302c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	c9lsrcPDQ01NdDju4yfOPrsVXymP86deIdCBBV8OH25kQ4qGx0LuHzwTTy9c15GRF4iA4WT9YX+BgdELtC9a01KblcELSRBpO2mNz7QxJGbtP8FgIw4qhhbXtRqD4EluOJpIGmSJXO7Ps5V3D61boMSXP9HgYrilQlQ/3AefbYVe75p+iCiiQACt1OVbNoBvoRngBNDsMyydAkB3qAgJVC3zwNeo6HolkRhmtV0RB2h/VoddIlV/wRM9KwI5uS8AmlwZYYHkpzb5BzrnX02XtMPrWKkALQmKjMr0gEvQtLPkaCHSUrYSIURK+aY0eWgdMZdE+Ic5VCMdGYAwmW7JwfRcppvVOq8DQ2KIRApNNaVeALCsjmKaJwz6hpqk4IplEG5ACQfSW1XStgvL1nalbsUd8Jl/bV1eoA5VtfwgbgRzmurGLGqk9xmV1+ztV0oBYtQjDrEnnzz4vx6EM7KOOCMH8jAoxFrHblAoL9iejjdC70SFxnGlMzjuL8M/X8gL7B4sgKFbTYO1SSoKY3xfzXDPJxzcROGzgHSlld1yYF6sJfzvIt6t9mPyW4d37hZ3iKWLvlWGE1NUK5RBC4Bi1jZWd3smPYbJIN8ZNEeeEN0Jz/jyGCzLBg/4NsrhYcK5i1uGGhjCqRSlfIzaoW6JmTVhhyuKflSs3U3I8c//uck=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(46966006)(36840700001)(47076005)(2906002)(2616005)(336012)(83380400001)(6512007)(6916009)(8676002)(70586007)(4326008)(70206006)(956004)(40480700001)(478600001)(54906003)(1076003)(26005)(316002)(15650500001)(6506007)(36736006)(82310400005)(186003)(6666004)(36756003)(558084003)(36860700001)(86362001)(41300700001)(82740400003)(5660300002)(9316004)(6486002)(81166007)(356005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 08:32:45.7887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 257a01f0-8454-4cd7-0a56-08db30302c3f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	TYZAPC01FT042.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5859
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
Cc: devicetree@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

v1 - Update Greatlakes BMC devicetree

Delphine CC Chiu (2):
  ARM: dts: aspeed: greatlakes: Add gpio names
  ARM: dts: aspeed: greatlakes: add mctp device

 .../dts/aspeed-bmc-facebook-greatlakes.dts    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

-- 
2.17.1

