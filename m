Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C880BF70
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 03:51:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=klkbpY0p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpR8V09mDz3c9l
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 13:51:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=klkbpY0p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::616; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpR801NGFz3c3W
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 13:50:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4aENfm50x9R/IlRaLv1CtQ0YSq500dlI+WVieS41q/Kmr3/OrtPo6idbi7xh0ysfw/bwY6L2qQdAam15lpjveLIhldaROTsyBvX6D/BoHSZs5Vel53N6eEhdVEk7zGUehU+FGP9fqse/YrfbL6JaIBFlKPQL4dK4CC8yV4/XoTrFTrcQIDIpVyFxgRmWERZoxn1Fyr4PBCyZOyz51iBKsflZS9c5AS45is9eh4uauQs9YQmlUfl4V1eKgKEngQuwvC7H79JKw+ZvHqgpdQyfgOCT/uNi8rCZVpZbrPAQ9N1AkOx6BiEX7vEJYpXEf4/p9pioLz5yGZUquttvKfJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ffrzl7Q7LhBDD1DGW62uNYlTs/fc48bAT0TeP8J1+Xg=;
 b=duxadIiqf9jZ3966OiU0vs4tEUZHt95UTeIljUlo5eIItp1y6Z82i2ShYQoGzKcofS3HiAVmyYrCtLGWLX6t/tn2LZ5sQ78CU9qWX2RPDXptxlKzp8Ek0UjUkTBChJU9L3FOFk6jHGeBDe0ULlHzN1MPBBMS6el6X0nt2lcxbE3hH1tGpNXVyMJU2NOjAWkloYUquUNnWF4ocrnNr4H87wF/gYbSK7q5uCZlhzNMoFUoWqyvmbSiLn7EeFK5gML9jFiIgWQ5I6sQ7TNdEPkhx+P3fxkLWRBoVyxDLYgXMnqJa4QB4uoPZkHWZeqI7NipxpInMCS52hIbJUOm3unuKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ffrzl7Q7LhBDD1DGW62uNYlTs/fc48bAT0TeP8J1+Xg=;
 b=klkbpY0peydZNcNCAb4jVJbHleYQipm9s3YhZ9LleNlW5zTWgOuk/gSKQjTVSAhPIvU5Tip4UPnDjmUOt6i6pSV2SgL3xdY3u7DKxF07nQ1ONS7Pe5EBgZZY5rcXZl6YsN1Y2483vdUsFxIrbNvAO6+2ET4ykSkxhN3zwKnuIaXLW9TQlmDNV1K88FVdlN/NzGKXhMBjJjUztCfXwBXLjjOa1jCVuzYwKQwqyksjbLIje3ZMJBm8+d31eC3rvJ62NREshLYV8yvTekeC8xOXZTVrDXbszd/yaO9Pzns+7jlx2IbDEdDxGt8CkChZZ45vuQhx2hw/luN111PfDcErEQ==
Received: from SG2PR02CA0028.apcprd02.prod.outlook.com (2603:1096:3:18::16) by
 SEYPR04MB7824.apcprd04.prod.outlook.com (2603:1096:101:1fd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 02:50:36 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::c7) by SG2PR02CA0028.outlook.office365.com
 (2603:1096:3:18::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 02:50:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 02:50:35 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 12/14] ARM: dts: aspeed: yosemite4: add mctp config for NIC
Date: Mon, 11 Dec 2023 10:49:43 +0800
Message-Id: <20231211024947.3990898-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEYPR04MB7824:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f75c8c0c-5077-48bb-7472-08dbf9f3f36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dwk26gtHkk/P20fEHHNnMMANn+iP/DjRXv/0urSZoSWbk6gOWUhNxiGyysHYwkNR1yvff6FqjdNe63dO344XatrTfMaoipmXlm1UqJ+k1mbOZ2/DN5U7U12aTtqX97tTCC5P0VT+pizesOK4x3F7RQMYNjs6QJJkaZdoqouYmRmxKc2VoB72HzCU2lmndP3KkppTiHtF49VIt/0Eu0TNPnkmNDWjTVk8+UtgIzvrTnJrS9inkZy3Efdv0zIDXtsTtkwgcUnwP/hAhAYHjXU3KmruSFBZF41B+pZTfsKU2JuJX33d5Ee5zb1NGP+gW8pRn9dr9vT9j13P0SMAMDZggij5b9iYOa+HT3Gv5LFwbo9PAtZSThf02FnH+xkPQul7uPEzz6JTbSmbdmYPCOQcvKm6LBbjbmN37RheaNC0MvOiZSruvvCJpidr4zFL+MWhQhfsJmidqFUVAQ/5bmOHmBg2ri7aIM6v5j3Lomm914VLBDFqiRY3hA4hagwoSDmBgPK6ZR7Ar5xCDXVN9ErMndbmTLzLzY2g0fxI+gDoi2noh8BLdTPybwp/HIRso5TTUsQ4DNg4CreuYgxn75eZ+ohj8rmbB7d2YLmb7gW2RbkP1hTwNaAvLGWoNPxdeyabZ8sF8evM9kv603HKI+InXWQChwKdKLApYNZ4FtgTtvcPKrFS6nhPxIVYKyyA6a392ww2oLBQJXr7LB7zkjTEnQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(136003)(39850400004)(346002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(82310400011)(186009)(46966006)(36840700001)(1076003)(26005)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(47076005)(5660300002)(7416002)(41300700001)(2906002)(4326008)(9316004)(478600001)(6486002)(8676002)(8936002)(70206006)(70586007)(110136005)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 02:50:35.2966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f75c8c0c-5077-48bb-7472-08dbf9f3f36e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7824
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

add mctp config for NIC

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 073f27f1e35f..c8e3a85b7a11 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1273,40 +1273,64 @@ imux24: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux25: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux26: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux27: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 	};
 };
-- 
2.25.1

