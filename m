Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 300909579FD
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL10Vfjz3gLx
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::709; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20709.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjmgh2X0dz2yV3
	for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Aug 2024 19:44:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3kb6u9ISVqDpCnknQNLoV8KLm1ukdZRmuNLwEsIEHjUIN4CVSJZzqTxed9bBAK04+KwQMYV6bEeNMQNDxWkPPXXjfjG0XKkUI2XERStun0gq3eLCrUIk2VknTqCS0eJw3Q+lnW/qnHCa21SHb73NTDHj8fu2VOYBFYlaPkdHI5fUZqlbvMRqKba3xYsFCRt5FcUg9WjktPSINpeXqeBU2GCJZy1j74an2OYY0W6kUl1Pf7VA7W2o1Czp8x7CHo4deVmgcATDZOMfF21aGy/YmZrk1P5cLPudgnnCVxMHQX0gB0T4SkmyN0fbDrBMupwHS434QwArq0gZCCnKSTmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amKVsK2pB0bYAc2JmKFrX15xqHvi9OagpIhGxzApxLc=;
 b=G2IeBjQkUK5XGDsS1UCVEntpR76wA6FRjFYVr/x38GWtovj80b5W4jlRH6I2nSRSyxoQAFx/iJoY7J9l+Dlfd/m1f8gvKilYilsGaJ1mqsFcnElqEYGJwuRiFt7FIj0MKmkg1L3Rt2uiRecWMR9fq+Nlm71q79cCcHJ+F2dauVNdILLNSBTAELXnT3ffwfiZlK0YF93VjLnOcdBk4C4DK4oUweW0cbto1ks6OFY6nBRgQjzYjY+Lt6KCx82RNFo6LKb1p7U+JD08J+d+gPhQHdkTfv3ZvF2gPP/opEXs9vXYZXwWTEbu8Ge7ZNxsos0Nmfy3NosnUqMaBdp0UdOKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amKVsK2pB0bYAc2JmKFrX15xqHvi9OagpIhGxzApxLc=;
 b=Aa3OAMmoZHhctfUCx9iiYzI03imhzQXPNUPt44rZpjQwv5se5N6vvOwuhbSwLlpElSRnQJEiXqTZoZ/VCfgSnQjeJ6ZS233J/dQobXU4wvoOI8nmnQ5tZJ/nKbjBoeBorpXLbpLnkLyXctCx6XDB2jJIjtSyaBnCSt+zKhBxpRGxT0w6H84omYuSDm51ePm4WJAr4g0BHZTAIc4NfBSXVpRNyIk6GQTV5RrPJbGm2ZpCCiDW1744lVK3hY5XiFKhRQBo//zfL4Jx9IRYPAH8T2zhyYv4TT9KKc22/62h9mmb72CFXOtM9dTmcu82AEwj/Lojs16FCsbaOkezLKT8nw==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by KL1PR06MB6233.apcprd06.prod.outlook.com (2603:1096:820:d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 09:44:03 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%6]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 09:44:03 +0000
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
Subject:  =?big5?B?pl7C0DogW1BBVENIIHYxIDIvMl0gaXJxY2hpcC9hc3BlZWQtaW50YzogQWRkIHN1?=
 =?big5?Q?pport_for_10_INTC_interrupts_on_AST27XX_platforms?=
Thread-Topic: [PATCH v1 2/2] irqchip/aspeed-intc: Add support for 10 INTC
 interrupts on AST27XX platforms
Thread-Index: AQHa7VSHSw8wQLr8FkWU5QCTbIfyFLIk4RKAgAAJDOo=
Date: Tue, 13 Aug 2024 09:44:03 +0000
Message-ID:  <PSAPR06MB4949680EBF66DCD47F2B4CF889862@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240813074338.969883-1-kevin_chen@aspeedtech.com>
 <20240813074338.969883-3-kevin_chen@aspeedtech.com>
 <315f9095-8928-44a9-bab7-a924a070eded@kernel.org>
