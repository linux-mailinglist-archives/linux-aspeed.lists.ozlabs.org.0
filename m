Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEDD95FE0E
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2024 02:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt88D1n7wz2yfm
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2024 10:49:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::615" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724655806;
	cv=pass; b=MRMl+IOiP4CQjfmsBGW3CAaUbxtZP7Te5BlpTnpv260lNpm7oVNBjl2dNGkFntnnCRff8zRHGFQXHfa9murgOe6ZF+v7RK3ovZtza4sG3QeAS5w8TZwV5LilzbXiDRU6CLGr7DCVbnWZcXBGxM4R1LF5B7fzWZmlaaZIy0xNMtXrmHB8bhqSdYvaoo/gkz2w1RaAYxFBDqM14q4D6Dl5DIUw45SD4NzwTna8bW8lrwDOsypXOzENyfsQH+hPjggeECf9mxTtILbQNUZZ7KGFbADKc65OgMA4AOGCgrc2t+ah66T3SCideDNGYM6TVeorx/LvzGPkGNNhmAecKqqrYg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724655806; c=relaxed/relaxed;
	bh=9G4SIElM1iVOlScJgsDjuvZP2BzHL137tu5+ozmC3dc=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=YKjuhnv9; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::615; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=liulei.rjpt@vivo.com; receiver=lists.ozlabs.org) smtp.mailfrom=vivo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=YKjuhnv9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:feab::615; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=liulei.rjpt@vivo.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WshTl5Fncz2xSM
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 17:03:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZAeTyR/wjPwhyLuHL6/IL2SYiAQ8y9pYuwcRMUF5+Klqcm4I2vQbsWYTC+kHU/+3tVmNmYwsxkl4HANDVmJHdJq4SFMzWKRUaTy+HjfzExeueOI6h1qGz9Nse5J/gxMW7cvCxFnDq1lElSL6XU9jjQKCMni7hZazorb47DKEyI/kLqOv7JYmKZl5ajuOx8hYlKANBnoNuRIUEKtDPsfOT3VpFDsGw304ibj+dHbf+H89VPGN3onYVAZolCB9f0761iAPOfym5ld5sRF63C6Fd0rTqrXKKFE4vQQdDGkkI8AZ2A/tg2smUO2Sa1vXcML7SqcyvXUNl2Y4p5RuyU3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9G4SIElM1iVOlScJgsDjuvZP2BzHL137tu5+ozmC3dc=;
 b=Cl/52Cf7ivauDcVSq/qDCUwfVgIAD7RqtkHZbkug2AuXcXStXW4yLHd67nn9/iVL1sfwzTxOr17v1PuL6l8G1UDhhFMlp1u6NRyC1H5F+XOfCr7cN4fhHVVsF/Fbo7bJoB5tjuCB6FeniGzdrZ+h/VLns7SEPWnu2spEkQXSxhbnzFzcz6egToZjjQlzTEF1CZk3+rOATw4p5gMo5E6OIoU7rnyPTSHKglbMJmWTBRYC2ITKjQ5sJcBjlotmgRhrb0GsuVBEN9xmtZwqOid5G7B70+gYOp1Pv/6BxInbmScnrLHTYQsgLwkJ5AKtlbn/SgbE/KUfn1SkGo8zMctcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G4SIElM1iVOlScJgsDjuvZP2BzHL137tu5+ozmC3dc=;
 b=YKjuhnv99tosk2dY8eKP6mDKJAj2/5kH/qy+4WU8QnbAfNI42ncNFyoMjM6788FLZRJeyMPRpNMeTQV9wHos7kEzttWFXvbBrgg0wMV+SHocPFbLD7wpllz9c1TiJiQfu3+xH+CywNwJFBWK4g3g8ZHG7obGRKXiWkHNJ59n2vftnDOqchL7RScrnN0iK0Knn8fThJ0K0o54KOwOTI41pPAqJ5Yqjr0/g/scyXq1YtdSlTMg/2I6K/nKnIJ2OCQ5RjsI/JL5jBGRotVWXxtMlx96NSGWvRMdTkSUSBt2odKAL9YP9igV6n8gK/6rJVpoqx/grcYE8KIFg13I054DeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5624.apcprd06.prod.outlook.com (2603:1096:101:c8::14)
 by PUZPR06MB6055.apcprd06.prod.outlook.com (2603:1096:301:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 07:02:57 +0000
Received: from SEZPR06MB5624.apcprd06.prod.outlook.com
 ([fe80::e837:10e3:818e:bdfd]) by SEZPR06MB5624.apcprd06.prod.outlook.com
 ([fe80::e837:10e3:818e:bdfd%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:02:56 +0000
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
	Lei Liu <liulei.rjpt@vivo.com>,
	linux-aspeed@lists.ozlabs.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/5] usb drivers use devm_clk_get_enabled() helpers
Date: Mon, 26 Aug 2024 15:02:38 +0800
Message-Id: <20240826070244.1835-1-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::23) To SEZPR06MB5624.apcprd06.prod.outlook.com
 (2603:1096:101:c8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5624:EE_|PUZPR06MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 5581a048-c6cf-418f-90e0-08dcc59d1c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?OC5iInawkBwUMk2zZurC3t9s4VPjncKra6vsP8NeqXps22Up6zrIoQEsuFsJ?=
 =?us-ascii?Q?9zVwYpzUD+NIW8bxo2vvSm2xZ6LkU/7AFaky2sCxomCjq/IgAW7H5azIPLY4?=
 =?us-ascii?Q?9BmuGkmEj3/c/poceD62cenAMzeb/6D3o5GY+kyslqzZ6EM+YTpgAzVLKlA2?=
 =?us-ascii?Q?6suLQ/4HE1eI3ldNCDJzD+xYvCdOgs6a111dUXWyxU9kI7RLufFmkGyf/NTa?=
 =?us-ascii?Q?3aJBU4VSyCu/A4oUHNIL5nFuSOqWRjrsnz7e8Rs/u2nrXUDX/AC0QmV+rwkI?=
 =?us-ascii?Q?5qJRcTeREG7KFt2hKKBKYl1wgot+wwlvxHO89ift9s5pXDV5ls71+DoaLlQb?=
 =?us-ascii?Q?zgIPnWtRK4aWC0krxOTM9iKf/UDhEa2mFc7h3IZmH/k02i4q/WTfqfNQMGYK?=
 =?us-ascii?Q?Doaxt9gWeo6yh5vI70ksNnEDsXeiUN52NnffPQRXUq6FI5Atq9hGvlPQguqf?=
 =?us-ascii?Q?xkRerypZrFA49APeJPJ83NGtsZatS62d7mYT3VpyD16q2eOfhurh/oKd+Bgk?=
 =?us-ascii?Q?pq1KuOyqsaKUjFeUf4yyRthM7DeeFHpPQ6k2TBTx1V6PHb/EHYrvGA6xE5yW?=
 =?us-ascii?Q?uXWROeYYLZ2Rmvxr1rnz3OVI9TLPgCnjm2f4A5D8vtjL7/3d8nUtG3KpnKdv?=
 =?us-ascii?Q?0McrPhvfqGdSU3K9gyrdmtEmy76U2BpWghmKuldWEIOJBLaz49+uPBEIURaf?=
 =?us-ascii?Q?cP1ArxxNpr1hCW7jtgQUsSyzm4iv6PAHDh79koGtLR9olpS7CG0SwBQWbfex?=
 =?us-ascii?Q?trrOxlzE5ofXQenpA/ES1anAB0Pp2Tbey+L6nWEEyAmGBalvHn79gV8eTC+5?=
 =?us-ascii?Q?mTMtg5mm3/YzOU4djYglQhZBbxaf7VO3yTk6g7UhbFYSjJBxEuiMIXDBlPne?=
 =?us-ascii?Q?qQaROU1dfTEjYoG76cbWsIRuflLoKpbP7/OqiH9jZBUZHYBnrIQO0J+GKXHn?=
 =?us-ascii?Q?xSIgme8J9U6/yTkaWZHkuZnmK18GZ3jPjwk4l9BFAJYU/toUozyRm+gjUExf?=
 =?us-ascii?Q?tcHnQjXPC0oe9sDNt8LT9lmeg4+8p5IsJYL1Qw5DfKJSKAEMdPspR9WkhyHw?=
 =?us-ascii?Q?5YlwfDHtWg9Q6Zy5SW/wdK5iJgmZinngzsAJbuOP/VnlQQ61ZmzWed/ph6oO?=
 =?us-ascii?Q?TKdY9L2569l0/mvUnEgNHniUW/Ju+2Lr6PyGjOabkyGOGpYeJRfCuwA+yBRh?=
 =?us-ascii?Q?sVFY4PjdDNRIZb9PZDhbV8LQGhzlNbc9epAD1LAZTFhRX7Anyuvot8d8UGkw?=
 =?us-ascii?Q?qc41mrfzgM+Xx41MmD4QRmDLTdyPNxWsbDcnFugyh5I4o5eN3PRB9FDh5YMM?=
 =?us-ascii?Q?ENpwxzSLkwc1e0N/z+tQ15koSsnGiszh7aQUzVMILRr0LMkphoQQ/WCmlafM?=
 =?us-ascii?Q?DzMYhm2P1ofVkM0O5Ve6MWKxfZ2jG2W5mJVjwwA4vY6GzVHk8BAJJdh49Moe?=
 =?us-ascii?Q?4MptdEBjP5JHfMTRDOPOWhoKEMBMgMGr?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5624.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WuFFIGyltUUMAgaeKRA5xdXDR0MIVxJgadAU9iJaqv2cCl0AN6nXIMBjSeK3?=
 =?us-ascii?Q?4hcGrw/em/dkDONYGxGivOWciI3iuDq14rDJi/TtvEQOhOvDPSF3C6MVezad?=
 =?us-ascii?Q?Fw5cP+u2aoZ1LsoAynZoftP9FnbkHw7lk75QCE/qTWwPMohhXNn3PGTgdhbz?=
 =?us-ascii?Q?WFky7J4PBAAxV88fd8zJQlf2vwT1/YT7roZl/B+IdVXGTSmUIv92axhaFY8k?=
 =?us-ascii?Q?5UoLoBHxYL174h/XMzX9L4blZto6ndlSJd7vfJy4lf6ExYNTyRRv7cAw4JG6?=
 =?us-ascii?Q?B+T2qiqfP37pPV2xfpORrOHZge7YeQMFX3ctaAyjYLOl9RihCuQSxMdaqljV?=
 =?us-ascii?Q?cJnlktRoWFMLZw2ubZCrU7xzbxMZrYgpM5xXmI6fkA9e08zswAdMogY4HFCK?=
 =?us-ascii?Q?UyzEbLT+n8kc6JovKs4dJtQRBhv/Xs8U51zpLDZelbZMpb/P/Peeg567pTC8?=
 =?us-ascii?Q?Fl6OVKoJ6w53hv6YuqsyZH+KLb7Dz6FPPm9QDjY9zCqz8pkqs802AgB6HZ+b?=
 =?us-ascii?Q?K4kxyZFhcACs1PEWqJw8bokWjoJII+7LVaCvQAn3V5u6TQSFVofwWLpg1btn?=
 =?us-ascii?Q?u9ZKOnes8xlvpFMMXE6Ki77PhuM/nyOJZrXoaOGdfJbRXiHdCLLR/xqq++Xt?=
 =?us-ascii?Q?H2TFmqhNE4yF/7mYbVUpfqOw+XS/0ttbUmnPtpg8dEaJEPFFFACSmUHJDNiV?=
 =?us-ascii?Q?AoWH/HHieOKO4eCE82t3V0WYbjCeVePUveTsJk2ZF7w1rLBsAwqGj09SXITq?=
 =?us-ascii?Q?D4gCMceogk1rGv2rHV5GA6Ce5r/p/rn9ZPCpmd1DGywHEImOZ4IlpqJcIAK/?=
 =?us-ascii?Q?WSqZ4rTVb1S7PJ+e5/4KnQpDN+apaMLqTwO94viskMZ7Pr6l2PFmcwJjZbWH?=
 =?us-ascii?Q?9qJYtUJDsjkeH2d6fleArnF6SYnUsBDukWyR7SI8rq6FHJ4jyDuMr4aNwM/4?=
 =?us-ascii?Q?K+uX3yw0MaLYPv+lB0Ud1aINUm5O9LZfUgnsl99go+FVWOC40yP3Hz69t5X7?=
 =?us-ascii?Q?OSdvY7UVGnvM5ac1e9s8CIjA1RribatQrl4kvIk8VZEV3/r0SHOJszFyZCUd?=
 =?us-ascii?Q?RKx91mYbFBVPblcO4dAqxQN2navfEZ099tk0ucMdH4KNr7tRzKmh7cn+F8tv?=
 =?us-ascii?Q?zwpZmtDKbEvJiSMBb5hg45mI1bOYA0RIUFvpcBUNPwu5YorSMqjfGGwM9N+S?=
 =?us-ascii?Q?R0V7M1OSc0bnWsa0TagRIrUC300AgJf2rqTCJ8YDsIlUYdTyAHEqvTs9LQ6I?=
 =?us-ascii?Q?Iq69XDb0kLH36hcZZ38GqnhCEBPdbs8w+smFlVoqPmTmvVk7Mj4zf3+/EQ6S?=
 =?us-ascii?Q?6g43+YWz9e7m3D7g3+AhX1W1zGoYYwN7p/Ma50BrXgKwHHWyFZT1sxv8Or9N?=
 =?us-ascii?Q?xqo6iImhZKQzzzUOBB1PEZbBuAtR2JaAIabfEdYeFw+4hiZy/Ni0t+CbO1hI?=
 =?us-ascii?Q?k+t3vP/lk8QqWsiQ7Dcaw+bKCWYpFy+BnGKt6Me46YyVGkGUsjfsFF3NtBJf?=
 =?us-ascii?Q?nv29P2XlAtNNrUu/D9JCEdj1Xmik/mhdh5ngYSn13RQkPaOMM4PpaMblwBMR?=
 =?us-ascii?Q?wmjOEPViMBGVMIiJT+4MxIXrB0KtVo2A1dJh4Br2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5581a048-c6cf-418f-90e0-08dcc59d1c9c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5624.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 07:02:56.3476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElUZ5DyEIQxSBeUDS5+4D2UMdpmuz2fiBnRxRQ21qCo5XZkP+EZv+yTxcmqU8JidBoHUJ7B+CCi6LS/5X5yvrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6055
X-Mailman-Approved-At: Tue, 27 Aug 2024 10:49:46 +1000
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

---
The files ux500.c, mpfs.c, and pxa27x_udc.c have incorrect usage of 
certain interfaces due to the lack of synchronization during the 
commit updates. These issues have been corrected in the v1 version.

version 2 changes
1.ux500: Incorrect usage of clk_prepare_enable() should be corrected to
  devm_clk_get_enabled().
2.mpfs: Incorrect usage of devm_clk_get_enable() should be corrected to
  devm_clk_get_enabled().
3.pxa27x_udc: Incorrect usage of clk_prepare_enable() should be
  corrected to devm_clk_get_enabled().

Lei Liu (5):
  usb: aspeed_udc: Use devm_clk_get_enabled() helpers
  usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
  usb: r8a66597-udc: Use devm_clk_get_enabled() helpers
  usb: mpfs: Use devm_clk_get_enabled() helpers
  sb: ux500: Use devm_clk_get_enabled() helpers

 drivers/usb/gadget/udc/aspeed_udc.c   |  9 +--------
 drivers/usb/gadget/udc/pxa27x_udc.c   |  6 +-----
 drivers/usb/gadget/udc/r8a66597-udc.c | 16 ++++------------
 drivers/usb/musb/mpfs.c               | 22 ++++++----------------
 drivers/usb/musb/ux500.c              | 18 ++++--------------
 5 files changed, 16 insertions(+), 55 deletions(-)

-- 
2.34.1

