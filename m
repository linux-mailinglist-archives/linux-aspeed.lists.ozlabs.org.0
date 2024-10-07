Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3063992985
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 12:49:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMbWC3nSLz2yst
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 21:49:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::709" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728298165;
	cv=pass; b=ab4x3hTq72KgaqbExXPE5+8vISqpg2srMVCVKDTC0WN8Be7LDLsgHAfkQ+u9WvcjOFXBDAjpiUo1iLDaSbqRzQJ6GcJ0xaOxph+6guxFFCUAsQjACvWClI7m4dS4w95p+PHiGCK1xmuF8XYHkFOE8JAw61CH/TGSvkhBXI9MvanEyEmTa8yqJ1boSJbSs5C83NpmW/1aTewlgEruan41q7evgs/4JUmaXxgcdA+A+wwJt6+izj+P9feK3o8yynC+b/1/oUfe6KQJOpmJe/CdYj163UNzvHa6L1xAqn0+zTf82N52RS3pMY9Y3FNltgveQzfu8egIfxyKKcZM7UWy+A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728298165; c=relaxed/relaxed;
	bh=4ejSWZUJowfq2W0BveNOLXFL24+r7SIn4DoXVFdhax0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mSONaTIPU4s1lXTjWBLWFnwaLcbV0bhyyKzh0fOeBv4XZm0fVh0T5IChni2SABpyLS+tVKxpvw+uyERxYdrooz27MvrOe7XwX7gjWiJKEAtt3bi/c9vxtxzzTzlO+VEddrM0k7SSK0ka+RfpZFuP3mc12h0W9+kG/fokAH0JCPof+lgN52kHTWfdRn5IrKmcDmGZQmvgFRJygfWUaKM6dY6/8S/ZpOU/4zua9F/znHYOinOEIPmQxMHQaCXp1y2i9Ww1vruqKHXncMpigajqD+KYhiMu5/Y3ThZfMB+P6GmHQTN0QyWkxGQwuaSM57vdrhhvdUtjNFQlcpB0CbFYvg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f400:feab::709; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::709; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20709.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMbVs0fmlz2xKh
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Oct 2024 21:49:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHQSRBapGZ2wEpHb0+NpGHHPb+fKaPRgI//FxGjhPThOL9hc3yXLzsqxeR2Wkdxj8zzflAdzmWLTOC9L26QtYfu13i78gIZ31tH6xxdExm3Ntq6QX/N5Hbzn2eSnYo0Gu4Y2rwwD2c6Fvh7ftzmqQIIZvcHaVdqmijIF/kSt8nSswJOQfLlLB5bq1oajUELQ+5nvPQEWCAz19z1G4Bbnm8Hhu8tlarOyhl19whlQRHHeJJGX3uhNCMj7AhRPqRFAHrhNydN/ZI3v6ueRzMQS7uq/5kQHLqKmd8q0BCkTDF5YRY/+LWxoz1rLSlucs881tNo1+oGmq+rGveYuPvxR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ejSWZUJowfq2W0BveNOLXFL24+r7SIn4DoXVFdhax0=;
 b=GJcxy23Is1VQREuIbscLH25iuWqErPV0/bXJoDKjIef0aCgHd4EnXOAJxSJgRglBjjW9TPpxWA8j7p6oe75ZS0IXcU4fBnyBxDAPoR50cR06PB/t0UcTGyqrersa2pbQtiUaJkHkFT1aMv2sc5BE6Ylt6R0LeMnpseXuXbtj0h7BQc5LaHseZLP0NEz7ZHL13hKEckPMue+JBZ67toVeW4I3kpoKQEuerFyGyA9ycg7qOMkhHMmLXoXuMrt90MR5k/aNKEslUTa9WrfhEO6bluDDJqJUTB6yJdVQGG9gv3C84z0J9kvpjIUyADSWaONXPvi6olBUXizVK0F57BmyrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ejSWZUJowfq2W0BveNOLXFL24+r7SIn4DoXVFdhax0=;
 b=ZyVpiHpQ3Q9CkQKrO4Ny1oV+7fuv2SMjE0XzjDuTRYulh1QtDZviX4nP30RzfcFDvKQTFVqRN3l/7copSN+kE4VKhQ4mlKv91yoErjcWJra7uOGntwApzGXd1yZvZvvoo76GPtFsWOIukjQdCShihdNaijcU5OcPt8SN3YTXgKm3AdK/rrYVBgIOF28MawQmJ9sD3BTonvzuL4QZLO6qeT1xKmNzQUd/q0oOuflRoz7NPjl+rhaZgkWhGEtMm73ULeNpq8H7LF87hKlu/M0LRoWtXV0Rx8jpEBHTQYsnVCoTtdzQm145cq8GIAnEDdCff46xbvVfwZx7P4vLkxgI0A==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by SEZPR06MB6496.apcprd06.prod.outlook.com (2603:1096:101:186::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Mon, 7 Oct
 2024 10:48:18 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%5]) with mapi id 15.20.8048.013; Mon, 7 Oct 2024
 10:48:18 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH v2 2/2] irqchip/aspeed-intc: Add support for AST27XX INTC