In-Reply-To: <315f9095-8928-44a9-bab7-a924a070eded@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|KL1PR06MB6233:EE_
x-ms-office365-filtering-correlation-id: a26f8055-8d1d-4f42-e4b8-08dcbb7c774a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?bVZrOWMxVnprQnpBdXNwRVNzT0FNb0k4UStVS2NoL25qZmRSalYrQVJFSDl1Y1Ar?=
 =?big5?B?Ri9ZeFBoNUtTUzUzTFllNTZiVjBxWFMxQXFvTGhaUStOZUZTNVdoRUZnNmZ4MXRi?=
 =?big5?B?R0MwWU8xUGVEOFZoT0gzYTZNRy8rN1ZVUGJ0dGNITkdIM2c5MVV2WVU4MnBYTGdQ?=
 =?big5?B?dzRXbW5MZit0ZzlMSVdqN0d2WnpUQThjcVVqY1VjTVNFY2g0Q3k1RUk1ZjBQVXQ3?=
 =?big5?B?Y1RjdFZ4R3czVHUvZGQ1eDNQM0RTaFNQZWhUSENlYVlqdUY1U2czaDllak9wNEdX?=
 =?big5?B?VDAxd1FIeTFONHcvM2Zmc1F4emFIdUlLYXMxbmN1WnY4clVTS2VhakwwVEJ0bGpH?=
 =?big5?B?ZE1LKzRkblNKWDZjdVFIRkI2d2pIaW9DZVU3OENIM09yS24yakFGaW9raUpDeTVW?=
 =?big5?B?UldMVjdyUUdEYllNV1BsbWFaQUVPM0p0aUVwbTJTc0tiRmxpbU5kVGJidGcwQ1ND?=
 =?big5?B?bnJzaVgvM0c1c0lBZEloS0NQdjdrMytDeWpiWFAzR2huM1pQMTJMOFBna0pWNHM1?=
 =?big5?B?V0JvNmE3ZENoZTFIRmcxbGptb0YzNHlTT0puaWc4bXhlYmkrMjF1QzNpR2NuRE1j?=
 =?big5?B?aUNLMWZRZnJNdzFibDRVV0x6Ym9rd1JEK0JvS1htMS83cm43cVpXbW5DbU93dklQ?=
 =?big5?B?SEFWVW5UcVk5MVBjVDMvVGxCcGZjS2t6eHl4YVY4cTkxTkF4QWltMm82UGtxbzJv?=
 =?big5?B?WG5HeG02ODVyQXJLOXphVGtsbkEzVldEczhyMXl1dzZkclQwWnZoMVZVZFFKKzRT?=
 =?big5?B?SFdiZ3VtYmhBdmk4NFlNT0R2NnhkRHZTbmpEZldsYTg4N1hxMkpkREI1STdySzho?=
 =?big5?B?aElhSnNUb3pYZmVIYlpIUHpZOURhT2VwdzkzT1BpdmpMT3ZqRWZtb1RlY1JuSmRo?=
 =?big5?B?TFZudW5zYmIxaG1vNFdkT2FzdjhjN21wMVdRVmV4ek1UUW9MZXU0WDZaS3hyWENt?=
 =?big5?B?ZHZZa0U2NldtNDB2L2RYV2dHcVRZQzZEWTBCYVhwaFpJTnVOMFV5STYweEorR05X?=
 =?big5?B?NlF5UDVKcWQzSVNzbFAwWmtkbHRURXIrSkxEK2MxV0FUZmFHTVBkdUlpMC9MK1hu?=
 =?big5?B?ZXQvc2xRYTRQamdUTmpLOTlKMHZaM3RYZDd6K0p3cmEyOVV6ZS92ZGNWTUJqT1lK?=
 =?big5?B?Qjh0NVVhK2RkeXk0MHV3VmFCVDNYMm9Xc2ZxTlpaOFJHUmkxU1FoT2Vhb2Nob1hu?=
 =?big5?B?OEtMR2VRUkJCRVFCZzc4eis2SXA0L3czNmRMRjBCMThkLzVJTktNQnJFU0ZBMndx?=
 =?big5?B?RGFxbnpvQWdsd0pPSWthajJXSWwrZml4NXROR29EUUhPME9IekNlYlpTWDJwSTc4?=
 =?big5?B?QUhKd09jc3RBaWRvNkNBVy9FVG54K1pVT1dwd2QrY2Y5YXFaWCtpeUYyYWwxOVds?=
 =?big5?B?RWc0TDU2ZVJpaWNJTXc0MTN1NXZlZVN0Yzc2ZlMwT1pwTE4vNDJGRmNyWkpZcm9n?=
 =?big5?B?ZVdEMkZ6eVdWQ3NZekxMczlxVW5abldnOU1UcGY0Y1VIMW52ckZLM1I1TkJNWjB1?=
 =?big5?B?WmZlMjViTS9vNjRTSHhVREZBTUdZWC9jUUtDeFdOdGNzcXVvbllTRUhDb2lmWllx?=
 =?big5?B?blVYSEsycThqbkV2TzRzMzFnZGJLWExkTVY2UVNyWDkrbXBmNWJPTFUyQmVsWEtH?=
 =?big5?B?dWYrU0EvOGg0K0xCNWpiUDBOTE5FakF6MmFqTy9USGUxMlc2Y2xQUDV4MWN2UGFN?=
 =?big5?B?ajRjWEVTTE1aUGx0MWIwY2hIU1Q0MWsvZEJRMWJyeE12dE9HalM4WXpvbmtrcVNU?=
 =?big5?Q?f7VndXwXchqNmTA0?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?b091RkJUeTdnaXJ2SXBIRjY0Skt4N3ptbzhlSk8xdkNyWUtvRGNvNUZlNEZobjZO?=
 =?big5?B?SXlwUHhndDNSSE01bEo0SWlNOVJ1VkxucmpORlhNM3lxQ0NvM3d6azFGL2h3OEtO?=
 =?big5?B?bE04eUFidkVROTlZN2ZROXVlZHdtd1dvbmVLTjQ2cU84N3REbHBzN2xPdURPZHFB?=
 =?big5?B?WTNTMnJscFh5a2YxWjh3bTh3Z3dHbXpIT3F1S1dPdS9rRXk5bjkwRFJNdGJZZmFH?=
 =?big5?B?bXBEcjZmOTF1M0ppL1lxTHIzMEJkY0NNV0hTU0pxWHlpN2c0ajFMcTBJSlFLV29P?=
 =?big5?B?ZVZxZ2loUzNHODgzZUxrRWtYUFd5TFFnbFdpMUlrVUFLcHlPeEx1a1RmZDBnSFdM?=
 =?big5?B?T1JDdm8yU1FkcHhCUUFzNnl6NFdRYVFySTh1VGhvWFkwekJTbGVSYktocy9ldXZ1?=
 =?big5?B?NFRUbm9hYUdvRlorMktFWVVUcko1OFYvQjVYaFkyVC8weG8zWkt4aWZIdG9rVklq?=
 =?big5?B?clpzajBEWkljMnRmWnE2ejZNSmJTcXB1SUdQWGpzSGtJZVQxU1d2cUEvRzNBem85?=
 =?big5?B?SmMySTMzWStuc0hlQzBkd056V3U3QVFJT0sxNTRVd1lONEkvcEtjY0tvZTNYT24x?=
 =?big5?B?dmVSc1E4RURVb2NVMXY4ZVZnUXl6dmJFaGFGL0ROSGhLYVFOUm5jZ05KK1VGeCtM?=
 =?big5?B?Z1VkbUVvc1hUM2Z2RzlzT3J1eE9oUC9SMiszQTFPYXVWMk9OR2dWSHJoTTF2RGt4?=
 =?big5?B?YzVxWElnendIeFBqY1U0VkhVemlqSzVjRVQ5Ynh1cU0xTzdZcVJuSzBzb2dGNy9F?=
 =?big5?B?Z3dwTWR0Q3RCSmsvTXpBS1FRZVI3elZFcUM5MXh1b09zR1ZDTDNmVk54NDlydFF6?=
 =?big5?B?eWlYZkxSczd3dzdTblBSNDdtSzdQOHhUMU44d29WNE9BRXJDTmhGNFM1OHQvVXZl?=
 =?big5?B?T0RFUHVsRjJaQjJPNzhiZFBkQXVaaEZHUlNuQzhJMlVlVktXOGxxYnd3S0ZBV0hC?=
 =?big5?B?OThmTnNLWVNHVk10a1p1M3pyZDdjaXFaNWI2UGdiYkJlTW8wSnhJc0tha0VYUzk4?=
 =?big5?B?MmdDTHZIbjhocDkvcjVzSzA0ZW05djNmRmZiaFVkYVBDa0xFa3hsTTgvTlF2Yktq?=
 =?big5?B?ZXpGNXpHUjhmNm4vSHZkdnFlK0I5VjUvMXhMckVGL3FZMXZvQWtKdXZyUlNkcFpv?=
 =?big5?B?ekliajFQUTVrT0x2Tm12YzNKQ1A0TjR0d1FseVdSMFdDUTlOYXpuRjVvZUtFVFdj?=
 =?big5?B?YURYOUpMRklsTWpJa1pyamtkTFB1eEE5SWtTWnJuOUtTWjJZTFJkbFp1M1NWclhl?=
 =?big5?B?d2cwTXNLbTNrQUhwQit2Um42Z05WdzB4U1hjeFJITmpzV0VQK3doMTZWWFlxeTdy?=
 =?big5?B?ek9uS2RUNUtodDdaQTZYR0ZBMUNNdXlZVHErTEQvNmdjWjMvdWVpZjlpSytQOUFQ?=
 =?big5?B?OGVrRlUrckVqYVhkUkdVcDVxK1FjSlduUEdEcWlBbkl5ZWdNY0h4Qk4rTkdMTVpY?=
 =?big5?B?VDRnTWQvME83VFA2dU1CL1NTS0RpNGI4VE5uWHh4RUFSb0pGQ05HeWZjQkk0OThh?=
 =?big5?B?QjFoakRXbVJtc05mQUVYTkhqdnVZeE1IUVo2NHc2OGtlakxyaDc4TDU2dVUzT1p5?=
 =?big5?B?RkpUZ0RSQWZjbmtBVVFtTktSQUJSK1czZ1JmRmJLZjJmU3JyUGlaN29sV1VRRC82?=
 =?big5?B?V1NNeWNsNk9NSDNkd3RxaTRVcHNmT0dqVWNUTGJjLzUwZ0tpbEpZY1NteDlDS1lE?=
 =?big5?B?SXJacUNTc2Mwb2E1VVVqNU5STFYwRGkySGovTjdrRW1YdXpQdzlUSzJrWDUrbDZE?=
 =?big5?B?MkxkL1VOTkgzazdnMTZzZVBqSDhZQ1Z1ZjRVbTE0bUVmcjc2UXpmM28vMmhLTURr?=
 =?big5?B?UHVGR3orQzFvVEd1ZldsWHdtVHB4d1phTEdWYTNvV0Jxek83MW1Md3pRVktWTzZI?=
 =?big5?B?L0JTWlAxem1rQW9KQTdYbm5aKzczOFhPK29XeHFqNVdXR3RnVjR3azRwbHIrOVpV?=
 =?big5?B?Tm1wN3RrRXB2dDdnY09qVTZ5UWpNZjV2dmE4VWZpOU1lazJOUG1jdWxtTlFMdDVE?=
 =?big5?Q?8HmHeMTasqb2jcH+?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB4949680EBF66DCD47F2B4CF889862PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26f8055-8d1d-4f42-e4b8-08dcbb7c774a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 09:44:03.1475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N8g4odVAW2AciqdaP1I4kFEWm2KAUJapgMbWMr42nJHIEGH5qLw7Ht0uSjCRnBM1ni5LPMKYoZNWC2aaU+Ta/VLxJJ0GDuWqZffe/deHkik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6233
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

