Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0749F957A05
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL26DH7z3wFk
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::702; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20702.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkvP21wxXz2yQJ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 15:50:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEIvytECSbAliAwYfv4EPlCu3DsRIH6qYGt22R0BHajnwYmlN2LyELv+AlVV0ammWAWbJ66aLewX4xAuMh9sp5oSLyhl39WEZQVvGmH0FcvS4aqIlT2QNRaNGbmoQx+YXbStQMXEpeO9IL9PdOzhZNJxLQ43yKrLkVu2hiGB2z0ZRxrR/S3rAR78A978AYfu4KGMypQuX08laMpGwxk62Tk/Nd3qCiq/qPBQrjVJlrWo4LQiHUCdEfPH1BMJr8gV0i/yd8oZqv+uDIjiBzZ8GDi+acwbgA1ihybYcr7ngaWLR5q93Rht7wAhC4WsFMMxzzw/rNYhGdN8aa7zeDfHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDJSQ1KxnGS2+7ssITcU7/BFBVHltviuMbRCk27ehG4=;
 b=D7YkRUf+UFIpqJRmPq4+HBNv4GcVHLtloJbskwaXfLlAPFgZZhY5Iwo9YyEP+ySolZGnTYTvFGZ4x7FS+F+G1gF7zkU22hDN8Xj31jl7JcO5D2xTxwsjaPIB/C6uEEBJvFHfYA4OCcJUpwyie6BJwV8nn9Cz4B5CmjgagtAdj3m5OsmvOIikTgjo15iRvDK/C1jKgANoheAOm2hO7og/S9t3LVyf9RR/u5+bK3a7RaN/hRg3bEsHDB5QawPnQ3MFFe/3wcd6bj2lO0kQtOIQFAaC6xVwHE7edvXU0dK1rhUh64EYejMQe93unkTKSVaG/2CAxL7cGnNSjNVUmKHefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDJSQ1KxnGS2+7ssITcU7/BFBVHltviuMbRCk27ehG4=;
 b=Xv02UqCTQmw3cqKO+VL9mu16kLUO8olpmQthZ7KM4gJUfITSbnaTcOd5G8vJTdVkATj7Gl0LmjV/j3Hhq43tByxhOVq7Upwnnq81IBZHzuKewyDl3OOMVYBQShyZQwP/xfa2Ic9ZSKPl49rM6t0ULJ2VOgmfHjn8aDd9Vr33KQzSpycf7tQrN/LtuyUvpR3DuSgk2vMk+zM3qHWFM9P1SMC80D/UeOPHksFXFojj8fKHZfMLE+U7/26+u1vGl9IiI1WpKnN04dsQHm4JAkmTN9i2YbIDiobsqoHv6wYV7NfHWWPBh3wGcpL8gOqxB9eSNpWnqohUEj3qjB2mFDS4FQ==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by SEYPR06MB7000.apcprd06.prod.outlook.com (2603:1096:101:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Thu, 15 Aug
 2024 05:50:16 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 05:50:15 +0000
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
Subject:  =?big5?B?pl7C0DogW1BBVENIIHYxIDAxLzEwXSBkdC1iaW5kaW5nOiBtZmQ6IGFzcGVlZCxh?=
 =?big5?Q?st2x00-scu:_Add_binding_for_ASPEED_AST2700_SCU?=
Thread-Topic: [PATCH v1 01/10] dt-binding: mfd: aspeed,ast2x00-scu: Add
 binding for ASPEED AST2700 SCU
Thread-Index: AQHa30uG4RfiWECZjUKlZ41AVxAy57II2jIAgB7sjwE=
Date: Thu, 15 Aug 2024 05:50:15 +0000
Message-ID:  <PSAPR06MB494964BEE33B160EE5E2159289802@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <20240726110355.2181563-2-kevin_chen@aspeedtech.com>
 <e6cb6f26-fef2-49bc-ab25-fdc9a659f593@kernel.org>
In-Reply-To: <e6cb6f26-fef2-49bc-ab25-fdc9a659f593@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|SEYPR06MB7000:EE_
x-ms-office365-filtering-correlation-id: b67ade65-b84b-41f3-7a51-08dcbcee230c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?RlNTOHFDUlM3WjZObHljNEFDK1BXdU9KdUtzL0VTd3gwR0gzUmNjVkR0ZHp3dFhH?=
 =?big5?B?OFA4M2ptYnI4UFh6dVpQKy9iVjdIN1VFZS9ZaWVBVXFZVDNMUTZ4U1BGZWkvM3Z1?=
 =?big5?B?Rk5jOHlocC9jSDROR2hYVDNjdnFuckpxRnc0aUY5MGk5SFd0enJRTjhJNWVPMXVw?=
 =?big5?B?c2ZCZlM1K0dDVTI4RnlicWhDR3NoZzdGbnlEbyt2cmZZczJLdlNWRzgrTTZyUzFr?=
 =?big5?B?bnMzVlRTTVhhdUZERzJEU0Z6cFMzTW56RkdPTDZWREhJeG83S01DVEpzNWkwWjE3?=
 =?big5?B?ZDVwRDhKWWErcmlhc2o5VGhRbFh6MHZBYWdJV2c3V3RmRTg2Q0Q2bzF1ZXdYcmtG?=
 =?big5?B?V0xVZWlhUmwyZTlIMXN0UnhSZFdQY1NnM0NuT1pFSUZIM2RiQ291eHVnM210NUh1?=
 =?big5?B?a2UvaHRtRHpPZ2ZKa2FQcCtoTmNrYmNsRHRuWittaEZ5bGhHeWpsdzYyWEpmR3du?=
 =?big5?B?N3BMN3VKQnVTamRiY1dZb3pKUkhqeW5mVkRXb05qdGsvZjA0YiszOGNNanNzREJ5?=
 =?big5?B?Mmlodk4rbXFQVWF6bTAreFVvcVNMRkxsUk5Ob243cXBkeU03cXN1dzlwQll4SUhK?=
 =?big5?B?WUkzVTJLNHZhRXRvb2tndVRqRE5vc2VXaUtzNit3Z3hOaVRkVFo2WlVsNStMYTgv?=
 =?big5?B?TGdncllUVFFDZlJRd2dXejFVcEh3U3dJVU9GZVJLak9OcDc2NkM1RWJxZTEwREt1?=
 =?big5?B?ZGJMVERhUEZXVlliWUNaN0NOMFo2QWVGKzhtWUt1RW9GVEtOc3d6ZnlvdnhCQ2kr?=
 =?big5?B?dkROMVk5cHh2RVJna3lsOXdQeHlDL3VYU3YxeFpjS25lUFFVR1JZT3AvZmFFdEo5?=
 =?big5?B?QUV2NmdWdWJNMUlRNHlqUDNFOXpFMzhWdHNLKzlnY1hmMDluaXVuVmd4Rmw1cEh1?=
 =?big5?B?ZlRiMXpzbWdTOXM1clpKTVgrTkhXbnZJUit6Z1dNaE9pb21uNXEzK3dwT1NnNWc1?=
 =?big5?B?b3dTR3IzeldrQy9OcHBIdzhkR3R6Q3pCb01qNllIMUxkZk41QVdUeFhma3I0Y3Vk?=
 =?big5?B?RWRtQWpaQ0Z6WUFiZG5XVEtNN0VaK0hQUExyL1k4NkxVYmQxMXlMYXFscmJrVGdh?=
 =?big5?B?ZDM1Qk0vVzBVdzcxZ3BIYlV1aStkZzlnQitzczM3Zzc4eTNOWFdtaHE0S1JpOElD?=
 =?big5?B?UHBMcGEveGt3dXpOSnhQdXNqS3I3Nkk1MDdFbEJtdmVxRndxVE4zZTg3c1lRa0VU?=
 =?big5?B?d1A3TmJTejJVSXBJZzZSZ2FPYWZibTNSM2FpeHVFT21uZHlZZ0JUbVNWcXdXRkx3?=
 =?big5?B?OWNJNDFDNDNyQ2VNdHdZMjhnU2cyUXdVWHNLTXZqclRTTWJVUnhnaC9wVkpwSWdU?=
 =?big5?B?cHlTWHgrblhDV29lYS8ycFBOcmFNbzVMR2g2bXFvVHhxSlZuaHloU3hsbit2ZXlQ?=
 =?big5?B?b1M0bHZNeFNtZEN5akM0RUJQOXE0V3h6NW5qS29Ud3FIdXBqajM0bUUwaHlMNldy?=
 =?big5?B?L3JIWVFGMUkrYTBPcnZDRTVoNE53aG9LdHMrV0t6TVhHdFhpYzExV01QbDRqOGcy?=
 =?big5?B?d3k1cnpJLzJ0dEc5Q3dBS2dDSDEzakVSMUZ4aW1Qb2thVjJBVEdHckxjTFcrbmoy?=
 =?big5?B?WVpxZGZIb21FYUxIK0N0ZkZnMldHWmR1Z0RmeU1ndnlQKzl0aGJOb3dUcHgvSWNL?=
 =?big5?B?dk5UbE9qRUxoMHJNTkVBSnRjNDdPOFl4SFlTSTdtMU1vWkNhRTNOS2o0aS82OFIw?=
 =?big5?Q?xhj4ZZt4R+GW7IDgjU8AmCCZYYggLFG/Z1dbHRSbopc=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?Mm93YjExYXlhN09qOG5kYXZHSlJtYnRxc3dwSzM3M2FqQmI0a3lHeWpxNzRFbzBF?=
 =?big5?B?REJzaFNlaVdEbjFIYXVsRHRuZzFJcmJzYlI5aHhlUTNmelhRWXdTM0FKNUd2VFgr?=
 =?big5?B?M3N4UlZiYnRGVFFmcjlFbXRLQnk3UEJtOGxDWWVDd2YrZnI5OGJ3L1BaR1lUOXBM?=
 =?big5?B?Nms0cHhrTGFEYm9WRE44aUxqSmN0VmJkL0FxaVd6WW5GVzhXWDN6bkdDWlZuSmFI?=
 =?big5?B?dHVPbDcxYjQ2ZzdrN1Q4R0M0dUpISEJ0R1B1UjVoYTJVa3Y2OGRjdC9QaDBHd1p4?=
 =?big5?B?Ris4dlMzR1IxK1RKeUFyWmdKNlFybXBHM0xnWHo2SCtVY3R3NXQvNU02dUZBR0JV?=
 =?big5?B?R211L0h5d0toNGJzM1lNdUkvUWZPQ1JMMGpVUHg2ZGhmbWUxdUtPWDlLQzYvTUdw?=
 =?big5?B?MnAxM21vNnA0b1BhdzlBQ0JuVWlOalJVQ1VyWGU2WDVUT1ZGQjBYcENLelo2c0No?=
 =?big5?B?WjRrb1RwbWMwejJqYXhWVllWbXM1eGdvcVZDa2M4VlN6K0RCWHdIRjNXOFM1UStp?=
 =?big5?B?dUNSbWVoSU9NUXkxZWh2OFgrTVowSStwSTVEYy8xR0FVdTM5WWxhbHdWUlFNQkJm?=
 =?big5?B?MkNMTU1WVURLY0JZLzNlSlhhTndDRjVaclF2Z29NbFhtOWtpL3k0eTkzZFkzUHJr?=
 =?big5?B?YWNPZE9YaExvdnUvY29wZG1KVXYrL1hLWWp0cTgwczg5NHh5MElJb1dIRWhUcGFK?=
 =?big5?B?aCtBQ0k4bVF3QnFtc0hmcFBXUHArS0QzclRyU0J4MDY4RnEvUzY4dTF1MlltaVYy?=
 =?big5?B?aGsxZDRZdVNORHpOamNLWWRIYTAxaHZWV24vWEw5MC90ZVVTRS85VGVNOG9KWFE5?=
 =?big5?B?K1NEMUsreUNZSHpUREYxYklWbTFqYlNCWXliN1I2SEVmWE5DUU92SmtWUUNaRmlM?=
 =?big5?B?SFZnbk1TemRBQllzL2hDYk5rbkYzbzl4QysxV2ZpK21OSE1HL0FibGZZNHJzWGR4?=
 =?big5?B?OEt3NHJkWG9CR1lKME5pVGFPOHlGUWRBamRhRzRscnFVTUxCbGF0TWMrdkprcWRi?=
 =?big5?B?ZkswdHZkQnFENFZHaDFaOVIvTVVvcEc1dHR3VVhTVWQ2U2dMOEpIRld4dTlLZ1Va?=
 =?big5?B?WTR6Zy9WTW9ONzNROTRFZW03TnBzVDE1Vmd2bzJDaS9IWktPQ3dZVTVNZHFPRHZT?=
 =?big5?B?bUxiVG5zUU9SQUZBOXV3QmxGMThJTHoyN09XMWdwaktMSFNmblJQS3BCMmkza3FP?=
 =?big5?B?NXlSQXBUdmZvQW10MHpCVHB2SUUyWERHVlJkNTNtYTVJZFhHcitOeWJQbGp6T09R?=
 =?big5?B?b1lqY29zUkk4NVRwS0dkSFo1QS9LQ2VIQUxpbjFQMkt6dTh3Ni9jWXBhckxheWhp?=
 =?big5?B?UldydllwRjVvaC8rTVY4eGJYM2RNTnBIKzRkNWw3Lzg0UkJ2QmZqVHl5SjZOaFVR?=
 =?big5?B?aGpBQU1iUnM2dlJKZktCZ2JDT2RaVXBUbXBCLzlvS2tidVJ2KzkvTjZHVnR0S1hW?=
 =?big5?B?YmZDZE9yYm1DRW5RVjlUam9KWGl4WFZ0MUFDOUVVRExYL1EwRFBBZS9Kd1pTcXFW?=
 =?big5?B?SUZOR0poOXkvWjI2U3pqQTdXZHowTWhoU0FzYzUzdTdzUUJhZnBoYkhxVHo4Smh2?=
 =?big5?B?b0Q1ZkxQR244UUlUZzBrQW5wNDhqTU1yeDl6akJJTW1pd2VVbUZtem45NjJYY1pO?=
 =?big5?B?QTdFWXBMQVFubzI3U3ZudTRub2dFSnZiZ0NrU210ejd2ZXpOQU1HS0NxZFJMVHJE?=
 =?big5?B?dnpDd25takxvWGdnRUdKV0dmYVp5dkMyN3QreFlpL2d1R1FLNXNBVy9VcXovRE1t?=
 =?big5?B?TS9BQS80RlNMVFI0TDBzczY4QWNtMzdSVUZGNG5DVzdZVkM5M3gwVGNhalBGazU5?=
 =?big5?B?MFh5VGdNb1Nna3pNVWdWOTZGZFRjV0pSY2k4M1dGQXlvVUVMM3JZNzB0MjNSdHhX?=
 =?big5?B?MTlHdVdDbjVWSWtpOU1lOHZKRnVFYkN3YndFMWJ0RGJyTklyZlp2OHVic3A0YkNH?=
 =?big5?B?SVh5VzhFYzNzUXNKT2wyQlRuQ0NLU1hsZFlHMStyOXBmb2xLNk1uWDhqUjZiT2FV?=
 =?big5?Q?0mqsawSlAeGF73Ib?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB494964BEE33B160EE5E2159289802PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67ade65-b84b-41f3-7a51-08dcbcee230c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 05:50:15.5559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SW3YACOBS9Kc8F66924zrv65OpoHQTtEhZigWtSWxRzS+7yQXUkX6sM0Q1tzOiz0zrh8oOao9kjlnANK+Kf63tkuw7Sj6zlR3STNRJ4bK9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7000
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

--_000_PSAPR06MB494964BEE33B160EE5E2159289802PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KSSB3aWxsIHNwZXBlcmF0ZSBjbG9jayBwYXJ0IGluIHRoZSB2MyBwYXRjaCBp
bnRvIFJ5YW4ncyBjbG9jayBzZXJpZXMuDQoNCj5NaXNzaW5nIGNvbW1pdCBtc2cuDQo+DQo+UGxl
YXNlIHVzZSBzdWJqZWN0IHByZWZpeGVzIG1hdGNoaW5nIHRoZSBzdWJzeXN0ZW0uIFlvdSBjYW4g
Z2V0IHRoZW0gZm9yDQo+ZXhhbXBsZSB3aXRoIGBnaXQgbG9nIC0tb25lbGluZSAtLSBESVJFQ1RP
UllfT1JfRklMRWAgb24gdGhlIGRpcmVjdG9yeQ0KPnlvdXIgcGF0Y2ggaXMgdG91Y2hpbmcuIEZv
ciBiaW5kaW5ncywgdGhlIHByZWZlcnJlZCBzdWJqZWN0cyBhcmUNCj5leHBsYWluZWQgaGVyZToN
Cj5odHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kZXZpY2V0cmVlL2JpbmRp
bmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI2ktZm9yLXBhdGNoLXN1Ym1pdHRlcnMNCj4NCj5B
IG5pdCwgc3ViamVjdDogZHJvcCBzZWNvbmQvbGFzdCwgcmVkdW5kYW50ICJiaW5kaW5ncyBmb3Ii
LiBUaGUNCj4iZHQtYmluZGluZ3MiIHByZWZpeCBpcyBhbHJlYWR5IHN0YXRpbmcgdGhhdCB0aGVz
ZSBhcmUgYmluZGluZ3MuDQo+U2VlIGFsc286DQo+aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuNy1yYzgvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
dWJtaXR0aW5nLXBhdGNoZXMucnN0I0wxOA0KQWdyZWUsIGFscmVhZHkgZml4ZWQgaW4gYW5vdGhl
ciBjb21taXQgaW4gUnlhbidzIHNlcmllcy4NClsxLzRdIGR0LWJpbmRpbmdzOiBtZmQ6IGFzcGVl
ZDogc3VwcG9ydCBmb3IgQVNUMjcwMCAtIFBhdGNod29yayAoa2VybmVsLm9yZyk8aHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWNsay9wYXRjaC8yMDI0MDgwODA3NTkz
Ny4yNzU2NzMzLTItcnlhbl9jaGVuQGFzcGVlZHRlY2guY29tLz4NCg0KLS0NCkJlc3QgUmVnYXJk
cywNCktldmluLiBDaGVuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQqxSKXz
qsw6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCrFIpfOk6bTBOiAyMDI0
pn43pOsyNqTpIKRVpMggMDc6MTANCqaspfOqzDogS2V2aW4gQ2hlbiA8a2V2aW5fY2hlbkBhc3Bl
ZWR0ZWNoLmNvbT47IHJvYmhAa2VybmVsLm9yZyA8cm9iaEBrZXJuZWwub3JnPjsga3J6aytkdEBr
ZXJuZWwub3JnIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBjb25vcitkdEBrZXJuZWwub3JnIDxjb25v
citkdEBrZXJuZWwub3JnPjsgam9lbEBqbXMuaWQuYXUgPGpvZWxAam1zLmlkLmF1PjsgYW5kcmV3
QGNvZGVjb25zdHJ1Y3QuY29tLmF1IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+OyBsZWVA
a2VybmVsLm9yZyA8bGVlQGtlcm5lbC5vcmc+OyBjYXRhbGluLm1hcmluYXNAYXJtLmNvbSA8Y2F0
YWxpbi5tYXJpbmFzQGFybS5jb20+OyB3aWxsQGtlcm5lbC5vcmcgPHdpbGxAa2VybmVsLm9yZz47
IGFybmRAYXJuZGIuZGUgPGFybmRAYXJuZGIuZGU+OyBvbG9mQGxpeG9tLm5ldCA8b2xvZkBsaXhv
bS5uZXQ+OyBzb2NAa2VybmVsLm9yZyA8c29jQGtlcm5lbC5vcmc+OyBtdHVycXVldHRlQGJheWxp
YnJlLmNvbSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBzYm95ZEBrZXJuZWwub3JnIDxzYm95
ZEBrZXJuZWwub3JnPjsgcC56YWJlbEBwZW5ndXRyb25peC5kZSA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT47IHF1aWNfYmpvcmFuZGVAcXVpY2luYy5jb20gPHF1aWNfYmpvcmFuZGVAcXVpY2luYy5j
b20+OyBnZWVydCtyZW5lc2FzQGdsaWRlci5iZSA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmcgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz47
IHNoYXduZ3VvQGtlcm5lbC5vcmcgPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBuZWlsLmFybXN0cm9u
Z0BsaW5hcm8ub3JnIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgbS5zenlwcm93c2tpQHNh
bXN1bmcuY29tIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+OyBuZnJhcHJhZG9AY29sbGFib3Jh
LmNvbSA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+OyB1LWt1bWFyMUB0aS5jb20gPHUta3VtYXIx
QHRpLmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZz47IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyA8bGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5v
cmcgPGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnPjsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZyA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWNsa0B2Z2VyLmtl
cm5lbC5vcmcgPGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc+DQqlRKauOiBSZTogW1BBVENIIHYx
IDAxLzEwXSBkdC1iaW5kaW5nOiBtZmQ6IGFzcGVlZCxhc3QyeDAwLXNjdTogQWRkIGJpbmRpbmcg
Zm9yIEFTUEVFRCBBU1QyNzAwIFNDVQ0KDQpPbiAyNi8wNy8yMDI0IDEzOjAzLCBLZXZpbiBDaGVu
IHdyb3RlOg0KPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBDaGVuIDxrZXZpbl9jaGVuQGFzcGVlZHRl
Y2guY29tPg0KDQpNaXNzaW5nIGNvbW1pdCBtc2cuDQoNClBsZWFzZSB1c2Ugc3ViamVjdCBwcmVm
aXhlcyBtYXRjaGluZyB0aGUgc3Vic3lzdGVtLiBZb3UgY2FuIGdldCB0aGVtIGZvcg0KZXhhbXBs
ZSB3aXRoIGBnaXQgbG9nIC0tb25lbGluZSAtLSBESVJFQ1RPUllfT1JfRklMRWAgb24gdGhlIGRp
cmVjdG9yeQ0KeW91ciBwYXRjaCBpcyB0b3VjaGluZy4gRm9yIGJpbmRpbmdzLCB0aGUgcHJlZmVy
cmVkIHN1YmplY3RzIGFyZQ0KZXhwbGFpbmVkIGhlcmU6DQpodHRwczovL3d3dy5rZXJuZWwub3Jn
L2RvYy9odG1sL2xhdGVzdC9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5o
dG1sI2ktZm9yLXBhdGNoLXN1Ym1pdHRlcnMNCg0KQSBuaXQsIHN1YmplY3Q6IGRyb3Agc2Vjb25k
L2xhc3QsIHJlZHVuZGFudCAiYmluZGluZ3MgZm9yIi4gVGhlDQoiZHQtYmluZGluZ3MiIHByZWZp
eCBpcyBhbHJlYWR5IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUgYmluZGluZ3MuDQpTZWUgYWxzbzoN
Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjctcmM4L3NvdXJjZS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCNMMTgNCg0K
DQoNCkJlc3QgcmVnYXJkcywNCktyenlzenRvZg0KDQoqKioqKioqKioqKioqIEVtYWlsIENvbmZp
ZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNCqdLs2TBbqn6Og0KpburSKXz
KKnOqOSq/qXzKaVpr+ClXad0vvexS7jqsFShQajDqPyqa6vfq0/FQKFDpnAgpXi63atEq/ypd6Sn
pqyl86rMoUG90KVIuXGkbLZspfOzcaq+pbu5caRstmyl86SntW+wZarMLCCow73Qpd+nWadSsKOl
u7lxpGy2bKXzpM6o5Kr+pfOpTb5Qt7Sp0qazvcamTKXzoUPBwsHCsXqquqZYp0AhDQoNCkRJU0NM
QUlNRVI6DQpUaGlzIG1lc3NhZ2UgKGFuZCBhbnkgYXR0YWNobWVudHMpIG1heSBjb250YWluIGxl
Z2FsbHkgcHJpdmlsZWdlZCBhbmQvb3Igb3RoZXIgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uLiBJ
ZiB5b3UgaGF2ZSByZWNlaXZlZCBpdCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVy
IGJ5IHJlcGx5IGUtbWFpbCBhbmQgaW1tZWRpYXRlbHkgZGVsZXRlIHRoZSBlLW1haWwgYW5kIGFu
eSBhdHRhY2htZW50cyB3aXRob3V0IGNvcHlpbmcgb3IgZGlzY2xvc2luZyB0aGUgY29udGVudHMu
IFRoYW5rIHlvdS4NCg==

--_000_PSAPR06MB494964BEE33B160EE5E2159289802PSAPR06MB4949apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Krzk,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I will speperate clock part in the v3 patch into Ryan's clock series.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;Missing commit msg.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;Please use subject prefixes matching the subsystem. You can get them fo=
r</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;your patch is touching. For bindings, the preferred subjects are</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;explained here:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-p=
atches.html#i-for-patch-submitters</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;A nit, subject: drop second/last, redundant &quot;bindings for&quot;. T=
he</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&quot;dt-bindings&quot; prefix is already stating that these are bindin=
gs.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;See also:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetr=
ee/bindings/submitting-patches.rst#L18</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Agree, already fixed in another commit in Ryan's series.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://patchwork.kernel.org/project/linux-clk/patch/20240808075=
937.2756733-2-ryan_chen@aspeedtech.com/" id=3D"OWA25cd1bd0-174c-0d0c-4d85-4=
e35c7fe23b0" class=3D"OWAAutoLink">[1/4] dt-bindings: mfd: aspeed: support =
for AST2700 - Patchwork (kernel.org)</a></div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
--</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Best Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Kevin. Chen</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>=B1H=A5=F3=AA=CC:</b>=
&nbsp;Krzysztof Kozlowski &lt;krzk@kernel.org&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b>&nbsp;2024=A6~7=A4=EB26=A4=E9 =A4U=A4=C8 07:1=
0<br>
<b>=A6=AC=A5=F3=AA=CC:</b>&nbsp;Kevin Chen &lt;kevin_chen@aspeedtech.com&gt=
;; robh@kernel.org &lt;robh@kernel.org&gt;; krzk+dt@kernel.org &lt;krzk+dt@=
kernel.org&gt;; conor+dt@kernel.org &lt;conor+dt@kernel.org&gt;; joel@jms.i=
d.au &lt;joel@jms.id.au&gt;; andrew@codeconstruct.com.au &lt;andrew@codecon=
struct.com.au&gt;;
 lee@kernel.org &lt;lee@kernel.org&gt;; catalin.marinas@arm.com &lt;catalin=
.marinas@arm.com&gt;; will@kernel.org &lt;will@kernel.org&gt;; arnd@arndb.d=
e &lt;arnd@arndb.de&gt;; olof@lixom.net &lt;olof@lixom.net&gt;; soc@kernel.=
org &lt;soc@kernel.org&gt;; mturquette@baylibre.com &lt;mturquette@baylibre=
.com&gt;;
 sboyd@kernel.org &lt;sboyd@kernel.org&gt;; p.zabel@pengutronix.de &lt;p.za=
bel@pengutronix.de&gt;; quic_bjorande@quicinc.com &lt;quic_bjorande@quicinc=
.com&gt;; geert+renesas@glider.be &lt;geert+renesas@glider.be&gt;; dmitry.b=
aryshkov@linaro.org &lt;dmitry.baryshkov@linaro.org&gt;; shawnguo@kernel.or=
g
 &lt;shawnguo@kernel.org&gt;; neil.armstrong@linaro.org &lt;neil.armstrong@=
linaro.org&gt;; m.szyprowski@samsung.com &lt;m.szyprowski@samsung.com&gt;; =
nfraprado@collabora.com &lt;nfraprado@collabora.com&gt;; u-kumar1@ti.com &l=
t;u-kumar1@ti.com&gt;; devicetree@vger.kernel.org &lt;devicetree@vger.kerne=
l.org&gt;;
 linux-arm-kernel@lists.infradead.org &lt;linux-arm-kernel@lists.infradead.=
org&gt;; linux-aspeed@lists.ozlabs.org &lt;linux-aspeed@lists.ozlabs.org&gt=
;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; linux=
-clk@vger.kernel.org &lt;linux-clk@vger.kernel.org&gt;<br>
<b>=A5D=A6=AE:</b>&nbsp;Re: [PATCH v1 01/10] dt-binding: mfd: aspeed,ast2x0=
0-scu: Add binding for ASPEED AST2700 SCU</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 26/07/2024 13:03, Kevin Chen wrote:<br>
&gt; Signed-off-by: Kevin Chen &lt;kevin_chen@aspeedtech.com&gt;<br>
<br>
Missing commit msg.<br>
<br>
Please use subject prefixes matching the subsystem. You can get them for<br=
>
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory<br>
your patch is touching. For bindings, the preferred subjects are<br>
explained here:<br>
<a href=3D"https://www.kernel.org/doc/html/latest/devicetree/bindings/submi=
tting-patches.html#i-for-patch-submitters" id=3D"OWA0097e513-e647-ae1d-01b9=
-99b5d9b9beff" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://ww=
w.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-=
for-patch-submitters</a><br>
<br>
A nit, subject: drop second/last, redundant &quot;bindings for&quot;. The<b=
r>
&quot;dt-bindings&quot; prefix is already stating that these are bindings.<=
br>
See also:<br>
<a href=3D"https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/d=
evicetree/bindings/submitting-patches.rst#L18" id=3D"OWA98cc7a80-6e2e-4266-=
86cc-dc51e31e7821" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https:=
//elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/binding=
s/submitting-patches.rst#L18</a><br>
<br>
<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</div>
************* Email Confidentiality Notice ********************<br>
=A7K=B3d=C1n=A9=FA:<br>
=A5=BB=ABH=A5=F3(=A9=CE=A8=E4=AA=FE=A5=F3)=A5i=AF=E0=A5]=A7t=BE=F7=B1K=B8=
=EA=B0T=A1A=A8=C3=A8=FC=AAk=AB=DF=ABO=C5@=A1C=A6p =A5x=BA=DD=ABD=AB=FC=A9w=
=A4=A7=A6=AC=A5=F3=AA=CC=A1A=BD=D0=A5H=B9q=A4l=B6l=A5=F3=B3q=AA=BE=A5=BB=B9=
q=A4l=B6l=A5=F3=A4=A7=B5o=B0e=AA=CC, =A8=C3=BD=D0=A5=DF=A7Y=A7R=B0=A3=A5=BB=
=B9q=A4l=B6l=A5=F3=A4=CE=A8=E4=AA=FE=A5=F3=A9M=BEP=B7=B4=A9=D2=A6=B3=BD=C6=
=A6L=A5=F3=A1C=C1=C2=C1=C2=B1z=AA=BA=A6X=A7@!<br>
<br>
DISCLAIMER:<br>
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing
 the contents. Thank you.
</body>
</html>

--_000_PSAPR06MB494964BEE33B160EE5E2159289802PSAPR06MB4949apcp_--
