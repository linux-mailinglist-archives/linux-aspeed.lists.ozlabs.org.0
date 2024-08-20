Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8742957A1E
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqLB4thVz7Bpg
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::700" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=XCFTBLOH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::700; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlT3v2TZbz2xks
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 14:07:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmuhVla3iNgDI3gCw4V8jH4HBaUiAoNOx0dv1yKjLjeVVKAoqOhhJKO84pPI4Tc7RTNBmSNqh0HNipWsJoHSMf4bx4waQS92yPsXxbAGM6l6OgQmblJCeOuk3CjnPO6r3rT5L8WpE92xpFgNCeuxnA28b//dzzTb2yq31tWBfZYmcCWnvB4rmRsJN6I3EW2S0Q3V12SmwkFooSy1J7a5vgNd2tVvCOmEKB5wIo3yMnNjh/tAqqOCkKhZWWzPA/PlzcdpKVCIsGzreYunLT+AMraldlzNGJl3OQ7MbZyMICjh6+pjk86r1vQX8kyUeNv0okw+EzrrzhuA2iGaOeljWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USmOSZB37SRKORQk5RjgPZN/QANjzV7IL+2DOCG4FLM=;
 b=CSQgnCug6/7oIM5aHushkHlDc+KqmoQgvI1/S9D0yxmLVS9wSVus95P7X9zJIdllXEIkKo33PKbb2n2xZXbYaIbVAmAe/es+vsyAaeY5WpYkdGzeEAGN14JVlgyHA/z8geV2MuDkV6BNvKcXjiY+71PzUYdDrnVQk+p1Gs3uo7Qdaua/7zd6KQOUj469/JviGiRjbS2UV45OdB8MthH5crn04/HdqvM6+8EAdNt3WkpRz0wPj/vNCGwon2zGwJLTUp7tFx/HWRkIHnjrFjl5EG86Cqd0kjO+FKpo8uUSZ/yBCdF8tMsR0m2YfnnMzhRLwALggkEFzGaNdrfeTMxq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USmOSZB37SRKORQk5RjgPZN/QANjzV7IL+2DOCG4FLM=;
 b=XCFTBLOHDHXKZfwEKfDLxcjh4a7qaqEY5LqWl5gwbTmi+j8YVo8WKXYTyDf1q3OyTBRATvVh5JqIjOpdKSaFBNOutm6n79ODF9UFAIKpwmw3smKRyH1El0HvoG1J4RqOZAx+CdJuzAK3MAGsUZjkZiaRRpDD+cKB+CnHL2XrWd7JgtWAFgn/wZlilEFXNtgUyc4cawteT9Dp9DsrpDEkbbK7F16YD0l2T8BgdBxphjRYB7PfP3YniYKg4SlFFth8rRNDNjoeKtneD+MnrcPRtN2ThYcS14baBohJp06WM+Rvky9f+LMvBnfqL46DuKXNYfwOCvvCao1YmYEuGtPJEQ==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by KL1PR0601MB5510.apcprd06.prod.outlook.com (2603:1096:820:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 04:07:52 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%7]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 04:07:52 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "lee@kernel.org" <lee@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net"
	<olof@lixom.net>, "soc@kernel.org" <soc@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "m.szyprowski@samsung.com"
	<m.szyprowski@samsung.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>, "u-kumar1@ti.com" <u-kumar1@ti.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH v1 05/10] dt-bindings: arm: aspeed: Add maintainer
Thread-Topic: [PATCH v1 05/10] dt-bindings: arm: aspeed: Add maintainer
Thread-Index: AQHa30uLS7p8iSeFD0em3skhlhDe/rII23QAgCBsv0A=
Date: Fri, 16 Aug 2024 04:07:52 +0000
Message-ID:  <PSAPR06MB4949F7EC3AF7B75BB5B8A39289812@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <20240726110355.2181563-6-kevin_chen@aspeedtech.com>
 <7f3f7255-e177-4689-a2f1-b5f3196ed1a5@kernel.org>