--_000_PSAPR06MB4949680EBF66DCD47F2B4CF889862PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KSW4gQVNQRUVELCBhc3QyNDAwLzI1MDAvMjYwMCB1c2UgYXJtIGFyY2hpdGVj
dHVyZSB3aXRoIEtDT05GSUdfQVJDSF9BU1BFRUQgd2hpY2ggc2xlY3QgTUFDSF9BU1BFRURfRzQv
RzUvRzYgaW4gYXJjaC9hcm0vbWFjaC1hc3BlZWQvS2NvbmZpZy4NCkluIHRoZSBmdXJldHVyZSwg
dGhlcmUgd291bGQgYmUgYXN0MjgwMC8yOTAwLy4uLiB1c2luZyBhcm02NC4gV2UgbmVlZCB0byBj
bGFyaWZ5IHRoZSBJQyBnZW5lcmF0aW9uIGJldHdlZW4gN3RoLzh0aC85dGgvLi4uLg0KDQpNYXli
ZSBjaGFuZ2UgQVJDSF9BU1BFRUQvTUFDSF9BU1BFRURHNyB0byBBUkNIX0FTUEVFRCBmaXJzdC4N
Ck9yLCBkbyB5b3UgaGF2ZSBiZXR0ZXIgS2NvbmZpZyB1c2FnZT8NCg0KDQo+ICtjb25maWcgQVJD
SF9BU1BFRUQNCj4gKyAgICAgYm9vbCAiQXNwZWVkIFNvQyBmYW1pbHkiDQo+ICsgICAgIHNlbGVj
dCBNQUNIX0FTUEVFRF9HNw0KPiArICAgICBoZWxwDQo+ICsgICAgICAgU2F5IHllcyBpZiB5b3Ug
aW50ZW5kIHRvIHJ1biBvbiBhbiBBc3BlZWQgYXN0MjcwMCBvciBzaW1pbGFyDQo+ICsgICAgICAg
c2V2ZW50aCBnZW5lcmF0aW9uIEFzcGVlZCBCTUNzLg0KPiArDQo+ICtjb25maWcgTUFDSF9BU1BF
RURfRzcNCj4gKyAgICAgYm9vbCAiQXNwZWVkIFNvQyBBU1QyNzAwIg0KDQpUaGVyZSBhcmUgbm8g
TUFDSGluZXMgZm9yIGFybTY0LiBMb29rIGF0IHRoaXMgY29kZS4gRG8geW91IHNlZSBNQUNIDQph
bnl3aGVyZSBlbHNlPyBOby4gVGhlbiB3aHkgQXNwZWVkIG11c3QgYmUgZGlmZmVyZW50Pw0KDQot
LQ0KQmVzdCBSZWdhcmRzLA0KS2V2aW4uIENoZW4NCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCrFIpfOqzDogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0K
sUil86TptME6IDIwMjSmfjik6zEzpOkgpFWkyCAwNDo1MA0Kpqyl86rMOiBLZXZpbiBDaGVuIDxr
ZXZpbl9jaGVuQGFzcGVlZHRlY2guY29tPjsgdGdseEBsaW51dHJvbml4LmRlIDx0Z2x4QGxpbnV0
cm9uaXguZGU+OyByb2JoQGtlcm5lbC5vcmcgPHJvYmhAa2VybmVsLm9yZz47IGtyemsrZHRAa2Vy
bmVsLm9yZyA8a3J6aytkdEBrZXJuZWwub3JnPjsgY29ub3IrZHRAa2VybmVsLm9yZyA8Y29ub3Ir
ZHRAa2VybmVsLm9yZz47IGpvZWxAam1zLmlkLmF1IDxqb2VsQGptcy5pZC5hdT47IGFuZHJld0Bj
b2RlY29uc3RydWN0LmNvbS5hdSA8YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1PjsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyA8bGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnPjsgbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmcgPGxpbnV4LWFz
cGVlZEBsaXN0cy5vemxhYnMub3JnPg0KpUSmrjogUmU6IFtQQVRDSCB2MSAyLzJdIGlycWNoaXAv
YXNwZWVkLWludGM6IEFkZCBzdXBwb3J0IGZvciAxMCBJTlRDIGludGVycnVwdHMgb24gQVNUMjdY
WCBwbGF0Zm9ybXMNCg0KT24gMTMvMDgvMjAyNCAwOTo0MywgS2V2aW4gQ2hlbiB3cm90ZToNCj4g
VGhlcmUgYXJlIDEwIGludGVycnVwdCBzb3VyY2Ugb2Ygc29jMF9pbnRjIGluIENQVSBkaWUgSU5U
Qy4NCj4gICAxLiA2IGludGVycnVwdCBzb3VyY2VzIGluIElPIGRpZSBvZiBzb2MxX2ludGMwfnNv
YzFfaW50YzUuDQo+ICAgMi4gMiBpbnRlcnJ1cHQgc291cmNlcyBpbiBMVFBJIG9mIGx0cGkwX2lu
dGMwIGFuZCBsdHBpMF9pbnRjMS4NCj4gICAzLiAyIGludGVycnVwdCBzb3VyY2VzIGluIExUUEkg
b2YgbHRwaTFfaW50YzAgYW5kIGx0cGkxX2ludGMxLg0KPiBSZXF1ZXN0IEdJQyBpbnRlcnJ1cHQg
dG8gY2hlY2sgZWFjaCBiaXQgaW4gc3RhdHVzIHJlZ2lzdGVyIHRvIGRvIG5leHQNCj4gbGV2ZWwg
SU5UQyBoYW5kbGVyLg0KPg0KPiBJbiBuZXh0IGxldmVsIElOVEMgaGFuZGxlciBvZiBJTyBkaWUg
b3IgTFRQSSBJTlRDIHVzaW5nIHNvYzFfaW50Y1ggY29tYmluaW5nDQo+IDMyIGludGVycnVwdCBz
b3VyY2VzIGludG8gc29jMF9pbnRjMTEgaW4gQ1BVIGRpZS4gSW4gc29jMV9pbnRjWCwgaGFuZGxl
cg0KPiB3b3VsZCBjaGVjayAzMiBiaXQgb2Ygc3RhdHVzIHJlZ2lzdGVyIHRvIGRvIHRoZSByZXF1
ZXN0ZWQgZGV2aWNlDQo+IGhhbmRsZXIuDQo+IC0tLQ0KPiAgZHJpdmVycy9pcnFjaGlwL01ha2Vm
aWxlICAgICAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtYXNwZWVkLWludGMu
YyB8IDE5OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTk5IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lycWNo
aXAvaXJxLWFzcGVlZC1pbnRjLmMNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9N
YWtlZmlsZSBiL2RyaXZlcnMvaXJxY2hpcC9NYWtlZmlsZQ0KPiBpbmRleCAxNTYzNTgxMmIyZDYu
LmQyZmU2ODZhZTAxOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL01ha2VmaWxlDQo+
ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9NYWtlZmlsZQ0KPiBAQCAtODQsNiArODQsNyBAQCBvYmot
JChDT05GSUdfTVZFQlVfU0VJKSAgICAgICAgICAgICAgICAgICAgICs9IGlycS1tdmVidS1zZWku
bw0KPiAgb2JqLSQoQ09ORklHX0xTX0VYVElSUSkgICAgICAgICAgICAgICAgICAgICAgKz0gaXJx
LWxzLWV4dGlycS5vDQo+ICBvYmotJChDT05GSUdfTFNfU0NGR19NU0kpICAgICAgICAgICAgKz0g
aXJxLWxzLXNjZmctbXNpLm8NCj4gIG9iai0kKENPTkZJR19BUkNIX0FTUEVFRCkgICAgICAgICAg
ICArPSBpcnEtYXNwZWVkLXZpYy5vIGlycS1hc3BlZWQtaTJjLWljLm8gaXJxLWFzcGVlZC1zY3Ut
aWMubw0KPiArb2JqLSQoQ09ORklHX01BQ0hfQVNQRUVEX0c3KSAgICAgICAgICs9IGlycS1hc3Bl
ZWQtaW50Yy5vDQoNClRoZXJlIGlzIG5vIHN1Y2ggdGhpbmcgYXMgQ09ORklHX01BQ0hfQVNQRUVE
X0c3LiBBbmQgdGhlcmUgd2lsbCBuZXZlciBiZS4NCg0KWW91IGFscmVhZHkgcmVjZWl2ZWQgZmVl
ZGJhY2sgb24gdGhpcywgc28gd2h5IGRvIHlvdSBrZWVwIHB1c2hpbmcgeW91cg0Kc29sdXRpb24/
IFlvdSBkaWQgbm90IHJlc3BvbmQgdG8gYW55IGZlZWRiYWNrIGdpdmVuLCBqdXN0IHNlbmQgdGhl
IHNhbWUNCmFuZCB0aGUgc2FtZSB0aWxsIHdlIGFncmVlPw0KDQpOQUsuDQoNCj4gIG9iai0kKENP
TkZJR19TVE0zMk1QX0VYVEkpICAgICAgICAgICArPSBpcnEtc3RtMzJtcC1leHRpLm8NCj4gIG9i
ai0kKENPTkZJR19TVE0zMl9FWFRJKSAgICAgICAgICAgICAgKz0gaXJxLXN0bTMyLWV4dGkubw0K
PiAgb2JqLSQoQ09ORklHX1FDT01fSVJRX0NPTUJJTkVSKSAgICAgICAgICAgICAgKz0gcWNvbS1p
cnEtY29tYmluZXIubw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1hc3BlZWQt
aW50Yy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1hc3BlZWQtaW50Yy5jDQo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzE0MDc0NzVmYjI3DQoNCi4uLg0KDQo+
ICtzdGF0aWMgaW50IF9faW5pdCBhc3BlZWRfaW50Y19pY19vZl9pbml0X3YyKHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQpDQo+ICt7DQo+ICsgICAgIHN0cnVjdCBhc3Bl
ZWRfaW50Y19pYyAqaW50Y19pYzsNCj4gKyAgICAgaW50IHJldCA9IDA7DQo+ICsgICAgIGludCBp
cnEsIGk7DQo+ICsNCj4gKyAgICAgaW50Y19pYyA9IGt6YWxsb2Moc2l6ZW9mKCppbnRjX2ljKSwg
R0ZQX0tFUk5FTCk7DQo+ICsgICAgIGlmICghaW50Y19pYykNCj4gKyAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsNCj4gKw0KPiArICAgICBpbnRjX2ljLT5iYXNlID0gb2ZfaW9tYXAobm9kZSwg
MCk7DQo+ICsgICAgIGlmICghaW50Y19pYy0+YmFzZSkgew0KPiArICAgICAgICAgICAgIHByX2Vy
cigiRmFpbGVkIHRvIGlvbWFwIGludGNfaWMgYmFzZVxuIik7DQo+ICsgICAgICAgICAgICAgcmV0
ID0gLUVOT01FTTsNCj4gKyAgICAgICAgICAgICBnb3RvIGVycl9mcmVlX2ljOw0KPiArICAgICB9
DQo+ICsgICAgIHdyaXRlbCgweGZmZmZmZmZmLCBpbnRjX2ljLT5iYXNlICsgSU5UQ19JTlRfU1RB
VFVTX1JFRyk7DQo+ICsgICAgIHdyaXRlbCgweDAsIGludGNfaWMtPmJhc2UgKyBJTlRDX0lOVF9F
TkFCTEVfUkVHKTsNCj4gKw0KPiArICAgICBpbnRjX2ljLT5pcnFfZG9tYWluID0gaXJxX2RvbWFp
bl9hZGRfbGluZWFyKG5vZGUsIDMyLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZhc3BlZWRfaW50Y19pY19pcnFfZG9tYWluX29wcywgaW50Y19p
Yyk7DQo+ICsgICAgIGlmICghaW50Y19pYy0+aXJxX2RvbWFpbikgew0KPiArICAgICAgICAgICAg
IHJldCA9IC1FTk9NRU07DQo+ICsgICAgICAgICAgICAgZ290byBlcnJfaW91bm1hcDsNCj4gKyAg
ICAgfQ0KPiArDQo+ICsgICAgIHJhd19zcGluX2xvY2tfaW5pdCgmaW50Y19pYy0+Z2ljX2xvY2sp
Ow0KPiArICAgICByYXdfc3Bpbl9sb2NrX2luaXQoJmludGNfaWMtPmludGNfbG9jayk7DQo+ICsN
Cj4gKyAgICAgaW50Y19pYy0+aXJxX2RvbWFpbi0+bmFtZSA9ICJhc3BlZWQtaW50Yy1kb21haW4i
Ow0KPiArDQo+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBvZl9pcnFfY291bnQobm9kZSk7IGkrKykg
ew0KPiArICAgICAgICAgICAgIGlycSA9IGlycV9vZl9wYXJzZV9hbmRfbWFwKG5vZGUsIGkpOw0K
PiArICAgICAgICAgICAgIGlmICghaXJxKSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICBwcl9l
cnIoIkZhaWxlZCB0byBnZXQgaXJxIG51bWJlclxuIik7DQo+ICsgICAgICAgICAgICAgICAgICAg
ICByZXQgPSAtRUlOVkFMOw0KPiArICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfaW91bm1h
cDsNCj4gKyAgICAgICAgICAgICB9IGVsc2Ugew0KPiArICAgICAgICAgICAgICAgICAgICAgaXJx
X3NldF9jaGFpbmVkX2hhbmRsZXJfYW5kX2RhdGEoaXJxLCBhc3BlZWRfaW50Y19pY19pcnFfaGFu
ZGxlciwgaW50Y19pYyk7DQo+ICsgICAgICAgICAgICAgfQ0KPiArICAgICB9DQo+ICsNCj4gKyAg
ICAgcmV0dXJuIDA7DQo+ICsNCj4gK2Vycl9pb3VubWFwOg0KPiArICAgICBpb3VubWFwKGludGNf
aWMtPmJhc2UpOw0KPiArZXJyX2ZyZWVfaWM6DQo+ICsgICAgIGtmcmVlKGludGNfaWMpOw0KPiAr
ICAgICByZXR1cm4gcmV0Ow0KPiArfQ0KDQpEb24ndCBkdXBsaWNhdGUgY29kZS4gVGhlc2UgYXJl
IGFsbW9zdCB0aGUgc2FtZSwgc28gZGVmaW5lIG9uZSBmdW5jdGlvbg0Kd2hpY2ggaXMgdGhlbiBj
YWxsZWQgYnkgYXNwZWVkX2ludGNfaWNfb2ZfaW5pdCBhbmQNCmFzcGVlZF9pbnRjX2ljX29mX2lu
aXRfdjIuDQoNCj4gKw0KPiArSVJRQ0hJUF9ERUNMQVJFKGFzdDI3MDBfaW50Y19pYywgImFzcGVl
ZCxhc3QyNzAwLWludGMtMS4wIiwgYXNwZWVkX2ludGNfaWNfb2ZfaW5pdCk7DQo+ICtJUlFDSElQ
X0RFQ0xBUkUoYXN0MjcwMF9pbnRjX2ljdjIsICJhc3BlZWQsYXN0MjcwMC1pbnRjLTIuMCIsIGFz
cGVlZF9pbnRjX2ljX29mX2luaXRfdjIpOw0KDQpCZXN0IHJlZ2FyZHMsDQpLcnp5c3p0b2YNCg0K
KioqKioqKioqKioqKiBFbWFpbCBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioq
KioqKioqDQqnS7NkwW6p+joNCqW7q0il8yipzqjkqv6l8ymlaa/gpV2ndL73sUu46rBUoUGow6j8
qmur36tPxUChQ6ZwIKV4ut2rRKv8qXekp6aspfOqzKFBvdClSLlxpGy2bKXzs3GqvqW7uXGkbLZs
pfOkp7VvsGWqzCwgqMO90KXfp1mnUrCjpbu5caRstmyl86TOqOSq/qXzqU2+ULe0qdKms73Gpkyl
86FDwcLBwrF6qrqmWKdAIQ0KDQpESVNDTEFJTUVSOg0KVGhpcyBtZXNzYWdlIChhbmQgYW55IGF0
dGFjaG1lbnRzKSBtYXkgY29udGFpbiBsZWdhbGx5IHByaXZpbGVnZWQgYW5kL29yIG90aGVyIGNv
bmZpZGVudGlhbCBpbmZvcm1hdGlvbi4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgaXQgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSByZXBseSBlLW1haWwgYW5kIGltbWVkaWF0ZWx5
IGRlbGV0ZSB0aGUgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgd2l0aG91dCBjb3B5aW5nIG9y
IGRpc2Nsb3NpbmcgdGhlIGNvbnRlbnRzLiBUaGFuayB5b3UuDQo=

