Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6314E95C0AE
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 00:14:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqctf2HrWz30Nl
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 08:14:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::62f" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=BL4u1iyo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:2011::62f; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=liulei.rjpt@vivo.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq8nb4x1Nz2xb9
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 14:08:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgtHYw4+9Ig1o3m7OLSPrbw/nDgkkuN7ufPt3yn+Hr2VF5k89Z9ioRf7slL5JcfIjJ1m5cUyDUyFs3ymgq3I4T+FCmRHJg+LCnR91Etk6+APAYIIrKuddUfYxFrLmhX2kAo6cPMKSx9qX3x3xb39ZJXnll7wiUgZPEE3Kze9wlLexzP0Tw2zkfMyCehczhF68LPimMLSewHxCGSD/ULS2JeXUlhm+0A0fGNoOCZ+Npn56XCPWS0wQrWlQROQPqEk1C0JdYuArIiWsDqYhaZGPyndA3VVu4Dn+F6gOFAfy+CLyT1VAWbDHRji0+OaYzd/BJtuIdpE+EsyCApYqjlInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRb0/yRYVHGbZBkAZiOJH8ReCmwegUzzPIqXkY3mCSg=;
 b=peB01ouF/DBCMzIQFbT7RGQEby0ij5aw06iGJGG/rmwWu0DDv6cdNnLpfmNZzf15C6sHCqNvWF7OlwBq5xLrVvyuJgGlUjmHbS4tvhSvRGEtuuEToA6ngvpssd36YUWXGz//HrbiHx6FlzduPz82oesohrRmkHZCOqEOPynvIzP97pDYhq9f5SiewNEzh6msWlt6olfP9RiiQkbZFhS6Y1Dzy2euL054NPjiiScPwP+I9VBFXz1dMGAjkBLARt5UTD/l//AyZnzK/gs+vAYfjpxCGOlFChTBQo2LuqvdzGS2rGHMMrHrcjJfDarqRJDYJCiMP82XgFYwlmAveQXC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRb0/yRYVHGbZBkAZiOJH8ReCmwegUzzPIqXkY3mCSg=;
 b=BL4u1iyo9+VdpM3/HAUgAv+c+0YmedoNp3nABpmExK4aqKhLj2mhZelL8ezMdosFDkEvLB7g2PuvHnC3vDor8HzN1qnlQY7C8uDtBvlbwHXpG2DWrUrPAuIg81SebEq7ln3pRtdco84LeEAx57dk4lQ2Nir5cNG0szE9jnWc+rfqLofv0jSslTWH4ouKee+FMnse1SxeitrEfm5s+ysK1X9NIM5Fiix9+tjPNdtd1v78AKjeYMkmsnu2Hm5P5zv+OLADdg79o++xTBKB685HoyI8fbDlJW4AhPqhH4CBe9GCWtFoo7y/X8wvvwE9aQ/1fvSB3NGQLANtaEkCtQqeCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by TYSPR06MB7134.apcprd06.prod.outlook.com (2603:1096:405:8b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 22 Aug
 2024 04:08:15 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 04:08:15 +0000
From: Lei Liu <liulei.rjpt@vivo.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 4/5] usb: mpfs: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 12:07:29 +0800
Message-Id: <20240822040734.29412-5-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822040734.29412-1-liulei.rjpt@vivo.com>
References: <20240822040734.29412-1-liulei.rjpt@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:404:15::24) To PUZPR06MB5620.apcprd06.prod.outlook.com
 (2603:1096:301:ee::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5620:EE_|TYSPR06MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 248d692e-7989-4cbd-ef87-08dcc2600bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?4J3t83InEpx6fPmPBbEXbaF+Ldc6xLTpT5t+dI2L2cPqD5x/jiWIfhJTxG0O?=
 =?us-ascii?Q?ba8EuGjxjiknQwYFd+Rhw75EVAsWo3lPscQMUVYtIwoaA6taBCbHR05LcGbd?=
 =?us-ascii?Q?famJt0ISE6fXR7wjACoVm4JBTbvRUjXl8aB1FOAWRZlOJiMn6wD9JEK1F70n?=
 =?us-ascii?Q?aNEqdWEWwb04zl4BAjf9SW+2c0zilVrAN+NYJBvL8hugtHaTDdRDmWuZZigZ?=
 =?us-ascii?Q?OGwYgFbNenZQP+QPGK5kzpOyVL2o5AALIvtjNkmSbwW4ReRg/i6jF5Uzw/YZ?=
 =?us-ascii?Q?Btyfkj58lHxBksE85MHLxN29eFZX4WjatnmlFiunnFSMYU0X+54PpwzAXs9B?=
 =?us-ascii?Q?hSP4GG8IPf2FyJ4DkWrzbxQibnJJO6X2jXX3W9t9s+jgS7ioAX55pmV7sG54?=
 =?us-ascii?Q?9JO7UAg+JBNm6yWFDs1vbyx09lXkNqn1vnSdzcoRgvxftvsVa7sBNWY+NWri?=
 =?us-ascii?Q?737e4k806LkGnFLy8cMfQgiUegqCh533JOTmR+mUAN8AoLMFOwX93FiA5rH/?=
 =?us-ascii?Q?RREabUyLhL71rMaKUsj0DJIfDUvj6xAxEWMIWxKQLv0Nn1JRPGWjAyljoXNL?=
 =?us-ascii?Q?L2HFX4Tf64biPnYOH6Q7VYye5wQPms1+EGbteydIvTN4YZYHfVe3OUmGb9DM?=
 =?us-ascii?Q?YXYN0Rq9sdejKNmGZUAbFKVw3LYWDu1mB7iAkih4hx4v2KMJh6PLdRCNOJBn?=
 =?us-ascii?Q?HUd26HUWXh5aQvr0sU/GcEAR4z+sk57XOTsnEY4bnGMWHKlnM77Ny0NpjG2X?=
 =?us-ascii?Q?zAV5e/2CeJeg8puJ5+5Cmb4Aj60KDR5kDBtbaG8kxhoIxGCl74AJrlt1DGPJ?=
 =?us-ascii?Q?Cgr7Ss/jkMbCivnRJJBssVjPABsOUNmWuBGxZZIdWcUTazhAyCDeauFfy2R/?=
 =?us-ascii?Q?mxoHZFMZM9IejnECwPcrjOAfg05pqsRfZc/9xrG5F12EgeEmvVYzx23RcGus?=
 =?us-ascii?Q?xxtC/zJ3JynJLcTk3FGum/vI9/v64e7tTXOPIysatGbsmGt+WBzZqbMCvKNG?=
 =?us-ascii?Q?+zAf5RF9NFWy/Y6NrCYqexwWXsLZ5gltr1y9ovWMcWzmhGxuwv/sZPi2tYu6?=
 =?us-ascii?Q?zI/AED9vTDg5qdhzE/ByQIMvPH+iov9RU6CrLuTb1KlD4aIIpMdk6vjz/RoZ?=
 =?us-ascii?Q?MEZ4cG/TTHRgAzgHFlMCPO3DlXiNA3qMdc7rf5yuFTdc6CPvSjmRBzflmpa4?=
 =?us-ascii?Q?mrJu74yrawYpbqsWetM91NBWRFS1TQepOVENkNUDkSOjOEOvI6LIBk4QNdpM?=
 =?us-ascii?Q?YPgm4xpfgEBO+mkLLVnUI4FmkcJd+5D4FeFCI5VCVJUidSbMhYYVxYI9Wmfe?=
 =?us-ascii?Q?QJ4/O1aUna8v6X8bCjabLdmk6gHL/mhjspi3rgeiypfM2X7zLMYMx4EVKxaZ?=
 =?us-ascii?Q?I7gED61PiM9sALLETB5jxus2icmmdOjJI6HJMT6fPhwaSHkuuBHp8l3o7Fa+?=
 =?us-ascii?Q?k+05lI3yRMzxce56BUGmXxq2yhe9Kkqx?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5620.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?C+uSPuwNZqbNkLzhsb0plMbtKx5DEUnVVz8mXvEJ6c0OQMzT0XHn+bkkSU5+?=
 =?us-ascii?Q?7DPzdcmd6I2eF8+YsSAUoSJ8uvjdiyQC6hMqYc225yF5Q/jWd10K+ajpeY/7?=
 =?us-ascii?Q?TxHc/b/JQNdI9S0nDxSaNJASWFoahsnwcCeuYSyTCLG2VxQUKY4uaxdO6+N6?=
 =?us-ascii?Q?SRwSeBkEARCaTmsI4UD9rp2xiXQJy+x21bSi5EH79MfXGUTUCm4mhA+QNBgl?=
 =?us-ascii?Q?ZfheuTgyWMtfYkAWR/f2ndTVSGepF2yiNBCgIK9LGcL6YdVYXcrRWtcS6sIR?=
 =?us-ascii?Q?xcoRnM/qdnzq701elQO7x07XxIQ1DvJNFVnq0VZoHNObxa+ELwjsksZM1Wuf?=
 =?us-ascii?Q?r/WF3n2FYKrJAT1/UR3/FPBKVJ0NPL2OZr1k5rG4zjSzBFz/ee6N20JtsQSg?=
 =?us-ascii?Q?0S6vfWsEkcMYjHjXvGGeflk8280pMcTs1qZWNEFhCOdZ8jZqAqvHOOvWQAL4?=
 =?us-ascii?Q?KhXRjSYCoZ86ruA6m/ncM+mil+TdwX5MeV3RqMurr6y3GgPMbhcw5u/MxQfd?=
 =?us-ascii?Q?fTOHpDtz/vgumcs6K78uh8uPrMTbduTrDmwQk59OXxlRTBboJOXDbo2DvLmE?=
 =?us-ascii?Q?LsHb84QHpUTE7Z0xDSTXnSoxLJ1ym84PmrusyXmbOUWR+DNw+U7CocWIbFs+?=
 =?us-ascii?Q?2nUOpTJ2fr7PhXhh/4JU/RPeqlbY7JiZXQ7AqQzk5o6FYI/AZ40LgdMW5yTB?=
 =?us-ascii?Q?cxeRbvekoMbzffGb8pi9m0vTWHLzqzRdff9+qJP4qr8par8SIWQChLG3Wpce?=
 =?us-ascii?Q?bFFf0SdiGrg8t+kbZfMxfECzJudY+2M9uszDreRZCC98cMKxUJrFjlX/LmC4?=
 =?us-ascii?Q?oEbF4xtAFFWMi17Vc0lnBtXptqB/33/YENYvJC4j40HN0cm/53CPEfmbVR+Z?=
 =?us-ascii?Q?LwL/NknCOMZynzrnycJzgKaPBVCdBB5Zj6v8YnsR6TDLZYtXBGzrWFWhZHga?=
 =?us-ascii?Q?3UeB2cLK1nRumm0MzJ+Y3ql3CgaxPBydUs1WB+w1qgnmR4W4N2FHmWC2wcVb?=
 =?us-ascii?Q?xcvhdw0Wy9Gzyoxt060s3OhQxAoEKz9mg1kSY7FnSfM+ETUz5i2brgU32Uif?=
 =?us-ascii?Q?TR8ndAaAyRl/rJrpCmY6CYLKMMm2r0IvHLRL7f6WmSnqQ10YJoH14gblUU4E?=
 =?us-ascii?Q?+4Bzg/zBUvio1EEJiTA6xHyym3AEoaUMT+/S/FvlVYLjCUi2hBLAVWP2MT3i?=
 =?us-ascii?Q?nipHX3UetW/osW40BU6yCgXMX49PIMkObCi5PIpLcSBK9xafMJJc1tbVUR+K?=
 =?us-ascii?Q?et83NeZ5kUAIqhEVwG0yB9rAP8mRPzvG6fJIXmmHX5D13QAsFiv6KZm5dMPk?=
 =?us-ascii?Q?PFF0Ay5ubdHD+ygEolDlb6kFUS2Ow29Epf9099Ui5qaJMCnTcG5p8uo3nCku?=
 =?us-ascii?Q?2Pai9sZ8bFMw5z1sAeUDClOzg4m+HH51/reW+BHOMASOl6l68XMj7gdKF3vo?=
 =?us-ascii?Q?UOJTY1fUXkvK3j5X7UD3hTfP7vD+JG+1gSHcNiE/VpyeCxfqNA+NA9M7O1+F?=
 =?us-ascii?Q?WX3Bf9yWO0uAWCrTJlz10ojbB2CxI6us59tUY8FdXzJQGI89ZWSZ0gfRPtO9?=
 =?us-ascii?Q?gbbyCXef3P5tuYJJqeLBsUStNo/ncESL/tLoe4ym?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248d692e-7989-4cbd-ef87-08dcc2600bfa
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 04:08:15.5274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGhe6g/PfoeE2uzevA1HyTS4fjJ4M4NK8CgjcF0sY3/BOXGnhz30sia/yPA/4r2E+ywkHsunOj7Eoy8R5TKNZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7134
X-Mailman-Approved-At: Fri, 23 Aug 2024 08:14:15 +1000
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
Cc: opensource.kernel@vivo.com, Lei Liu <liulei.rjpt@vivo.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

---
v0 -> v1
Incorrect usage of devm_clk_get_enable() should be corrected to 
devm_clk_get_enabled().

Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
---
 drivers/usb/musb/mpfs.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 29c7e5cdb230..06faf5ab22e6 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -159,19 +159,13 @@ static int mpfs_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	clk = devm_clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
 		ret = PTR_ERR(clk);
 		goto err_phy_release;
 	}
 