In-Reply-To: <7f3f7255-e177-4689-a2f1-b5f3196ed1a5@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|KL1PR0601MB5510:EE_
x-ms-office365-filtering-correlation-id: 62f1375f-e572-4c0f-300a-08dcbda8fff7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:  =?utf-8?B?Qm8wY24xU0VQdHJvMEYrZ0YwVXhSa09mN1hYZnpCUHJVcFVTVVZyeGdGQlBh?=
 =?utf-8?B?Q3liMHJIaUplbTMxWVBoU3lraTlJNXBZczE2ZDc5SmtTR1prNXYzc09zLzh1?=
 =?utf-8?B?SGZZYkNJYW5WVWxLUW5aQkRVUjRtallwMzl4eWdrYXBEbGRkUzdrMFZaVXdN?=
 =?utf-8?B?VUF6bFBZYTVuNndzZGVKL3daR0VrY0hqSUt0VExNK3Q2OC9zV1NXWGUxdVA1?=
 =?utf-8?B?T0lkY0lyT1B2UlI2ZFE4TVl0cnJJT2tTWkFzeEFUUlNDQmNrZEk2R3lqSFk2?=
 =?utf-8?B?RGVpSk9PeEVqV3lUVWl4bjdUQzF0SjVPcllKRjBFcmxOOGtnNlVQRUppZ1Qr?=
 =?utf-8?B?eTNWa1RCMEhtUVQyZ21GWjAzb0drbHlwalhOaE4yWGN5bHo1R2RTZ2UzbkZ6?=
 =?utf-8?B?QzJOcmF3Qm83K1lXOXNWSC9wTHdRR3RxUk9aTkNzRTZDbWNHcUo5YjkvbnA3?=
 =?utf-8?B?V1gwbTk2VWFTRnM4ekNrWTFZRE42Uk5CbEx0bk0rK1pkWEVieHRwRU5tUHlh?=
 =?utf-8?B?Mk1NMmFsR1kyWHhLUXNyUzVQL1E2ZHZ4OFR0TGx5REhBMWlOWGNadDNKekVa?=
 =?utf-8?B?S1dId0ZZQldocWhxK014eGFmVWZPUDRtYjhnUGNUY1dya2cxcUp0ZVVTYTFS?=
 =?utf-8?B?U3ZrS29sSUprMTNxdHp2cUxjVlBlTXNTeWdlRGNXRVR5emV1UCtFdXFvV1dS?=
 =?utf-8?B?YTRkaW5kT2ozNnIwYWcwaEY4L3BNMDVXTUtjMzY4YndWam1NNkR1dkpBaFY4?=
 =?utf-8?B?TjRBUjVDNExNd3RhTDl5Q25weDhmZEE1QWZaYmI3NmlFL3BDYk9yOGxTYVly?=
 =?utf-8?B?V3loay9LWExkaFZwNW92Q1d2TnRyUmF6eDg1TnNjUmhyOGsrQWdoS2JLN1lL?=
 =?utf-8?B?NnRjeVNscU9YZkpqUHlkSEJPVW9PRWJ0VXNlQUxaaWdTQVJQNkZMTEtUVVlF?=
 =?utf-8?B?S3VZbGQrNjRXL2x3dVBIRFRVSU5LUTZpcHYyNXVtSmhGbjFPV0YyNnRxNStF?=
 =?utf-8?B?bDNRR2lwQ3hxUEVOczJGTUZqM1RXU2hsaUpNdFphUGtyZzVsNHNOOHlVWUcv?=
 =?utf-8?B?djVFaXE2YkJOQS9lUWo3azg0N0prdmR2Q0F1eG1qNzE5c0pER3ArdlBvTU4y?=
 =?utf-8?B?YzV3anBFSDhzL044VWwxSmVQWTM0SFJWVU9MTm5nZ1dGdEx5aUJ6ZVBNb3NZ?=
 =?utf-8?B?R3F4VDJCdVRZVndxQW44MkdWVVlYNG1leldxcHh5bytUbVhDd1BNWERiYldl?=
 =?utf-8?B?dWtRaXFXWHJPZ1hTMG84VXpXY1R2L3JsYTNZWWowVkQ4S09kYURKVTBkS3No?=
 =?utf-8?B?dGhlZlBHMXNpODRWdE5WTnhSdlFJSTRKU2tqMHgxK01LeVhlTjFnck9EdkQy?=
 =?utf-8?B?aFBaWFk0cFgvRWdBVVY1clZweEV2MWhnY0UwOVRpOW8vdDZsQ21ZTmFnZDB3?=
 =?utf-8?B?a0ozY1dWT2dlTU1DZVN1TlIzNFhXcDNyMXp1YWpabWxoVFNwYkdLWjBmVzA4?=
 =?utf-8?B?dFA3OXMvUkJlRDF6Wit1emdpaTZabUNXV0NjYy80YjByWTVGVnpHeFBEdFY1?=
 =?utf-8?B?dks4WC9jc1lIMmU0UmtaVmhIekExdDRYL1dPNkxHMFpwbnZuSUJZQzN3RmxP?=
 =?utf-8?B?a09CWXkza00rSmFkV3k5a29iMDZxZGdqWlVid1V0VUdOTVpLeU84QUF1ZThC?=
 =?utf-8?B?dUd5d1pJb1hlRU5wTlFrQ0h5ZmRvV1pVVzNOTlFjaFdneTFoWERiU1I4RGVS?=
 =?utf-8?B?Z3hVVVRtM043UEMwbElqWXB4QjlUbGNiVDdtUWFXb0FxVDdtWjVHMU9TQnAw?=
 =?utf-8?B?cnAvZDcxd0ZxRlMrRklRS2VHdldRTk9LZWs2YWtrTFNrQkQrMm1vK1VaQmxK?=
 =?utf-8?B?cVRSM2VvU0RKMjBldFA1SVFVTmNhVTRJY0Zybm1ybTQwTk9PWGJhZUI2VXJU?=
 =?utf-8?Q?q01rnLHiNaM=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YzR4anNFUUIzSTUvNmxlMlFpNWlnaC9EN0pDeHdDNUpnR2tsUnVjNmdpcEl1?=
 =?utf-8?B?UXhkZC9hZDFtREhsbU9uSE01blQycDAyM1h0YlEvb2V0ZUZUZi9hTVVJaUN2?=
 =?utf-8?B?R2oveXFGa0xYamRpaEZTK0VveUxUUStpNWpvV0JjenpETlgvVGVmaGFtYWI3?=
 =?utf-8?B?OHFwUnBrVFovSGl0RWswcDNWOWxUZmJ6U1d1OWFEZ0ZIN0tPeEN4WVQwNTNo?=
 =?utf-8?B?SlowSFJUTTJHNGQyNGxBcE9FTXVGRUprQk5SMHI3LzJMUFJLOVFwYUJ5TDFv?=
 =?utf-8?B?TVNSdDNBVHZ1RERGM3VPbk5aVXArQUxaVWwvZGUyZWNYN3N3emV1TzN3UzQz?=
 =?utf-8?B?a0ROS3NHMHI1UUNDZVVSTGlDbGxQaC96QjJiTG9QNCtRbDdNcGNMM3R3SkJm?=
 =?utf-8?B?Z0NEczI0eURTeUVmZ21IdUcwQ0ZjTXoxY01yU2xKUm9hODdEQXBqQkNQejdj?=
 =?utf-8?B?VERzZ0RnbEh3bzNzenV3cWMwTUZYeDVUVFRIamNpMjlhSTZjak5WZFhrdGU4?=
 =?utf-8?B?RnBxV1RHZWltSDcwSWJRbjFENzRjeXFoazVpWmcveGNqcVYyeXhiWmNzQ1NN?=
 =?utf-8?B?Z20xNlVDYzVHWlJvajJ5NXJnZ2YwTTNFNlQ2Z1hqRm5kelJpY1lxeTlOaUYr?=
 =?utf-8?B?OEM0TU5WRTZsLzR6bTU3VGp4Z1I2TzJUY1ZuWFN3aTBrOEtJYks2ZitKai9P?=
 =?utf-8?B?eXpwZktRR2ZTYlZBM3pLQmUvVXE5N01XNEJNRUpIRHlXYUp3OXVDZG1RNXhR?=
 =?utf-8?B?Sk4vdXFhSGt2YVhPZzNHZm1VZUtLaWlvNWhhTTUyV0ZjS3kzaFhQaDFnMVRF?=
 =?utf-8?B?VmJnRmNjVEJyWlJNQzB1Q1NRaVNYRVpvMm02ZHVEV0xuZWdiSTZLOXhsUUZW?=
 =?utf-8?B?N0NjVVNRL25MZml3ZElWdlI1cm4xMnoxWjQwSy9WT2ppeFpsT01DYldJTFZl?=
 =?utf-8?B?WHBYenQ4Qm05VFlOT3A0T0RFUXU1YlUvVUpDYmZkc0pTRG51OU9SRGhzYU12?=
 =?utf-8?B?OE1RWjJhaEo1bU0wdGJqQ1lQR2dXVFkyM1N5M2FxckFEN0JTUmVLOU1zdnpS?=
 =?utf-8?B?cnhGdlFhVlNGWFBTWHB0bVV4d1JKN2wxYy93UXRRa1N2NXkxN3JMUnFCTjQw?=
 =?utf-8?B?cUNmaGJnODExemRLRktCcjU1UFV5aGR0RHFRczBCRmRsNFB4ekhMWnRZWGpH?=
 =?utf-8?B?OEg4MGxKdWZHZFd0UTcrZk01NzZ2UGw0NGNuWWVndDR2aUdNVGhnTGdWakR3?=
 =?utf-8?B?bFROZHNUWWRqVHZpMTdQenNUR3hLTFA1V0FZZ1NSMFNFbDl6T2UvY2pJSURv?=
 =?utf-8?B?RllPRTIzTDNUZVNQSjBXcG1PQ0xSUzNEallGaU5iREF0WlU5NnQ3YXNMcDBV?=
 =?utf-8?B?N0pJVDBhMk9NM2VPR0tEbGk4TjBjZTF5b2s4NjduU1FNakZEZ05CREVacDZL?=
 =?utf-8?B?Z1JtZ1VKaHdkbWlrYWgwSVFCcFgwT0NISVVsb3dtVjlieDJTTGhnUGpqTUZ5?=
 =?utf-8?B?aEdGbFgwZGJROE8yTHdHWE9nTVFzaVk1dnhWaldCOU1GV3I1OFVqQVNJMGhy?=
 =?utf-8?B?dDh6cGM5ZWkwRjlnVlFYNlhTekMwUEtETGt6elJIVGZDd24xajZYaXBSRDhh?=
 =?utf-8?B?OVZjenFzYWgyMEVtVDZEN0wvSUFLL3dONTM3YUFrL3liVWZUVFIySW54T0Ix?=
 =?utf-8?B?QkdyaVlIUUtkMTNvVUhSVDZrZFJnbldWSDRVblljT1ZjZStNdjZuQU5jeVpG?=
 =?utf-8?B?SGpTTkpTV2ZyK1ZVMmJXYVl2akZWM2M3U3EzakdLYkFNalF5a3ZVZ3lwMkNN?=
 =?utf-8?B?M2xaSHNxK3N0bkpsOVJ1ejdPSStMem90RjY5QlR3RE1OM1IwQS81WTNLcklu?=
 =?utf-8?B?RE85WXg1aEszdzVFbE5Nc0JwQ09iK1crb0pXVGlLTmc3dm8ydnRKVlpxeHBM?=
 =?utf-8?B?M25Ob3FTam5mWWNHa0JBZEZhSTBlRklkY1JSclVaNDRBUkJHSGdoTE80OE90?=
 =?utf-8?B?SzFTYzhnZ0dwNUZ2TEgrMk83TVcvNnJFUVRvVis1V0hqWE9CdFdnSE9sZ3JI?=
 =?utf-8?B?c21LSnRCYVpKRWMyZ0RyZFZ4eURXaUY0VmFLTFdZSjQ2Q1JiaUo3ZjdzZzZ1?=
 =?utf-8?Q?T/l+udVBrbLE8PpDPseRu2LQ/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f1375f-e572-4c0f-300a-08dcbda8fff7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 04:07:52.6270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j06QJ5Hl9A3IH6/8IQzS5GBM1bKkH3GsychFjY3K4Vwem6lhvsxAAAE9GgK28vhHGX4WR65U7YzSq60DSgvOxJx9f+vRHT20z/KDmHa+by8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5510
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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