--_000_PSAPR06MB4949680EBF66DCD47F2B4CF889862PSAPR06MB4949apcp_
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
In ASPEED, ast2400/2500/2600 use arm architecture with KCONFIG_ARCH_ASPEED =
which slect MACH_ASPEED_G4/G5/G6 in arch/arm/mach-aspeed/Kconfig.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
In the fureture, there would be ast2800/2900/... using arm64. We need to cl=
arify the IC generation between 7th/8th/9th/....</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Maybe change ARCH_ASPEED/MACH_ASPEEDG<i>7 to </i>ARCH_ASPEED first.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Or, do you have better Kconfig usage?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<pre style=3D"margin: 0px 0px 10px; padding: 9.5px; border-radius: 0px; dis=
play: block;"><div class=3D"elementToProof" style=3D"text-align: left; text=
-indent: 0px; line-height: 14.3px; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color=
: rgb(0, 0, 0);">&gt; +config ARCH_ASPEED=0A=
&gt; +	bool &quot;Aspeed SoC family&quot;=0A=
&gt; +	select MACH_ASPEED_G7=0A=
&gt; +	help=0A=
&gt; +	 &nbsp;Say yes if you intend to run on an Aspeed ast2700 or similar=
=0A=
&gt; +	 &nbsp;seventh generation Aspeed BMCs.=0A=
&gt; +=0A=
&gt; +config MACH_ASPEED_G7=0A=
&gt; +	bool &quot;Aspeed SoC AST2700&quot;=0A=
=0A=
There are no MACHines for arm64. Look at this code. Do you see MACH=0A=
anywhere else? No. Then why Aspeed must be different?</div></pre>
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
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>=B1H=A5=F3=AA=CC:</b>=
&nbsp;Krzysztof Kozlowski &lt;krzk@kernel.org&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b>&nbsp;2024=A6~8=A4=EB13=A4=E9 =A4U=A4=C8 04:5=
0<br>
<b>=A6=AC=A5=F3=AA=CC:</b>&nbsp;Kevin Chen &lt;kevin_chen@aspeedtech.com&gt=
;; tglx@linutronix.de &lt;tglx@linutronix.de&gt;; robh@kernel.org &lt;robh@=
kernel.org&gt;; krzk+dt@kernel.org &lt;krzk+dt@kernel.org&gt;; conor+dt@ker=
nel.org &lt;conor+dt@kernel.org&gt;; joel@jms.id.au &lt;joel@jms.id.au&gt;;=
 andrew@codeconstruct.com.au
 &lt;andrew@codeconstruct.com.au&gt;; linux-kernel@vger.kernel.org &lt;linu=