Thread-Topic: [PATCH v2 2/2] irqchip/aspeed-intc: Add support for AST27XX INTC
Thread-Index: AQHa7j7h/7S5Esh0RUuWKKXnnknulrImybAAgFSGV6A=
Date: Mon, 7 Oct 2024 10:48:18 +0000
Message-ID:  <PSAPR06MB4949E625766C4E6F5173EB1B897D2@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240814114106.2809876-1-kevin_chen@aspeedtech.com>
 <20240814114106.2809876-4-kevin_chen@aspeedtech.com>
 <4817e23e-a726-4557-b756-e0cbc54eebaa@kernel.org>
In-Reply-To: <4817e23e-a726-4557-b756-e0cbc54eebaa@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|SEZPR06MB6496:EE_
x-ms-office365-filtering-correlation-id: ac8e36b4-ed41-4615-9a10-08dce6bd8e18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?am9GWW1WUEhuSExHemM4a2t6WnBMS3JhQXJteTEzZE4vM3RNRjFvVmRDaEVx?=
 =?utf-8?B?aUJHaG13bVRQNkxkTkRWTTJBYVFoclZMQnpMK2NPYTNFeEFySk1tUGFrSE1K?=
 =?utf-8?B?dEt1eHo3UGZSZTRnSDEyaHFmck85cU1DeDRRTjFubUpzYWJSdmFVR0lWWFRo?=
 =?utf-8?B?b2RnR29GaHJqSkQrQjVNU1BEUnczQW4yckJzT0NBeS94RjQzaE13b24zYUFU?=
 =?utf-8?B?K2RFQktMMmxvMnZZbW9Bc2d5d2RvSDArV1lsK21naVRYQjZ5aWo2YXVTOTdH?=
 =?utf-8?B?aVFIanFqRjRrTy84ZFcrVlR4b05kUURCTHZ2c3lDY1dPODcxbUlPNXhKNGVw?=
 =?utf-8?B?blhUUlgrbkdGTFRFNStSVmJybTFyWFkxQXBqbjB2V1lRTTNqdmxkRWtmcHBu?=
 =?utf-8?B?eUtTOG5Zcnl0L3lBZEV0bHk3VlBRcGMrOWMyamVjZkNROUIxUXVIV1owNkJS?=
 =?utf-8?B?NGVwUEp4V2lSZmhObHBEb1pia3M1cGlpSjBza3AxdzZ0dko4cmkxRzRiWkRP?=
 =?utf-8?B?VTNyalNKbFk0WEM2VEkvelQvRjE2NEk4Z1UrSFAvN05USVdKZlM1eFhxM1Bw?=
 =?utf-8?B?YVMzcXRNZDMxU0x0OHBFeFY3QlV5ZG9rTTBLTWVDa3dHSVZHRU5pN1VHb0tL?=
 =?utf-8?B?V3YvdzJMQlRGYnFDVi9WVzJIVGZPc2x2MzQwUVE4ODJmVThpTXhpT09Mcjdl?=
 =?utf-8?B?dThLTVJwaEFYQmREZWZzMWh6cWx3OW9WVnUyNzBZQmQ4K3FiU2ovVnRxS2J3?=
 =?utf-8?B?NC9QTndvU3JXVkljWHpZTTlkcDVTZEpzV2s4T1VrNHNBZXZCTHkxLzlIZXpH?=
 =?utf-8?B?eDlIMDZKcWxIR0liZU1DY3BqZkdiUDdJVFl5RS9iVEZmTEV3NlBXNy9rYXBO?=
 =?utf-8?B?dVRtcFlSUU1ibGllOVhkbWtyN2twcGtRd1habCs0NHJVbkFxZ3J0T2ZzZ1FI?=
 =?utf-8?B?cWlFcXM4VFJRVlB6eEhNWElrL1ZyUE8zdEpNeWVuVzlPRXczekJ2NVlLc3dT?=
 =?utf-8?B?U1VhQjBreER4WEF6YlNmS0I5SkxhWEx1MFJqM2FDakJFaWRvM2l4aXYzYzdo?=
 =?utf-8?B?dm92dSs3dDhoblloaTRPZFNUM0F3QVpNK3IzZXNENGM5cjcxMUF0WGN6WUM3?=
 =?utf-8?B?bHY5MmFaYmkxTUgwZEhxU1dhNStYWDJ3KzVmMFdsYzFxQW9YQlQ3OHhzdXdy?=
 =?utf-8?B?cmJGN3A3RU4vOHJEdExwbkJKcXZyUzArSmpuYUhLdjF4MkpnUlFOZmx1K3hj?=
 =?utf-8?B?eml4ZXpGdFl2bkp1ckdiTFJjNEkyNnhOV0d5dDc2enRjVG9uaEhTZXBuWEl1?=
 =?utf-8?B?cTNyNzgzbDJTSVJCYnV2YW5GSWhIbElQY215c2h4Tkw1VXhxQXRKV3FYTXZi?=
 =?utf-8?B?RjVXbTJqTFZlb2d2dmkvU2s0Mzhld0ZSY29BZkJ6Sy9uUWM4cThzcHhiSGt3?=
 =?utf-8?B?WjZRK3RkVUFjNWhKUGtFd2RSNmo0dVZuWndDaHhKRzJCWEZEVUVwOWZQSWlY?=
 =?utf-8?B?bWU3SnJ3RjI0WjV1ZmVwRmczamVWYytwdjRhc3ZpeHIzVHl1RG1SQ2REYno2?=
 =?utf-8?B?MFRXWXFGOFBUV0xJaThKNUFCVURwSk5aR2lkZzJFY1M3Qk9pWmU1Z0JLdW1v?=
 =?utf-8?B?MjJPOTdwd2Y1R1VNY0llTm12Ny9YeG9GSTBKYUw1VWJia0xDMmlyZktrNThR?=
 =?utf-8?B?Q2J0dlhuMzdqeUlxV1lGc3hGTVFkcDd0WXBNeTY1S2R6VEE5cmFJRGY5UVBq?=
 =?utf-8?B?RjFEeTNWMHhsOHpjdzVlN3ZHTHZnU3BqV0xhMnVnMERhZldkRFJxU2o1TVpG?=
 =?utf-8?Q?PwFrnC9zjWXC+V816rOtzYgQSMo3VRmP0Jyvw=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aFlkWWMzZ1FPNFFnbmVtazRoZmdwQ08rY00xa2Z6SXhCMFM4UTBIMXIvRXhu?=
 =?utf-8?B?YUM5TFN4MzZlcjZhQVM5RDJoOXlJenpFVkNIVzlvV1AxbFdhanE4ckFCRmR0?=
 =?utf-8?B?RWN2NUVMZU5MbzlsY1pkY3pZRlltYXZlOTdjM0ZKSHlIZ2JuYUJpV2lqQUxl?=
 =?utf-8?B?TnN4Tkl4Zk5qQ1Z4R0Y1ZG5UQ1U1b2pHamFSUStQZmgvVmFaaEp6NTRYZEVV?=
 =?utf-8?B?S2R6aFdsMlFMek5OYXhLdFZ0Y3BaenA5bXRnSDgwR01nTEVGY0xhMkxBVjkz?=
 =?utf-8?B?OGcwOGhwMTVabjJNSXJVaWo3R3J2U29LNnZXRkVRVU5NNWdmQ2FUUlVWSU9W?=
 =?utf-8?B?S0JWOEw1MnFlSG5yT0N6Q0oxZThETm9zNzlyK3JMVUtXQWc5c0hwWnM3MUpT?=
 =?utf-8?B?QkhpTEs3bG9kbFpPOU1zekhaVGtJZW5NQ01RYTg2RGNtMk0xRERBdWRmUmF3?=
 =?utf-8?B?YkRiaW5VWldVVXZ4UW5YU01SUW9ad2YvdVB3MnQ2RFcxWGpJd09HVFkzcHlM?=
 =?utf-8?B?bGFNdFFsYWV0c2N1ekVna0k2Q1RvTlRRdC9NQ3MvR2pIT29KOGRTZW9wNkYy?=
 =?utf-8?B?Z2N1VWdiQTgzUFB3RTJMay9rMGZjeFNDYUV4UGpSR0ZLaWJaSUFKSkpWNUpv?=
 =?utf-8?B?dzhaR2ZETHdXNmx1Qy9CL0FqeTFLRmdBZTlvcnpEVVlkSmtLeEZTYjRhRzN0?=
 =?utf-8?B?SnVFME4vUmFmY3A1NFY0MkIrUUFoKzRSUC9vZ1V3Z0ZIRGVKd0hFQWZndDkx?=
 =?utf-8?B?MEN1dUI4QWMrSkUyYXNHd2VaZFRyd2pVYnpxMDNzN1Yxd1BnT2l1UGpTcVpM?=
 =?utf-8?B?OGhFd3Q5NjRBYTJRSTBCTzBkc1c3Q3RzN1NmVWJrd0xXK2NZZG1tTHpCbUFi?=
 =?utf-8?B?NDJPa21mVm1taEtHaGExVXJxYnRyditGaUpEWUFxNnRBN3VZVXZlaUFaVDZW?=
 =?utf-8?B?SGRWZFNUODJTTUEzSkU1aGF4ZjVGREZIN2xRUmVpckJyV2Zpa2VGcVBTUWRw?=
 =?utf-8?B?UjFYTVZOdCtwazVBNi9nRVIvN1NIMjhyTFVIenZNZnhaOW5sOCsxTStxS1RC?=
 =?utf-8?B?WUlzMmpDVERSNGEydGg4T3AyRXh6a3lvaThPaEMzSXFBWVptdVZJNTJCU0lN?=
 =?utf-8?B?VUZRYzRuWVN2Q2JlS3dBMHBGcmp6dUcvQ3MxcmV3cVFhZS9KeUdvZnRyaUNF?=
 =?utf-8?B?Rnd5aGNZeEhBRVZHUjlxYitCMml5OEFYNzRyTThWd3ZESUdoYklBWUxkdWVP?=
 =?utf-8?B?S3dJZE5WRnlZOEZJckppRUwzaUpJOTE5enZrVHpsbzNhSXhpaUE4L0Z6Skpw?=
 =?utf-8?B?Zk8yZFpONmhQcytwN0VZY28rVGJJNUwySzUrWG5ybFR0Y2dXUUlEckdQUlo3?=
 =?utf-8?B?VzJhM29MSGdEaG1yWWM3T1dLaENvWWVKNDJFZ21FeXpGQXJMcXhtUDNHa21O?=
 =?utf-8?B?Nkk1bGN2K0V4RGhocC9HMXdPT25ZMlQ5QlBoem5QQWlmZUg0U1V2anpveXVE?=
 =?utf-8?B?YXc0S3UreTJHM2FTY2ZlZWxVTWdjeGJmaHpmc1p1SmJ6UXRGa1A3b3lkVnVY?=
 =?utf-8?B?VnhqajE3S3VsSDA2RW45dWhtNmI0ME5NYXpUMGY4M3lGSnRTUGEvV3JrY2hK?=
 =?utf-8?B?R2RZa1d0c2pCMnp4eS9Dc1MyQmM1VHNicGdsaHJIRXdxbUFVLzBhK2x0Smhn?=
 =?utf-8?B?VFFQSGozN0VaS2dIRWxUajlrSjBlV2t5S01mV0JxOHNGRm9tUnRHZi9UTGlw?=
 =?utf-8?B?aUNsbFQ3enp4S1F6TXN6U0I5MWF4d3VoeEIzSURvL1k2T2s1ejhOUjBwL0ly?=
 =?utf-8?B?MHNPS1lHaUYxMlFZbVBSeHdzRXFpdVlXVnJKM1V3cVV6Z01MYm93VjBnRGZT?=
 =?utf-8?B?UUVCRGt1S2ZCZUxzTSthejVBSFB4dGh0Rlk5S1U4ekJGZmtpajk3ZFAzL1Uv?=
 =?utf-8?B?dnFSZkJuUTl3UUp3S01LUnJvZ0RVM05rTkdmUlNYNmhOd3NkVjc5Z0YrT0VP?=
 =?utf-8?B?TFByZTNlRHZPdnRZUDhxZUYyVFVEWVNnOVdoRHpwSXg3bEozdHlsOUlpY2d5?=
 =?utf-8?B?cVQzbG14emVSbGFRMVVhNXRlcXRIKzZRV3lURm1acnErako1V0ZLU1ErSGs0?=
 =?utf-8?Q?y8Z65IX4DtQLybi7/e13nhpJm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8e36b4-ed41-4615-9a10-08dce6bd8e18
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 10:48:18.6581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BZsEUO/kqqwsT5qLicM7ZY+bxwzKTkBR1rPwb5j1bl1DUUwIPeKj9GbYJjiUyRwxHdxLNSbUDi9FvC2+AXDtLyMfJvpPBJb69SyYT8/5ZSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6496
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