SGkgS3J6aywNCg0KPg0KPiBXaHk/DQpBZ3JlZSwgSSB3aWxsIHJlbW92ZSBpdC4NCg0KPg0KPiA+
IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FzcGVlZC9h
c3BlZWQueWFtbCB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KLS0NCkJlc3QgUmVnYXJkcywNCktldmluLkNo
ZW4NCioqKioqKioqKioqKiogRW1haWwgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioq
KioqKioqKioqKg0K5YWN6LKs6IGy5piOOg0K5pys5L+h5Lu2KOaIluWFtumZhOS7tinlj6/og73l
jIXlkKvmqZ/lr4bos4foqIrvvIzkuKblj5fms5Xlvovkv53orbfjgILlpoIg5Y+w56uv6Z2e5oyH
5a6a5LmL5pS25Lu26ICF77yM6KuL5Lul6Zu75a2Q6YO15Lu26YCa55+l5pys6Zu75a2Q6YO15Lu2
5LmL55m86YCB6ICFLCDkuKboq4vnq4vljbPliKrpmaTmnKzpm7vlrZDpg7Xku7blj4rlhbbpmYTk
u7blkozpirfmr4DmiYDmnInopIfljbDku7bjgILorJ3orJ3mgqjnmoTlkIjkvZwhDQoNCkRJU0NM
QUlNRVI6DQpUaGlzIG1lc3NhZ2UgKGFuZCBhbnkgYXR0YWNobWVudHMpIG1heSBjb250YWluIGxl
Z2FsbHkgcHJpdmlsZWdlZCBhbmQvb3Igb3RoZXIgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uLiBJ
ZiB5b3UgaGF2ZSByZWNlaXZlZCBpdCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVy
IGJ5IHJlcGx5IGUtbWFpbCBhbmQgaW1tZWRpYXRlbHkgZGVsZXRlIHRoZSBlLW1haWwgYW5kIGFu
eSBhdHRhY2htZW50cyB3aXRob3V0IGNvcHlpbmcgb3IgZGlzY2xvc2luZyB0aGUgY29udGVudHMu
IFRoYW5rIHlvdS4NCg==
