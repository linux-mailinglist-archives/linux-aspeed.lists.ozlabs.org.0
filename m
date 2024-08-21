Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACF295A86D
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 01:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq2qf20sGz307K
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 09:39:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::629" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=Fb5vbOLm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:2011::629; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=liulei.rjpt@vivo.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WplZ22Fv7z2ygy
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 22:11:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWn8B65voyh3hNIf/TReIGjFqMc1hkEMke5msiVy5fXKjEt4FE1okyk0vKGbsBSIscTT0SXykrFBRhlux/vGhiHss2X8Ua1Yp3MJHXKXrwnEM0wRVOtM0c22ZGY+b6bN6E+BGHMhCJ29MDi0AMhC4Dys22uCxJKHJQOibKFyp0kXgjhqr1SklWFDF0JlsT7AusjxjfUBza1wYNRovYueZoyWDsBekxJbj0AMiBwvHjMz4IQJI0LXv7y3M7OVZzTiH6QRXZrLsx53Rg1wgqXgB3DQBUfSuJkIE0BFPT8G3nfyYOkb4aKNCGx2Cz8CWGvPDslKnY1T3LGgjKZ4753o2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsWSeDLZchiIY6ePE2w9Udp0YVknhkAQDbpJe39jeVY=;
 b=B9Q+KTNAxmPgK6aEx8e2u6lxaMEyguP/JTPWn5J2CR0/dRN8e9lgPBjBEe0CKsSLdA9XmbWs+fl6ouSa+mKjkF3U154gRRDGpOCo3dSXr97Xp9xTUBdOk8ee4uJIUxNjU6I1XA575jDLed3mrZyyIUtGW5JoNNNtW43zbYQr45LUIidxUnTr8xUYDg59Z58vpNn8XSY39lqlkr8TdDhXPtoG6m/Ch2BN0ZtTqhmqTiNaK9xFeAyl6Wb7D7F35jwFVPU4uZoEK1rpQvjTbzXt3cQ9cguyhiInDQCFLzWiXOuuE+n582PmK+9ahcwKdcslsSvMHQAaftlVkiUK/O12qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsWSeDLZchiIY6ePE2w9Udp0YVknhkAQDbpJe39jeVY=;
 b=Fb5vbOLmNBUy7UsoIbHx6n9EY2O+0MxJ8k5eNIqt73DaI+fHQI7Cqqbv0lSfw37trbiVR5Y/+l/1r2AxKZuYRZB+wj1FWMGrPLt79+wrgziRwiJYmLnlv/5FtVXepIlRBQCP2fam3wSxjiF7kEWyxVkZnJcme7yT55P8U0IoIpmawoo1bZ/efOsecxEFiK0zhVK4X1xMX/9y92MInFeuPn6rJa/dCkmvaP5/Z1v2B+vb2VFm0lCjyBGhreDhd2q+AeeSAxf99yJUXw8JCVawz+mxO6navpk9IQ6qNInr+hVOzmtkMHjLaNRkjm6kq44tzUzzMqZnyXkEfONVncKigQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5624.apcprd06.prod.outlook.com (2603:1096:101:c8::14)
 by JH0PR06MB7128.apcprd06.prod.outlook.com (2603:1096:990:8e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 12:11:35 +0000
Received: from SEZPR06MB5624.apcprd06.prod.outlook.com
 ([fe80::e837:10e3:818e:bdfd]) by SEZPR06MB5624.apcprd06.prod.outlook.com
 ([fe80::e837:10e3:818e:bdfd%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 12:11:35 +0000
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
	Lei Liu <liulei.rjpt@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 4/5] usb: mpfs: Use devm_clk_get_enabled() helpers
Date: Wed, 21 Aug 2024 20:10:42 +0800
Message-Id: <20240821121048.31566-5-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821121048.31566-1-liulei.rjpt@vivo.com>
References: <20240821121048.31566-1-liulei.rjpt@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To SEZPR06MB5624.apcprd06.prod.outlook.com
 (2603:1096:101:c8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5624:EE_|JH0PR06MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c75f13a-b1fb-4630-6566-08dcc1da668e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?G5Lb6B80RvC3zNbZwIT3Ko+6s9Xs2YOQOqNUAT7pd5C7HWaxviqn37z2aePB?=
 =?us-ascii?Q?WipAl6MiyNnSTPwGYfmpSTtKWzNdkDKR9GGAWEyBPz/5EGi2R+AdLKg1+yVa?=
 =?us-ascii?Q?39l/soj5x2H/Eie3eJ6C3tlNFLPOQOqmTkMhgFSVPPVhCY1l6iD3II9CCdjp?=
 =?us-ascii?Q?Aqz2HHQjF22fWq4/1bx9eLUDoXbG6KXezaTLQmJlLGBF6ei7nfSt5TyRr8iP?=
 =?us-ascii?Q?akx6GtqDsYLUlVHWlAsRCfp1aRfV6OZ7+lz/nXnBLyhNqoB3XpQeRkSZLU+H?=
 =?us-ascii?Q?BR1DhTLAwaKTXKvl3rWBg2x2kuAeThDDhQ54IKn/Wv0/bsM7nw29ZzybKrUN?=
 =?us-ascii?Q?dp+t5QGK0i6AvfAA2AB26Eqq+VZiQHYfxOhmMj/FORUIxwypCQEHW5NyUu12?=
 =?us-ascii?Q?bzqSHLVV+50okS7lAXtKj+rGZpvXd+I58ZisxfxIYwb1woIK8bRuALnkp9lP?=
 =?us-ascii?Q?Ddv6YHcRioy1ZP5mYs2LlW2F6Sbhue47xg8GpAdpk2jPrNDsLII+Etw4Kken?=
 =?us-ascii?Q?qPP1Fj+o0QZQZl047vqOAndOqqQ84UadXij5l9DBGa/cb9+X6Zu+648pgwxa?=
 =?us-ascii?Q?DXqcfhNENdLOQ8Rot5uk4YociZzCMVAhObBHrvgwIgLmKGFZ0qgiNSA9inUx?=
 =?us-ascii?Q?YhUevyasQbN2Lfe7O6kH9tS5ojVe2OKgzMb8DXFSVWAPOS59aU6Ib3xffgfG?=
 =?us-ascii?Q?hqODkmMTJimq+G8v8IT/LbCaOWFHEhsI/vmixDzsaLhq5SqOmu55euabi9Pl?=
 =?us-ascii?Q?j7L5o/b5zMBNO3ryiOkHoNGD0iv3eXJUZz3RDEOX3Rpd7JEKtnpNf9vlirKw?=
 =?us-ascii?Q?tgogYZ7WZnTuiyYkotH/c71bBCXzcrQXbhipk63M0bffBmVwiQ/9WNTycojj?=
 =?us-ascii?Q?TFnM8xnGWfJjAXL/CPhwTKGWHDAOd7+sMU8Ykaso5byGttL2bJCwE8ZURF9u?=
 =?us-ascii?Q?f6LUTMdmeDkLUMrg+dd1/mxkRZ19Tn97dGYF3si+YRn7wHDfqIEwdry+UIyN?=
 =?us-ascii?Q?qPD/RxFzLh88ikDAro7jRn8HolxN6QhLJzA8ppTVUiPCosDZgpRUpn0sxQeD?=
 =?us-ascii?Q?fhKYLBYLRwrA5qoEQpxbjCE0jfjzZD9bZKGU10oSmbkuhU1C9p6PPQp+cU1a?=
 =?us-ascii?Q?+5M602MKts0ecKs1CkEltqJ4M7MuvG82/+UFK9uI/3exrqn46K4rWnh+MUkl?=
 =?us-ascii?Q?3ijJ4JrlShSBfF9pYcfkgl82bJdZXTQxFtKTfaad4yqqJ/wKWxpDfa96zhmX?=
 =?us-ascii?Q?bPbn8yuRhbv0vYkM6TdnQHG5pyj/D5/tflwN4fGLH+Mp3M/MDcBfNec5GECk?=
 =?us-ascii?Q?UhmI6lcgdUxskIY4vnJLJQWHimDWiXMh4eno3XcQ8CDW20XpN7Kf7pMfRw0c?=
 =?us-ascii?Q?sfiW2wUwSRnDAbzxpSoookjSwW6fAoK2iUAsp3RLrbzrokkQlplVTM7HhPYU?=
 =?us-ascii?Q?KSRhW0qXtCMPxWZUQZYzLiZVPkMlD2Mt?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5624.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?B7rw34+ly8UBlm4Zx90hT82dUiyHQbGxzy6DvMt1ifwOBXgG9URZtqJUWKSi?=
 =?us-ascii?Q?HwFD4gSVoqB4JHGCJ47mBxYvITjqK5OKbNVWHw0lm/9w3m3Yi70w7wTHeO87?=
 =?us-ascii?Q?hGVcamLeQb9qgmV4OjclFzV6xZm+rtfY6TYiZthSfUxqN9WP9vK/Bl6I2MAL?=
 =?us-ascii?Q?qA72rdvdl4jaHncFbPZjjC149GFwdyx+jY+/11NPJboziCPoLtIJLsh8ojnr?=
 =?us-ascii?Q?HbpYAH/n8i58w6UINttj0khuLdfCCcAA80TaVA/+Vskqe5fQ+oARKFRai75m?=
 =?us-ascii?Q?Fws5HhaDS9OeyqLBuJjE4/bm6a7+qmAvRGYAbRNfOVrBDfRWJ1sTr+PQEgoP?=
 =?us-ascii?Q?YlIb3imD4Qgo4P2pkQdoVQxf21Jk0RTnp3fBpgVpWo0WTS9Uo2SbVwcLvudY?=
 =?us-ascii?Q?YyVwbG9QVPisyu4m3LMFrUjH0Ed42KgOCLHRrDh7m6K3Z4Q6U0K0GWeVFKat?=
 =?us-ascii?Q?2mjn4ZaSMRxKt+l+8yXWFU6N7RcK+rTv/zXdrFyby3JKmaxk+0Ex61gpn94B?=
 =?us-ascii?Q?vKMe5zk4VJaralB5/wD6pIccu0MZIRQ7pbkX/w4tlAMpDX6lTDyD9WJucJhd?=
 =?us-ascii?Q?72vP8tTGEVh9KV+yM5NA8+dFKHP1job74QyhWlpGV7lpkaJ5qo3ARWE5TTXO?=
 =?us-ascii?Q?Qr/YM30cDGi6sYuhLylFWNrtT/wYXdp1/CGaliU26ptx5sybcbE4I+sxalyV?=
 =?us-ascii?Q?uJxJ10+ySSwGKlYwV+O6U7KSCWVA3Gm4DOXzHiuswdBhyzJx93zuRne95NEE?=
 =?us-ascii?Q?nzZiEQhCHU0LG1ExRJwZm01MeMUFfjmnS/n9VvsQEyo5AgE72NcGmMJpk17f?=
 =?us-ascii?Q?EOw+Wdis63sEd4T5Ynu6KuTBzGmFHOtAIagcT+PWhUBBjM0TGQYWmSq+epkh?=
 =?us-ascii?Q?WWC/ov+ioqCAuSDzVkeBUuUD/ZI6GZMnsY7+oK/l5I1+fOp2FJBNM683goPm?=
 =?us-ascii?Q?6XBgtvsOq5yu7hJ3V12/wHVCIHro46yanxG/l4/sby/vZU0MX8Qpj7mW5wtd?=
 =?us-ascii?Q?ze9oGk3phTaT7UlGAyMHyPMYfwhIxJ3Ou22cxlwc+9JImX0Z47H1DIxUkhRG?=
 =?us-ascii?Q?4RsXQWwsYtp10Bs6KUjV46fH0WlPeoYlqeWa9ZBNcwALVsAZb8SFB1Hhr4rY?=
 =?us-ascii?Q?Kb//4+6WgcWJeTI5JckGQvt4PcWXmZjZy9XCLd+JDu0AsJyWo9MCRPWriJD9?=
 =?us-ascii?Q?uPSnK6Hj1mzSV00hRIM9doWw6pn7GO3/RIIEt8scCFyD1w5O9SIcyh2lZ+b8?=
 =?us-ascii?Q?E+iecQU1Cz+bSmqHGnrIDC+K/rX5YXVOw7RJJfvL88XzFE19OxSc4qaOlNKp?=
 =?us-ascii?Q?e8i+86IDCs1IvKGX+Lv2j6VrBtq/2AA9NzT2gk+XQ5WUSamRDlfg5fhYDaqP?=
 =?us-ascii?Q?nQqyA2I4Gp5YlOYiWydre3fA0MCzDbQkEpouHOdqZWANS15yd8D4h/X9kU2P?=
 =?us-ascii?Q?wk6JP1rtNZ/4FTjxYscsXYBUlPNdXFkH8nttQ4GDC/bz/ktKdmgBo46ISiRg?=
 =?us-ascii?Q?48afLdkYdxYzgyd2OATHHH4hHoghPlOf9Zv7oIDHqd8WKDZE5jpGgoPn5ndo?=
 =?us-ascii?Q?4ZQpjkv24BhQxAor3/fA0xqryTSksd56R3u1pNiI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c75f13a-b1fb-4630-6566-08dcc1da668e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5624.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 12:11:34.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ntxx0EBxIUiEERee1aCnlqRW/GQ7BFw5hwMoSFe0zI0mvTaKfng3UJAvMuBRGZ3Y8DGsW13m70YQvTf1Y6OsqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7128
X-Mailman-Approved-At: Thu, 22 Aug 2024 09:39:39 +1000
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
Cc: opensource.kernel@vivo.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

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
+	clk = devm_clk_get_enable(&pdev->dev, NULL);
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