PiA+IFN1cHBvcnQgZm9yIHRoZSBBc3BlZWQgSW50ZXJydXB0IENvbnRyb2xsZXIgZm91bmQgb24g
QXNwZWVkIFNpbGljb24NCj4gPiBTb0NzLCBzdWNoIGFzIHRoZSBBU1QyNzAwLCB3aGljaCBpcyBh
cm02NCBhcmNoaXRlY3R1cmUuDQo+ID4NCj4gPiBUbyBzdXBwb3J0IEFTUEVFRCBpbnRlcnJ1cHQg
Y29udHJvbGxlcihJTlRDKSBtYXBzIHRoZSBpbnRlcm5hbA0KPiA+IGludGVycnVwdCBzb3VyY2Vz
IG9mIHRoZSBBU1QyN1hYIGRldmljZSB0byBhbiBwYXJlbnQgaW50ZXJydXB0IGNvbnRyb2xsZXIu
DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaXJxY2hpcC9NYWtlZmlsZSAgICAgICAgICB8ICAgMSAr
DQo+ID4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtYXNwZWVkLWludGMuYyB8IDEzNw0KPiA+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEzOCBpbnNl
cnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lycWNoaXAvaXJxLWFz
cGVlZC1pbnRjLmMNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvTWFrZWZp
bGUgYi9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUgaW5kZXgNCj4gPiAxNTYzNTgxMmIyZDYuLjVk
YTNmMmY0ZWVkZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUNCj4g
PiArKysgYi9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUNCj4gPiBAQCAtODQsNiArODQsNyBAQCBv
YmotJChDT05GSUdfTVZFQlVfU0VJKQkJCSs9DQo+IGlycS1tdmVidS1zZWkubw0KPiA+ICBvYmot
JChDT05GSUdfTFNfRVhUSVJRKQkJCSs9IGlycS1scy1leHRpcnEubw0KPiA+ICBvYmotJChDT05G
SUdfTFNfU0NGR19NU0kpCQkrPSBpcnEtbHMtc2NmZy1tc2kubw0KPiA+ICBvYmotJChDT05GSUdf
QVJDSF9BU1BFRUQpCQkrPSBpcnEtYXNwZWVkLXZpYy5vIGlycS1hc3BlZWQtaTJjLWljLm8NCj4g
aXJxLWFzcGVlZC1zY3UtaWMubw0KPiA+ICtvYmotJChDT05GSUdfQVNQRUVEX0c3X0lOVEMpCQkr
PSBpcnEtYXNwZWVkLWludGMubw0KPiANCj4gDQo+IFRoZXJlIGlzIG5vIHN1Y2ggY29uZmlnIHN5
bWJvbC4NCkFncmVlLCBJIHdpbGwgdXNlIENPTkZJR19BUkNIX0FTUEVFRCBhcyB0aGUgZm9sbG93
aW5nLg0Kb2JqLSQoQ09ORklHX0FSQ0hfQVNQRUVEKQkJKz0gaXJxLWFzcGVlZC1pbnRjLm8NCg0K
PiANCj4gWW91IGFscmVhZHkgZ290IHRoaXMgZXhhY3QgY29tbWVudC4gUmVwbGFjaW5nIG9uZSBi
cm9rZW4gY29kZSB3aXRoIG90aGVyDQo+IGJyb2tlbiBjb2RlIGlzIG5vdCB0aGUgc29sdXRpb24u
DQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
