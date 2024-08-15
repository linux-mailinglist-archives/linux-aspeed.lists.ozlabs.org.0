Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8FB957A11
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL63f8cz87xw
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=OAqawjOd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::702; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20702.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkvPN6J5lz2yQJ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 15:51:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLy7qLuSBG2vEz+Y9icSakNt7bLGTYyH0V/KgcvUWr7iY+FAVbH/2IHY4Oec+eZYrak4OwQ/JKyguVK8m8xE9kgtF4KpuUDV7NTaQaKfcD/nEAqJXUEKFKnCXMZ2ZW9IaTNRpq4xF6oXXsr6SQEZawNa6ET2JEsX53VbKFVgziE3GbYqw6SYMEGKvy4aESVORVDTH7zLk/yQhsU8P0wxyZT+6sGuX6Ryk3LM/+6u+qZs8gdZ1tBKh8lSIeeOS9La/3/sS69bOuAk3FpbftA+0AbgsyHytkdz+q+7ox1sG7xQA4g9vapvzEfzdaYiSzzGG/c59Eh411berFGRFdoXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNTQo8cUaJtkeewsMtft+oLrLFqrhA1jozg13IIGV3I=;
 b=RfTwyywdCO9lywkb4FjdGAHJOS9D7BsJLBCR2uhVbmTGucbAQAeQbchBWqQxXfN+pH78RkuQfo5a0b/svi1UwKMwxG81AVOoB8Lw3k1ZOvQ3wUZcHMY8rj+QONT7nLAZ65lxaYGUO0uo6cSeSClD8zyVzMmty4jcqPXjBRrQQltgqgZvmpb0kWy19/7M/kpEB7go+QSI3WfkUr73hS0tfeXmG5yZruAbPMZ/ECKgXuLmju6YkEdQNNXTNS4LEJpMkyfZwnsBIG9LkDWhdFb+vEfGHNL2S7NWPzOTui80iPMXit69nVvn/uj8ipEywf8ikigqjmq++lDQ3AsscD0dYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNTQo8cUaJtkeewsMtft+oLrLFqrhA1jozg13IIGV3I=;
 b=OAqawjOd0JhrD4j/PQ8ukGVN9vJyAz+ynN3UErvk6KD1G0Q1Wnweao22LrUUr3Y0KoWscQriGzu7VrNWPJwWJLEtMzG0DKoXTkPZEhmiCfZ1MdZymfDSoC5q0v2+/AHBWFVQ4kyvdloos6HEQA3vtKKezY9Ra+epp9lYx5CplZyVNuQAube9vbbe5cfkUVT+PCIiwwemT+LP5F9QvrNHxabqr2oGdTjbNSHo+f/euBqd3RBNFl7LXz/sAcBCb4m1CRB6L07KqJplim+70L/GX6hZl0EY6oGvA1alKB9zWerNacWePL9pMwTuCSNiZlN8NQhFL50ENtw+QBwvhElzHg==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by SEYPR06MB7000.apcprd06.prod.outlook.com (2603:1096:101:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Thu, 15 Aug
 2024 05:50:41 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 05:50:41 +0000
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
Subject:  =?big5?B?pl7C0DogW1BBVENIIHYxIDA5LzEwXSBhcm02NDogZHRzOiBhc3BlZWQ6IEFkZCBp?=
 =?big5?Q?nitial_AST2700_EVB_device_tree?=
Thread-Topic: [PATCH v1 09/10] arm64: dts: aspeed: Add initial AST2700 EVB
 device tree
Thread-Index: AQHa30uPDJPGKhP2w02fD585UynZDLII3BKAgB7zCjA=
Date: Thu, 15 Aug 2024 05:50:41 +0000
Message-ID:  <PSAPR06MB4949AE344C9386123AC2145F89802@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <20240726110355.2181563-10-kevin_chen@aspeedtech.com>
 <79d13e65-ca4a-461f-9888-9664e204f2ed@kernel.org>
In-Reply-To: <79d13e65-ca4a-461f-9888-9664e204f2ed@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|SEYPR06MB7000:EE_
x-ms-office365-filtering-correlation-id: f2698c49-0bf5-440f-0328-08dcbcee3293
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:  =?big5?B?bytZY1ZRaWVIUjJCclVydi9DRk5Ma2piTEc2Sll2K0RvZkFta2x4UXlDOC9OajRu?=
 =?big5?B?MGQ4a1FpOEVGS1UwMlpySHFLZm43L3R2c2d3aTFhWCtRbzlWVndvR1RHZGdBMTRz?=
 =?big5?B?eWRHZkdUNk4xc3FyZDJIQkRJN09waVRWdjZ6UWNjL1lxT1dMYTNyRGlXQjhiZ1Z3?=
 =?big5?B?Z3d2NUplaVFKMWlJb2o3b3M5R1dIa2N5V0Z5QXI5dExqTDJSV2ZXRmJ0YVdvK3FX?=
 =?big5?B?NklObXp4aHZYS0VEcTJrakl5OUpkQXhJM0VRa3R6USt0Z1hiMS8zMkNEQjBmSnJs?=
 =?big5?B?V3kxeCtQOC9Od0tLV1lHKzZqVDVXSm1VMytIc1lqV1JwVXFaWE1UTlVnQlk2a2Vn?=
 =?big5?B?d2d3RjFIbGRiMjdDYzQvZDZyYVlwa0s2UTBuK3paR05ndm5TbWUrUFdQQ28rWEpH?=
 =?big5?B?dmI3OW5tbzRCd0JqNHpGdm05TUhLTituajJPa2VjN2tvT1drcVNaaEdOWmlHV0JS?=
 =?big5?B?YjZmYTFaM3Y4VmwrMWxiVHRONVV2STVJZmtZWEsxb3BhSG8vTEsvUDVHcVZhRWNv?=
 =?big5?B?akkxUkhCR0VRdzZ1d29aQk1DQTlVN0FpZTRMTmc3ZjNHZnJnZmZFd1ZYcnk5R2Zy?=
 =?big5?B?cjNqZ3pvSG9yVW5zcGR5YWZtc21CZGdPRnVVcEE5SE5peHgrZng5dFpTamJlQWxp?=
 =?big5?B?OXROUUxoTDJxakFqMnM0bjh5dnVnU0J2dEtSSmdnd0oxWnhTWHEveGRvSUhnSDhF?=
 =?big5?B?YVJ4QmZwdnU2SFVKYUVUeFN0N3d0S2gxK0tlUlhzTitEYXVxVDlXd1JyTGJ2RDdR?=
 =?big5?B?aDZndEVQa1BIT2VZNSt3aUpRZE9aWDFtaS8zdEswVW14VU5JMHpTMVVvSTRJR1Jy?=
 =?big5?B?RTh3alhkbjIvT2VwNmNyV2JTYW5HMTArc1RBNU1ONUg3akRod3NQYTF2T1A2eWFL?=
 =?big5?B?VFNlaEhyMjV6K09pWUZsYlYvMEtBSnJxUDJnNG5rZXRFdzFOZmxXU1V0VFpiYzRO?=
 =?big5?B?SElJcXIvMWFES0JtZ2lPYjVVODVOYkh2cStBT0piazZMMy9lQXd1NGluNUE0aTJ3?=
 =?big5?B?V0V5clpiQmpTVzVVVys4Rm02T3JDMjRPMnBYK29udGRCQmpFY0FyeDNEUFJuYklu?=
 =?big5?B?OHNzS1FDMVBHUExsSVVwcUF2UkdaTG9UdytsVjlFMDRQbTF3U1dGK2xpcGFxTEFh?=
 =?big5?B?Ri9RSXVlL2xvK1dsNU4vcDFudEdpdkVDalE2c09qRHlibXJoeTN0cG04N2JWV3ZR?=
 =?big5?B?cSs0bDRFM1NkWGVOSjkzWTA4Q0wzQkllYWxhN1hPVERMNVc3RVR5U1ZEZGNSOEhJ?=
 =?big5?B?RXpSUjBGMXFsRGRuak9RVHJ5WSs5TVFlZDVoaVMrTEZLcVVaOHB1T0E3MkFpVDFG?=
 =?big5?B?QTRaei9ZalFEZmprYU9ZMzJWN3FSQkx4TzJPalh2ZVV2V3NHWEc1cnNrUGRabEpI?=
 =?big5?B?SHk5NUJPaEphcHN6L1RBbVFpalU5LzkxRlgwa3hxQjBKbHo3YitmRmM4VXdmclJz?=
 =?big5?B?RjBFUEI4VU1NdUNwc3VaS0FQWHZNd3ZLb3VDcGczWHlQYWFZTGxDOXFqN1NrQ0pw?=
 =?big5?B?QUt4OG9lMWNVUXZiSXlNOVA0VEpwOXp0bHpFZkhhZWxmeWt2Z2t4eWtrb1JTMjNY?=
 =?big5?B?eDB5NHgxZ1hoOFVmRXY0QXZuN2xXNWtIOWRyTllZMDB0U3JSdFREU0VJMnRvNHAv?=
 =?big5?B?QXd3YVNNdU43bWVwMkZTdDFsVWhSVjJFNjZUaHNOU1YzblpmTWd4ZXRLOWtXb2RK?=
 =?big5?B?SVIrRG1nQVo4TG1Ob3NkWStHOU1wNVd4UXZyS1U1YnlwWXMvUG9WL1lHOEl5T1hh?=
 =?big5?B?YlJmcFRHUWJDeTA5dzRFVmdkSmZvSGV5Q0lHZWpHRzdLTko2VnlOZUIxNVY2S1Nt?=
 =?big5?Q?qRdWrDCe4wk=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?a3dRd1p2bktJNFh1eHZzaGFkN3ZuVHJDYm5sMXBUZlNPQVFKL2xHaEo2M2NBWEEx?=
 =?big5?B?UG9BOUwyL28ramljVGhGNXBETXVmSThxaHUraFJyaXVDZTBPK1gzKzJ5YnFzdUFD?=
 =?big5?B?RGxkeG5tZkRQT2xLUkkycnl4SWgzOFlqZS9zSTFmQ0VZZjJIT0d1bU5Ob256a3BF?=
 =?big5?B?OC9wNmcwOVdPUGNOU1dFZU1qVlZCc1hwbWZmTUQzVVZYQzBRd0J5Q2xrUDFVVHU0?=
 =?big5?B?SHhtZE1KWm0rajQ1RkF0SzZUSkhqczNORFVZeHU4MFQ5OXZlUS9RYWNKd29WTHln?=
 =?big5?B?bytBNVdNckJIM1FFUFhvRmZBdG1IWSt6cnRsREpSb3lhaWlESi9kWkpPOEZxdkFL?=
 =?big5?B?MGNqMlV4cm1QU1BCY1pRWHVERy82TW1QTFNUSHlkZGxBclU5YTdIL3JnbDFOR1hl?=
 =?big5?B?SWZlMXRrcGlLNUpWbHFqanFKQmJKUWxkeDBmaDNFWXJnWnM2VWg4VUpTMisrSjVQ?=
 =?big5?B?WFExdXY0ZWtCMDVBWWNiWC8wOFlZUjJVNmJzbkxFQ2hXRW41Ni9TSjBTS2d6ZUZK?=
 =?big5?B?N3YzaXluK2dNcmMxUG85bVU3ODFoUU1jb2NZZEZULzNrVGMwbDNtLzBSOVdObTNE?=
 =?big5?B?eXlUK1UzMjlCQktDSzNmOGVxYmEyWE85SThHSnI0NE83aE1RU2tKWEpCY0oxOW16?=
 =?big5?B?VUxuOVc0cHFZU2ZMVlB2R0RpcVRFMDUwVE0weHBXRXR5Qy9QMlBnT1ptVXFZSTZn?=
 =?big5?B?bnZ4OUx2RmtWa1hnVmp5R2tVK3lxbG5IWExiUmZxRFRSTlY3VTl2OWt0cFUzMEQz?=
 =?big5?B?eU5CTy85cWRqVjZReTVnVEJHMDNYNFdvSzlnMDdXbms4N1ZyekZma1Zuei9UYXVQ?=
 =?big5?B?M2Vscm1aY0RSRlNRNkxDMzR1cjNEbDZSMkxrME5pS0U4L1pXUSs2TVVaZWpzdGNY?=
 =?big5?B?dWNUZDM2dCs5U3E0R0huZHhHVkJHTEUxUUVTMGtacjhZM0dXbXJmRENwakxOYkdW?=
 =?big5?B?alE4U1lhWWFrbXF6MXV0am1pYnovMGt3a1dzZ0dYSGp3ZzY3THJGWDJkcVphUGJH?=
 =?big5?B?M2hSTWgvVGU1Y1c4NnVzQmsvTVBvYjM3aTFXaFRrclJ4cWx1Nkx6bGZESU1UUmZK?=
 =?big5?B?b1psT3dzYUFLUnB3Yk1VaGxiNjVJaVBoQnU0NDJ0bGUyR3AvVEJHbWRsb2M2WXAr?=
 =?big5?B?VjR4SlNhYWpkbklrRllsb2R4akJ4WU1BakN3SktjSng0ektQUEF5V3UySmNhNEx6?=
 =?big5?B?TllLM3czV3dDSW01NzBsc09ZMkF4RVUwT1dXbExwcEtqSzJZVU8vdGU1NU5EeEZ0?=
 =?big5?B?cUl4QWNkTzRsS1BMWFU2WndBZ0tzVnNmZ1MvVUFoSjMzK0JrWld3blZtSjBnSHMv?=
 =?big5?B?MGMxOHIwNGZPOWtTbUNvSmJXc2pOWVlOKyttWitaVHVySmNPb05LanRPWTNWMWhr?=
 =?big5?B?ejNpZHVPek84cWovbnZZZjMwa0kvTGRpandPbGFxaFRVUEpUOFJhZkczZ1dKcGQz?=
 =?big5?B?QU01THEvZEV5L1N5QVE4RUZrRWRKWWx4eWg4TFBCaTdOV0ZockFGRno1UU4wcC9U?=
 =?big5?B?RU05TjM3SnB4K0lWRzlvakc3UEQ0L0tvVTlwakFVNWptSkdRbzVxRjlkMysxeXpS?=
 =?big5?B?eW5hais5RHk5S0sxYnpQZVZESVVSQmJVZmMybG5CbVBBN3RWVlhtclNsajFkbGtM?=
 =?big5?B?U0M0enhQNkx6ajRUdkRkTUxqTW5uNWZGWkpiRkpOQ1orVFM1Vm5oakRGMllaKzFL?=
 =?big5?B?blJhSTNSNzVUSEhGNm0rSWdGN3VONXpPTDcrZVMrRjFNWEdERzhzMlZzNklCZjR0?=
 =?big5?B?bkI4Zm9xMlBYUTA3dWg3UWQ2MGhLNFlXL3lCTC9neUpTWVBsdldxM2VRWDU4eVA3?=
 =?big5?B?REdhd1RVTFpYTVdVVGRnWlpoSFFObTVKbGVRSExmU2pDRkFSajdNK2tRa3JWdzBh?=
 =?big5?B?WXBCNnFDZ0daOCtsdFJYN24vU3hoQkNlclAvNVl1ZFZyei9WL1BHaWdRaEM2aWZu?=
 =?big5?B?N2JoL3J1N1dZSmxuQi9WdFdzUjJHSzU2QlM1KzgwWGxSdTM2NVdxOEFNcVJUVzhN?=
 =?big5?Q?uLpRkMWCeio7fzLJ?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR06MB4949AE344C9386123AC2145F89802PSAPR06MB4949apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2698c49-0bf5-440f-0328-08dcbcee3293
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 05:50:41.6148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DYfZhxJ4kHCrf+TMg2DxgZ17la+xAVtFpFO7LOX14CydhswW7/js8+EdlMgf4KrcEqm/sP//s/l6KaoxQkQ8G7Gv0jC2HeHwwQM+lrUyKR0=
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

--_000_PSAPR06MB4949AE344C9386123AC2145F89802PSAPR06MB4949apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgS3J6aywNCg0KPj4gLS0tDQo+PiAgYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvTWFrZWZp
bGUgICAgICAgIHwgIDQgKysNCj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FzcGVlZC9hc3QyNzAw
LWV2Yi5kdHMgfCA1MCArKysrKysrKysrKysrKysrKysrKysrDQo+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCA1NCBpbnNlcnRpb25zKCspDQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9v
dC9kdHMvYXNwZWVkL01ha2VmaWxlDQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYXNwZWVkL2FzdDI3MDAtZXZiLmR0cw0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FzcGVlZC9NYWtlZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYXNw
ZWVkL01ha2VmaWxlDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAw
MDAwLi5mZmU3ZTE1MDE3Y2MNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYXNwZWVkL01ha2VmaWxlDQo+PiBAQCAtMCwwICsxLDQgQEANCj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+PiArDQo+PiArZHRiLSQoQ09ORklHX0FSQ0hf
QVNQRUVEKSArPSBcDQo+PiArICAgICBhc3QyNzAwLWV2Yi5kdGINCj4+IGRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FzcGVlZC9hc3QyNzAwLWV2Yi5kdHMgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FzcGVlZC9hc3QyNzAwLWV2Yi5kdHMNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjE4N2M0NThlNTY2Yg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvYXN0MjcwMC1ldmIuZHRzDQo+PiBAQCAt
MCwwICsxLDUwIEBADQo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3It
bGF0ZXINCj4+ICsNCj4+ICsvZHRzLXYxLzsNCj4+ICsNCj4+ICsjaW5jbHVkZSAiYXNwZWVkLWc3
LmR0c2kiDQo+PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vYXNwZWVkLWdwaW8uaD4NCj4+
ICsNCj4+ICsvIHsNCj4+ICsgICAgIG1vZGVsID0gIkFTVDI3MDBBMS1FVkIiOw0KPj4gKyAgICAg
Y29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjcwMGExLWV2YiIsICJhc3BlZWQsYXN0MjcwMCI7DQo+
DQo+WW91IGhhdmUgbmV2ZXIgdGVzdGVkIHRoaXMuDQo+DQo+U29ycnksIHRlc3QgeW91ciBEVFMg
Zmlyc3QuDQpBZ3JlZS4gSSB3aWxsIHRlc3QgbXkgZHRzIGJ5IG1ha2UgZHRic19jaGVjayBXPTEN
Cg0KPg0KPj4gKw0KPj4gKyAgICAgY2hvc2VuIHsNCj4+ICsgICAgICAgICAgICAgYm9vdGFyZ3Mg
PSAiY29uc29sZT10dHlTMTIsMTE1MjAwbjgiOw0KPg0KPkRyb3AuDQpBZ3JlZS4NCg0KPg0KPj4g
KyAgICAgICAgICAgICBzdGRvdXQtcGF0aCA9ICZ1YXJ0MTI7DQo+PiArICAgICB9Ow0KPj4gKw0K
Pj4gKyAgICAgZmlybXdhcmUgew0KPj4gKyAgICAgICAgICAgICBvcHRlZTogb3B0ZWUgew0KPj4g
KyAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibGluYXJvLG9wdGVlLXR6IjsNCj4+
ICsgICAgICAgICAgICAgICAgICAgICBtZXRob2QgPSAic21jIjsNCj4+ICsgICAgICAgICAgICAg
fTsNCj4+ICsgICAgIH07DQo+PiArDQo+PiArICAgICBtZW1vcnlANDAwMDAwMDAwIHsNCj4+ICsg
ICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCj4+ICsgICAgICAgICAgICAgcmVn
ID0gPDB4NCAweDAwMDAwMDAwIDB4MCAweDQwMDAwMDAwPjsNCj4+ICsgICAgIH07DQo+PiArDQo+
PiArICAgICByZXNlcnZlZC1tZW1vcnkgew0KPj4gKyAgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwyPjsNCj4+ICsgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+PiArICAgICAg
ICAgICAgIHJhbmdlczsNCj4+ICsNCj4+ICsgICAgICAgICAgICAgbWN1X2Z3OiBtY3UtZmlybXdh
cmVANDJmZTAwMDAwIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHg0IDB4MmZl
MDAwMDAgMHgwIDB4MjAwMDAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBuby1tYXA7DQo+
PiArICAgICAgICAgICAgIH07DQo+PiArDQo+PiArICAgICAgICAgICAgIGF0ZjogdHJ1c3RlZC1m
aXJtd2FyZS1hQDQzMDAwMDAwMCB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4
NCAweDMwMDAwMDAwIDB4MCAweDgwMDAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBuby1t
YXA7DQo+PiArICAgICAgICAgICAgIH07DQo+PiArDQo+PiArICAgICAgICAgICAgIG9wdGVlX2Nv
cmU6IG9wdGVlX2NvcmVANDMwMDgwMDAwIHsNCj4NCj5SZWFkIERUUyBjb2Rpbmcgc3R5bGUuDQpB
Z3JlZS4gU2hvdWxkIEkgY2hhbmdlIHRvIG9wdGVlX2NvcmU6IG9wdGVlLWNvcmVANDMwMDgwMDAw
IHsNCg0KPg0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDQgMHgzMDA4MDAwMCAw
eDAgMHgxMDAwMDAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBuby1tYXA7DQo+PiArICAg
ICAgICAgICAgIH07DQo+PiArICAgICB9Ow0KPj4gK307DQo+PiArDQo+DQo+UmVtb3ZlIHN0cmF5
IGJsYW5rIGxpbmUuDQpBZ3JlZS4NCg0KLS0NCkJlc3QgUmVnYXJkcywNCktldmluLiBDaGVuDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQqxSKXzqsw6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4NCrFIpfOk6bTBOiAyMDI0pn43pOsyNqTpIKRVpMggMDc6
MTYNCqaspfOqzDogS2V2aW4gQ2hlbiA8a2V2aW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IHJvYmhA
a2VybmVsLm9yZyA8cm9iaEBrZXJuZWwub3JnPjsga3J6aytkdEBrZXJuZWwub3JnIDxrcnprK2R0
QGtlcm5lbC5vcmc+OyBjb25vcitkdEBrZXJuZWwub3JnIDxjb25vcitkdEBrZXJuZWwub3JnPjsg
am9lbEBqbXMuaWQuYXUgPGpvZWxAam1zLmlkLmF1PjsgYW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29t
LmF1IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+OyBsZWVAa2VybmVsLm9yZyA8bGVlQGtl
cm5lbC5vcmc+OyBjYXRhbGluLm1hcmluYXNAYXJtLmNvbSA8Y2F0YWxpbi5tYXJpbmFzQGFybS5j
b20+OyB3aWxsQGtlcm5lbC5vcmcgPHdpbGxAa2VybmVsLm9yZz47IGFybmRAYXJuZGIuZGUgPGFy
bmRAYXJuZGIuZGU+OyBvbG9mQGxpeG9tLm5ldCA8b2xvZkBsaXhvbS5uZXQ+OyBzb2NAa2VybmVs
Lm9yZyA8c29jQGtlcm5lbC5vcmc+OyBtdHVycXVldHRlQGJheWxpYnJlLmNvbSA8bXR1cnF1ZXR0
ZUBiYXlsaWJyZS5jb20+OyBzYm95ZEBrZXJuZWwub3JnIDxzYm95ZEBrZXJuZWwub3JnPjsgcC56
YWJlbEBwZW5ndXRyb25peC5kZSA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IHF1aWNfYmpvcmFu
ZGVAcXVpY2luYy5jb20gPHF1aWNfYmpvcmFuZGVAcXVpY2luYy5jb20+OyBnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZSA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBkbWl0cnkuYmFyeXNoa292QGxp
bmFyby5vcmcgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz47IHNoYXduZ3VvQGtlcm5lbC5v
cmcgPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIDxuZWls
LmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgbS5zenlwcm93c2tpQHNhbXN1bmcuY29tIDxtLnN6eXBy
b3dza2lAc2Ftc3VuZy5jb20+OyBuZnJhcHJhZG9AY29sbGFib3JhLmNvbSA8bmZyYXByYWRvQGNv
bGxhYm9yYS5jb20+OyB1LWt1bWFyMUB0aS5jb20gPHUta3VtYXIxQHRpLmNvbT47IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyA8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnPjsgbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmcgPGxpbnV4LWFzcGVlZEBs
aXN0cy5vemxhYnMub3JnPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWNs
a0B2Z2VyLmtlcm5lbC5vcmc+DQqlRKauOiBSZTogW1BBVENIIHYxIDA5LzEwXSBhcm02NDogZHRz
OiBhc3BlZWQ6IEFkZCBpbml0aWFsIEFTVDI3MDAgRVZCIGRldmljZSB0cmVlDQoNCk9uIDI2LzA3
LzIwMjQgMTM6MDMsIEtldmluIENoZW4gd3JvdGU6DQo+IC0tLQ0KPiAgYXJjaC9hcm02NC9ib290
L2R0cy9hc3BlZWQvTWFrZWZpbGUgICAgICAgIHwgIDQgKysNCj4gIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYXNwZWVkL2FzdDI3MDAtZXZiLmR0cyB8IDUwICsrKysrKysrKysrKysrKysrKysrKysNCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvYXJtNjQvYm9vdC9kdHMvYXNwZWVkL01ha2VmaWxlDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvYXN0MjcwMC1ldmIuZHRzDQo+DQo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FzcGVlZC9NYWtlZmlsZSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYXNwZWVkL01ha2VmaWxlDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZmZlN2UxNTAxN2NjDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hc3BlZWQvTWFrZWZpbGUNCj4gQEAgLTAsMCArMSw0IEBADQo+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsNCj4gK2R0Yi0kKENPTkZJR19B
UkNIX0FTUEVFRCkgKz0gXA0KPiArICAgICBhc3QyNzAwLWV2Yi5kdGINCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYXNwZWVkL2FzdDI3MDAtZXZiLmR0cyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYXNwZWVkL2FzdDI3MDAtZXZiLmR0cw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjE4N2M0NThlNTY2Yg0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYXNwZWVkL2FzdDI3MDAtZXZiLmR0cw0KPiBAQCAtMCww
ICsxLDUwIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRl
cg0KPiArDQo+ICsvZHRzLXYxLzsNCj4gKw0KPiArI2luY2x1ZGUgImFzcGVlZC1nNy5kdHNpIg0K
PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vYXNwZWVkLWdwaW8uaD4NCj4gKw0KPiArLyB7
DQo+ICsgICAgIG1vZGVsID0gIkFTVDI3MDBBMS1FVkIiOw0KPiArICAgICBjb21wYXRpYmxlID0g
ImFzcGVlZCxhc3QyNzAwYTEtZXZiIiwgImFzcGVlZCxhc3QyNzAwIjsNCg0KWW91IGhhdmUgbmV2
ZXIgdGVzdGVkIHRoaXMuDQoNClNvcnJ5LCB0ZXN0IHlvdXIgRFRTIGZpcnN0Lg0KDQo+ICsNCj4g
KyAgICAgY2hvc2VuIHsNCj4gKyAgICAgICAgICAgICBib290YXJncyA9ICJjb25zb2xlPXR0eVMx
MiwxMTUyMDBuOCI7DQoNCkRyb3AuDQoNCj4gKyAgICAgICAgICAgICBzdGRvdXQtcGF0aCA9ICZ1
YXJ0MTI7DQo+ICsgICAgIH07DQo+ICsNCj4gKyAgICAgZmlybXdhcmUgew0KPiArICAgICAgICAg
ICAgIG9wdGVlOiBvcHRlZSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImxpbmFybyxvcHRlZS10eiI7DQo+ICsgICAgICAgICAgICAgICAgICAgICBtZXRob2QgPSAic21j
IjsNCj4gKyAgICAgICAgICAgICB9Ow0KPiArICAgICB9Ow0KPiArDQo+ICsgICAgIG1lbW9yeUA0
MDAwMDAwMDAgew0KPiArICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9yeSI7DQo+ICsg
ICAgICAgICAgICAgcmVnID0gPDB4NCAweDAwMDAwMDAwIDB4MCAweDQwMDAwMDAwPjsNCj4gKyAg
ICAgfTsNCj4gKw0KPiArICAgICByZXNlcnZlZC1tZW1vcnkgew0KPiArICAgICAgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiArICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDI+Ow0K
PiArICAgICAgICAgICAgIHJhbmdlczsNCj4gKw0KPiArICAgICAgICAgICAgIG1jdV9mdzogbWN1
LWZpcm13YXJlQDQyZmUwMDAwMCB7DQo+ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHg0
IDB4MmZlMDAwMDAgMHgwIDB4MjAwMDAwPjsNCj4gKyAgICAgICAgICAgICAgICAgICAgIG5vLW1h
cDsNCj4gKyAgICAgICAgICAgICB9Ow0KPiArDQo+ICsgICAgICAgICAgICAgYXRmOiB0cnVzdGVk
LWZpcm13YXJlLWFANDMwMDAwMDAwIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
eDQgMHgzMDAwMDAwMCAweDAgMHg4MDAwMD47DQo+ICsgICAgICAgICAgICAgICAgICAgICBuby1t
YXA7DQo+ICsgICAgICAgICAgICAgfTsNCj4gKw0KPiArICAgICAgICAgICAgIG9wdGVlX2NvcmU6
IG9wdGVlX2NvcmVANDMwMDgwMDAwIHsNCg0KUmVhZCBEVFMgY29kaW5nIHN0eWxlLg0KDQo+ICsg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHg0IDB4MzAwODAwMDAgMHgwIDB4MTAwMDAwMD47
DQo+ICsgICAgICAgICAgICAgICAgICAgICBuby1tYXA7DQo+ICsgICAgICAgICAgICAgfTsNCj4g
KyAgICAgfTsNCj4gK307DQo+ICsNCg0KUmVtb3ZlIHN0cmF5IGJsYW5rIGxpbmUuDQoNCkJlc3Qg
cmVnYXJkcywNCktyenlzenRvZg0KDQoqKioqKioqKioqKioqIEVtYWlsIENvbmZpZGVudGlhbGl0
eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNCqdLs2TBbqn6Og0KpburSKXzKKnOqOSq/qXz
KaVpr+ClXad0vvexS7jqsFShQajDqPyqa6vfq0/FQKFDpnAgpXi63atEq/ypd6Snpqyl86rMoUG9
0KVIuXGkbLZspfOzcaq+pbu5caRstmyl86SntW+wZarMLCCow73Qpd+nWadSsKOlu7lxpGy2bKXz
pM6o5Kr+pfOpTb5Qt7Sp0qazvcamTKXzoUPBwsHCsXqquqZYp0AhDQoNCkRJU0NMQUlNRVI6DQpU
aGlzIG1lc3NhZ2UgKGFuZCBhbnkgYXR0YWNobWVudHMpIG1heSBjb250YWluIGxlZ2FsbHkgcHJp
dmlsZWdlZCBhbmQvb3Igb3RoZXIgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uLiBJZiB5b3UgaGF2
ZSByZWNlaXZlZCBpdCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJlcGx5
IGUtbWFpbCBhbmQgaW1tZWRpYXRlbHkgZGVsZXRlIHRoZSBlLW1haWwgYW5kIGFueSBhdHRhY2ht
ZW50cyB3aXRob3V0IGNvcHlpbmcgb3IgZGlzY2xvc2luZyB0aGUgY29udGVudHMuIFRoYW5rIHlv
dS4NCg==

--_000_PSAPR06MB4949AE344C9386123AC2145F89802PSAPR06MB4949apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 11pt; color: rgb(0, 0, 0);">
Hi Krzk,</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; ---</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;arch/arm64/boot/dts/aspeed/Makefile &nbsp; &nbsp; &nbsp; &nb=
sp;| &nbsp;4 ++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;arch/arm64/boot/dts/aspeed/ast2700-evb.dts | 50 ++++++++++++=
++++++++++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;2 files changed, 54 insertions(+)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;create mode 100644 arch/arm64/boot/dts/aspeed/Makefile</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp;create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dt=
s</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/arch/arm64/boot/dts/aspeed/Makefile b/arch/arm64/boot=
/dts/aspeed/Makefile</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; new file mode 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; index 000000000000..ffe7e15017cc</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; --- /dev/null</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/arch/arm64/boot/dts/aspeed/Makefile</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -0,0 +1,4 @@</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +# SPDX-License-Identifier: GPL-2.0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +dtb-$(CONFIG_ARCH_ASPEED) +=3D \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ast2700-evb.dtb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/arch/arm64/boot/dts/aspeed/ast2700-evb.dts b/arch/arm=
64/boot/dts/aspeed/ast2700-evb.dts</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; new file mode 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; index 000000000000..187c458e566b</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; --- /dev/null</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/arch/arm64/boot/dts/aspeed/ast2700-evb.dts</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -0,0 +1,50 @@</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +// SPDX-License-Identifier: GPL-2.0-or-later</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +/dts-v1/;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &quot;aspeed-g7.dtsi&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;dt-bindings/gpio/aspeed-gpio.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +/ {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; model =3D &quot;AST2700A1-EVB&quot;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; compatible =3D &quot;aspeed,ast2700a1-evb&quot;, &=
quot;aspeed,ast2700&quot;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;You have never tested this.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;Sorry, test your DTS first.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Agree. I will test my dts by make dtbs_check W=3D1</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; chosen {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bootargs =3D &quot;con=
sole=3DttyS12,115200n8&quot;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;Drop.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Agree.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; stdout-path =3D &amp;u=
art12;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; firmware {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; optee: optee {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; compatible =3D &quot;linaro,optee-tz&quot;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; method =3D &quot;smc&quot;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; memory@400000000 {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; device_type =3D &quot;=
memory&quot;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;0x4 0x0000=
0000 0x0 0x40000000&gt;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; reserved-memory {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #address-cells =3D &lt=
;2&gt;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #size-cells =3D &lt;2&=
gt;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ranges;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mcu_fw: mcu-firmware@4=
2fe00000 {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; reg =3D &lt;0x4 0x2fe00000 0x0 0x200000&gt;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; no-map;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; atf: trusted-firmware-=
a@430000000 {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; reg =3D &lt;0x4 0x30000000 0x0 0x80000&gt;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; no-map;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; optee_core: optee_core=
@430080000 {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;Read DTS coding style.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Agree. Should I change to optee_core: optee-core@430080000 {</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; reg =3D &lt;0x4 0x30080000 0x0 0x1000000&gt;;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; no-map;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +};</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;Remove stray blank line.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Agree.</div>
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
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>=B1H=A5=F3=AA=CC:</b>=
&nbsp;Krzysztof Kozlowski &lt;krzk@kernel.org&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b>&nbsp;2024=A6~7=A4=EB26=A4=E9 =A4U=A4=C8 07:1=
6<br>
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
<b>=A5D=A6=AE:</b>&nbsp;Re: [PATCH v1 09/10] arm64: dts: aspeed: Add initia=
l AST2700 EVB device tree</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 26/07/2024 13:03, Kevin Chen wrote:<br>
&gt; ---<br>
&gt;&nbsp; arch/arm64/boot/dts/aspeed/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp; 4 ++<br>
&gt;&nbsp; arch/arm64/boot/dts/aspeed/ast2700-evb.dts | 50 ++++++++++++++++=
++++++<br>
&gt;&nbsp; 2 files changed, 54 insertions(+)<br>
&gt;&nbsp; create mode 100644 arch/arm64/boot/dts/aspeed/Makefile<br>
&gt;&nbsp; create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts<br=
>
&gt;<br>
&gt; diff --git a/arch/arm64/boot/dts/aspeed/Makefile b/arch/arm64/boot/dts=
/aspeed/Makefile<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..ffe7e15017cc<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm64/boot/dts/aspeed/Makefile<br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +dtb-$(CONFIG_ARCH_ASPEED) +=3D \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ast2700-evb.dtb<br>
&gt; diff --git a/arch/arm64/boot/dts/aspeed/ast2700-evb.dts b/arch/arm64/b=
oot/dts/aspeed/ast2700-evb.dts<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..187c458e566b<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm64/boot/dts/aspeed/ast2700-evb.dts<br>
&gt; @@ -0,0 +1,50 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +<br>
&gt; +/dts-v1/;<br>
&gt; +<br>
&gt; +#include &quot;aspeed-g7.dtsi&quot;<br>
&gt; +#include &lt;dt-bindings/gpio/aspeed-gpio.h&gt;<br>
&gt; +<br>
&gt; +/ {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; model =3D &quot;AST2700A1-EVB&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2700a1-evb&qu=
ot;, &quot;aspeed,ast2700&quot;;<br>
<br>
You have never tested this.<br>
<br>
Sorry, test your DTS first.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chosen {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bootargs =3D &quot;console=3DttyS12,115200n8&quot;;<br>
<br>
Drop.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; stdout-path =3D &amp;uart12;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; firmware {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; optee: optee {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;li=
naro,optee-tz&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; method =3D &quot;smc&qu=
ot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memory@400000000 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; device_type =3D &quot;memory&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; reg =3D &lt;0x4 0x00000000 0x0 0x40000000&gt;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; reserved-memory {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; #address-cells =3D &lt;2&gt;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; #size-cells =3D &lt;2&gt;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ranges;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; mcu_fw: mcu-firmware@42fe00000 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x4 0x2fe00=
000 0x0 0x200000&gt;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; atf: trusted-firmware-a@430000000 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x4 0x30000=
000 0x0 0x80000&gt;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; optee_core: optee_core@430080000 {<br>
<br>
Read DTS coding style.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x4 0x30080=
000 0x0 0x1000000&gt;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +};<br>
&gt; +<br>
<br>
Remove stray blank line.<br>
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

--_000_PSAPR06MB4949AE344C9386123AC2145F89802PSAPR06MB4949apcp_--