-	ret = clk_prepare_enable(clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto err_phy_release;
-	}
-
 	musb_pdev->dev.parent = dev;
 	musb_pdev->dev.coherent_dma_mask = DMA_BIT_MASK(39);
 	musb_pdev->dev.dma_mask = &musb_pdev->dev.coherent_dma_mask;
@@ -184,7 +178,7 @@ static int mpfs_probe(struct platform_device *pdev)
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata) {
 		ret = -ENOMEM;
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	pdata->config = &mpfs_musb_hdrc_config;
@@ -203,7 +197,7 @@ static int mpfs_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to register usb-phy %ld\n",
 			PTR_ERR(glue->phy));
 		ret = PTR_ERR(glue->phy);
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	platform_set_drvdata(pdev, glue);
@@ -211,27 +205,24 @@ static int mpfs_probe(struct platform_device *pdev)
 	ret = platform_device_add_resources(musb_pdev, pdev->resource, pdev->num_resources);
 	if (ret) {
 		dev_err(dev, "failed to add resources\n");
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	ret = platform_device_add_data(musb_pdev, pdata, sizeof(*pdata));
 	if (ret) {
 		dev_err(dev, "failed to add platform_data\n");
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	ret = platform_device_add(musb_pdev);
 	if (ret) {
 		dev_err(dev, "failed to register musb device\n");
-		goto err_clk_disable;
+		goto err_phy_release;
 	}
 
 	dev_info(&pdev->dev, "Registered MPFS MUSB driver\n");
 	return 0;
 
-err_clk_disable:
-	clk_disable_unprepare(clk);
-
 err_phy_release:
 	usb_phy_generic_unregister(glue->phy);
 	platform_device_put(musb_pdev);
@@ -242,7 +233,6 @@ static void mpfs_remove(struct platform_device *pdev)
 {
 	struct mpfs_glue *glue = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(glue->clk);
 	platform_device_unregister(glue->musb);
 	usb_phy_generic_unregister(pdev);
 }
-- 
2.34.1