x-kernel@vger.kernel.org&gt;; devicetree@vger.kernel.org &lt;devicetree@vge=
r.kernel.org&gt;; linux-arm-kernel@lists.infradead.org &lt;linux-arm-kernel=
@lists.infradead.org&gt;; linux-aspeed@lists.ozlabs.org
 &lt;linux-aspeed@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b>&nbsp;Re: [PATCH v1 2/2] irqchip/aspeed-intc: Add support=
 for 10 INTC interrupts on AST27XX platforms</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 13/08/2024 09:43, Kevin Chen wrote:<br>
&gt; There are 10 interrupt source of soc0_intc in CPU die INTC.<br>
&gt;&nbsp;&nbsp; 1. 6 interrupt sources in IO die of soc1_intc0~soc1_intc5.=
<br>
&gt;&nbsp;&nbsp; 2. 2 interrupt sources in LTPI of ltpi0_intc0 and ltpi0_in=
tc1.<br>
&gt;&nbsp;&nbsp; 3. 2 interrupt sources in LTPI of ltpi1_intc0 and ltpi1_in=
tc1.<br>
&gt; Request GIC interrupt to check each bit in status register to do next<=
br>
&gt; level INTC handler.<br>
&gt;<br>
&gt; In next level INTC handler of IO die or LTPI INTC using soc1_intcX com=
bining<br>
&gt; 32 interrupt sources into soc0_intc11 in CPU die. In soc1_intcX, handl=
er<br>
&gt; would check 32 bit of status register to do the requested device<br>
&gt; handler.<br>
&gt; ---<br>
&gt;&nbsp; drivers/irqchip/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; drivers/irqchip/irq-aspeed-intc.c | 198 ++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; 2 files changed, 199 insertions(+)<br>
&gt;&nbsp; create mode 100644 drivers/irqchip/irq-aspeed-intc.c<br>
&gt;<br>
&gt; diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile<br>
&gt; index 15635812b2d6..d2fe686ae018 100644<br>
&gt; --- a/drivers/irqchip/Makefile<br>
&gt; +++ b/drivers/irqchip/Makefile<br>
&gt; @@ -84,6 +84,7 @@ obj-$(CONFIG_MVEBU_SEI)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; +=3D irq-mvebu-sei.o<br>
&gt;&nbsp; obj-$(CONFIG_LS_EXTIRQ)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; +=3D irq-ls-extirq.o<br>
&gt;&nbsp; obj-$(CONFIG_LS_SCFG_MSI)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D irq-ls-scfg-msi.o<br>
&gt;&nbsp; obj-$(CONFIG_ARCH_ASPEED)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-a=
speed-scu-ic.o<br>
&gt; +obj-$(CONFIG_MACH_ASPEED_G7)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; +=3D irq-aspeed-intc.o<br>
<br>
There is no such thing as CONFIG_MACH_ASPEED_G7. And there will never be.<b=
r>
<br>
You already received feedback on this, so why do you keep pushing your<br>
solution? You did not respond to any feedback given, just send the same<br>
and the same till we agree?<br>
<br>
NAK.<br>
<br>
&gt;&nbsp; obj-$(CONFIG_STM32MP_EXTI)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; +=3D irq-stm32mp-exti.o<br>
&gt;&nbsp; obj-$(CONFIG_STM32_EXTI)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D irq-stm32-exti.o<br>
&gt;&nbsp; obj-$(CONFIG_QCOM_IRQ_COMBINER)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D qcom-irq-combiner.o<br>
&gt; diff --git a/drivers/irqchip/irq-aspeed-intc.c b/drivers/irqchip/irq-a=
speed-intc.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..71407475fb27<br>
<br>
...<br>
<br>
&gt; +static int __init aspeed_intc_ic_of_init_v2(struct device_node *node,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; struct device_node *parent)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct aspeed_intc_ic *intc_ic;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int irq, i;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; intc_ic =3D kzalloc(sizeof(*intc_ic), GFP_KE=
RNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!intc_ic)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; intc_ic-&gt;base =3D of_iomap(node, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!intc_ic-&gt;base) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pr_err(&quot;Failed to iomap intc_ic base\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -ENOMEM;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto err_free_ic;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; writel(0xffffffff, intc_ic-&gt;base + INTC_I=
NT_STATUS_REG);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; writel(0x0, intc_ic-&gt;base + INTC_INT_ENAB=
LE_REG);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; intc_ic-&gt;irq_domain =3D irq_domain_add_li=
near(node, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;=
aspeed_intc_ic_irq_domain_ops, intc_ic);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!intc_ic-&gt;irq_domain) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -ENOMEM;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto err_iounmap;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; raw_spin_lock_init(&amp;intc_ic-&gt;gic_lock=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; raw_spin_lock_init(&amp;intc_ic-&gt;intc_loc=
k);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; intc_ic-&gt;irq_domain-&gt;name =3D &quot;as=
peed-intc-domain&quot;;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; of_irq_count(node); i++=
) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; irq =3D irq_of_parse_and_map(node, i);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!irq) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;Failed to =
get irq number\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D -EINVAL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err_iounmap;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; irq_set_chained_handler=
_and_data(irq, aspeed_intc_ic_irq_handler, intc_ic);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +<br>
&gt; +err_iounmap:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; iounmap(intc_ic-&gt;base);<br>
&gt; +err_free_ic:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; kfree(intc_ic);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
<br>
Don't duplicate code. These are almost the same, so define one function<br>
which is then called by aspeed_intc_ic_of_init and<br>
aspeed_intc_ic_of_init_v2.<br>
<br>
&gt; +<br>
&gt; +IRQCHIP_DECLARE(ast2700_intc_ic, &quot;aspeed,ast2700-intc-1.0&quot;,=
 aspeed_intc_ic_of_init);<br>
&gt; +IRQCHIP_DECLARE(ast2700_intc_icv2, &quot;aspeed,ast2700-intc-2.0&quot=
;, aspeed_intc_ic_of_init_v2);<br>
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

--_000_PSAPR06MB4949680EBF66DCD47F2B4CF889862PSAPR06MB4949apcp_--
